--[[
Copyright © 2017, Matt Hampton
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of eventFwd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Matt Hampton BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--]]

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
events = T{}
events = require('eventInfo')

require("eventCallbacks")
setCallbacks(events)

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

eventIds = T{}
for idx, evInfo in pairs(events) do
	eventIds[evInfo["name"]] = evInfo["id"]
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

--gain buff 	number buff_id 	None 	Triggers on receiving a buff or debuff.
--lose buff 	number buff_id 	None 	Triggers on losing a buff or debuff. 
function printEventInfo(iEventId)
	local evInfo = events[iEventId]
	--table.vprint(evInfo)
	--evInfo.cb()
	--print("events has ", #events, " items.")
	--print("id passed was", iEventId)
end

function register_event(iEvent)
	local ev = nil
	if(type(iEvent) == "number") then
		ev = events[iEvent]
		log("type number")
	elseif(type(iEvent) == "string") then
		ev = events[eventIds[iEvent]]
		log("type string")
	else
		log("unknown type passed to 'eventFwd.register_event'.")
		return 1
	end
	if ev == nil then
		error("Could not find event " .. iEvent)
		return 2
	end
	windower.register_event(ev.name, ev.cb)
	return 0
end

--register_event("gain buff")











