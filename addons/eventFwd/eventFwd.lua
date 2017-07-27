_addon.name = 'eventFwd'
_addon.author = 'hammy025'
_addon.version = '1.0.0.0'
_addon.command = 'eventFwd'
_addon.command = 'ef'
_addon.command = 'fwd'

require('tables')
require('chat')
require('logger')
require('functions')

packets = require('packets')
files = require('files')
config = require('config')
res = require('resources')
local socket = require("socket")

defaults = {}
settings = config.load(defaults)

local socketPort = 0
local socketAddr = "127.0.0.1"
local socketClient = nil

itemIds = T{}
for item in res.items:it() do
    itemIds[item.name:lower()] = item.id
    itemIds[item.name_log:lower()] = item.id
end
bagIds = T{}
for bag in res.bags:it() do
    bagIds[bag.name:lower()] = bag.id
end

function setSocketPort(iPortNb)
	socketPort = iPortNb
end

-- iData must be formatted into a string.
-- The first 2 bytes will be a type ID.
-- The remaining values will be dependent on the type.
function send(iData)
	socketClient = socket.tcp()
	socketClient:connect(socketAddr, socketPort)
	if socketClient == nil then
		error("socketClient was nil.")
		return 1
	end
	socketClient:send(iData)
	socketClient:close()
	return 0
end
