return Def.ActorFrame {
	LoadActor("../_stars/openL")..{
		OnCommand=cmd(x,-(SCREEN_WIDTH+215);sleep,.034;linear,.934;x,SCREEN_CENTER_X+50);
	};
	LoadActor("../_stars/openR")..{
		OnCommand=cmd(x,SCREEN_WIDTH+216;sleep,.034;linear,.934;x,(SCREEN_LEFT-SCREEN_WIDTH/2)-50);
	};
	LoadActor("cleared") .. {
		OnCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,3.103;diffusealpha,0);
	}
};