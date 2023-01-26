import xmltree2
import std/[tables, sequtils, options]
import common

proc addDescription[T:XmlNode](o:var T; value:string) =
  var desc = newXmlTree("desc", [], [].toXmlAttributes)
  desc.add newText(value)
  o.add desc

proc addDefault[T:var XmlNode](o:T; value:string) =
  var default = newXmlTree("default", [], [].toXmlAttributes)
  default.add newText(value)
  o.add default


proc addLocator(o:var XmlNode; obj:LocatorObj) =
  var xml = newXmlTree("locator", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  o.add xml


method toXml*(obj:DataObj): XmlNode =
  var xml = newXmlTree("data", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  if obj.value != "":
    xml.add newText(obj.value)
  return xml

method addData(o:var XmlNode; obj:DataObj) =
  var xml = obj.toXml
  o.add xml

proc addPort(o:var XmlNode; obj:PortObj) =
  var xml = newXmlTree("port", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  if obj.description != "":
    xml.addDescription(obj.description)

  for data in obj.datas:
    xml.addData(data)

  for port in obj.ports:
    xml.addPort(port)

  o.add xml

proc addGraph(o:var XmlNode; obj: GraphObj)


method toXml*(obj: NodeObj):XmlNode =
  var xml = newXmlTree("node", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  if obj.description != "":
    xml.addDescription(obj.description)

  case obj.isLocator:
  of true:
    xml.addLocator(obj.locator)
  else:
    for data in obj.datas:
      xml.addData(data)

    for port in obj.ports:
      xml.addPort(port)

    if obj.graph.isSome:
      xml.addGraph(obj.graph.get)
  return xml


method addNode*(o:var XmlNode; obj: NodeObj) =
  var xml = obj.toXml
  o.add xml


proc addEndpoint(o:var XmlNode; obj: EndpointObj) =
  var xml = newXmlTree("endpoint", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  if obj.description != "":
    xml.addDescription(obj.description)

  o.add xml

proc addEdge(o:var XmlNode; obj: EdgeObj) =
  var xml = newXmlTree("edge", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  if obj.description != "":
    xml.addDescription(obj.description)


  for data in obj.datas:
    xml.addData(data)

  if obj.graph.isSome:
    xml.addGraph(obj.graph.get)

  o.add xml


proc addHyperedge(o:var XmlNode; obj: HyperedgeObj) =
  var xml = newXmlTree("hyperedge", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  if obj.description != "":
    xml.addDescription(obj.description)


  for data in obj.datas:
    xml.addData(data)

  for endpoint in obj.endpoints:
    xml.addEndpoint(endpoint)

  if obj.graph.isSome:
    xml.addGraph(obj.graph.get)

  o.add xml


proc addGraph(o:var XmlNode; obj: GraphObj) =
  var xml = newXmlTree("graph", [], obj.attributes.toAttributesSeq.toXmlAttributes)
  if obj.description != "":
    xml.addDescription(obj.description)

  case obj.isLocator:
  of true:
    xml.addLocator(obj.locator)
  else:
    for data in obj.datas:
      xml.addData(data)

    for node in obj.nodes:
      xml.addNode(node)

    for edge in obj.edges:
      xml.addEdge(edge)

    for hyperedge in obj.hyperedges:
      xml.addHyperedge(hyperedge)

  o.add xml

proc toXml*(o:GraphMlObj):XmlNode =
  result = newXmlTree("graphml", [], o.attributes.toAttributesSeq.toXmlAttributes)
  # Add graphml description
  if o.description != "":
    result.addDescription(o.description)

  # Add the keys
  for k in o.keys:
    var key = newXmlTree("key", [], k.attributes.toAttributesSeq.toXmlAttributes)
    if k.description != "":
      key.addDescription(k.description)
    if k.default != "":
      key.addDefault(k.default)
    result.add key 
  
  
  #case o.kind:
  #of gkGraph: # Add the graphs
  for graph in o.graphs:
      result.addGraph( graph )

  #of gkData:  # Add the data
  for data in o.datas:
      result.addData( data )  

proc `$`*(o:GraphMlObj):string =
  result = xmlHeader

  # var root = newXmlTree("graphml", [], o.attributes.toAttributesSeq.toXmlAttributes)
  # # Add graphml description
  # if o.description != "":
  #   root.addDescription(o.description)

  # # Add the keys
  # for k in o.keys:
  #   var key = newXmlTree("key", [], k.attributes.toAttributesSeq.toXmlAttributes)
  #   if k.description != "":
  #     key.addDescription(k.description)
  #   if k.default != "":
  #     key.addDefault(k.default)
  #   root.add key 
  
  
  # case o.kind:
  # of gkGraph: # Add the graphs
  #   for graph in o.graphs:
  #     root.addGraph( graph )

  # of gkData:  # Add the data
  #   for data in o.datas:
  #     root.addData( data )

  result &= $o.toXml
