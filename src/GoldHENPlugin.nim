import "private/GoldHEN"
{.passL: "-lGoldHEN_Hook"}

proc arrayToString(arr: openArray[char]): string = 
  for character in arr:
    if character == '\x00':
      break
    result.add(character)

type ProcessInfo* = ref object
  pid*: cint
  name*: string
  path*: string 
  titleId*: string
  contentId*: string
  version*: string
  baseAddress*: uint64

proc writeMemory*(pi: ProcessInfo, offset: uint64, data: openArray[byte]): cint =
  var writer : proc_rw
  writer.address = pi.baseAddress + offset
  writer.data = data[0].addr
  writer.length = data.len.uint64
  writer.write_flags = 1
  sys_sdk_proc_rw(writer.addr)  

proc readMemory*(pi: ProcessInfo, offset: uint64, data: openArray[byte]): cint =
  var reader : proc_rw
  reader.address = pi.baseAddress + offset
  reader.data = data[0].addr
  reader.length = data.len.uint64
  reader.write_flags = 0
  sys_sdk_proc_rw(reader.addr)  

proc getProcessInfo*() : ProcessInfo = 
  var pi: proc_info

  if sys_sdk_proc_info(pi.addr) != 0:
    return nil
  result = ProcessInfo(pid: pi.pid, 
                       name: arrayToString(pi.name), 
                       path: arrayToString(pi.path), 
                       titleId: arrayToString(pi.titleid),
                       contentId : arrayToString(pi.contentid), 
                       version: arrayToString(pi.version),
                       baseAddress: pi.base_address)

