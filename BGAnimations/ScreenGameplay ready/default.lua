return Def.ActorFrame {
	LoadActor("ready") .. {
		OnCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,2.836;diffusealpha,0);
	};
};