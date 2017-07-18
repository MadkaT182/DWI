local t = Def.ActorFrame{};
local path = "../_eval/";

local function GetFormattedMaxCombo(pn)
	return string.format("% 4d",STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):MaxCombo());
end;

--Common
t[#t+1] = Def.ActorFrame{
	LoadActor("grade")..{};
	LoadActor(path.."songbanner")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-140);
	};
	LoadActor("../eval_stage")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+74)
	};
	LoadActor(path.."ScreenEvaluation judge labels")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+9);
	};
	LoadActor("diff")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+82);
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
			if STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):FullCombo() then
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
			if STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):FullCombo() then
				self:textglowmode('TextGlowMode_Inner');
				self:glowshift();
				self:effectperiod(.5);
			end;
		end;
		OffCommand=cmd(diffusealpha,0);
	};
};
end

--Mod icons
for player in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor( "OptionIcons/OptionIcons.lua", player )..{
		InitCommand=function(self)
			self:x(player == PLAYER_1 and SCREEN_LEFT+147 or SCREEN_RIGHT-147)
				:y(_screen.cy+182)
		end
	}
end

--New record definition
if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetPersonalHighScoreIndex() == 0) then
	NewRec1 = 1
end

if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetPersonalHighScoreIndex() == 0) then
	NewRec2 = 1
end

if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetMachineHighScoreIndex() == 0) then
	NewRec1 = 1
end

if (STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetMachineHighScoreIndex() == 0) then
	NewRec2 = 1
end

--New record Sounds and Graphic
if ((NewRec1 == 1) and (GAMESTATE:IsHumanPlayer(PLAYER_1))) then
	t[#t+1] = Def.ActorFrame {
		LoadFont("_sui generis") .. {
			Text="It's a new record!!";
			OnCommand=cmd(x,SCREEN_CENTER_X-223;y,SCREEN_CENTER_Y+97;diffusealpha,0;sleep,.734;linear,0.167;diffusealpha,1;zoom,.562;diffuse,color("#FFFF00");textglowmode,'TextGlowMode_Inner';glowshift;effectperiod,.5);
		};
	}
end

if ((NewRec2 == 1) and (GAMESTATE:IsHumanPlayer(PLAYER_2))) then
	t[#t+1] = Def.ActorFrame {
		LoadFont("_sui generis") .. {
			Text="It's a new record!!";
			OnCommand=cmd(x,SCREEN_CENTER_X+221;y,SCREEN_CENTER_Y+97;diffusealpha,0;sleep,.734;linear,0.167;diffusealpha,1;zoom,.562;diffuse,color("#FFFF00");textglowmode,'TextGlowMode_Inner';glowshift;effectperiod,.5);
		};
	}
end

--Extra stage stuff
if GAMESTATE:HasEarnedExtraStage() then
	t[#t+1] = Def.ActorFrame {
		LoadFont("_sui generis") .. {
			Text="Try the extra stage!!";
			OnCommand=cmd(queuecommand,"Set";x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+180;diffuse,color("#FF0000");zoom,1.312;textglowmode,'TextGlowMode_Inner';diffuseshift;effectcolor1,255,0,0,.5;effectcolor2,126,0,0,1;effectperiod,.3);
			SetCommand=function(self,params)
				local Stage = GAMESTATE:GetCurrentStage();
				local StageIndex = GAMESTATE:GetCurrentStageIndex();
				local screen = SCREENMAN:GetTopScreen();
				if screen and screen.GetStageStats then
					local ss = screen:GetStageStats();
					Stage = ss:GetStage();
					StageIndex = ss:GetStageIndex();
				end;
				if Stage == 'Stage_Final' then
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		};
	}
	t[#t+1] = Def.ActorFrame {
		LoadFont("_sui generis") .. {
			Text="Try the bonus stage!!";
			OnCommand=cmd(queuecommand,"Set";x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+180;diffuse,color("#1C73E5");zoom,1.312;textglowmode,'TextGlowMode_Inner';diffuseshift;effectcolor1,color("#1C73E6");effectcolor2,color("#0E3A73");effectperiod,.3);
			SetCommand=function(self,params)
				local Stage = GAMESTATE:GetCurrentStage();
				local StageIndex = GAMESTATE:GetCurrentStageIndex();
				local screen = SCREENMAN:GetTopScreen();
				if screen and screen.GetStageStats then
					local ss = screen:GetStageStats();
					Stage = ss:GetStage();
					StageIndex = ss:GetStageIndex();
				end
				if Stage == 'Stage_Extra1' then
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		};
	}
	t[#t+1] = Def.ActorFrame {
		LoadActor("warning") .. {
			OnCommand=cmd(play);
		};
	}
end

return t