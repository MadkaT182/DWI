local bgsong = SONGMAN:GetRandomSong():GetMusicPath();

local t = Def.ActorFrame {
	LoadActor(bgsong) .. {
		OnCommand=cmd(play);
	};
	LoadActor("bg")..{
		OnCommand=cmd(Center;addx,120);
	};
	LoadActor("covers")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-200;y,SCREEN_TOP-3030;linear,51;y,SCREEN_BOTTOM-390);
	};
};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(diffusealpha,0;sleep,42.342;linear,1.501;diffusealpha,1);
	LoadFont("_sui generis") .. {
		Text="Thank you for playing!";
		OnCommand=cmd(x,SCREEN_CENTER_X+95;y,SCREEN_CENTER_Y-82;zoom,.687);
	};
	LoadFont("_sui generis") .. {
		Text="DANCE WITH INTENSITY";
		OnCommand=cmd(x,SCREEN_CENTER_X+84;y,SCREEN_CENTER_Y-42;zoom,.55;diffuse,color("#007E7E"));
	};
	LoadFont("_sui generis") .. {
		Text="SimWolf. 2003";
		OnCommand=cmd(x,SCREEN_CENTER_X+43;y,SCREEN_CENTER_Y-23;zoom,.55;diffuse,color("#7E7E00"));
	};
	LoadFont("_sui generis") .. {
		Text="v2.50.00";
		OnCommand=cmd(x,SCREEN_CENTER_X+21;y,SCREEN_CENTER_Y-3;zoom,.55;diffuse,color("#7E7E7E"));
	};
};

return t;