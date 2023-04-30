##
##  Hacker Disassembler Engine 64 C
##  Copyright (c) 2008-2009, Vyacheslav Patkov.
##  All rights reserved.
##
##

const
  C_NONE* = 0x00
  C_MODRM* = 0x01
  C_IMM8* = 0x02
  C_IMM16* = 0x04
  C_IMM_P66* = 0x10
  C_REL8* = 0x20
  C_REL32* = 0x40
  C_GROUP* = 0x80
  C_ERROR* = 0xff
  PRE_ANY* = 0x00
  PRE_NONE* = 0x01
  PRE_F2* = 0x02
  PRE_F3* = 0x04
  PRE_66* = 0x08
  PRE_67* = 0x10
  PRE_LOCK* = 0x20
  PRE_SEG* = 0x40
  PRE_ALL* = 0xff
  DELTA_OPCODES* = 0x4a
  DELTA_FPU_REG* = 0xfd
  DELTA_FPU_MODRM* = 0x104
  DELTA_PREFIXES* = 0x13c
  DELTA_OP_LOCK_OK* = 0x1ae
  DELTA_OP2_LOCK_OK* = 0x1c6
  DELTA_OP_ONLY_MEM* = 0x1d8
  DELTA_OP2_ONLY_MEM* = 0x1e7

var hde64_table* {.importc: "hde64_table", header: "GoldHEN/Table64.h".}: UncheckedArray[
    cuchar]
