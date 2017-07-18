return Def.ActorFrame {
	LoadActor("_stars/openL")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+50;linear,.934;addx,-(SCREEN_WIDTH+215));
	};
	LoadActor("_stars/openR")..{
		OnCommand=cmd(x,(SCREEN_LEFT-SCREEN_WIDTH/2)-50;linear,.934;addx,SCREEN_WIDTH+216);
	};
	LoadActor("ScreenGameplay ready/ready")..{
		OnCommand=cmd(Center;sleep,.934;diffusealpha,0);
	};
};