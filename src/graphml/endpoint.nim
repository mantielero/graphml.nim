import xmltree2
import std/[tables] #, options]
import common#, data




method setId*(endpoint: EndPointObj; id: string) =
  ## optional
  endpoint.attributes["id"] = id

method setPort*(endpoint:EndPointObj; port: string) =
  ## optional
  endpoint.attributes["port"] = port

method setNode*(endpoint:EndPointObj; node: string) =
  ## optional
  endpoint.attributes["node"] = node

proc newEndpoint*(node:string):EndPointObj =
  result = EndPointObj()
  result.setNode(node)

method setDescription*(endpoint: EndPointObj; description: string ) =
  endpoint.description = description