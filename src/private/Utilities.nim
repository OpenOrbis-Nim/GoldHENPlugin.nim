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

template ARRAY_COUNT*(arry: untyped): untyped =
  sizeof((arry) div sizeof((arry[0])))

type
  vm_prot_t* = cuchar

##  protection codes

const
  VM_PROT_NONE* = (cast[vm_prot_t](0x00))
  VM_PROT_READ* = (cast[vm_prot_t](0x01))
  VM_PROT_WRITE* = (cast[vm_prot_t](0x02))
  VM_PROT_EXECUTE* = (cast[vm_prot_t](0x04))
  VM_PROT_COPY* = (cast[vm_prot_t](0x08)) ##  copy-on-read
  VM_PROT_ALL* = (VM_PROT_READ or VM_PROT_WRITE or VM_PROT_EXECUTE)
  VM_PROT_RW* = (VM_PROT_READ or VM_PROT_WRITE)
  VM_PROT_DEFAULT* = VM_PROT_ALL
  MNT_UPDATE* = 0x0000000000010000'u

type
  HA* = culong

const
  HA_MANYARGS* = HA

## !!!Ignored construct:  arg1 , HA arg2 , HA arg3 , HA arg4 , HA arg5 , HA arg6 , HA arg7 , HA arg8 , HA arg9 , HA arg10 , HA arg11 , HA arg12 [NewLine] # MANYARGS arg1 , arg2 , arg3 , arg4 , arg5 , arg6 , arg7 , arg8 , arg9 , arg10 , arg11 , arg12 [NewLine]  if you need to define the hook in some header file, this only externs it. # HOOK_EXTERN ( name ) extern Detour Detour_ ## name [NewLine]  this defines the actual implementation # HOOK_INIT ( name ) Detour Detour_ ## name = { DetourMode_x64 } [NewLine]  this does a 64bit hook # HOOK ( name ) do { Detour_Construct ( ( & ( Detour_ ## name ) ) , DetourMode_x64 ) ; Detour_DetourFunction ( ( & ( Detour_ ## name ) ) , ( uint64_t ) name , ( void * ) ( & ( name ## _hook ) ) ) ; } while ( 0 ) [NewLine]  32bit... # HOOK32 ( name ) do { Detour_Construct ( ( & ( Detour_ ## name ) ) , DetourMode_x32 ) ; Detour_DetourFunction ( ( & ( Detour_ ## name ) ) , ( uint64_t ) name , ( void * ) ( & ( name ## _hook ) ) ) ; } while ( 0 ) [NewLine]  tries to pass arguments # HOOK_CONTINUE ( name , type , ... ) Detour_Stub ( ( & ( Detour_ ## name ) ) , type , __VA_ARGS__ ) [NewLine]  unhooks, killing the defined hook, CANNOT BE REUSED # UNHOOK ( name ) Detour_Destroy ( ( & ( Detour_ ## name ) ) ) [NewLine] # __USE_PRINTF__ [NewLine] # klog printf [NewLine] # [NewLine] # __USE_KLOG__ [NewLine] void klog ( char * fmt , ... ) ;
## Error: expected ';'!!!

proc hex_dump*(data: pointer; size: csize_t) {.cdecl, importc: "hex_dump",
    header: "GoldHEN/Utilities.h".}