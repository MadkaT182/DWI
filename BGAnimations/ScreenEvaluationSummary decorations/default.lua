local t = Def.ActorFrame{};
local path = "../_eval/";

local function GetFormattedMaxCombo(pn)
	return string.format("% 4d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn):MaxCombo());
end;

t[#t+1] = Def.ActorFrame{
	LoadActor("grade")..{};
	LoadActor(path.."totbanner")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-140);
	};
	LoadFont("_sui generis") .. {
		InitCommand=function(self)
		local totalstg = GAMESTATE:GetCurrentStageIndex();
			self:settext("ALL "..totalstg.." STAGES");
		end;
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+74;diffuse,color("#00FCFC");zoom,.624);
	};
	LoadActor(path.."ScreenEvaluation judge labels")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+9);
	};
	LoadFont("_sui generis") .. {
		Text="SCORE";
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+116;zoom,.687);
	};
	LoadFont("_sui generis") .. {
		Text="TOTAL";
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+146;zoom,.687);
	};
};

--P1 Decorations
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
--Statsp1
t[#t+1] = Def.ActorFrame{
	LoadActor("statsP1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-71;y,SCREEN_CENTER_Y);
	};
	LoadActor(path.."ScreenEvaluation bonus frame p1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-239;y,SCREEN_CENTER_Y-2);
	};
	LoadActor(path.."maxcombo")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-279;y,SCREEN_CENTER_Y+68;diffusealpha,0;sleep,.668;linear,.166;diffusealpha,1);
	};
	LoadFont("_eval", "combo")..{
		Text=GetFormattedMaxCombo(PLAYER_1);
		InitCommand=cmd(x,SCREEN_CENTER_X-210;y,SCREEN_CENTER_Y+68;diffuse,color("1,1,0,1");zoom,0.8);
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(.696);
			self:linear(.066);
			self:zoom(1);
			self:linear(.034);
			self:zoom(.8);
			if STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_1):FullCombo() then
				self:textglowmode('TextGlowMode_Inner');
				self:glowshift();
				self:effectperiod(.5);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	};
};
end

--P2 Decorations
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
--Statsp2
t[#t+1] = Def.ActorFrame{
	LoadActor("statsP2")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+299;y,SCREEN_CENTER_Y);
	};
	LoadActor(path.."ScreenEvaluation bonus frame p2")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+239;y,SCREEN_CENTER_Y-2);
	};
	LoadActor(path.."maxcombo")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+199;y,SCREEN_CENTER_Y+68;diffusealpha,0;sleep,.668;linear,.166;diffusealpha,1);
	};
	LoadFont("_eval", "combo")..{
		Text=GetFormattedMaxCombo(PLAYER_2);
		InitCommand=cmd(x,SCREEN_CENTER_X+269;y,SCREEN_CENTER_Y+68;diffuse,color("1,1,0,1");zoom,0.8);
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(.696);
			self:linear(.066);
			self:zoom(1);
			self:linear(.034);
			self:zoom(.8);
			if STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_2):FullCombo() then
				self:textglowmode('TextGlowMode_Inner');
				self:glowshift();
				self:effectperiod(.5);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	};
};
end

return t;