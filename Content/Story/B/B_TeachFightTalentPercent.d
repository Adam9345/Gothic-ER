
func int B_TeachFightTalentPercent(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realHitChance;
	kosten = B_GetLearnCostTalent(oth,talent,1) * percent;
	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** B��d: Z�y parametr ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = Npc_GetTalentValue(hero,NPC_TALENT_1H);
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = Npc_GetTalentValue(hero,NPC_TALENT_2H);
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = Npc_GetTalentValue(hero,NPC_TALENT_BOW);
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = Npc_GetTalentValue(hero,NPC_TALENT_CROSSBOW);
	};
	if(realHitChance >= teacherMAX)
	{
		concatText = ConcatStrings("Maksimum dla tego nauczyciela wynosi ",IntToString(teacherMAX));
		PrintScreen(concatText,-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if((realHitChance + percent) > teacherMAX)
	{
		concatText = ConcatStrings("Maksimum dla tego nauczyciela wynosi ",IntToString(teacherMAX));
		PrintScreen(concatText,-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	
	if(talent == NPC_TALENT_1H)
	{
		Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)+percent);
		if(Npc_GetTalentValue(hero,NPC_TALENT_1H) >= (Npc_GetTalentValue(hero,NPC_TALENT_2H) +30))
		{
			Npc_SetTalentValue(hero, NPC_TALENT_2H, Npc_GetTalentValue(hero, NPC_TALENT_2H)+percent);
			PrintScreen("Trening: pos�ugiwanie si� broni� jedno- i dwur�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
			B_SetFightSkill(hero,NPC_TALENT_2H,percent);
		}
		else
		{
			PrintScreen("Trening: pos�ugiwanie si� broni� jednor�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
		};
		B_SetFightSkill(hero,talent,percent);
		return TRUE;
	};
	
    if(talent == NPC_TALENT_2H)
	  {
		Npc_SetTalentValue(hero, NPC_TALENT_2H, Npc_GetTalentValue(hero, NPC_TALENT_2H)+percent);	
		if(Npc_GetTalentValue(hero,NPC_TALENT_2H) >= (Npc_GetTalentValue(hero,NPC_TALENT_1H) +30))	
		{
			Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)+percent);
			
			PrintScreen	("Trening: pos�ugiwanie si� broni� dwu- i jednor�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
			B_SetFightSkill(hero,NPC_TALENT_1H,percent);
		}
		else
		{
			PrintScreen	("Trening: pos�ugiwanie si� broni� dwur�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
		};
		B_SetFightSkill(hero,talent,percent);
		return TRUE;

      };
        if(talent == NPC_TALENT_BOW)
	   {
		Npc_SetTalentValue(hero, NPC_TALENT_BOW, Npc_GetTalentValue(hero, NPC_TALENT_BOW)+percent);	
		if(Npc_GetTalentValue(hero,NPC_TALENT_BOW) >= (Npc_GetTalentValue(hero,NPC_TALENT_CROSSBOW) +30))	
		{
			Npc_SetTalentValue(hero, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+percent);
			B_SetFightSkill(hero,NPC_TALENT_CROSSBOW,percent);
			PrintScreen	("Trening: pos�ugiwanie si� broni� dwu- i jednor�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
		}
		else
		{
			PrintScreen	("Trening: pos�ugiwanie si� broni� dwur�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
		};
		B_SetFightSkill(hero,talent,percent);
		return TRUE;

       };
        if(talent == NPC_TALENT_CROSSBOW)
	   {
		Npc_SetTalentValue(hero, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(hero, NPC_TALENT_CROSSBOW)+percent);	
		if(Npc_GetTalentValue(hero,NPC_TALENT_CROSSBOW) >= (Npc_GetTalentValue(hero,NPC_TALENT_BOW) +30))	
		{
			Npc_SetTalentValue(hero, NPC_TALENT_BOW, Npc_GetTalentValue(hero, NPC_TALENT_BOW)+percent);
			B_SetFightSkill(hero,NPC_TALENT_BOW,percent);
			PrintScreen	("Trening: pos�ugiwanie si� broni� dwu- i jednor�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
		}
		else
		{
			PrintScreen	("Trening: pos�ugiwanie si� broni� dwur�czn�", -1,10,"FONT_OLD_20_WHITE.TGA",2);
		};
		B_SetFightSkill(hero,talent,percent);
		return TRUE;

      };
  
	
};



