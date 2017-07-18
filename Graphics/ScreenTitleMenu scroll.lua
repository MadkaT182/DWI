local children = {
	LoadActor("dwi2-selector") .. {
		GainFocusCommand=cmd(diffusealpha,0.5);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadFont("", "_sui generis") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
		InitCommand=cmd(shadowlength,2;zoom,0.8;y,1);
		GainFocusCommand=cmd();
		LoseFocusCommand=cmd();
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	};
};

return Def.ActorFrame { children = children };