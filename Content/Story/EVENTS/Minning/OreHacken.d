
func int b_Oremob_bestimmung() 
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"KOP1") && (OreMOB_01_AMOUNT_MAX > OreMOB_01_AMOUNT))
	{
		OreMOB_01_AMOUNT = OreMOB_01_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"KOP3") && (OreMOB_02_AMOUNT_MAX > OreMOB_02_AMOUNT))
	{
		OreMOB_02_AMOUNT = OreMOB_02_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"KOP4") && (OreMOB_03_AMOUNT_MAX > OreMOB_03_AMOUNT))
	{
		OreMOB_03_AMOUNT = OreMOB_03_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"KOP6") && (OreMOB_04_AMOUNT_MAX > OreMOB_04_AMOUNT)) //==
	{
		OreMOB_04_AMOUNT = OreMOB_04_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"KOP7") && (OreMOB_05_AMOUNT_MAX > OreMOB_05_AMOUNT))
	{
		OreMOB_05_AMOUNT = OreMOB_05_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"KOP8") && (OreMOB_06_AMOUNT_MAX > OreMOB_06_AMOUNT))
	{
		OreMOB_06_AMOUNT = OreMOB_06_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"KOP9") && (OreMOB_07_AMOUNT_MAX > OreMOB_07_AMOUNT))
	{
		OreMOB_07_AMOUNT = OreMOB_07_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_07") && (OreMOB_08_AMOUNT_MAX > OreMOB_08_AMOUNT))
	{
		OreMOB_08_AMOUNT = OreMOB_08_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_04") && (OreMOB_09_AMOUNT_MAX > OreMOB_09_AMOUNT))
	{
		OreMOB_09_AMOUNT = OreMOB_09_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_06") && (OreMOB_10_AMOUNT_MAX > OreMOB_10_AMOUNT))
	{
		OreMOB_10_AMOUNT = OreMOB_10_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_05") && (OreMOB_11_AMOUNT_MAX > OreMOB_11_AMOUNT))
	{
		OreMOB_11_AMOUNT = OreMOB_11_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_01") && (OreMOB_12_AMOUNT_MAX > OreMOB_12_AMOUNT))
	{
		OreMOB_12_AMOUNT = OreMOB_12_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_09") && (OreMOB_13_AMOUNT_MAX > OreMOB_13_AMOUNT))
	{
		OreMOB_13_AMOUNT = OreMOB_13_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_10") && (OreMOB_14_AMOUNT_MAX > OreMOB_14_AMOUNT))
	{
		OreMOB_14_AMOUNT = OreMOB_14_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_08") && (OreMOB_15_AMOUNT_MAX > OreMOB_15_AMOUNT))
	{
		OreMOB_15_AMOUNT = OreMOB_15_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_02") && (OreMOB_16_AMOUNT_MAX > OreMOB_16_AMOUNT))
	{
		OreMOB_16_AMOUNT = OreMOB_16_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ORE_03") && (OreMOB_17_AMOUNT_MAX > OreMOB_17_AMOUNT))
	{
		OreMOB_17_AMOUNT = OreMOB_17_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OM_PICKORE_01B") && (OreMOB_18_AMOUNT_MAX > OreMOB_18_AMOUNT))
	{
		OreMOB_18_AMOUNT = OreMOB_18_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"OM_PICKORE_01A") && (OreMOB_19_AMOUNT_MAX > OreMOB_19_AMOUNT))
	{
		OreMOB_19_AMOUNT = OreMOB_19_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_OM_01") && (OreMOB_20_AMOUNT_MAX > OreMOB_20_AMOUNT))
	{
		OreMOB_20_AMOUNT = OreMOB_20_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_ORE1") && (OreMOB_21_AMOUNT_MAX > OreMOB_21_AMOUNT))
	{
		OreMOB_21_AMOUNT = OreMOB_21_AMOUNT + 1;
		return TRUE;
	};
	return FALSE;
};
func void OreHacken_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_OreHACKEN;
		AI_ProcessInfos(her);
	};
};

instance PC_OreHACKEN_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_Orehacken_end_condition;
	information = pc_Orehacken_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_Orehacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_OreHACKEN)
	{
		return TRUE;
	};
};

func void pc_Orehacken_end_info()
{
	TRUEMMER_COUNT = 0;
	b_endproductiondialog();
};

 
instance PC_OreHACKEN_ADDON_HOUR(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_Orehacken_addon_hour_condition;
	information = pc_Orehacken_addon_hour_info;
	permanent = TRUE;
	description = "Od³up trochê.";
};


func int pc_Orehacken_addon_hour_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_OreHACKEN)
	{
		return TRUE;
	};
};


var int Orecounter;

func void pc_Orehacken_addon_hour_info()
{
	var int currentchance;
	var int multinugget;
	LEARN_BY_DOING = LEARN_BY_DOING + 1;
	if(LEARN_BY_DOING == 10)
	{
		b_upgrade_hero_hackchance(2);
	}
	else if(LEARN_BY_DOING == 15)
	{
		b_upgrade_hero_hackchance(3);
	}
	else if(LEARN_BY_DOING == 20)
	{
		b_upgrade_hero_hackchance(5);
	};
	currentchance = Hlp_Random(100);
	multinugget = Hlp_Random(10);
	if(b_Oremob_bestimmung() == TRUE)
	{
		if(currentchance <= HERO_HACKCHANCE)
		{
			if((OreCOUNTER >= 20) && (multinugget >= 8))
			{
				CreateInvItems(hero,ItMiNugget,3);
				PrintScreen("Odpad³y 3 bry³ki rudy!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
				TRUEMMER_COUNT = 0;
			}
			else if((OreCOUNTER >= 7) && (multinugget >= 5))
			{
				CreateInvItems(hero,ItMiNugget,2);
				PrintScreen("Odpad³y 2 bry³ki rudy!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
				TRUEMMER_COUNT = 0;
				OreCOUNTER = OreCOUNTER + 1;
			}
			else
			{
				CreateInvItems(hero,ItMiNugget,1);
				PrintScreen("Odpad³a 1 bry³ka rudy!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
				TRUEMMER_COUNT = 0;
				OreCOUNTER = OreCOUNTER + 1;
			};
		}
		else
		{
			PrintScreen("Kawa³ki rudy zasypuj¹ okolicê...",-1,-1,"FONT_OLD_20_WHITE.tga",2);
			TRUEMMER_COUNT = TRUEMMER_COUNT + 1;
		};
	}
	else
	{
		PrintScreen("Nic nie zosta³o.",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		b_endproductiondialog();
	};
};


instance PC_OreHACKEN_ADDON_TSCHLAG(C_INFO)
{
	npc = pc_hero;
	nr = 997;
	condition = pc_Orehacken_addon_tschlag_condition;
	information = pc_Orehacken_addon_tschlag_info;
	permanent = TRUE;
	description = "Mocno uderz.";
};


func int pc_Orehacken_addon_tschlag_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_OreHACKEN) && (TRUEMMER_COUNT >= 2) && (KNOWS_TRUEMMERSCHLAG == TRUE))
	{
		return TRUE;
	};
};

func void pc_Orehacken_addon_tschlag_info()
{
	var int truemmerchance;
	truemmerchance = Hlp_Random(100);
	if(truemmerchance < 5)
	{
		PrintScreen("Nic...",-1,-1,"FONT_OLD_20_WHITE.tga",2);
	}
	else
	{
		//Snd_Play("RAVENS_EARTHQUAKE3");
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		if(truemmerchance >= 85)
		{
			CreateInvItems(hero,ItMiNugget,3);
			PrintScreen("Odpad³y 3 bry³ki rudy!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		}
		else if(truemmerchance >= 50)
		{
			CreateInvItems(hero,ItMiNugget,2);
			PrintScreen("Odpad³y 2 bry³ki rudy!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		}
		else
		{
			CreateInvItems(hero,ItMiNugget,1);
			PrintScreen("Odpad³ 1 bry³ka rudy!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		};
	};
	TRUEMMER_COUNT = 0;
};


instance PC_OreHACKEN_ADDON_CHANCE(C_INFO)
{
	npc = pc_hero;
	nr = 998;
	condition = pc_Orehacken_addon_chance_condition;
	information = pc_Orehacken_addon_chance_info;
	permanent = TRUE;
	description = "(Ocena zdolnoœci)";
};


func int pc_Orehacken_addon_chance_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_OreHACKEN)
	{
		return TRUE;
	};
};

func void pc_Orehacken_addon_chance_info()
{
	var string concattext;
	if(HERO_HACKCHANCE < 20)
	{
		concattext = ConcatStrings("nieopierzony ¿ó³todziób (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 40)
	{
		concattext = ConcatStrings("przeciêtny kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 55)
	{
		concattext = ConcatStrings("doœwiadczony kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 75)
	{
		concattext = ConcatStrings("urodzony kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 90)
	{
		concattext = ConcatStrings("piekielnie dobry kopacz (",IntToString(HERO_HACKCHANCE));
	}
	else if(HERO_HACKCHANCE < 98)
	{
		concattext = ConcatStrings("mistrz kopania (",IntToString(HERO_HACKCHANCE));
	}
	else
	{
		concattext = ConcatStrings("guru kopaczy ( ",IntToString(HERO_HACKCHANCE));
	};
	concattext = ConcatStrings(concattext," procent)");
	PrintScreen(concattext,-1,-1,"FONT_OLD_20_WHITE.tga",2);
};

