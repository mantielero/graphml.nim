import xmltree2
import std/[tables, options]
import common#, data





method setId*(node:NodeObj; id: string) =
  node.attributes["id"] = id


proc newNode*(id:string = ""; isLocator:bool = false):NodeObj =
  result = NodeObj(isLocator: false)
  if islocator:
    result = NodeObj(isLocator: true)
  if id != "":
    result.setId(id)
 
method setInDegree*(node:NodeObj; inDegree: int) =
  node.attributes["parse.indegree"] = $inDegree

method setOutDegree*(node:NodeObj; outDegree: int) =
  node.attributes["parse.outdegree"] = $outDegree

method setDescription*[T:NodeObj](obj:T; description:string ) =
  obj.description = description

method add*(node:NodeObj; data: DataObj ) =
  node.datas &= data

#proc setUrl*(node:var NodeObj; url: string) =
#  node.attributes["xlink:href"] = url  

# when isMainModule:
#   var root = DataObj()

