local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	Def.Sprite {
		InitCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:HasBanner() then
					Path = song:GetBannerPath();
				else
					Path = THEME:GetPathG("Common","fallback banner");
				end
				self:LoadBackground(Path);
				self:scaletoclipped(256,80);
			end;
		end;
	};
};

return t;