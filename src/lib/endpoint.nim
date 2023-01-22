import xmltree2
import std/[tables] #, options]
import common#, data




proc setId*(endpoint:var EndPointObj; id: string) =
  ## optional
  endpoint.attributes["id"] = id

proc setPort*(endpoint:var EndPointObj; port: string) =
  ## optional
  endpoint.attributes["port"] = port

proc setNode*(endpoint:var EndPointObj; node: string) =
  ## optional
  endpoint.attributes["node"] = node

proc newEndpoint*(node:string):EndPointObj =
  result = EndPointObj()
  result.setNode(node)

proc setDescription*(endpoint:var EndPointObj; description: string ) =
  endpoint.description = description