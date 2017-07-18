local t = Def.ActorFrame {};

for i=1,20 do
	local song = SONGMAN:GetRandomSong();
	t[#t+1] = Def.Sprite {
		InitCommand=function(self)
			if song then
				if song:HasBackground() then
					Path = song:GetBackgroundPath();
				else
					Path = THEME:GetPathG("Common","fallback background");
				end;
				self:LoadBackground(Path);
				self:setsize(240,180);
				self:y((i-1)*180);
			end;
		end;
	};
end;

return t;