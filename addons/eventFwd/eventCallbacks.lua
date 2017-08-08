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

local callbacksSet = False

function setCallbacks()
	if callbackSet then
		return 0
	end
	events[2].cb  = evCb_login
	events[3].cb  = evCb_logout
	events[4].cb  = evCb_gain_buff
	events[5].cb  = evCb_lose_buff
	events[6].cb  = evCb_gain_experience
	events[7].cb  = evCb_lose_experience
	events[8].cb  = evCb_level_up
	events[9].cb  = evCb_level_down
	events[10].cb = evCb_job_change
	events[11].cb = evCb_target_change
	events[12].cb = evCb_weather_change
	events[13].cb = evCb_status_change
	events[14].cb = evCb_hp_change
	events[15].cb = evCb_mp_change
	events[16].cb = evCb_tp_change
	events[17].cb = evCb_hpp_change
	events[18].cb = evCb_mpp_change
	events[19].cb = evCb_hpmax_change
	events[20].cb = evCb_mpmax_change
	events[21].cb = evCb_chat_message
	events[22].cb = evCb_emote
	events[23].cb = evCb_party_invite
	events[24].cb = evCb_examined
	events[25].cb = evCb_time_change
	events[26].cb = evCb_day_change
	events[27].cb = evCb_moon_change
	events[28].cb = evCb_linkshell_change
	events[29].cb = evCb_zone_change
	events[30].cb = evCb_add_item
	events[31].cb = evCb_remove_item
	events[32].cb = evCb_incoming_text
	events[33].cb = evCb_incoming_chunk
	events[34].cb = evCb_outgoing_text
	events[35].cb = evCb_outgoing_chunk
	events[36].cb = evCb_mouse
	events[37].cb = evCb_keyboard
	events[38].cb = evCb_ipc_message
	events[39].cb = evCb_addon_command
	events[40].cb = evCb_unhandled_command
	events[41].cb = evCb_pipe_message
	events[42].cb = evCb_prerender
	events[43].cb = evCb_postrender
		
	callbacksSet = True
	return 0
end

function evCb_login(name)
	send("2 " .. name)
end
function evCb_logout(name)
	send("3 " .. name)
end
function evCb_gain_buff(buff_id)
	send("4 " .. buff_id)
end
function evCb_lose_buff(buff_id)
	send("5 " .. buff_id)
end
function evCb_gain_experience(amount, chain_number, limit)
	send("6 " .. amount .. " " .. chain_number .. " " .. tostring(limit))
end
function evCb_lose_experience(amount)
	send("7 " .. amount)
end
function evCb_level_up(level)
	send("8 " .. level)
end
function evCb_level_down(level)
	send("9 " .. level)
end
function evCb_job_change(main_job_id, main_job_level, sub_job_id, sub_job_level)
	send("10 " .. main_job_id .. " " .. main_job_level .. " " .. sub_job_id .. " " .. sub_job_level)
end
function evCb_target_change(index)
	send("11 " .. index)
end
function evCb_weather_change(weather_id)
	send("12 " .. weather_id)
end
function evCb_status_change(new_status_id, old_status_id)
	send("13 " .. new_status_id .. " " .. old_status_id)
end
function evCb_hp_change(new_hp, old_hp)
	send("14 " .. new_hp .. " " .. old_hp)
end
function evCb_mp_change(new_mp, old_mp)
	send("15 " .. new_mp .. " " .. old_mp)
end
function evCb_tp_change(new_tp, old_tp)
	send("16 " .. new_tp .. " " .. old_tp)
end
function evCb_hpp_change(new_hpp, old_hpp)
	send("17 " .. new_hpp .. " " .. old_hpp)
end
function evCb_mpp_change(new_mpp, old_mpp)
	send("18 " .. new_mpp .. " " .. old_mpp)
end
function evCb_hpmax_change(new_hp_max, old_hp_max)
	send("19 " .. new_hp_max .. " " .. old_hp_max)
end
function evCb_mpmax_change(new_mp_max, old_mp_max)
	send("20 " .. new_mp_max .. " " .. old_mp_max)
end
function evCb_chat_message(message, sender, mode, gm)
	-- Arbitrary length message goes last for the sake of parsing
	-- on the receiving side.
	send("21 " .. tostring(gm) .. mode .. sender .. message)
end
function evCb_emote(emote_id, sender_id, target_id, motion)
	send("22 " .. emote_id .. " " .. sender_id .. " " .. target_id .. " " .. tostring(motion))
end
function evCb_party_invite(sender, sender_id)
	send("23 " .. sender .. " " .. sender_id)
end
function evCb_examined(name, sender_index)
	send("24 " .. name .. " " .. sender_index)
end
function evCb_time_change(new, old)
	send("25 " .. new .. " " .. old)
end
function evCb_day_change(new_day, old_day)
	send("26 " .. new_day .. " " .. old_day)
end
function evCb_moon_change(new_moon, old_moon)
	send("27 " .. new_moon .. " " .. old_moon)
end
function evCb_linkshell_change(new_ls, old_ls)
	send("28 " .. new_ls .. " " .. old_ls)
end
function evCb_zone_change(new_id, old_id)
	send("29 " .. new_id .. " " .. old_id)
end
function evCb_add_item(bag, index, id, count)
	send("30 " .. bag .. " " .. index .. " " .. id .. " " .. count)
end
function evCb_remove_item(bag, index, id, count)
	send("31 " .. bag .. " " .. index .. " " .. id .. " " .. count)
end
function evCb_incoming_text(original, modified, original_mode, blocked)
	send("32 " .. string.len(original) .. " " .. string.len(modified) .. " " .. modified .. " " .. original .. " " .. original_mode .. " " .. tostring(blocked))
	return modified
end
function evCb_incoming_chunk(id, original, modified, injected, blocked)
	send("33 " .. id .. " " .. string.len(original) .. " " .. string.len(modified) .. " " .. original .. " " .. modified .. " " .. tostring(injected) .. " " .. tostring(blocked))
	return modified
function evCb_outgoing_text(original, modified, blocked)
	send("34 " .. string.len(original) .. " " .. string.len(modified) .. " " .. modified .. " " .. original .. " " .. tostring(blocked)
end
function evCb_outgoing_chunk(id, original, modified, injected, blocked)
	send("35 " .. id .. " " .. string.len(original) .. " " .. string.len(modified) .. " " .. original .. " " .. modified .. " " .. tostring(injected) .. " " .. tostring(blocked))
	return modified
end
function evCb_mouse(type_, x, y, delta, blocked)
	send("36 " .. type_ .. " " .. x .. " " .. y .. " " .. delta .. " " .. blocked)
end
function evCb_keyboard(dik, flags, blocked)
	send("37 " .. dik .. " " .. flags .. " " .. blocked)
end
function evCb_ipc_message(message)
	send("38 " .. message)
end
function evCb_addon_command(command)
	-- TBD: Need to iterate over a list of strings and concat them all.
	send("39 " .. command)
end
function evCb_unhandled_command(command)
	-- TBD: Need to iterate over a list of strings and concat them all.
	send("40 " .. command)
end
function evCb_pipe_message(message)
	-- TBD: Not sure how this will work. Need a testcase to try.
	send("41 " .. message)
end
function evCb_prerender()
	send("42 ")
end
function evCb_postrender()
	send("43 ")
end

end
