import xmltree2
import std/[tables]
import common



proc setId*(key:var KeyObj; value: string) =
  key.attributes["id"] = value

proc newKey*(id:string):KeyObj =
  result = KeyObj()
  result.setId(id)

proc setFor*(key:var KeyObj; value: string) =
  key.attributes["for"] = value

proc setNameType*(key:var KeyObj; name,typ: string) =
  key.attributes["attr.name"] = name
  key.attributes["attr.type"] = name

proc setNameAsDouble*(key:var KeyObj; name: string) =
  key.attributes["attr.name"] = name
  key.attributes["attr.type"] = "double"

proc setNameAsString*(key:var KeyObj; name: string) =
  key.attributes["attr.name"] = name
  key.attributes["attr.type"] = "string"
  

proc setDefault*(key:var KeyObj; value: string) =
  key.default = value

proc setDescription*(key:var KeyObj; value: string) =
  key.description = value


