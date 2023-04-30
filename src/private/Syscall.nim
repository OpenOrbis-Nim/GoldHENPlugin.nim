##
##  GoldHEN Plugin SDK - a prx hook/patch sdk for Orbis OS
##
##  Credits
##  - OSM <https://github.com/OSM-Made>
##  - jocover <https://github.com/jocover>
##  - bucanero <https://github.com/bucanero>
##  - OpenOrbis Team <https://github.com/OpenOrbis>
##  - SiSTRo <https://github.com/SiSTR0>
##

proc orbis_syscall*(num: cint): cint {.varargs, cdecl, importc: "orbis_syscall",
                                       header: "GoldHEN/Syscall.h".}
proc sys_dynlib_dlsym*(loadedModuleID: cint; name: cstring; destination: pointer): cint {.
    cdecl, importc: "sys_dynlib_dlsym", header: "GoldHEN/Syscall.h".}
proc sys_dynlib_load_prx*(name: cstring; idDestination: ptr cint): cint {.cdecl,
    importc: "sys_dynlib_load_prx", header: "GoldHEN/Syscall.h".}