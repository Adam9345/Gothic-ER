
	

func int B_GetLearnCostTalent(var C_Npc oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;
	if(talent == NPC_TALENT_1H)
	{
		if(Npc_GetTalentValue(hero,NPC_TALENT_1H) >= 90)
		{
			kosten = 4;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_1H) >= 60)
		{
			kosten = 3;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_1H) >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_2H)
	{
		if(Npc_GetTalentValue(hero,NPC_TALENT_2H) >= 90)
		{
			kosten = 4;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_2H) >= 60)
		{
			kosten = 3;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_2H) >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		
		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(Npc_GetTalentValue(hero,NPC_TALENT_BOW) >= 90)
		{
			kosten = 4;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_BOW) >= 60)
		{
			kosten = 3;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_BOW) >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		
		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(Npc_GetTalentValue(hero,NPC_TALENT_CROSSBOW) >= 90)
		{
			kosten = 4;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_CROSSBOW) >= 60)
		{
			kosten = 3;
		}
		else if(Npc_GetTalentValue(hero,NPC_TALENT_CROSSBOW) >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		
		kosten = kosten * skill;
	};	
	return kosten;
};

//--------------------Other Skills
/*
func void B_SetFightSkills_Coward()
{
	Npc_SetTalentValue(self, NPC_TALENT_1H,10);
	Npc_SetTalentValue(self, NPC_TALENT_2H,10);
	Npc_SetTalentValue(self, NPC_TALENT_BOW,10);
	Npc_SetTalentValue(self, NPC_TALENT_CROSSBOW,10);

	Npc_SetTalentSkill(self,NPC_TALENT_1H,0);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,0);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,0);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,0);
};

func void B_SetFightSkills_Warrior()
{
	Npc_SetTalentValue(self, NPC_TALENT_1H,30);
	Npc_SetTalentValue(self, NPC_TALENT_2H,30);
	Npc_SetTalentValue(self, NPC_TALENT_BOW,30);
	Npc_SetTalentValue(self, NPC_TALENT_CROSSBOW,30);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	
};
func void B_SetFightSkills_Advanced()
{
	Npc_SetTalentValue(self, NPC_TALENT_1H,50);
	Npc_SetTalentValue(self, NPC_TALENT_2H,50);
	Npc_SetTalentValue(self, NPC_TALENT_BOW,50);
	Npc_SetTalentValue(self, NPC_TALENT_CROSSBOW,50);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	
};
func void B_SetFightSkills_Master()
{
	Npc_SetTalentValue(self, NPC_TALENT_1H,70);
	Npc_SetTalentValue(self, NPC_TALENT_2H,70);
	Npc_SetTalentValue(self, NPC_TALENT_BOW,70);
	Npc_SetTalentValue(self, NPC_TALENT_CROSSBOW,70);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	
};
*/
func void B_SetFightSkills(var C_NPC slf,var int percent)
{
    Npc_SetTalentValue(self, NPC_TALENT_1H,percent);
    Npc_SetTalentValue(self, NPC_TALENT_2H,percent);
    Npc_SetTalentValue(self, NPC_TALENT_BOW,percent);
    Npc_SetTalentValue(self, NPC_TALENT_CROSSBOW,percent);
    if(percent >= 60)
    {
        Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
        Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
        Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
        Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
    }
    else if(percent >= 30)
    {
        Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
        Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
        Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
        Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
    }
    else
    {
        Npc_SetTalentSkill(self,NPC_TALENT_1H,0);
        Npc_SetTalentSkill(self,NPC_TALENT_2H,0);
        Npc_SetTalentSkill(self,NPC_TALENT_BOW,0);
        Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,0);
    };
};
func int b_teachthieftalent(var C_NPC slf,var C_NPC oth,var int talent)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,talent,1);
	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET))
	{
		Print("*** B³¹d: Z³y parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
	//	PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_PICKLOCK)
	{
		if (Npc_GetTalentSkill(oth, NPC_TALENT_PICKLOCK) == 0) {
			Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		}
		else if (Npc_GetTalentSkill(oth, NPC_TALENT_PICKLOCK) == 1) {
			Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,2);
		};

	//	PrintScreen(PRINT_LEARNPICKLOCK,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
	//	PrintScreen(PRINT_LEARNSNEAK,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
	//	PrintScreen(PRINT_LEARNACROBAT,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		if (Npc_GetTalentSkill(oth, NPC_TALENT_PICKPOCKET) == 0) {
			Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		}
		else if (Npc_GetTalentSkill(oth, NPC_TALENT_PICKPOCKET) == 1) {
			Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,2);
		};
	//	PrintScreen(PRINT_LEARNPICKPOCKET,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
};


