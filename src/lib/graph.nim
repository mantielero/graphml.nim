import xmltree2
import std/[tables]
import common


proc setId*(graph:var GraphObj, value:string) =
  graph.attributes["id"] = value

proc setDirected*(graph:var GraphObj) =
  graph.attributes["edgedefault"] = "directed"

proc setUndirected*(graph:var GraphObj) =
  graph.attributes["edgedefault"] = "undirected"


proc newGraphDirected*(id:string = ""; isLocator:bool = false):GraphObj =
  result = GraphObj(isLocator: isLocator)
  result.setDirected()
  if id != "":
    result.setId(id)

proc newGraphUndirected*(id:string = ""; isLocator:bool = false):GraphObj =
  result = GraphObj(isLocator: isLocator) 
  result.setUndirected()   
  if id != "":
    result.setId(id)


proc add*(graph: var GraphObj; obj: NodeObj) =
  graph.nodes &= obj

proc add*(graph: var GraphObj; obj: EdgeObj) =  
  graph.edges &= obj