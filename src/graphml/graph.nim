import xmltree2
import std/[tables]
import common


method setId*(graph:GraphObj, value:string) =
  graph.attributes["id"] = value

method setDirected*(graph:GraphObj) =
  graph.attributes["edgedefault"] = "directed"

method setUndirected*(graph:GraphObj) =
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


method add*(graph: GraphObj; obj: NodeObj) =
  graph.nodes &= obj

method add*(graph: GraphObj; obj: EdgeObj) =  
  graph.edges &= obj