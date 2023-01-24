import xmltree2
import std/[tables, options]
import common, data, graph





proc setSource*(edge:var EdgeObj; source: string) =
  edge.attributes["source"] = source

proc setTarget*(edge:var EdgeObj; target: string) =
  edge.attributes["target"] = target

proc setId*(edge:var EdgeObj; id: string) =
  ## optional
  edge.attributes["id"] = id

proc newEdge*(source, target: string):EdgeObj =
  result = EdgeObj()
  result.setSource(source)
  result.setTarget(target)

proc setDirected*(edge:var EdgeObj) =
  ## optional
  edge.attributes["directed"] = "true"

proc setDescription*(edge: var EdgeObj; description: string) =
  edge.description = description


proc setSourcePort*(edge:var EdgeObj; sourcePort:string) =
  ## optional
  edge.attributes["sourceport"] = sourcePort

proc setTargetPort*(edge:var EdgeObj; targetPort:string) =
  ## optional
  edge.attributes["targetport"] = targetPort



#proc setUrl*(node:var NodeObj; url: string) =
#  node.attributes["xlink:href"] = url  

# when isMainModule:
#   var root = DataObj()

proc add*(graph: var EdgeObj; data: DataObj) =
  graph.datas &= data