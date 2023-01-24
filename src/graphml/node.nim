import xmltree2
import std/[tables, options]
import common#, data





proc setId*(node:var NodeObj; id: string) =
  node.attributes["id"] = id


proc newNode*(id:string = ""; isLocator:bool = false):NodeObj =
  result = NodeObj(isLocator: false)
  if islocator:
    result = NodeObj(isLocator: true)
  if id != "":
    result.setId(id)
 
proc setInDegree*(node:var NodeObj; inDegree: int) =
  node.attributes["parse.indegree"] = $inDegree

proc setOutDegree*(node:var NodeObj; outDegree: int) =
  node.attributes["parse.outdegree"] = $outDegree

proc setDescription*[T:NodeObj](obj:var T; description:string ) =
  obj.description = description

proc add*(node:var NodeObj; data: DataObj ) =
  node.datas &= data

#proc setUrl*(node:var NodeObj; url: string) =
#  node.attributes["xlink:href"] = url  

# when isMainModule:
#   var root = DataObj()

