local t = Def.ActorFrame {};

--GRADEP1---
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	t[#t+1] = Def.ActorFrame {
		LoadActor("Grade_AAA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier01") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_AA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier02") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_A_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier03") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_B_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier04") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_C_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier05") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_D_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier06") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_E_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Tier07" or STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetGrade()=="Grade_Failed") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};
	};
end

--GRADEP2---
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	t[#t+1] = Def.ActorFrame {
		LoadActor("Grade_AAA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier01") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_AA_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier02") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_A_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier03") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_B_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier04") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_C_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier05") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_D_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier06") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};

		LoadActor("Grade_E_Tier")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+230;y,SCREEN_CENTER_Y-140;diffusealpha,0);
			OnCommand=function(self)
				if(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Tier07" or STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetGrade()=="Grade_Failed") then
					(cmd(sleep,.901;linear,.134;diffusealpha,1))(self);
				end;
			end;
			OffCommand=cmd(linear,0.2;zoom,0);
		};
	};
end

return t;
