import xmltree2
import std/[tables, options]
import common, data




method setId*(hyperedge: HyperEdgeObj; id: string) =
  ## optional
  hyperedge.attributes["id"] = id


method setDescription*(edge: HyperEdgeObj; description: string) =
  edge.description = description





#proc setUrl*(node:var NodeObj; url: string) =
#  node.attributes["xlink:href"] = url  

# when isMainModule:
#   var root = DataObj()

