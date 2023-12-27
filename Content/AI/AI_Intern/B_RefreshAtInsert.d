func void b_refreshatinsert()
{
	var C_NPC her;
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		return;
	};
	her = Hlp_GetNpc(pc_hero);
	if((self.guild < GIL_SEPERATOR_HUM) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her)))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		if(Npc_HasEquippedWeapon(self) == FALSE)
		{
			if(self.guild == GIL_STT)
			{
			CreateInvItems(self,ItMw_1H_Club_01,1);
			};
			if(self.guild == GIL_GRD)
			{
				CreateInvItems(self,ItMw_1H_Club_01,1);
			};
			if(self.guild == GIL_ORG)
			{
				CreateInvItems(self,ItMw_1H_Club_01,1);
			};
			if(self.guild == GIL_SLD)
			{
				CreateInvItems(self,ItMw_1H_Club_01 ,1);
			};
			if(self.guild == GIL_TPL)
			{
				CreateInvItems(self,ItMw_1H_Club_01,1);
			};
			if(self.guild == GIL_NOV)
			{
				CreateInvItems(self,ItMw_1H_Club_01,1);
			};
		};
	};
};

