return Def.ActorFrame {
	LoadFont("", "_sui generis") .. {
		Text="GAME OVER";
		OnCommand=cmd(Center);
	};
	SOUND:PlayAnnouncer("game over")
};