import xmltree2
import std/[tables]
import common



proc setKey*(data:var DataObj; key: string) =
  data.attributes["key"] = key


proc newData*(key:string = ""):DataObj =
  result = DataObj()
  if key != "":
    result.setKey(key)

proc set*(data:var DataObj; value: string) =
  data.value = value

proc set*(data:var DataObj; value: float) =
  data.value = $value

