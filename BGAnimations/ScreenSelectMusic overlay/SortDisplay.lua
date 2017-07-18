return Def.ActorFrame {
	LoadFont("Common normal") .. {
		BeginCommand=cmd(horizalign,right;zoom,.56;diffuse,color("#7e7e7e");playcommand,"Update");
		UpdateCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so ~= nil then
				if so == "SortOrder_Group" then
					self:settext("All Music (Folder/Separated)");
				elseif so == "SortOrder_Title" then
					self:settext("Title");
				elseif so == "SortOrder_Popularity" then
					self:settext("Player's Best");
				elseif so == "SortOrder_BPM" then
					self:settext("BPM");
				elseif so == "SortOrder_Artist" then
					self:settext("Artist");
				elseif so == "SortOrder_Title" then
					self:settext("Title");
				else
				self:settext(SortOrderToLocalizedString(so));
				end;
			end;
		end;
		SortOrderChangedMessageCommand=function(self)
		self:queuecommand("Update");
		end;
	};
};