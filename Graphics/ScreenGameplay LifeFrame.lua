return Def.ActorFrame{
	--Player1
	Def.Sprite{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-175;y,SCREEN_TOP+22);
		OnCommand=function(self)
			self:Load(THEME:GetPathG("Screengameplay","LifeNormal"));
		end;
		Condition=not IsUsingWideScreen()
	};
	Def.Sprite{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-320;y,SCREEN_TOP+22);
		OnCommand=function(self)
			self:Load(THEME:GetPathG("Screengameplay","LifeWide"));
		end;
		Condition=IsUsingWideScreen()
	};
	--Player2
	Def.Sprite{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+175;y,SCREEN_TOP+22;zoomx,-1);
		OnCommand=function(self)
			self:Load(THEME:GetPathG("Screengameplay","LifeNormal"));
		end;
		Condition=not IsUsingWideScreen()
	};
	Def.Sprite{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+320;y,SCREEN_TOP+22;zoomx,-1);
		OnCommand=function(self)
			self:Load(THEME:GetPathG("Screengameplay","LifeWide"));
		end;
		Condition=IsUsingWideScreen()
	};

};