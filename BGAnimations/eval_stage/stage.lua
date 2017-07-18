local stages = Def.ActorFrame {
};

for s in ivalues(Stage) do
	if s ~= 'Stage_Next' and s ~= 'Stage_Nonstop' and s ~= 'Stage_Oni' and s ~= 'Stage_Endless' then
		stages[#stages+1] = LoadFont("_sui generis") .. {
			SetCommand=function(self,params)
				local Stage = GAMESTATE:GetCurrentStage();
				local StageIndex = GAMESTATE:GetCurrentStageIndex();
				local screen = SCREENMAN:GetTopScreen();
				if screen and screen.GetStageStats then
					local ss = screen:GetStageStats();
					Stage = ss:GetStage();
					StageIndex = ss:GetStageIndex();
				end
				if Stage == 'Stage_Final' then
					self:settext( "FINAL STAGE");
					self:diffuse(color("#FC7E7F"));
				elseif Stage == 'Stage_Extra1' then
					self:settext( "EXTRA STAGE");
					self:diffuse(color("#FC3F3F"));
				elseif Stage == 'Stage_Extra2' then
					self:settext( "BONUS STAGE");
					self:diffuse(color("#1E7EFC"));
				else
					self:settext( "STAGE "..params.StageNumber );
					self:diffuse(color("#FCFC00"));
				end
				self:zoom(.624);
				self:visible( Stage == s );
			end;
		}
	end;
end;

return stages;
