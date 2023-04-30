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

type
  Patcher* {.importc: "Patcher", header: "GoldHEN/Patcher.h", bycopy.} = object
    Address* {.importc: "Address".}: uint64
    OriginalData* {.importc: "OriginalData".}: pointer
    Length* {.importc: "Length".}: csize_t


proc Patcher_Construct*(This: ptr Patcher) {.cdecl,
    importc: "Patcher_Construct", header: "GoldHEN/Patcher.h".}
proc Patcher_Install_Patch*(This: ptr Patcher; Address: uint64; Data: pointer;
                            Length: csize_t) {.cdecl,
    importc: "Patcher_Install_Patch", header: "GoldHEN/Patcher.h".}
proc Patcher_Restore_Patch*(This: ptr Patcher) {.cdecl,
    importc: "Patcher_Restore_Patch", header: "GoldHEN/Patcher.h".}
proc Patcher_Destroy*(This: ptr Patcher) {.cdecl, importc: "Patcher_Destroy",
    header: "GoldHEN/Patcher.h".}