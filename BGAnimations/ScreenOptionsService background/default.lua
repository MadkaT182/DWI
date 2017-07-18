return Def.ActorFrame{
	LoadActor( "../logobg" )..{
		OnCommand=cmd(Center);
	};
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0.7"));
	};
};