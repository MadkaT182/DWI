return Def.ActorFrame {
	LoadActor("text")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+109;y,SCREEN_BOTTOM+5;linear,42;y,SCREEN_TOP-1934);
	};
	LoadActor("overlay")..{
		OnCommand=cmd(Center;addx,120);
	};
};