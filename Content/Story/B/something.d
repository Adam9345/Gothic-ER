var int newStrength;
var int newDexterity;
var int newManaMax;

func int countCostAttributeOld (var int ATR, var C_NPC typ) {
	var int attributeCost;

	if (ATR == ATR_STRENGTH) {
		if (typ.attribute[ATR_STRENGTH] >= 90)
		{
			attributeCost = 5;
			public_str_cost = 5;
		}
		else if (typ.attribute[ATR_STRENGTH] >= 75)
		{
			attributeCost = 4;
			public_str_cost = 4;
		}
		else if (typ.attribute[ATR_STRENGTH] >= 50)
		{
			attributeCost = 3;
			public_str_cost = 3;
		}
		else if (typ.attribute[ATR_STRENGTH] >= 25)
		{
			attributeCost = 2;
			public_str_cost = 2;
		}
		else if (typ.attribute[ATR_STRENGTH] < 25)
		{
			attributeCost = 1;
			public_str_cost = 1;
		};
	} else if (ATR == ATR_DEXTERITY) {
	//wyliczanie kosztów atrybutu ZRÊCZNOŒÆ
		if (typ.attribute[ATR_DEXTERITY] >= 90)
		{
			attributeCost = 5;
			public_dex_cost = 5;
		}
		else if (typ.attribute[ATR_DEXTERITY] >= 75)
		{
			attributeCost = 4;
			public_dex_cost = 4;
		}
		else if (typ.attribute[ATR_DEXTERITY] >= 50)
		{
			attributeCost = 3;
			public_dex_cost = 3;
		}
		else if (typ.attribute[ATR_DEXTERITY] >= 25)
		{
			attributeCost = 2;
			public_dex_cost = 2;
		}
		else if (typ.attribute[ATR_DEXTERITY] < 25)
		{
			attributeCost = 1;
			public_dex_cost = 1;
		};
	} else if (ATR == ATR_MANA_MAX) {
	//wyliczanie kosztów atrybutu MANA MAX
		if (typ.attribute[ATR_MANA_MAX] >= 90)
		{
			attributeCost = 3;
			public_man_cost = 3;
		}
		else if (typ.attribute[ATR_MANA_MAX] >= 75)
		{
			attributeCost = 2;
			public_man_cost = 2;
		}
		else if (typ.attribute[ATR_MANA_MAX] >= 50)
		{
			attributeCost = 2;
			public_man_cost = 2;
		}
		else if (typ.attribute[ATR_MANA_MAX] >= 25)
		{
			attributeCost = 1;
			public_man_cost = 1;
		}
		else if (typ.attribute[ATR_MANA_MAX] < 25)
		{
			attributeCost = 1;
			public_man_cost = 1;
		};
	};

	return attributeCost;
};

func int countCostAttribute(var int ATR) {
	var int attributeCost;

	if (ATR == ATR_STRENGTH) {
		if (newStrength >= 90)
		{
			attributeCost = 5;
			public_str_cost = 5;
		}
		else if (newStrength >= 75)
		{
			attributeCost = 4;
			public_str_cost = 4;
		}
		else if (newStrength >= 50)
		{
			attributeCost = 3;
			public_str_cost = 3;
		}
		else if (newStrength >= 25)
		{
			attributeCost = 2;
			public_str_cost = 2;
		}
		else if (newStrength < 25)
		{
			attributeCost = 1;
			public_str_cost = 1;
		};
	} else if (ATR == ATR_DEXTERITY) {
		if (newDexterity >= 90)
		{
			attributeCost = 5;
			public_dex_cost = 5;
		}
		else if (newDexterity >= 75)
		{
			attributeCost = 4;
			public_dex_cost = 4;
		}
		else if (newDexterity >= 50)
		{
			attributeCost = 3;
			public_dex_cost = 3;
		}
		else if (newDexterity >= 25)
		{
			attributeCost = 2;
			public_dex_cost = 2;
		}
		else if (newDexterity < 25)
		{
			attributeCost = 1;
			public_dex_cost = 1;
		};
	} else if (ATR == ATR_MANA_MAX) {
		if (newManaMax >= 90)
		{
			attributeCost = 3;
			public_man_cost = 3;
		}
		else if (newManaMax >= 75)
		{
			attributeCost = 2;
			public_man_cost = 2;
		}
		else if (newManaMax >= 50)
		{
			attributeCost = 2;
			public_man_cost = 2;
		}
		else if (newManaMax >= 25)
		{
			attributeCost = 1;
			public_man_cost = 1;
		}
		else if (newManaMax < 25)
		{
			attributeCost = 1;
			public_man_cost = 1;
		};
	};

	return attributeCost;

};

func void Mod_KupAtrybut (var C_NPC typ, var int ATR, var int AtrPlus)
{
	// --------- Umwandeln von var in const
	var int Typ_Atr;

	if 		(ATR == ATR_STRENGTH)	
	{	
		if (newLearnPointsWithoutBonuses) {
			Typ_Atr = newStrength;
		} else {
			Typ_Atr = typ.attribute[ATR_STRENGTH];
		};
	}
	else if (ATR == ATR_DEXTERITY)	
	{	
		if (newLearnPointsWithoutBonuses) {
			Typ_Atr = newDexterity;
		} else {
			Typ_Atr = typ.attribute[ATR_DEXTERITY];	
		};
	}
	else if (ATR == ATR_MANA_MAX)	
	{
		if (newLearnPointsWithoutBonuses) {
			Typ_Atr = newManaMax;
		} else {
			Typ_Atr = typ.attribute[ATR_MANA_MAX];
		};		
	};
	
	// --------- Steigern oder verbieten	
	var string AtrPlusSTRING; AtrPlusSTRING	= IntToString(AtrPlus);
	var string PrintSTRING; var string PrintSTRING2;   var string PrintSTRING3;  
	var string atrwartosc;
	
	var int koszt_punktu_str;
	var int koszt_punktu_dex;
	var int koszt_punktu_mana;
	//wyliczanie kosztów atrybutu SI£A

	if (newLearnPointsWithoutBonuses) {
		koszt_punktu_str = countCostAttribute(ATR_STRENGTH);
		koszt_punktu_dex = countCostAttribute(ATR_DEXTERITY);
		koszt_punktu_mana = countCostAttribute(ATR_MANA_MAX);
	} else {
		koszt_punktu_str = countCostAttributeOld(ATR_STRENGTH, typ);
		koszt_punktu_dex = countCostAttributeOld(ATR_DEXTERITY, typ);
		koszt_punktu_mana = countCostAttributeOld(ATR_MANA_MAX, typ);
	};
	
	if 	(ATR == ATR_STRENGTH)	
	{	
		if (Typ_Atr + AtrPlus <= 100)
		{
			if (typ.lp >= AtrPlus*koszt_punktu_str)
			{
				if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*koszt_punktu_str*10) 
				{
				B_GiveInvItems  (hero, self, itminugget, AtrPlus*koszt_punktu_str*10);
				Npc_RemoveInvItems (self, itminugget, AtrPlus*koszt_punktu_str*10);
		
				typ.lp = typ.lp - AtrPlus*koszt_punktu_str;

				if (newLearnPointsWithoutBonuses) {
					newStrength = newStrength + AtrPlus;
				};
				
				typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + AtrPlus;
		
				PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_STRENGTH]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				//PrintS_Ext(ConcatStrings("Punkty si³y: ", IntToString(newStrength)), COL_Lime);
				PrintS_Ext(PrintSTRING3, COL_Lime);
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);				
var string pri1;
var string pri2;
var string pri3;
var string pri4;
				pri1 = IntToString(typ.lp); //pozosta³e PN
				pri2 = IntToString(AtrPlus*koszt_punktu_str); //odjête PN
				pri3 = ConcatStrings ("Wykorzystano punktów nauki:",pri2);
				pri4 = ConcatStrings ("Pozosta³o punktów nauki:", pri1);
				
				PrintS_Ext(pri3, COL_RED);				
				PrintS_Ext(pri4, COL_Lime);			
				}
				else
				{
				
				PrintS_Ext("Za ma³o rudy!", COL_RED);	
				};
		}
		else
		{
		B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
	
	PrintS_Ext("100 punktów to wartoœæ maksymalna!", COL_RED);	
	B_Say (self, other, "$NOLEARNOVERMAX");
	};
	};
	
	 
	if 	(ATR == ATR_DEXTERITY)	
	{	
		if (Typ_Atr + AtrPlus <= 100)
		{
			if (typ.lp >= AtrPlus*koszt_punktu_dex)
			{
				if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*koszt_punktu_dex*10) 
				{
				B_GiveInvItems  (hero, self, itminugget, AtrPlus*koszt_punktu_dex*10);
				Npc_RemoveInvItems (self, itminugget, AtrPlus*koszt_punktu_dex*10);
				typ.lp = typ.lp - AtrPlus*koszt_punktu_dex;
				
				if (newLearnPointsWithoutBonuses) {
					newDexterity = newDexterity + AtrPlus;
				};

				typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + AtrPlus;
		
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);			
				PrintString = ConcatStrings(NAME_BuyAttributeDEX, AtrPlusSTRING);
				
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_DEXTERITY]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				//PrintS_Ext(ConcatStrings("Punkty zrêcznoœci: ", IntToString(newDexterity)), COL_Lime);
				PrintS_Ext(PrintSTRING3, COL_Lime);				
var string pri1d;
var string pri2d;
var string pri3d;
var string pri4d;
				pri1d = IntToString(typ.lp); //pozosta³e PN
				pri2d = IntToString(AtrPlus*koszt_punktu_dex); //odjête PN
				pri3d = ConcatStrings ("Wykorzystano punktów nauki:",pri2d);
				pri4d = ConcatStrings ("Pozosta³o punktów nauki:", pri1d);
				
				PrintS_Ext(pri3d, COL_RED);				
				PrintS_Ext(pri4d, COL_Lime);			
				}
				else
				{
				PrintS_Ext("Za ma³o rudy!", COL_RED);	
				};
		}
		else
		{
		B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
	PrintS_Ext("100 punktów to wartoœæ maksymalna!", COL_RED);	
	B_Say (self, other, "$NOLEARNOVERMAX");
	};
	};

		if 	(ATR == ATR_MANA_MAX)	
	{	
		if (Typ_Atr + AtrPlus <= 100)
		{
			if (typ.lp >= AtrPlus*koszt_punktu_mana)
			{
				if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*koszt_punktu_mana*10) 
				{
				B_GiveInvItems  (hero, self, itminugget, AtrPlus*koszt_punktu_mana*10);
				Npc_RemoveInvItems (self, itminugget, AtrPlus*koszt_punktu_mana*10);
				typ.lp = typ.lp - AtrPlus*koszt_punktu_mana;
				
				if (newLearnPointsWithoutBonuses) {
					newManaMax = newManaMax + AtrPlus;
				};

				typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + AtrPlus;
		
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);	
				PrintString = ConcatStrings(NAME_BuyAttributeMAN, AtrPlusSTRING);
				
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_MANA_MAX]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				//PrintS_Ext(ConcatStrings("Punkty many: ", IntToString(newManaMax)), COL_Lime);
				PrintS_Ext(PrintSTRING3, COL_Lime);				
var string pri1m;
var string pri2m;
var string pri3m;
var string pri4m;
				pri1m = IntToString(typ.lp); //pozosta³e PN
				pri2m = IntToString(AtrPlus*koszt_punktu_mana); //odjête PN
				pri3m = ConcatStrings ("Wykorzystano punktów nauki:",pri2m);
				pri4m = ConcatStrings ("Pozosta³o punktów nauki:", pri1m);
				
				PrintS_Ext(pri3m, COL_RED);				
				PrintS_Ext(pri4m, COL_Lime);			
				//PrintScreen	(pri3m, -1,53,"FONT_OLD_10_WHITE.TGA",2);
				//PrintScreen	(pri4m, -1,56,"FONT_OLD_10_WHITE.TGA",2);
				}
				else
				{
				PrintS_Ext("Za ma³o rudy!", COL_RED);	
				};
		}
		else
		{
		B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
	PrintS_Ext("100 punktów to wartoœæ maksymalna!", COL_RED);	
	B_Say (self, other, "$NOLEARNOVERMAX");
	};
	};
	
	//wyliczanie kosztów atrybutu SI£A
	if (newLearnPointsWithoutBonuses) {
		koszt_punktu_str = countCostAttribute(ATR_STRENGTH);
		koszt_punktu_dex = countCostAttribute(ATR_DEXTERITY);
		koszt_punktu_mana = countCostAttribute(ATR_MANA_MAX);
	} else {
		koszt_punktu_str = countCostAttributeOld(ATR_STRENGTH, typ);
		koszt_punktu_dex = countCostAttributeOld(ATR_DEXTERITY, typ);
		koszt_punktu_mana = countCostAttributeOld(ATR_MANA_MAX, typ);
	};
};
