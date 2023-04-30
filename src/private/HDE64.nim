##
##  Hacker Disassembler Engine 64
##  Copyright (c) 2008-2009, Vyacheslav Patkov.
##  All rights reserved.
##
##  hde64.h: C/C++ header file
##
##

##  stdint.h - C99 standard header
##  http://en.wikipedia.org/wiki/stdint.h
##
##  if your compiler doesn't contain "stdint.h" header (for
##  example, Microsoft Visual C++), you can download file:
##    http://www.azillionmonkeys.com/qed/pstdint.h
##  and change next line to:
##    #include "pstdint.h"
##
##  User mode

when defined(cplusplus):
  discard
else:
  discard
const
  F_MODRM* = 0x00000001
  F_SIB* = 0x00000002
  F_IMM8* = 0x00000004
  F_IMM16* = 0x00000008
  F_IMM32* = 0x00000010
  F_IMM64* = 0x00000020
  F_DISP8* = 0x00000040
  F_DISP16* = 0x00000080
  F_DISP32* = 0x00000100
  F_RELATIVE* = 0x00000200
  F_ERROR* = 0x00001000
  F_ERROR_OPCODE* = 0x00002000
  F_ERROR_LENGTH* = 0x00004000
  F_ERROR_LOCK* = 0x00008000
  F_ERROR_OPERAND* = 0x00010000
  F_PREFIX_REPNZ* = 0x01000000
  F_PREFIX_REPX* = 0x02000000
  F_PREFIX_REP* = 0x03000000
  F_PREFIX_66* = 0x04000000
  F_PREFIX_67* = 0x08000000
  F_PREFIX_LOCK* = 0x10000000
  F_PREFIX_SEG* = 0x20000000
  F_PREFIX_REX* = 0x40000000
  F_PREFIX_ANY* = 0x7f000000
  PREFIX_SEGMENT_CS* = 0x2e
  PREFIX_SEGMENT_SS* = 0x36
  PREFIX_SEGMENT_DS* = 0x3e
  PREFIX_SEGMENT_ES* = 0x26
  PREFIX_SEGMENT_FS* = 0x64
  PREFIX_SEGMENT_GS* = 0x65
  PREFIX_LOCK* = 0xf0
  PREFIX_REPNZ* = 0xf2
  PREFIX_REPX* = 0xf3
  PREFIX_OPERAND_SIZE* = 0x66
  PREFIX_ADDRESS_SIZE* = 0x67

type
  INNER_C_UNION_HDE64_2* {.importc: "hde64s::no_name",
                           header: "GoldHEN/HDE64.h", bycopy, union.} = object
    imm8* {.importc: "imm8".}: uint8
    imm16* {.importc: "imm16".}: uint16
    imm32* {.importc: "imm32".}: uint32
    imm64* {.importc: "imm64".}: uint64

  INNER_C_UNION_HDE64_3* {.importc: "hde64s::no_name",
                           header: "GoldHEN/HDE64.h", bycopy, union.} = object
    disp8* {.importc: "disp8".}: uint8
    disp16* {.importc: "disp16".}: uint16
    disp32* {.importc: "disp32".}: uint32

  hde64s* {.importc: "hde64s", header: "GoldHEN/HDE64.h", bycopy.} = object
    len* {.importc: "len".}: uint8
    p_rep* {.importc: "p_rep".}: uint8
    p_lock* {.importc: "p_lock".}: uint8
    p_seg* {.importc: "p_seg".}: uint8
    p_66* {.importc: "p_66".}: uint8
    p_67* {.importc: "p_67".}: uint8
    rex* {.importc: "rex".}: uint8
    rex_w* {.importc: "rex_w".}: uint8
    rex_r* {.importc: "rex_r".}: uint8
    rex_x* {.importc: "rex_x".}: uint8
    rex_b* {.importc: "rex_b".}: uint8
    opcode* {.importc: "opcode".}: uint8
    opcode2* {.importc: "opcode2".}: uint8
    modrm* {.importc: "modrm".}: uint8
    modrm_mod* {.importc: "modrm_mod".}: uint8
    modrm_reg* {.importc: "modrm_reg".}: uint8
    modrm_rm* {.importc: "modrm_rm".}: uint8
    sib* {.importc: "sib".}: uint8
    sib_scale* {.importc: "sib_scale".}: uint8
    sib_index* {.importc: "sib_index".}: uint8
    sib_base* {.importc: "sib_base".}: uint8
    imm* {.importc: "imm".}: INNER_C_UNION_HDE64_2
    disp* {.importc: "disp".}: INNER_C_UNION_HDE64_3
    flags* {.importc: "flags".}: uint32


##  __cdecl

proc hde64_disasm*(code: pointer; hs: ptr hde64s): cuint {.cdecl,
    importc: "hde64_disasm", header: "GoldHEN/HDE64.h".}