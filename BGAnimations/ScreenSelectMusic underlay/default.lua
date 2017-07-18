local OnCommand = cmd(diffusealpha,1)
local OffCommand = cmd(diffusealpha,0)

local function visibility()
	local song = GAMESTATE:GetCurrentSong()
	if not song then return false
	else return true
	end
end

local t = Def.ActorFrame {
	LoadActor( '_difficulty frame p1' ) .. {
		InitCommand = cmd(player,PLAYER_1;x,SCREEN_CENTER_X-273;y,SCREEN_CENTER_Y+2);
		OnCommand = OnCommand;
		OffCommand = OffCommand;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		CurrentSongChangedMessageCommand=function(self)
			self:visible( visibility() )
		end
	};
	LoadActor( '_difficulty frame p2' ) .. {
		InitCommand = cmd(player,PLAYER_2;x,SCREEN_CENTER_X-61;y,SCREEN_CENTER_Y+2);
		OnCommand = OnCommand;
		OffCommand = OffCommand;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
		CurrentSongChangedMessageCommand=function(self)
			self:visible( visibility() )
		end
	};
};
return t;
