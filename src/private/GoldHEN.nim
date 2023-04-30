##
##  GoldHEN Plugin SDK - a prx hook/patch sdk for Orbis OS
##
##  Credits
##  - SiSTRo <https://github.com/SiSTR0>
##  - ctn123 <https://github.com/ctn123>
##  - OSM <https://github.com/OSM-Made>
##  - jocover <https://github.com/jocover>
##  - bucanero <https://github.com/bucanero>
##  - OpenOrbis Team <https://github.com/OpenOrbis>
##  - nik <https://github.com/nkrapivin>
##

type
  jailbreak_backup* {.importc: "struct jailbreak_backup", header: "GoldHEN/GoldHEN.h",
                      bycopy.} = object
    cr_uid* {.importc: "cr_uid".}: uint32
    cr_ruid* {.importc: "cr_ruid".}: uint32
    cr_rgid* {.importc: "cr_rgid".}: uint32
    cr_groups* {.importc: "cr_groups".}: uint32
    cr_paid* {.importc: "cr_paid".}: uint64
    cr_caps* {.importc: "cr_caps".}: array[2, uint64]
    cr_prison* {.importc: "cr_prison".}: pointer
    fd_cdir* {.importc: "fd_cdir".}: pointer
    fd_jdir* {.importc: "fd_jdir".}: pointer
    fd_rdir* {.importc: "fd_rdir".}: pointer

  proc_info* {.importc: "struct proc_info", header: "GoldHEN/GoldHEN.h", bycopy.} = object
    pid* {.importc: "pid".}: cint
    name* {.importc: "name".}: array[40, char]
    path* {.importc: "path".}: array[64, char]
    titleid* {.importc: "titleid".}: array[16, char]
    contentid* {.importc: "contentid".}: array[64, char]
    version* {.importc: "version".}: array[6, char]
    base_address* {.importc: "base_address".}: uint64

  proc_rw* {.importc: "struct proc_rw", header: "GoldHEN/GoldHEN.h", bycopy.} = object
    address* {.importc: "address".}: uint64
    data* {.importc: "data".}: pointer
    length* {.importc: "length".}: uint64
    write_flags* {.importc: "write_flags".}: uint64

  proc_prx_load* {.importc: "struct proc_prx_load", header: "GoldHEN/GoldHEN.h", bycopy.} = object
    process_name* {.importc: "process_name".}: array[32, char]
    prx_path* {.importc: "prx_path".}: array[100, char]
    res* {.importc: "res".}: uint64

  proc_prx_unload* {.importc: "struct proc_prx_unload", header: "GoldHEN/GoldHEN.h",
                     bycopy.} = object
    process_name* {.importc: "process_name".}: array[32, char]
    prx_handle* {.importc: "prx_handle".}: uint64
    res* {.importc: "res".}: uint64


const
  GOLDHEN_SDK_CMD_VERSION* = 0
  GOLDHEN_SDK_CMD_KLOG* = 1
  GOLDHEN_SDK_CMD_JAILBREAK* = 2
  GOLDHEN_SDK_CMD_UNJAILBREAK* = 3
  GOLDHEN_SDK_CMD_PROCESS_INFO* = 4
  GOLDHEN_SDK_CMD_PROCESS_RW* = 5
  GOLDHEN_SDK_CMD_PROCESS_PRX_LOAD* = 6
  GOLDHEN_SDK_CMD_PROCESS_PRX_UNLOAD* = 7
  GOLDHEN_SDK_VERSION* = 0x00000100

proc sys_sdk_cmd*(cmd: uint64; data: pointer): cint {.cdecl,
    importc: "sys_sdk_cmd", header: "GoldHEN/GoldHEN.h".}
proc sys_sdk_jailbreak*(jb: ptr jailbreak_backup): cint {.cdecl,
    importc: "sys_sdk_jailbreak", header: "GoldHEN/GoldHEN.h".}
proc sys_sdk_unjailbreak*(jb: ptr jailbreak_backup): cint {.cdecl,
    importc: "sys_sdk_unjailbreak", header: "GoldHEN/GoldHEN.h".}
proc sys_sdk_version*(): uint32 {.cdecl, importc: "sys_sdk_version",
                                  header: "GoldHEN/GoldHEN.h".}
proc sys_sdk_proc_info*(info: ptr proc_info): cint {.cdecl,
    importc: "sys_sdk_proc_info", header: "GoldHEN/GoldHEN.h".}
proc sys_sdk_proc_rw*(data: ptr proc_rw): cint {.cdecl,
    importc: "sys_sdk_proc_rw", header: "GoldHEN/GoldHEN.h".}
proc sys_sdk_proc_prx_load*(process_name: cstring; prx_path: cstring): cint {.
    cdecl, importc: "sys_sdk_proc_prx_load", header: "GoldHEN/GoldHEN.h".}
proc sys_sdk_proc_prx_unload*(process_name: cstring; prx_handle: cint): cint {.
    cdecl, importc: "sys_sdk_proc_prx_unload", header: "GoldHEN/GoldHEN.h".}
