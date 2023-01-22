# Package

version       = "0.1.2"
author        = "Jose Maria Garcia"
description   = "graphml creator"
license       = "MIT"

#bin = @[]
srcDir = "src"
#installExt = @["nim"]

# Dependencies

requires "nim >= 1.0.0"

# when defined(nimdistros):
#   import distros
#   if detectOs(Ubuntu):
#     foreignDep "libssl-dev"
#   else:
#     foreignDep "openssl"

# task test, "Run the Nimble tester!":
#   withDir "tests":
#     exec "nim c -r --gc:refc tester"