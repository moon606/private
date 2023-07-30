local API = {}

local dir = script.Parent

API.basic = loadstring(game:HttpGet("https://raw.githubusercontent.com/oldAccount894/private/main/stdfunctions.lua"))() -- gets Standard functions (exists like this so .Math can require the stdfunctions module without recursion)
API.math = loadstring(game:HttpGet("https://raw.githubusercontent.com/oldAccount894/private/main/Math.lua"))() -- Math Library

return API
