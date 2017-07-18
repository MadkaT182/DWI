return Def.ActorFrame {
	LoadActor("ModIcon p1")..{
		OnCommand=cmd(player,PLAYER_1);
	};
	LoadActor("ModIcon p2")..{
		OnCommand=cmd(player,PLAYER_2);
	};
};