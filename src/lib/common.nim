import xmltree2
import std/[tables, options]

type
  AttributesTyp* = Table[string, string]

  LocatorObj* = object
    attributes*:AttributesTyp

  EndPointObj* = object
    attributes*:AttributesTyp
    description*:string # optional

  DataObj* = object
    #desc?, default?
    attributes*:AttributesTyp
    value*: string
    #description*: string  # Optional
    #default*:string       # Optional

  KeyObj* = object
    #desc?, default?
    attributes*:AttributesTyp
    description*: string  # Optional
    default*:string       # Optional



  PortObj* = object
    #desc?, ( data | port )*
    attributes*:AttributesTyp
    description*: string  # Optional
    datas*:seq[DataObj]
    ports*:seq[PortObj]

  NodeObj* = object
    #desc?, ( ( data | port )*, graph? | locator )
    attributes*:AttributesTyp
    #value*: string
    description*: string  # Optional
    case isLocator*:bool:
    of true:
      locator*:LocatorObj
    else:
      datas*:seq[DataObj]
      ports*:seq[PortObj]
      graph*: Option[GraphObj]  # Optional



  GraphObj* = ref object
    # desc?, ( ( data | node | edge | hyperedge )* | locator )
    attributes*:AttributesTyp
    description*: string # optional
    case isLocator*:bool:
    of true:
      locator*:LocatorObj
    else:
      datas*:seq[DataObj]
      nodes*:seq[NodeObj]    
      edges*:seq[EdgeObj]    
      hyperedges*:seq[HyperEdgeObj]

  EdgeObj* = ref object
    # desc?, data*, graph?
    attributes*:AttributesTyp
    description*: string  # Optional
    datas*:seq[DataObj]
    graph*: Option[GraphObj]   # Optional


  HyperEdgeObj* = object
    #desc?, ( data | endpoint )*, graph?
    attributes*:AttributesTyp
    description*: string  # Optional
    datas*:seq[DataObj]
    endpoints*:seq[EndPointObj]
    graph*:Option[GraphObj]  # Optional


  GraphMlKind* = enum
    gkGraph, gkData
  GraphMlObj* = object
    #desc?, key*, ( graph | data )*
    attributes*:AttributesTyp
    description*: string
    keys*:seq[KeyObj]
    case kind*:GraphMlKind:
    of gkGraph:
      graphs*:seq[GraphObj]
    of gkData:
      datas*:seq[DataObj]

converter toAttributesSeq*(attribs:AttributesTyp):seq[tuple[key,val:string]] =
  for (k,v) in attribs.pairs:
    result &= (k,v)


proc `[]=`*[T:GraphMlObj|NodeObj|KeyObj](obj:var T; key,value:string) =
  obj.attributes[key] = value

# proc `[]=`*(obj:var NodeObj; key,value:string) =
#   obj.attributes[key] = value

# proc newXmlNode*(tag:string; attributes: varargs[tuple[key,val:string]]): XmlNode =
#   newXmlTree(tag, [], attributes.toXmlAttributes)

# proc `[]=`*(g:var GraphMlObj; key,val:string) =
#   g.attributes[key] = val