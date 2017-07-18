return Def.ActorFrame {
	GainFocusCommand=cmd(diffusealpha,1);
	LoseFocusCommand=cmd(diffusealpha,0);
	LoadActor("icon_single")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_CENTER_Y/2+1;diffuse,0.25,0.25,0.25,1);
	};
	LoadActor("icon_versus")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-130;y,SCREEN_CENTER_Y/2+1;diffuse,0.25,0.25,0.25,1);
	};
	LoadActor("icon_double")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y/2+1);
	};
};