local t = Def.ActorFrame {
	LoadFont("", "_sui generis") .. {
		Text="v2.50.00";
		OnCommand=cmd(x,SCREEN_RIGHT-4;y,SCREEN_TOP+8;horizalign,right;zoom,0.575;shadowlength,2;sleep,5;diffusealpha,0);
	};
	LoadFont("", "_sui generis") .. {
		OnCommand=cmd(x,SCREEN_LEFT+4;y,SCREEN_TOP+8;horizalign,left;zoom,0.575;shadowlength,2;playcommand,"Set";sleep,5;diffusealpha,0);
		SetCommand=function(self)
			local fmt = THEME:GetString( "ScreenTitleMenu", "%d songs in %d groups, %d courses in %d groups" )
			local text = string.format( fmt, SONGMAN:GetNumSongs(), SONGMAN:GetNumSongGroups(), SONGMAN:GetNumCourses(), SONGMAN:GetNumCourseGroups() )

			if PREFSMAN:GetPreference("UseUnlockSystem") then
				text = text .. string.format(", %d unlocks", UNLOCKMAN:GetNumUnlocks() )
			end
			self:settext( text )
		end;
	};
	LoadFont("", "_sui generis") .. {
		Text="Not for sale.  You must legally own the songs used.";
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-16;zoom,0.6;shadowlength,2;diffuse,color("#D7D920"));
	};
}
return t;
