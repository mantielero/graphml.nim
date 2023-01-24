import xmltree2
import std/[tables, logging, strformat]
import key,graph, common, xml
import system


proc newGraphMl*(isData:bool = false):GraphMlObj =
  if isData:
    return GraphMlObj(kind: gkData)
  return GraphMlObj(kind: gkGraph)

proc setDescription*(g:var GraphMlObj; description: string ) =
  g.description = description

proc add*(g:var GraphMlObj; obj: KeyObj) =
  if "id" in obj.attributes:
    for k in g.keys:
      if k.attributes["id"] == obj.attributes["id"]:
        error(&"""Trying to add another {$typeof(obj)} into {$typeof(g)} with the same id="{obj.attributes["id"]}".""")
        quit(1)
  g.keys &= obj

proc add*(g:var GraphMlObj; obj: GraphObj) =
  if "id" in obj.attributes:
    for o in g.graphs:
      if o.attributes["id"] == obj.attributes["id"]:
        error(&"""Trying to add another {$typeof(obj)} into {$typeof(g)} with the same id="{obj.attributes["id"]}".""")
        quit(1)
  g.graphs &= obj