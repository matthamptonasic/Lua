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
--[] = {id=, name="", args={name='string'}, ret={}, cb=nil, desc=""},

local callbacksSet = False

function setCallbacks()
	if callbackSet then
		return 0
	end
	events[4].cb = evCb_gain_buff
	
	callbacksSet = True
	return 0
end

function evCb_gain_buff()
	print("sending gain_buff.")
end

--[[
return {
	[0] = {id=0, name="load", args={}, ret={}, cb=nil, desc="Triggers on addon load. Cannot be used in eventFwd addon."},
	[1] = {id=1, name="unload", args={}, ret={}, cb=nil, desc="Triggers on addon unload. Cannot be used in eventFwd addon."},
	[2] = {id=2, name="login", args={name='string'}, ret={}, cb=nil, desc="Triggers on login."},
	[3] = {id=3, name="logout", args={name='string'}, ret={}, cb=nil, desc="Triggers on logout."},
	[4] = {id=4, name="gain buff", args={buff_id='uint16'}, ret={}, cb=nil, desc="Triggers on receiving a buff or debuff."},
	[5] = {id=5, name="lose buff", args={buff_id='uint16'}, ret={}, cb=nil, desc="Triggers on losing a buff or debuff."},
	[6] = {id=6, name="gain experience", args={amount='uint32', chain_number="uint16", limit="bool"}, ret={}, cb=nil, desc="Triggers on gaining any experience. limit is true, if the EXP gained were limit points."},
	[7] = {id=7, name="lose experience", args={amount='uint32'}, ret={}, cb=nil, desc="Triggers on losing any experience."}
}
--]]
