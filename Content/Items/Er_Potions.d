/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* MIKSTURY 
*****************************************************/

//MIKSTURY CZASOWE

/******************************************************************************************/
//STRENGTH 1

INSTANCE ItFo_PotionTime_Strength_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	200;	

	visual 			=	"ItFo_Potion_Strength_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrengthPotionT;
	scemeName		=	"POTIONFAST";

	description			= "Wywar si³y";
	TEXT[1]				= "Tymczasowy wzrost si³y o 20 punktów";
	TEXT[2]				= "Czas trwania: 3 minuty";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 200;
};

	FUNC VOID UseStrengthPotionT()
	{ 
	if (Pot_StrenghtTimeStart <= 0)
	{
	B_RaiseAttribute	(ATR_STRENGTH,	20);
 	Pot_StrenghtTimeStart = 3 * 60;
	}
	else
	{
	Print ("Mikstura nie przynios³a skutku!");
	};
	};
/******************************************************************************************/
//DEX 1

INSTANCE ItFo_PotionTime_Dex_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	200;	

	visual 			=	"ItFo_Potion_Dex_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDexPotionT;
	scemeName		=	"POTIONFAST";

	description			= "Wywar zwinnoœci";
	TEXT[1]				= "Tymczasowy wzrost zrêcznoœci o 20 punktów";
	TEXT[2]				= "Czas trwania: 3 minuty";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 200;
};

	FUNC VOID UseDexPotionT()
	{ 
	if (Pot_DexTimeStart <= 0)
	{
		B_RaiseAttribute	(ATR_DEXTERITY,	20);
		Pot_DexTimeStart = 3 * 60;
	}
	else
	{
	Print ("Mikstura nie przynios³a skutku!");
	};	
	};

/******************************************************************************************/
// MANA 1

INSTANCE ItFo_PotionTime_Mana_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	200;	

	visual 			=	"ItFo_Potion_Mana_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectarPotionT;
	scemeName		=	"POTIONFAST";

	description			= "Wywar many";
	TEXT[1]				= "Tymczasowy wzrost many o 20 punktów";
	TEXT[2]				= "Czas trwania: 3 minuty";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 250;
};

	FUNC VOID UseNectarPotionT()
	{
	if (Pot_ManaTimeStart <= 0)
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	20);
		Pot_ManaTimeStart = 3 * 60;
	}
	else
	{
	Print ("Mikstura nie przynios³a skutku!");
	};	
	};	
/******************************************************************************************/
// STRENGTH & DEX 1

INSTANCE ItFo_PotionTime_Master_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	450;	

	visual 			=	"ItFo_Potion_Master_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMasterPotionT;
	scemeName		=	"POTIONFAST";

	description			= "Wywar potêgi";
	TEXT[1]				= "Tymczasowy wzrost si³y i zrêcznoœci";
	TEXT[2]				= "o 20 punktów";
	TEXT[3]				= "Czas trwania: 3 minuty";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 450;
};

	FUNC VOID UseMasterPotionT()
	{
	if (Pot_MasterTimeStart <= 0) {
	Npc_ChangeAttribute	(self,	ATR_STRENGTH,	20);
	Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	20);
	//B_RaiseAttribute	(ATR_STRENGTH,	20);
	//B_RaiseAttribute	(ATR_DEXTERITY,	20);	
	var string msg;
	msg = ConcatStrings(NAME_RaiseStrDex , IntToString(20));
	PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
	Pot_MasterTimeStart = 3 * 60;	
	}
	else
	{
	Print ("Mikstura nie przynios³a skutku!");
	};	
	};	
/******************************************************************************************/		
// Hitpoints 1

INSTANCE ItFo_Potion_HealthTime_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	300;	

	visual 			=	"ItFo_Potion_Health_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLifePotionT;
	scemeName		=	"POTIONFAST";

	description			= "Wywar ¿ycia";
	TEXT[1]				= "Tymczasowy wzrost punktów ¿ycia o 50";
	TEXT[2]				= "Czas trwania: 4 minuty";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 300;
};

	FUNC VOID UseLifePotionT()
	{
	if (Pot_HPTimeStart <= 0) {
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	50);
		Pot_HPTimeStart = 4 * 60;	
	}
	else
	{
	Print ("Mikstura nie przynios³a skutku!");
	};		
	};	
	
//***********************************PE£NIA MANY******************************************//

INSTANCE ItFo_Potion_Mana_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaFull;	

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItFo_Potion_Mana_04;
	scemeName		=	"POTIONFAST";

	description		= 	"Pe³nia many";
	
	TEXT[2]			= 	"Ca³kowita regeneracja many";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaFull;
};

	FUNC VOID UseItFo_Potion_Mana_04()
	{
		
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
//***********************************PE£NIA ¯YCIA******************************************//	
	INSTANCE ItFo_Potion_Health_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpFull;	

	visual 			=	"ItFo_Potion_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItFo_Potion_Health_04;
	scemeName		=	"POTIONFAST";


	description		= 	"Pe³nia ¿ycia";
	
	//TEXT[1]			= 	NAME_Bonus_HP;				
	TEXT[2]			= 	"Ca³kowita regeneracja energii ¿yciowej";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpFull;
};

	FUNC VOID UseItFo_Potion_Health_04()
	{
		
		self.attribute[ATR_HITPOINTS] =  self.attribute[ATR_HITPOINTS_MAX];
};

//===========================================================================

	INSTANCE ItFo_Potion_Sleep(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpFull;	

	visual 			=	"itmi_rum_01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItFo_Potion_Sleep;
	scemeName		=	"POTIONFAST";


	description		= 	"Napój usypiaj¹cy";
	
	//TEXT[1]			= 	NAME_Bonus_HP;				
	TEXT[2]			= 	"Lepiej go nie piæ...";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpFull;
};

	FUNC VOID UseItFo_Potion_Sleep()
	{
		
		AI_StartState	(self, ZS_MagicSleep, 0, "");
};

	INSTANCE ItFo_Potion_Sleep01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpFull;	

	visual 			=	"ItFo_Potion_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItFo_Potion_Sleep;
	scemeName		=	"POTIONFAST";


	description		= 	"Napój usypiaj¹cy";
	
	//TEXT[1]			= 	NAME_Bonus_HP;				
	TEXT[2]			= 	"Lepiej go nie piæ...";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpFull;
};




INSTANCE ItPo_Heal_DP(C_Item)
{
	name 			=	"Odtrudka";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

//	value 			=	Value_HpMaxExtrakt;	

	visual 			=	"ITPO_ER01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLifeDP;
	scemeName		=	"POTIONFAST";

	description		=  name;
	TEXT[1]				= "Odtrudka Richarda";	
    TEXT[2]				= "muszê mu j¹ czym prêdzej";	
	TEXT[3]				= "dostarczyæ.";	
   
};

	FUNC VOID UseLifeDP()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	  HPMax_Extrakt);
		B_RaiseAttribute	(ATR_MANA_MAX,	    ManaMax_Extrakt);
		
	};
	