local Frame = CreateFrame("FRAME");
Frame:RegisterEvent("PLAYER_ENTERING_WORLD");

local start_time = GetTime();
local is_in_world = false;
local is_in_channels = false;
local left_channels = false;

 Frame:SetScript("OnUpdate", function(self, elapsed)
	if is_in_world and not is_in_channels then
		local elapsed = GetTime()  -  start_time;
		
		-- seconds after PLAYER_ENTERING_WORLD fires.
		-- If any channels you join below are suddenly numbered
		-- before the usual default channels (/1 general, /2 trade etc),
		-- you can try to increase the number of seconds so the game 
		-- has time to join the default channels before the timer runs out.
		if elapsed >= 15 and left_channels then
		
			-- If you have other channels you want to automatically join
			-- every time you log on, add them here like so:
			-- JoinChannel("myOtherChannel");
			JoinChannel("World");
			JoinChannel("Trade");
			JoinChannel("General");
			JoinChannel("LocalDefense");
			--JoinChannel("WorldDefense");
			ChatFrame_RemoveChannel(ChatFrame1, "World");
			ChatFrame_RemoveChannel(ChatFrame2, "World");
			ChatFrame_RemoveChannel(ChatFrame4, "World");
			ChatFrame_RemoveChannel(ChatFrame5, "World");
			ChatFrame_RemoveChannel(ChatFrame1, "Trade");
			ChatFrame_RemoveChannel(ChatFrame2, "Trade");
			ChatFrame_RemoveChannel(ChatFrame4, "Trade");
			ChatFrame_RemoveChannel(ChatFrame5, "Trade");
			ChatFrame_RemoveChannel(ChatFrame1, "General");
			ChatFrame_RemoveChannel(ChatFrame2, "General");
			ChatFrame_RemoveChannel(ChatFrame4, "General");
			ChatFrame_RemoveChannel(ChatFrame5, "General");
			ChatFrame_RemoveChannel(ChatFrame1, "LocalDefense");
			ChatFrame_RemoveChannel(ChatFrame2, "LocalDefense");
			ChatFrame_RemoveChannel(ChatFrame4, "LocalDefense");
			ChatFrame_RemoveChannel(ChatFrame5, "LocalDefense");
			--ChatFrame_RemoveChannel(ChatFrame1, "WorldDefense");
			--ChatFrame_RemoveChannel(ChatFrame2, "WorldDefense");
			--ChatFrame_RemoveChannel(ChatFrame4, "WorldDefense");
			--ChatFrame_RemoveChannel(ChatFrame5, "WorldDefense");			
			ChatFrame_AddChannel(ChatFrame3, "World");
			ChatFrame_AddChannel(ChatFrame3, "Trade");
			ChatFrame_AddChannel(ChatFrame3, "General");
			ChatFrame_AddChannel(ChatFrame3, "LocalDefense");
			--ChatFrame_AddChannel(ChatFrame3, "WorldDefense");
			
			is_in_channels = true;
			
		elseif elapsed >= 13 and not left_channels then
			-- Leaves the channels specified below before re-joining them.
			LeaveChannelByName("World");
			LeaveChannelByName("Trade");
			LeaveChannelByName("General");
			LeaveChannelByName("LocalDefense");
			LeaveChannelByName("WorldDefense");
			left_channels = true;
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
