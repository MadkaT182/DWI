local t = Def.ActorFrame {};

local Combo = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetCurrentCombo();

local Marvelous = string.format("% 5d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W1"));
local Perfect = string.format("% 5d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W2"));
local Great = string.format("% 5d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W3"));
local Good = string.format("% 5d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W4"));
local Ok = string.format("% 5d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetHoldNoteScores("HoldNoteScore_Held"));
local Miss = string.format("% 5d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_Miss"));
local Almost = string.format("% 5d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W5"));

local Score = string.format("% 9d",STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore());
local Total = string.format("% 9d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(PLAYER_2):GetScore());

local slp = .3;
local lin1 = .066;
local lin2 = .034;

--Marvelous--
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(draworder,5;x,-150;y,SCREEN_CENTER_Y-315;horizalign,right;zoom,0;sleep,slp;linear,lin1;zoom,.8;linear,lin2;zoom,.578);
	OnCommand=function(self)
		self:settextf(Marvelous);
		self:diffuse(color("#F4D500"));
	end;
};
--Perfect--
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(draworder,5;x,-150;y,SCREEN_CENTER_Y-288;horizalign,right;zoom,0;sleep,slp+lin1;linear,lin1;zoom,.8;linear,lin2;zoom,.578);
	OnCommand=function(self)
		self:settextf(Perfect);
		self:diffuse(color("#F4D500"));
	end;
};
--Great--
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(draworder,5;x,-150;y,SCREEN_CENTER_Y-261;horizalign,right;zoom,0;sleep,slp+(lin1*2);linear,lin1;zoom,.8;linear,lin2;zoom,.578);
	OnCommand=function(self)
		self:settextf(Great);
		self:diffuse(color("#F4D500"));
	end;
};
--Good--
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(draworder,5;x,-150;y,SCREEN_CENTER_Y-234;horizalign,right;zoom,0;sleep,slp+(lin1*3);linear,lin1;zoom,.8;linear,lin2;zoom,.578);
	OnCommand=function(self)
		self:settextf(Good);
		self:diffuse(color("#F4D500"));
	end;
};
--Boo
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(draworder,5;x,-150;y,SCREEN_CENTER_Y-207;horizalign,right;zoom,0;sleep,slp+(lin1*4);linear,lin1;zoom,.8;linear,lin2;zoom,.578);
	OnCommand=function(self)
		self:settextf(Almost);
		self:diffuse(color("#F4D500"));
	end;
};
--Miss--(Almost+Miss)
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(draworder,5;x,-150;y,SCREEN_CENTER_Y-180;horizalign,right;zoom,0;sleep,slp+(lin1*5);linear,lin1;zoom,.8;linear,lin2;zoom,.578);
	OnCommand=function(self)
		self:settextf(Miss);
		self:diffuse(color("#F4D500"));
	end;
};
--Ok--
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(draworder,5;x,-150;y,SCREEN_CENTER_Y-153;horizalign,right;zoom,0;sleep,slp+(lin1*6);linear,lin1;zoom,.8;linear,lin2;zoom,.578);
	OnCommand=function(self)
		self:settextf(Ok);
		self:diffuse(color("#F4D500"));
	end;
};

--Score--
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(zoom,1;draworder,5;y,SCREEN_CENTER_Y-124;horizalign,right;addx,-2;diffusealpha,0;sleep,.734;linear,.167;diffusealpha,1);
	OnCommand=function(self)
		self:settextf(Score);
		self:diffuse(color("#F4D500"));
	end;
};

--Total Score--
t[#t+1] = LoadFont("_score")..{
	InitCommand=cmd(zoom,1;draworder,5;y,SCREEN_CENTER_Y-94;horizalign,right;addx,-2;diffusealpha,0;sleep,.801;linear,.167;diffusealpha,1);
	OnCommand=function(self)
		self:settextf(Total);
		self:diffuse(color("#F4D500"));
	end;
};

return t;
