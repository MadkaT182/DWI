local player = ...
-- tranform a long-form enum string like "PlayerNumber_P1" into just "P1"
local p = ToEnumShortString(player)

local ps = GAMESTATE:GetPlayerState(player)
local po = ps:GetCurrentPlayerOptions()
---

return Def.ActorFrame {
	InitCommand=function(self) self:playcommand("Show") end,
	PlayerJoinedMessageCommand=function(self, params)
		if params.Player == player then
			self:playcommand("Show")
		end
	end,

	----------------------------------------------------------
	-- Speed
	Def.Sprite {
		ShowCommand=function(self)
			self:x(-128)
			if GAMESTATE:PlayerIsUsingModifier(player,'1.5x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_15x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'2x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_2x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'3x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_3x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'4x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_4x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'5x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_5x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'8x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_8x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'0.25x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_025x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'0.5x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_05x.png");
			elseif GAMESTATE:PlayerIsUsingModifier(player,'0.75x') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/speed_075x.png");
			end
		end,
	},

	----------------------------------------------------------
	-- Boost
	Def.Sprite {
		ShowCommand=function(self)
			self:x(-96)
			if po:Boost() ~= 0  then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons") .."/"..p.."/boost_on.png");

			elseif po:Brake() ~= 0 then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/boost_brake.png");

			elseif po:Wave() ~= 0 then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/boost_wave.png");
			end
		end,
	},

	----------------------------------------------------------
	-- Appearance
	Def.Sprite {
		ShowCommand=function(self)
			self:x(-64)

			if po:Hidden() ~= 0 then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/appearance_hidden.png")

			elseif po:Sudden() ~= 0 then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/appearance_sudden.png")

			elseif po:Stealth() ~= 0 then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/appearance_stealth.png")
			end
		end
	},

	----------------------------------------------------------
	-- Turn
	Def.Sprite {
		ShowCommand=function(self)
			self:x(-32)

			if po:Mirror() then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/turn_mirror.png")

			elseif po:Left() then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/turn_left.png")

			elseif po:Right() then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/turn_right.png")

			elseif po:Shuffle() then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/turn_shuffle.png")
			end
		end
	},

	----------------------------------------------------------
	-- Dark
	Def.Sprite {
		ShowCommand=function(self)
			self:x(32)

			if po:Dark() ~= 0 then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/dark_on.png")
			end
		end
	},

	----------------------------------------------------------
	-- Scroll
	Def.Sprite {
		ShowCommand=function(self)
			self:x(64)

			if po:Reverse() ~= 0 then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/scroll_reverse.png")
			end
		end
	},

	----------------------------------------------------------
	-- Arrow
	Def.Sprite {
		ShowCommand=function(self)
			self:x(0)

			if po:NoteSkin():lower():match("flat") then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/arrow_flat.png")

			elseif po:NoteSkin():lower():match("little") then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/arrow_little.png")

			elseif po:NoteSkin():lower():match("classic") then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/arrow_classic.png")

			elseif po:NoteSkin():lower():match("rainbow") or po:NoteSkin():lower():match("solo") then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/arrow_rainbow.png")
			end
		end
	},

	----------------------------------------------------------
	-- Freeze arrow
	Def.Sprite {
		ShowCommand=function(self)
			self:x(96)
			if po:NoHolds() then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/freeze_arrow_off.png")
			end
		end
	},

	----------------------------------------------------------
	-- Risky
	Def.Sprite {
		ShowCommand=function(self)
			self:x(128)

			if GAMESTATE:PlayerIsUsingModifier(player, 'suddendeath') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/SuddenDeath.png")
			elseif GAMESTATE:PlayerIsUsingModifier(player, 'norecover') then
				self:Load(THEME:GetPathB("ScreenEvaluationNormal","decorations/OptionIcons").."/"..p.."/NoRecover.png")
			end
		end
	}
}