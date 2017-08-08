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

return {
	[0]  = {id=0,  name="load", args={}, ret={}, cb=nil, desc="Triggers on addon load. Cannot be used in eventFwd addon."},
	[1]  = {id=1,  name="unload", args={}, ret={}, cb=nil, desc="Triggers on addon unload. Cannot be used in eventFwd addon."},
	[2]  = {id=2,  name="login", args={name='string'}, ret={}, cb=nil, desc="Triggers on login."},
	[3]  = {id=3,  name="logout", args={name='string'}, ret={}, cb=nil, desc="Triggers on logout."},
	[4]  = {id=4,  name="gain buff", args={buff_id='uint16'}, ret={}, cb=nil, desc="Triggers on receiving a buff or debuff."},
	[5]  = {id=5,  name="lose buff", args={buff_id='uint16'}, ret={}, cb=nil, desc="Triggers on losing a buff or debuff."},
	[6]  = {id=6,  name="gain experience", args={amount='uint32', chain_number='uint16', limit='bool'}, ret={}, cb=nil, desc="Triggers on gaining any experience. limit is true, if the EXP gained were limit points."},
	[7]  = {id=7,  name="lose experience", args={amount='uint32'}, ret={}, cb=nil, desc="Triggers on losing any experience."},
	[8]  = {id=8,  name="level up", args={level='byte'}, ret={}, cb=nil, desc="Triggers on gaining a level."},
	[9]  = {id=9,  name="level down", args={level='byte'}, ret={}, cb=nil, desc="Triggers on losnig a level."},
	[10] = {id=10, name="job change", args={main_job_id='byte', main_job_level='byte', sub_job_id='byte', sub_job_level='byte'}, ret={}, cb=nil, desc="Triggers on job change. This will trigger on both main and sub job change."},
	[11] = {id=11, name="target change", args={index='uint32'}, ret={}, cb=nil, desc="Triggers on target change."},
	[12] = {id=12, name="weather change", args={weather_id='byte'}, ret={}, cb=nil, desc="Triggers on weather change."},
	[13] = {id=13, name="status change", args={new_status_id='byte', old_status_id='byte'}, ret={}, cb=nil, desc="Triggers on player status change. This only triggers for the following statuses: Idle, Engaged, Resting, Dead, Zoning"},
	[14] = {id=14, name="hp change", args={new_hp='uint16', old_hp='uint16'}, ret={}, cb=nil, desc="Triggers on HP change."},
	[15] = {id=15, name="mp change", args={new_mp='uint16', old_mp='uint16'}, ret={}, cb=nil, desc="Triggers on MP change."},
	[16] = {id=16, name="tp change", args={new_tp='uint16', old_tp='uint16'}, ret={}, cb=nil, desc="Triggers on TP change."},
	[17] = {id=17, name="hpp change", args={new_hpp='byte', old_hpp='byte'}, ret={}, cb=nil, desc="Triggers on HP% change."},
	[18] = {id=18, name="mpp change", args={new_mpp='byte', old_mpp='byte'}, ret={}, cb=nil, desc="Triggers on MP% change."},
	[19] = {id=19, name="hpmax change", args={new_hp_max='uint16', old_hp_max='uint16'}, ret={}, cb=nil, desc="Triggers on maximum HP change."},
	[20] = {id=20, name="mpmax change", args={new_mp_max='uint16', old_mp_max='uint16'}, ret={}, cb=nil, desc="Triggers on maximum MP change."},
	[21] = {id=21, name="chat message", args={message='string', sender='string', mode='byte', gm='bool'}, ret={}, cb=nil, desc="Triggers on any chat message. This only includes FFXI chat messages and will therefor not work with Windower-based chat events, like FFOChat."},
	[22] = {id=22, name="emote", args={emote_id='uint16', sender_id='uint32', target_id='uint32', motion='bool'}, ret={}, cb=nil, desc="Triggers on any player doing an emote. motion is true if it's only motioned without text."},
	[23] = {id=23, name="party invite", args={sender='string', sender_id='uint32'}, ret={}, cb=nil, desc="Triggers on receiving a party or alliance invite."},
	[24] = {id=24, name="examined", args={name='string', sender_index='uint32'}, ret={}, cb=nil, desc="Triggers on being examined. name is the name of the person to examine you."},
	[25] = {id=25, name="time change", args={new='uint16', old='uint16'}, ret={}, cb=nil, desc="Triggers on time change. This only triggers when the displayed in-game time actually changes. Both arguments are the number of minutes since the beginning of the in-game day."},
	[26] = {id=26, name="day change", args={new_day='string', old_day='string'}, ret={}, cb=nil, desc="Triggers on day change."},
	[27] = {id=27, name="moon change", args={new_moon='string', old_moon='string'}, ret={}, cb=nil, desc="Triggers on moon type change. This means Full Moon, Waning Gibbous, etc."},
	[28] = {id=28, name="linkshell change", args={new_ls='string', old_ls='string'}, ret={}, cb=nil, desc="Triggers on changing linkshells."},
	[29] = {id=29, name="zone change", args={new_id='uint16', old_id='uint16'}, ret={}, cb=nil, desc="Fires whenever the player is zoning. This includes logging in and logging out."},
	[30] = {id=30, name="add item", args={bag='byte', index='byte', id='uint16', count='byte'}, ret={}, cb=nil, desc="Triggers whenever an item enters a bag (through trade, dropping from the treasure pool, NPC reward, moving it from another bag, etc.)."},
	[31] = {id=31, name="remove item", args={bag='byte', index='byte', id='uint16', count='byte'}, ret={}, cb=nil, desc="Triggers whenever an item leaves a bag (through trade, dropping it, usage, etc.)."},
	[32] = {id=32, name="incoming text", args={original='string', modified='string', original_mode='byte', blocked='bool'}, ret={modified='string', color='uint16', block='bool'}, cb=nil, desc="Triggers on any incoming line in the chatlog. Optionally returns modified string and color or true to block the incoming text from appearing in the chatlog. In that case it will still be sent to other addons with the blocked argument set to true."},
	[33] = {id=33, name="incoming chunk", args={id='uint32', original='string', modified='string', injected='bool', blocked='bool'}, ret={pkt='string', block='bool'}, cb=nil, desc="Triggers on any incoming packet. Optionally returns modified packet or true to block the packet."}
	[34] = {id=34, name="outgoing text", args={original='string', modified='string', blocked='bool'}, ret={modified='string', block='bool'}, cb=nil, desc="Triggers on any outgoing line in the user sends. Optionally returns modified string or true to block the outgoing text from being sent to the game. In that case it will still be sent to other addons with the blocked argument set to true."},
	[35] = {id=35, name="outgoing chunk", args={id='uint32', original='string', modified='string', injected='bool', blocked='bool'}, ret={pkt='string', block='bool'}, cb=nil, desc="Triggers on any outgoing packet. Optionally returns modified packet or true to block the packet."}
	[36] = {id=36, name="mouse", args={type_='uint16', x='float', y='float', delta='float', blocked='uint32'}, ret={caught='bool'}, cb=nil, desc="Triggers on any mouse action, including movement. Optionally returns a bool indicating whether or not the mouse action has been caught. If true, it will not be passed on to the next stage, so the mouse action would never reach the game."},
	[37] = {id=37, name="keyboard", args={dik='uint32', flags='uint32', blocked='bool'}, ret={caught='bool'}, cb=nil, desc="Triggers on any keyboard action, including release of a button. Optionally returns a bool indicating whether or not the keyboard action has been caught. If true, it will not be passed on to the next stage, so the keyboard action would never reach the game."},
	[38] = {id=38, name="ipc message", args={message='string'}, ret={}, cb=nil, desc="Triggers on an incoming IPC message."},
	[39] = {id=39, name="addon command", args={command='list'}, ret={}, cb=nil, desc="Triggers on passing an addon command, which is any command of the form lua c <name>, where name is the addon name. (Everything after the command is passed to the function, not the command itself.)"},
	[40] = {id=40, name="unhandled command", args={command='list'}, ret={}, cb=nil, desc="Triggers on Windower commands that weren't processed by any other plugin. (The entire line is passed to the function, including the command.)"},
	[41] = {id=41, name="pipe message", args={message='string pointer'}, ret={}, cb=nil, desc="Triggers upon receiving a message from the named pipe reader \\.\pipe\luaReader."},
	[42] = {id=42, name="prerender", args={name='string'}, ret={}, cb=nil, desc="Triggers before every rendering tick."},
	[43] = {id=43, name="postrender", args={name='string'}, ret={}, cb=nil, desc="Triggers after every rendering tick."},
}































