import xmltree2
import std/[tables]
import common



method setId*(key:KeyObj; value: string) =
  key.attributes["id"] = value

proc newKey*(id:string):KeyObj =
  result = KeyObj()
  result.setId(id)

method setFor*(key:KeyObj; value: string) =
  key.attributes["for"] = value

method setNameType*(key:KeyObj; name,typ: string) =
  key.attributes["attr.name"] = name
  key.attributes["attr.type"] = name

method setNameAsDouble*(key:KeyObj; name: string) =
  key.attributes["attr.name"] = name
  key.attributes["attr.type"] = "double"

method setNameAsString*(key:KeyObj; name: string) =
  key.attributes["attr.name"] = name
  key.attributes["attr.type"] = "string"
  

method setDefault*(key:KeyObj; value: string) =
  key.default = value

method setDescription*(key:var KeyObj; value: string) =
  key.description = value


