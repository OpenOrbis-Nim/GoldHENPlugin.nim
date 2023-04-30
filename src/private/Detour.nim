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
  DetourMode* {.size: sizeof(cint).} = enum
    DetourMode_x64, DetourMode_x32
  Detour* {.importc: "Detour", header: "GoldHEN/Detour.h", bycopy.} = object
    Mode* {.importc: "Mode".}: DetourMode
    StubPtr* {.importc: "StubPtr".}: pointer
    StubSize* {.importc: "StubSize".}: csize_t
    FunctionPtr* {.importc: "FunctionPtr".}: pointer
    TrampolinePtr* {.importc: "TrampolinePtr".}: pointer
    HookPtr* {.importc: "HookPtr".}: pointer
    JumpInstructions64* {.importc: "JumpInstructions64".}: array[14, uint8]
    ##  jmp QWORD PTR[Address]
    JumpInstructions32* {.importc: "JumpInstructions32".}: array[0o5, uint8]
    ##  jmp 32



##  usage:
##  typedef int(*somefunc_t)(int, void *, const char *);
##  int result = Detour_Stub(&SomeHook, somefunc_t, /* arguments begin */ 1, NULL, "hi");

template Detour_Stub*(This, FunctionPointerType: untyped;
                      xargs: varargs[untyped]): untyped =
  (((FunctionPointerType)((This).StubPtr))(VA_ARGS)) ##  Arguments

proc Detour_DetourFunction*(This: ptr Detour; FunctionPtr: uint64;
                            HookPtr: pointer): pointer {.cdecl,
    importc: "Detour_DetourFunction", header: "GoldHEN/Detour.h".}
proc Detour_RestoreFunction*(This: ptr Detour) {.cdecl,
    importc: "Detour_RestoreFunction", header: "GoldHEN/Detour.h".}
proc Detour_Construct*(This: ptr Detour; Mode: DetourMode) {.cdecl,
    importc: "Detour_Construct", header: "GoldHEN/Detour.h".}
proc Detour_Destroy*(This: ptr Detour) {.cdecl, importc: "Detour_Destroy",
    header: "GoldHEN/Detour.h".}