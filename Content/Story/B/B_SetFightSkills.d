

func void B_SetFightSkill(var C_Npc self,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		if(Npc_GetTalentValue(self,NPC_TALENT_1H) >= 0)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_1H,0);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_1H) >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_1H) >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
		};
	};
	if(talent == NPC_TALENT_2H)
	{
		if(Npc_GetTalentValue(self,NPC_TALENT_2H) >= 0)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_2H,0);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_2H) >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_2H) >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
		};
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(Npc_GetTalentValue(self,NPC_TALENT_BOW) >= 0)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_BOW,0);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_BOW) >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_BOW) >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
		};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(Npc_GetTalentValue(self,NPC_TALENT_CROSSBOW) >= 0)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,0);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_CROSSBOW) >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
		};
		if(Npc_GetTalentValue(self,NPC_TALENT_CROSSBOW) >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
		};
	};
	
	
	
	};
	