import xmltree2
import std/[tables, options]
import common, data, graph



method setSource*(edge:EdgeObj; source: string) =
  edge.attributes["source"] = source

method setTarget*(edge:EdgeObj; target: string) =
  edge.attributes["target"] = target

method setId*(edge:EdgeObj; id: string) =
  ## optional
  edge.attributes["id"] = id

proc newEdge*(source, target: string):EdgeObj =
  result = EdgeObj()
  result.setSource(source)
  result.setTarget(target)

method setDirected*(edge:EdgeObj) =
  ## optional
  edge.attributes["directed"] = "true"

method setDescription*(edge: EdgeObj; description: string) =
  edge.description = description


method setSourcePort*(edge: EdgeObj; sourcePort:string) =
  ## optional
  edge.attributes["sourceport"] = sourcePort

method setTargetPort*(edge: EdgeObj; targetPort:string) =
  ## optional
  edge.attributes["targetport"] = targetPort



#proc setUrl*(node:var NodeObj; url: string) =
#  node.attributes["xlink:href"] = url  

# when isMainModule:
#   var root = DataObj()

method add*(graph: EdgeObj; data: DataObj) =
  graph.datas &= data