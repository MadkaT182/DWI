local t = Def.ActorFrame {};
local pStages = STATSMAN:GetStagesPlayed();

--Song list
for i=1, pStages do
	local sStats = STATSMAN:GetPlayedStageStats(i);
	--Banner
	t[#t+1] = Def.Sprite {
		InitCommand=cmd(queuecommand,"Anim");
		AnimCommand=cmd(diffusealpha,0;sleep,(i-1)*1.034;linear,.267;diffusealpha,1;sleep,.5;linear,.267;diffusealpha,0;queuecommand,"Init");
		BeginCommand=function(self)
			local song = sStats:GetPlayedSongs()[1];
			if song then
				if song:HasBanner() then
					Path = song:GetBannerPath();
				else
					Path = THEME:GetPathG("Common","fallback banner");
				end;
				self:LoadBanner(Path);
				self:setsize(254,79);
			end;
		end;
	};
end

return t;