return Def.ActorFrame {
	LoadActor("../_stars/openL")..{
		OnCommand=cmd(x,-(SCREEN_WIDTH+215);sleep,1.435;linear,1;x,SCREEN_CENTER_X+50);
	};
	LoadActor("../_stars/openR")..{
		OnCommand=cmd(x,SCREEN_WIDTH+216;sleep,1.435;linear,1;x,(SCREEN_LEFT-SCREEN_WIDTH/2)-50);
	};
	LoadActor( "fail" ) .. {
		OnCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,4;diffusealpha,0);
	};
};
