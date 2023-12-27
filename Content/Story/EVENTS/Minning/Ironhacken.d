
func int b_Ironmob_bestimmung() 
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_CAVEBQ_PICK_01") && (IronMOB_01_AMOUNT_MAX > IronMOB_01_AMOUNT))
	{
		IronMOB_01_AMOUNT = IronMOB_01_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_CAVEBQ_PICK_03") && (IronMOB_02_AMOUNT_MAX > IronMOB_02_AMOUNT))
	{
		IronMOB_02_AMOUNT = IronMOB_02_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_CAVEBQ_PICK_02") && (IronMOB_03_AMOUNT_MAX > IronMOB_03_AMOUNT))
	{
		IronMOB_03_AMOUNT = IronMOB_03_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_CAVEBQ_PICK_04") && (IronMOB_04_AMOUNT_MAX > IronMOB_04_AMOUNT)) //==
	{
		IronMOB_04_AMOUNT = IronMOB_04_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_PICK_IRON_01") && (IronMOB_05_AMOUNT_MAX > IronMOB_05_AMOUNT))
	{
		IronMOB_05_AMOUNT = IronMOB_05_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_PICK_IRON_02") && (IronMOB_06_AMOUNT_MAX > IronMOB_06_AMOUNT))
	{
		IronMOB_06_AMOUNT = IronMOB_06_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_14") && (IronMOB_07_AMOUNT_MAX > IronMOB_07_AMOUNT))
	{
		IronMOB_07_AMOUNT = IronMOB_07_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_22") && (IronMOB_08_AMOUNT_MAX > IronMOB_08_AMOUNT))
	{
		IronMOB_08_AMOUNT = IronMOB_08_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_23") && (IronMOB_09_AMOUNT_MAX > IronMOB_09_AMOUNT))
	{
		IronMOB_09_AMOUNT = IronMOB_09_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_24") && (IronMOB_10_AMOUNT_MAX > IronMOB_10_AMOUNT))
	{
		IronMOB_10_AMOUNT = IronMOB_10_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_25") && (IronMOB_11_AMOUNT_MAX > IronMOB_11_AMOUNT))
	{
		IronMOB_11_AMOUNT = IronMOB_11_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_26") && (IronMOB_12_AMOUNT_MAX > IronMOB_12_AMOUNT))
	{
		IronMOB_12_AMOUNT = IronMOB_12_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_ADD_27") && (IronMOB_13_AMOUNT_MAX > IronMOB_13_AMOUNT))
	{
		IronMOB_13_AMOUNT = IronMOB_13_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_PICK_IRON_03") && (IronMOB_14_AMOUNT_MAX > IronMOB_14_AMOUNT))
	{
		IronMOB_14_AMOUNT = IronMOB_14_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_07") && (IronMOB_15_AMOUNT_MAX > IronMOB_15_AMOUNT))
	{
		IronMOB_15_AMOUNT = IronMOB_15_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_08") && (IronMOB_16_AMOUNT_MAX > IronMOB_16_AMOUNT))
	{
		IronMOB_16_AMOUNT = IronMOB_16_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_09") && (IronMOB_17_AMOUNT_MAX > IronMOB_17_AMOUNT))
	{
		IronMOB_17_AMOUNT = IronMOB_17_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_19") && (IronMOB_18_AMOUNT_MAX > IronMOB_18_AMOUNT))
	{
		IronMOB_18_AMOUNT = IronMOB_18_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_SLAVE_01") && (IronMOB_19_AMOUNT_MAX > IronMOB_19_AMOUNT))
	{
		IronMOB_19_AMOUNT = IronMOB_19_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_05") && (IronMOB_20_AMOUNT_MAX > IronMOB_20_AMOUNT))
	{
		IronMOB_20_AMOUNT = IronMOB_20_AMOUNT + 1;
		return TRUE;
	};
	return FALSE;
};
func void Ironhacken_s1()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_IronHACKEN;
		AI_ProcessInfos(her);
	};
};

instance PC_IronHACKEN_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_Ironhacken_end_condition;
	information = pc_Ironhacken_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_Ironhacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_IronHACKEN)
	{
		return TRUE;
	};
};

func void pc_Ironhacken_end_info()
{
	TRUEMMER_COUNT = 0;
	b_endproductiondialog();
};

 
instance PC_IronHACKEN_ADDON_HOUR(C_INFO)
{
	npc = pc_hero;
	nr = 2;
	condition = pc_Ironhacken_addon_hour_condition;
	information = pc_Ironhacken_addon_hour_info;
	permanent = TRUE;
	description = "Od³up trochê.";
};


func int pc_Ironhacken_addon_hour_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_IronHACKEN)
	{
		return TRUE;
	};
};


var int Ironcounter;

func void pc_Ironhacken_addon_hour_info()
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
	if(b_Ironmob_bestimmung() == TRUE)
	{
		if(currentchance <= HERO_HACKCHANCE)
		{
			if((IronCOUNTER >= 20) && (multinugget >= 8))
			{
				CreateInvItems(hero,ItMi_IronNugget,3);
				PrintScreen("Odpad³y 3 samorodki ¿elaza!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
				TRUEMMER_COUNT = 0;
			}
			else if((IronCOUNTER >= 7) && (multinugget >= 5))
			{
				CreateInvItems(hero,ItMi_IronNugget,2);
				PrintScreen("Odpad³y 2 samorodki ¿elaza!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
				TRUEMMER_COUNT = 0;
				IronCOUNTER = IronCOUNTER + 1;
			}
			else
			{
				CreateInvItems(hero,ItMi_IronNugget,1);
				PrintScreen("Odpad³ 1 samorodek ¿elaza!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
				TRUEMMER_COUNT = 0;
				IronCOUNTER = IronCOUNTER + 1;
			};
		}
		else
		{
			PrintScreen("Kawa³ki ¿elaza zasypuj¹ okolicê...",-1,-1,"FONT_OLD_20_WHITE.tga",2);
			TRUEMMER_COUNT = TRUEMMER_COUNT + 1;
		};
	}
	else
	{
		PrintScreen("Nic nie zosta³o.",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		b_endproductiondialog();
	};
};


instance PC_IronHACKEN_ADDON_TSCHLAG(C_INFO)
{
	npc = pc_hero;
	nr = 997;
	condition = pc_Ironhacken_addon_tschlag_condition;
	information = pc_Ironhacken_addon_tschlag_info;
	permanent = TRUE;
	description = "Mocno uderz.";
};


func int pc_Ironhacken_addon_tschlag_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_IronHACKEN) && (TRUEMMER_COUNT >= 2) && (KNOWS_TRUEMMERSCHLAG == TRUE))
	{
		return TRUE;
	};
};

func void pc_Ironhacken_addon_tschlag_info()
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
			CreateInvItems(hero,ItMi_IronNugget,3);
			PrintScreen("Odpad³y 3 samorodki ¿elaza!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		}
		else if(truemmerchance >= 50)
		{
			CreateInvItems(hero,ItMi_IronNugget,2);
			PrintScreen("Odpad³y 2 samorodki ¿elaza!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		}
		else
		{
			CreateInvItems(hero,ItMi_IronNugget,1);
			PrintScreen("Odpad³ 1 samorodek ¿elaza!",-1,-1,"FONT_OLD_20_WHITE.tga",2);
		};
	};
	TRUEMMER_COUNT = 0;
};


instance PC_IronHACKEN_ADDON_CHANCE(C_INFO)
{
	npc = pc_hero;
	nr = 998;
	condition = pc_Ironhacken_addon_chance_condition;
	information = pc_Ironhacken_addon_chance_info;
	permanent = TRUE;
	description = "(Ocena zdolnoœci)";
};


func int pc_Ironhacken_addon_chance_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_IronHACKEN)
	{
		return TRUE;
	};
};

func void pc_Ironhacken_addon_chance_info()
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

