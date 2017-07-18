local gc = Var("GameCommand");
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("_style/SSS_icon"..gc:GetName())..{
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor("SSSart_Choice"..gc:GetName())..{
	};
};

return t;