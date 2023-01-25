import xmltree2
import std/[tables]
import common



method setKey*(data:DataObj; key: string) =
  data.attributes["key"] = key


proc newData*(key:string = ""):DataObj =
  result = DataObj()
  if key != "":
    result.setKey(key)

method set*(data:DataObj; value: string) =
  data.value = value

method set*(data:DataObj; value: float) =
  data.value = $value

