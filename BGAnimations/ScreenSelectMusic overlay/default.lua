local function Autogen(pn)
	local function set(self, player)
		if player and player ~= pn then return end
		local Selection = GAMESTATE:GetCurrentSteps(pn) or GAMESTATE:GetCurrentCourse()
		local bIsAutogen = Selection and Selection:IsAutogen();
		self:visible( bIsAutogen and 1 or 0 );
	end

	local t = LoadActor( "_autogen" ) .. {
		OnCommand=cmd(zoomy,0;linear,0.5;zoomy,1);
		OffCommand=cmd(linear,0.5;zoomy,0);
		CurrentStepsP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
		CurrentCourseChangedMessageCommand=function(self) set(self); end;
	};
	return t;
end

local function DifficultyMeter(pn)
	-- local function set(self, player)
	-- 	self:SetFromGameState( player );
	-- end

	-- local t = Def.DifficultyMeter {
	-- 	Type="DifficultyMeter"; -- metrics section
	-- };

	-- if pn == PLAYER_1 then
	-- 	t.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
	-- 	t.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	-- else
	-- 	t.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
	-- 	t.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	-- end

	-- return t;
end

local function DifficultyIcons(pn)
	local function set(self, player)
		if player and player ~= pn then return end
		local Selection = GAMESTATE:GetCurrentSteps(pn) or GAMESTATE:GetCurrentTrail(pn)

		if not Selection then
			self:Unset();
			return
		end
		local dc = Selection:GetDifficulty()
		self:SetFromDifficulty( dc );
	end

	local t = Def.DifficultyIcon {
		File="_difficulty icons 1x6";
		InitCommand=function(self)
			self:player( pn );
			self:SetPlayer( pn );
		end;

		CurrentStepsP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
	};
	return t;
end

-- groove radarse.cx
local function Radar()
	local function set(self,player)
		local Selection = GAMESTATE:GetCurrentSteps(player) or GAMESTATE:GetCurrentTrail(player)
		local Song = GAMESTATE:GetCurrentSong();
		if not Selection or not Song then
			self:SetEmpty( player );
			return
		end
		self:SetFromRadarValues( player, Selection:GetRadarValues(player) );
	end

	local t = Def.GrooveRadar {
		OnCommand=cmd();
		OffCommand=cmd(linear,0.6;rotationz,180*4;zoom,0);
		CurrentStepsP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
	};

	return t;
end

local t = Def.ActorFrame {
	LoadActor( "_icon challenge" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X-262;y,SCREEN_CENTER_Y-41;playcommand,"Toggle");
		ToggleCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			local steps = GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber());
			if not song then
				self:visible(false);
			else
				self:visible(true);
				if steps then
					if song:HasStepsTypeAndDifficulty(steps:GetStepsType(), 'Difficulty_Challenge')
						then self:visible(true);
						else self:visible(false);
					end;
				end;
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Toggle");
	};

	Radar() .. {
		BeginCommand=cmd(x,SCREEN_CENTER_X-169;y,SCREEN_CENTER_Y+81);
		Condition=GAMESTATE:IsCourseMode() == false;
	};

	LoadFont("Common", "normal") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+94;playcommand,"Set");
		OnCommand=cmd(zoom,0.5;shadowlength,2;diffusealpha,0;linear,0.5;diffusealpha,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0);

		SetCommand=function(self)
			local sText = GAMESTATE:GetSongOptionsString()
			sText = string.gsub(sText, ", ", "\n")
			self:settext( sText )
			if GAMESTATE:IsAnExtraStage() then
				self:diffuseblink()
			end
		end;
		SongOptionsChangedMessageCommand=cmd(playcommand,"Set");
	};

	--Sort display
	LoadActor("SortDisplay")..{
		InitCommand=cmd(x,SCREEN_RIGHT-10;y,SCREEN_BOTTOM-34);
		Condition=not GAMESTATE:IsCourseMode();
	};

	--Stage display
	LoadActor("../norm_stage")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-250;y,SCREEN_CENTER_Y-125);
		Condition=not GAMESTATE:IsCourseMode();
	};

	-- bpm display
	Def.BPMDisplay {
		File=THEME:GetPathF("BPMDisplay", "bpm");
		Name="BPMDisplay";
		InitCommand=cmd(x,SCREEN_CENTER_X-97;y,SCREEN_CENTER_Y-124;horizalign,right;shadowlength,0);
		OffCommand=cmd(diffusealpha,0);
		SetCommand=function(self) self:SetFromGameState() end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
	LoadActor( "_bpm label" ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-97;y,SCREEN_CENTER_Y-121;horizalign,left);
		OffCommand=cmd(diffusealpha,0);
	};

	-- select course junk
	Def.CourseContentsList {
		MaxSongs = 5;

		InitCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+96);
		OnCommand=cmd(zoomy,0;bounceend,0.3;zoom,1);
		OffCommand=cmd(zoomy,1;bouncebegin,0.3;zoomy,0);
		ShowCommand=cmd(bouncebegin,0.3;zoomy,1);
		HideCommand=cmd(linear,0.3;zoomy,0);
		SetCommand=function(self)
			self:SetFromGameState();
			self:setsecondsperitem(0.7);
			self:SetSecondsPauseBetweenItems(0.7);
			self:scrollwithpadding(0, 0);
		end;
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");

		Display = Def.ActorFrame { 
			InitCommand=cmd(setsize,270,44);

			LoadActor("_CourseEntryDisplay bar");

			Def.TextBanner {
				ArtistPrependString="/";
				SetCommand=TextBannerSet;
				--InitCommand=cmd(LoadFromString,"", "", "", "", "", "");
				Title = LoadFont("TextBanner","text") .. {
					Name="Title";
					OnCommand=cmd(shadowlength,0);
				};
				Subtitle = LoadFont("TextBanner","text") .. {
					Name="Subtitle";
					OnCommand=cmd(shadowlength,0);
				};
				Artist = LoadFont("TextBanner","text") .. {
					Name="Artist";
					OnCommand=cmd(shadowlength,0);
				};
				SetSongCommand=function(self, params)
					if params.Song then
						--self:LoadFromSong( params.Song );
						self:diffuse( SONGMAN:GetSongColor(params.Song) );
					else
						self:LoadFromString( "??????????", "??????????", "", "", "", "" );
						self:diffuse( color("#FFFFFF") );
					end
				end;
			};

			LoadFont("CourseEntryDisplay","number") .. {
				OnCommand=cmd(x,-118;shadowlength,0);
				SetSongCommand=function(self, params) self:settext(string.format("%i", params.Number)); end;
			};

			LoadFont("Common","normal") .. {
				OnCommand=cmd(x,SCREEN_CENTER_X-200;y,-8;zoom,0.7;shadowlength,0);
				DifficultyChangedCommand=function(self, params)
					if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
					self:settext( params.Meter );
					self:diffuse( DifficultyColor(params.Difficulty) );
				end;
			};

			LoadFont("Common","normal") .. {
				OnCommand=cmd(x,SCREEN_CENTER_X-192;y,SCREEN_CENTER_Y-230;horizalign,right;zoom,0.5;shadowlength,0);
				SetSongCommand=function(self, params) self:settext(params.Modifiers); end;
			};

			LoadFont("CourseEntryDisplay","difficulty") .. {
				OnCommand=cmd(x,SCREEN_CENTER_X-222;y,-8;shadowlength,0;settext,"1");
				DifficultyChangedCommand=function(self, params)
					if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
					self:diffuse( DifficultyColor(params.Difficulty) );
				end;
			};
		};
	};

	-- autogen icons
	Autogen(PLAYER_1) .. {
		BeginCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y;draworder,98);
	};
	Autogen(PLAYER_2) .. {
		BeginCommand=cmd(x,SCREEN_CENTER_X-68;y,SCREEN_CENTER_Y;draworder,98);
	};

	-- difficulty icons
	DifficultyIcons(PLAYER_1) .. {
		BeginCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y+3;draworder,97);
		OffCommand=cmd(diffusealpha,0);
		ToggleCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then self:visible(false)
			else self:visible(true)
			end
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Toggle");
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
	};
	DifficultyIcons(PLAYER_2) .. {
		BeginCommand=cmd(x,SCREEN_CENTER_X-44;y,SCREEN_CENTER_Y+3;draworder,97);
		OffCommand=cmd(diffusealpha,0);
		ToggleCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then self:visible(false);
			else self:visible(true);
			end
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Toggle");
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
	};

	-- -- difficulty meter
	-- DifficultyMeter(PLAYER_1) .. {
	-- 	BeginCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y+184;shadowlength,0);
	-- 	OffCommand=cmd(diffusealpha,0);
	-- };
	-- DifficultyMeter(PLAYER_2) .. {
	-- 	BeginCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y+184;shadowlength,0);
	-- 	OffCommand=cmd(diffusealpha,0);
	-- };

	--new diffmeter
	

	-- num stages
	LoadFont("_numbers2") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-262;y,SCREEN_CENTER_Y-126);
		OnCommand=cmd(shadowlength,0;addx,-SCREEN_WIDTH;bounceend,0.5;addx,SCREEN_WIDTH);
		OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH);

		SetCommand=function(self)
			local Course = GAMESTATE:GetCurrentCourse()
			if not Course then
				self:visible(0)
				return
			end

			self:visible(1)
			self:settext( Course:GetEstimatedNumStages() );
		end;

		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};

};

--Mod icons
for player in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor( "../ScreenEvaluationNormal decorations/OptionIcons/OptionIcons.lua", player )..{
		InitCommand=function(self)
			self:y(player == PLAYER_1 and SCREEN_TOP+58 or SCREEN_TOP+79)
				:x(_screen.cx-145)
		end;
		PlayerOptionsChangedP1MessageCommand=cmd(playcommand,"Show");
		PlayerOptionsChangedP2MessageCommand=cmd(playcommand,"Show");
	};
end;

return t;
