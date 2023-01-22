import graphml
import std/logging

proc main =
  var consoleLog = newConsoleLogger()
  addHandler(consoleLog)

  var gml = newGraphml()
  gml["xmlns"]              = "http://graphml.graphdrawing.org/xmlns"
  gml["xmlns:xlink"]        = "http://www.w3.org/1999/xlink"
  gml["xmlns:xsi"]          = "http://www.w3.org/2001/XMLSchema-instance"
  gml["xsi:schemaLocation"] = "http://graphml.graphdrawing.org/xmlnsgraphml+xlink.xsd" 
  gml.setDescription("Just testing")

  # new key
  var key0 = newKey("d0")
  key0.setFor("node")
  key0.setNameAsString("color")
  key0.setDefault("yellow")
  key0.setDescription("This defines a color which defaults to yellow")
  gml.add key0

  # new key
  var key1 = newKey("d1")
  key1.setFor("edge")
  key1.setNameAsDouble("weight")
  key1.setDescription("This defines a weight as double")
  gml.add key1

  # new graph
  var g = newGraphUndirected( id = "G")
  var n1 = newNode(id = "n0" )
  n1.setDescription("n0 example")
  n1["xlink:href"] = "http://graphml.graphdrawing.org"
  var n2 = newNode(id = "n1" )  
  
  var e1 = newEdge("n0", "n1")

  var data1 = newData("d0")
  data1.set("green")

  n1.add data1
  g.add n1
  g.add n2

  var data2 = newData("d1")
  data2.set(1.0) 
  e1.add data2
  g.add e1 

  gml.add g

  echo $gml

main()  