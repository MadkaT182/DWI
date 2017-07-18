return Def.ActorFrame {
	LoadActor( "bg" )..{
		OnCommand=cmd(Center);
	};
	LoadActor( "../_StyleIcon" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+108;y,SCREEN_TOP+20);
	};
}