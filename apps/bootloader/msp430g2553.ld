/****************************************************************************
 *                                                                          *
 *                         GNAT COMPILER COMPONENTS                         *
 *                                                                          *
 *                                  A R M                                   *
 *                                                                          *
 *                            Linker Script File                            *
 *                                                                          *
 *      Copyright (C) 1999-2002 Universidad Politecnica de Madrid           *
 *             Copyright (C) 2003-2006 The European Space Agency            *
 *                   Copyright (C) 2003-2018 AdaCore                        *
 *                                                                          *
 * GNAT is free software;  you can  redistribute it  and/or modify it under *
 * terms of the  GNU General Public License as published  by the Free Soft- *
 * ware  Foundation;  either version 2,  or (at your option) any later ver- *
 * sion.  GNAT is distributed in the hope that it will be useful, but WITH- *
 * OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY *
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License *
 * for  more details.  You should have  received  a copy of the GNU General *
 * Public License  distributed with GNAT;  see file COPYING.  If not, write *
 * to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, *
 * Boston, MA 02110-1301, USA.                                              *
 *                                                                          *
 * As a  special  exception,  if you  link  this file  with other  files to *
 * produce an executable,  this file does not by itself cause the resulting *
 * executable to be covered by the GNU General Public License. This except- *
 * ion does not  however invalidate  any other reasons  why the  executable *
 * file might be covered by the  GNU Public License.                        *
 *                                                                          *
 * GNARL was developed by the GNARL team at Florida State University.       *
 * Extensive contributions were provided by Ada Core Technologies, Inc.     *
 * The  executive  was developed  by the  Real-Time  Systems  Group  at the *
 * Technical University of Madrid.                                          *
 *                                                                          *
 ****************************************************************************/

MEMORY
{
  infomem      : ORIGIN = 0x1000, LENGTH = 0x0100 /* END=0x10FF, size 256 as 4 64-byte segments */
  infoa        : ORIGIN = 0x10C0, LENGTH = 0x0040 /* END=0x10FF, size 64 */
  infob        : ORIGIN = 0x1080, LENGTH = 0x0040 /* END=0x10BF, size 64 */
  infoc        : ORIGIN = 0x1040, LENGTH = 0x0040 /* END=0x107F, size 64 */
  infod        : ORIGIN = 0x1000, LENGTH = 0x0040 /* END=0x103F, size 64 */
  flash   (rx) : ORIGIN = 0xFC00, LENGTH = 1024-32
  vectors (rx) : ORIGIN = 0xFFE0, LENGTH = 32
  ram    (rwx) : ORIGIN = 0x0200, LENGTH = 512
}

REGION_ALIAS("sram_tx", ram)
REGION_ALIAS("sram_ro", ram)
REGION_ALIAS("sram_bs", ram)
REGION_ALIAS("sram_da", ram)

_DEFAULT_STACK_SIZE = 440;

__flash_start = 0xC000;
__flash_size = 0x4000;
__info_start = 0x1000;
__info_size = 0x0100;

ENTRY(_start_rom);

SECTIONS
{
  .text.lower :
  {
    *(.text.lower)
    __lower_end = .;
  } > flash

  .text :
  {
    *(.text .text.* .gnu.linkonce.t*)
    *(.gnu.warning)
  } > flash

  .rodata :
  {
    *(.lit)
    *(.rodata .rodata.* .gnu.linkonce.r*)
    . = ALIGN(0x4);
    __rom_end = .;
  } > flash

  .vectors :
  {
    KEEP (*(.vectors))
  } > vectors

  __data_load = __rom_end;
  .data : AT (__data_load)
  {
    __data_start = .;
    *(.data .data.* .gnu.linkonce.d*)

    /* Ensure that the end of the data section is always word aligned.
       Initial values are stored in 4-bytes blocks so we must guarantee
       that these blocks do not fall out the section (otherwise they are
       truncated and the initial data for the last block are lost). */

    . = ALIGN(0x4);
    __data_end = .;
  } > sram_da
  __data_words = (__data_end - __data_start) >> 2;

  .bss (NOLOAD): {
   . = ALIGN(0x8);
   __bss_start = .;

   *(.bss .bss.*)
   *(COMMON)

   . = ALIGN(0x8);    /* Align the stack to 64 bits */
   __bss_end = .;

   __interrupt_stack_start = .;
   *(.interrupt_stacks)
   . = ALIGN(0x8);
   __interrupt_stack_end = .;

   __stack_start = .;
   . += DEFINED (__stack_size) ? __stack_size : _DEFAULT_STACK_SIZE;
   . = ALIGN(0x8);
   __stack_end = .;

   _end = .;
   __heap_start = .;
   __heap_end = ORIGIN(sram_bs) + LENGTH(sram_bs);
  } > sram_bs

  __bss_words = (__bss_end - __bss_start) >> 2;

  .infoA     : {} > infoa              /* MSP430 INFO FLASH MEMORY SEGMENTS */
  .infoB     : {} > infob
  .infoC     : {} > infoc
  .infoD     : {} > infod

  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* DWARF 3 */
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges   0 : { *(.debug_ranges) }
  .gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }
}
