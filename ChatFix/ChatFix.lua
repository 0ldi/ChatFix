local Frame = CreateFrame("FRAME");
Frame:RegisterEvent("PLAYER_ENTERING_WORLD");

local start_time = GetTime();
local is_in_world = false;
local is_in_reported = false;
local leaved = false;

 Frame:SetScript("OnUpdate", function(self, elapsed)
	if is_in_world and not is_in_reported then
		local elapsed = GetTime()  -  start_time;
		if elapsed >= 15 and not leaved then
			LeaveChannelByName("reported")
			leaved = true
			DEFAULT_CHAT_FRAME:AddMessage("Leaving reported channel.")
		end

		if elapsed >= 20  and leaved then
			JoinChannel("reported")
			DEFAULT_CHAT_FRAME:AddMessage("Joining reported channel.")
			is_in_reported = true;
		end
	end
end)

Frame:SetScript("OnEvent",function()
	if event == "PLAYER_ENTERING_WORLD" then
		is_in_world = true;
	end
end)

function JoinChannel(name)
	JoinChannelByName(name) 
	ChatFrame_AddChannel(DEFAULT_CHAT_FRAME, name) 
end

