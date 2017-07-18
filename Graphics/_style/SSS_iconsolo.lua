return Def.ActorFrame {
	LoadActor("icon_solo")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-130;y,SCREEN_CENTER_Y/2+1);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
};