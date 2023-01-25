import xmltree2
import std/[tables] #, options]
import common#, data




method setRef*(locator:LocatorObj; href: string) =
  ## optional
  locator.attributes["xlink:href"] = href


proc newLocator*(url:string):LocatorObj =
  result = LocatorObj()
  result.setRef(url)


