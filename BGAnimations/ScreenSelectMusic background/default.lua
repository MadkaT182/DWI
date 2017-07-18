local t = Def.ActorFrame {};
local image = "normalbg";
if GAMESTATE:IsCourseMode() then
	image = "coursebg";
end;
t[#t+1] = Def.ActorFrame {
	LoadActor(image)..{
		OnCommand=cmd(Center);
	};
	LoadActor( "../_StyleIcon" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+108;y,SCREEN_TOP+20);
	};
};
return t;