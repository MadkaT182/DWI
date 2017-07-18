local c;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local t = Def.ActorFrame {
	LoadFont( "Combo", "numbers" ) .. {
		Name="Number";
		OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
	};
	LoadActor("_combo") .. {
		Name="ComboLabel";
		OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
	};

	InitCommand = function(self)
		c = self:GetChildren();
		c.Number:visible(false);
		c.ComboLabel:visible(false);
	end;

	ComboCommand=function(self, param)
		local iCombo = param.Combo;
		if not iCombo or iCombo < ShowComboAt then
			c.Number:visible(false);
			c.ComboLabel:visible(false);
			return;
		end

		local Label = c.ComboLabel;

		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );

		c.Number:visible(true);
		Label:visible(true);

		c.Number:settext( string.format("%i", iCombo) );

		Pulse( c.Number, param );
		Pulse( Label, param );
	end;
};

return t;
