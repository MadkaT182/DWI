return Def.ActorFrame{
	GainFocusCommand=cmd(diffusealpha,1);
	LoseFocusCommand=cmd(diffusealpha,0);
	SwitchToPage1MessageCommand=cmd(visible,false);
	SwitchToPage2MessageCommand=cmd(visible,true);

	LoadActor("pad") ..{
		InitCommand=cmd(x,SCREEN_CENTER_X-128;y,SCREEN_CENTER_Y+92);
	};
	
	LoadActor("info") ..{
		InitCommand=cmd(x,SCREEN_CENTER_X+194;y,SCREEN_CENTER_Y-62);
	};
};