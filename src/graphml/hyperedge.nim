import xmltree2
import std/[tables, options]
import common, data




proc setId*(hyperedge:var HyperEdgeObj; id: string) =
  ## optional
  hyperedge.attributes["id"] = id


proc setDescription*(edge: var HyperEdgeObj; description: string) =
  edge.description = description





#proc setUrl*(node:var NodeObj; url: string) =
#  node.attributes["xlink:href"] = url  

# when isMainModule:
#   var root = DataObj()

