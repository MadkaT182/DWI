return Def.ActorFrame{
	LoadActor("SongItem")..{};
	LoadActor("NewSong")..{
		InitCommand=cmd(x,-149;y,-2);
		SetCommand=function(self,param)
			if param.Song then
				if PROFILEMAN:IsSongNew(param.Song) then
					self:visible(true);
				else
					self:visible(false);
				end
			else
				self:visible(false);
			end
		end;
	};
};