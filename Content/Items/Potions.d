// ************************************************************************************************
// Wirkung und Kosten von Tr�nken
// ************************************************************************************************

// Heilung
 
const int	Value_HpEssenz			=	80;		const int	HP_Essenz			=	50;
const int	Value_HpExtrakt			=	160;	const int	HP_Extrakt			=	70;
const int	Value_HpElixier			=	200;	const int	HP_Elixier			=	100;
const int	Value_HpFull			=	250;

// Mana (Magier)
 
const int	Value_ManaEssenz		=	80;  	const int	Mana_Essenz			=	30;
const int	Value_ManaExtrakt		=	160;	const int	Mana_Extrakt		=	50;
const int	Value_ManaElixier		=	200;	const int	Mana_Elixier		=	70;
const int	Value_ManaFull			=	250;

// Mana (Bruderschaft)
const int	Value_Elixier1			=	150;		const int	Mana_Elixier1		=	100;

// Permanente Attribut-Steigerungen
// FIXME: sind die zu kaufen (m��sen dann teuer sein) oder zu fnden (dann evtl. billiger)
// FIXME: Textanzeige der Attribut-�nderung bei Benutzung m�glich?
const int	Value_ElixierEgg		=	600;	const int	ManaMax_ElixierEgg	=	10;	// FIXME: was wenn der SC das selbst benutzt??

const int	Value_StrEssenz			=	800;	const int	STR_Essenz			=	2;
const int	Value_StrExtrakt		=	1200;	const int	STR_Extrakt			=	3;
const int	Value_StrElixier		=	1800;	const int	STR_Elixier			=	4;

const int	Value_DexEssenz			=	800;	const int	DEX_Essenz			=	2;
const int	Value_DexExtrakt		=	1200;	const int	DEX_Extrakt			=	4;
const int	Value_DexElixier		=	1800;	const int	DEX_Elixier			=	6;

// Trank der Macht
const int	Value_StrDex_Macht		=	800;	const int	StrDex_Macht		=	2;
// Trank der Herrschaft
const int	Value_StrDex_Herrschaft	=	1200;	const int	StrDex_Herrschaft	=	3;

const int	Value_HpMaxEssenz		=	800;	const int	HPMax_Essenz		=	4;
const int	Value_HpMaxExtrakt		=	1200;	const int	HPMax_Extrakt		=	8;
const int	Value_HpMaxElixier		=	1800;	const int	HPMax_Elixier		=	16;

const int	Value_ManaMaxEssenz		=	800;	const int	ManaMax_Essenz		=	4;
const int	Value_ManaMaxExtrakt	=	1200;	const int	ManaMax_Extrakt		=	8;
const int	Value_ManaMaxElixier	=	1800;	const int	ManaMax_Elixier		=	16;

// Speed-Potions
const int	Value_Haste1			=	25;	const int	Time_Haste1			=	60000;	// 1 min.
const int	Value_Haste2			=	60;	const int	Time_Haste2			=	120000;	// 2 min.
const int	Value_Haste3			=	150;	const int	Time_Haste3			=	300000;	// 5 min.


/******************************************************************************************/
//	MANATR�NKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaEssenz;	

	visual 			=	"ItFo_Potion_Mana_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseManaPotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja magicznej energii";
	TEXT[1]				= NAME_Bonus_ManaProc;				COUNT[1]	= 20;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaEssenz;
};

	FUNC VOID UseManaPotion()
	{
	if (Npc_IsPlayer(self)){

		var int MANA_PROC; MANA_PROC = ((hero.attribute[ATR_MANA_MAX]*25)/100);

		if (MANA_PROC > 1){

			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + MANA_PROC;

		}else{

			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 1;

		};

		if (hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};

	}
	else
	{

			Npc_ChangeAttribute	(self,	ATR_MANA,	8);

	};
	
	
	
	//	PrintDebugNpc		(PD_ITEM_MOBSI, "UseManaPotion");
		//Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaExtrakt;	

	visual 			=	"ItFo_Potion_Mana_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci�g magicznej energii";
	TEXT[1]				= NAME_Bonus_ManaProc;			COUNT[1]	= 50;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaExtrakt;
};

	FUNC VOID UseMana2Potion()
	{
		if (Npc_IsPlayer(self)){

		var int MANA_PROC; MANA_PROC = ((hero.attribute[ATR_MANA_MAX]*50)/100);

		if (MANA_PROC > 1){

			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + MANA_PROC;

		}else{

			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 1;

		};

		if (hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};

	}
	else
	{

			Npc_ChangeAttribute	(self,	ATR_MANA,	8);

	};
	
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaElixier;	

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir magicznej energii";
	TEXT[1]				= NAME_Bonus_ManaProc;			COUNT[1]	= 75;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaElixier;
};

	FUNC VOID UseMana3Potion()
	{
		if (Npc_IsPlayer(self)){

		var int MANA_PROC; MANA_PROC = ((hero.attribute[ATR_MANA_MAX]*75)/100);

		if (MANA_PROC > 1){

			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + MANA_PROC;

		}else{

			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 1;

		};

		if (hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};

	}
	else
	{

			Npc_ChangeAttribute	(self,	ATR_MANA,	8);

	};
	
	};

/******************************************************************************************/	
// MANA ELIXIERE BRUDERSCHAFT//

INSTANCE ItFo_Potion_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Elixier1;	

	visual 			=	"ItFo_Potion_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseElixier;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Elixier1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Elixier1;
};

	func void  UseElixier ()
	{
 		PrintDebugNpc		(PD_ITEM_MOBSI, "UseElixier");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Elixier1);	 
	};



/******************************************************************************************/
//	HEILTR�NKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Health_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealthPotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja uzdrawiaj�ca ";
	TEXT[1]				= NAME_Bonus_HPProc;				COUNT[1]	= 20;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpEssenz;
};

	FUNC VOID UseHealthPotion()
	{
       if (Npc_IsPlayer(self)){

		var int HP_PROC; HP_PROC = ((hero.attribute[ATR_HITPOINTS_MAX]*20)/100);

		if (HP_PROC > 1){

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PROC;

		}else{

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 1;

		};

		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX]){
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

	}else{

			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	8);

	};
	};

/******************************************************************************************/	
INSTANCE ItFo_Potion_Health_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpExtrakt;	

	visual 			=	"ItFo_Potion_Health_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci�g uzdrawiaj�cy ";
	TEXT[1]				= NAME_Bonus_HPProc;				COUNT[1]	= 45;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpExtrakt;
};

	FUNC VOID UseHealth2Potion()
	{
	       if (Npc_IsPlayer(self)){

		var int HP_PROC; HP_PROC = ((hero.attribute[ATR_HITPOINTS_MAX]*45)/100);

		if (HP_PROC > 1){

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PROC;

		}else{

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 1;

		};

		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX]){
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

	}else{

			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	8);

	};
	};

/******************************************************************************************/	
INSTANCE ItFo_Potion_Health_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpElixier;	

	visual 			=	"ItFo_Potion_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir uzdrawiaj�cy ";
	TEXT[1]				= NAME_Bonus_HPProc;				COUNT[1]	= 75;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpElixier;
};

	FUNC VOID UseHealth3Potion()
	{
       if (Npc_IsPlayer(self)){

		var int HP_PROC; HP_PROC = ((hero.attribute[ATR_HITPOINTS_MAX]*75)/100);

		if (HP_PROC > 1){

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PROC;

		}else{

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 1;

		};

		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX]){
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

	}else{

			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	8);

	};
	};


/******************************************************************************************/
// TR�NKE F�R PERMANENTE ATTRIBUT-�NDERUNGEN!
/******************************************************************************************/

/******************************************************************************************/
INSTANCE ItFo_Potion_Elixier_Egg(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ElixierEgg;	

	visual 			=	"ItFo_Potion_Elixier_Egg.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseEggElixier;
	scemeName		=	"POTIONFAST";

	description			= "Nap�j z pe�zaczy";
	TEXT[0]				= "Pozwala nawi�za� kontakt ze �ni�cym.";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_ElixierEgg;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ElixierEgg;
};

	func void  UseEggElixier ()
	{
 		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_ElixierEgg);
	};
	

/******************************************************************************************/
//STRENGTH

INSTANCE ItFo_Potion_Strength_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrEssenz;	

	visual 			=	"ItFo_Potion_Strength_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrengthPotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja si�y";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrEssenz;
};

	FUNC VOID UseStrengthPotion()
	{ 
 		B_RaiseAttribute	(ATR_STRENGTH,	STR_Essenz);
	};
	
/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrExtrakt;	

	visual 			=	"ItFo_Potion_Strength_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci�g si�y";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrExtrakt;
};

	FUNC VOID UseStrength2Potion()
	{ 
		B_RaiseAttribute	(ATR_STRENGTH,	STR_Extrakt);
	};
		
/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrElixier;	

	visual 			=	"ItFo_Potion_Strength_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir si�y";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrElixier;
};

	FUNC VOID UseStrength3Potion()
	{ 
		B_RaiseAttribute	(ATR_STRENGTH,	STR_Elixier);
	};




/******************************************************************************************/
//	DEXTERITY

INSTANCE ItFo_Potion_Dex_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexEssenz;	

	visual 			=	"ItFo_Potion_Dex_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDexPotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja zwinno�ci";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexEssenz;
};

	FUNC VOID UseDexPotion()
	{ 
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Essenz);
	};
		
/******************************************************************************************/		
INSTANCE ItFo_Potion_Dex_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexExtrakt;	

	visual 			=	"ItFo_Potion_Dex_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci�g zwinno�ci";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexExtrakt;
};

	FUNC VOID UseDex2Potion()
	{ 
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Extrakt);
	};
		
/******************************************************************************************/		
INSTANCE ItFo_Potion_Dex_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexElixier;	

	visual 			=	"ItFo_Potion_Dex_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir zwinno�ci";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexElixier;
};

	FUNC VOID UseDex3Potion()
	{ 
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Elixier);
	};


/******************************************************************************************/
// STRENGTH & DEX

INSTANCE ItFo_Potion_Master_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Macht;	

	visual 			=	"ItFo_Potion_Master_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMasterPotion;
	scemeName		=	"POTIONFAST";

	description			= "Nap�j pot�gi";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= StrDex_Macht;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]	= StrDex_Macht;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrDex_Macht;
};

	FUNC VOID UseMasterPotion()
	{
		Npc_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Macht);
		Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Macht);
		
		var string msg;
		msg = ConcatStrings(NAME_RaiseStrDex , IntToString(StrDex_Macht));
		PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Master_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Herrschaft;	

	visual 			=	"ItFo_Potion_Master_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMaster2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Nap�j w�adzy";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= StrDex_Herrschaft;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]	= StrDex_Herrschaft;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrDex_Herrschaft;
};

	FUNC VOID UseMaster2Potion()
	{
		Npc_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Herrschaft);
		Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Herrschaft);

		var string msg;
		msg = ConcatStrings(NAME_RaiseStrDex , IntToString(StrDex_Herrschaft));
		PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
	};


/******************************************************************************************/		
// Hitpoints

INSTANCE ItFo_Potion_Health_Perma_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxEssenz;	

	visual 			=	"ItFo_Potion_Health_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLifePotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja �ycia";
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]	= HPMax_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpMaxEssenz;
};

	FUNC VOID UseLifePotion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Essenz);
	};
		
/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxExtrakt;	

	visual 			=	"ItFo_Potion_Health_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife2Potion;
	scemeName		=	"POTIONFAST";

	description		= "Wyci�g �ycia";
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]	= HPMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpMaxExtrakt;
};

	FUNC VOID UseLife2Potion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxElixier;	

	visual 			=	"ItFo_Potion_Health_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife3Potion;
	scemeName		=	"POTIONFAST";

	description		= "Eliksir �ycia";
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]	= HPMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_HpMaxElixier;
};

	FUNC VOID UseLife3Potion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Elixier);	
	};


/******************************************************************************************/
// MANA

INSTANCE ItFo_Potion_Mana_Perma_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxEssenz;	

	visual 			=	"ItFo_Potion_Mana_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectarPotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja ducha";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxEssenz;
};

	FUNC VOID UseNectarPotion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Essenz);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxExtrakt;	

	visual 			=	"ItFo_Potion_Mana_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci�g ducha";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxExtrakt;
};

	FUNC VOID UseNectar2Potion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Extrakt);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxElixier;	

	visual 			=	"ItFo_Potion_Mana_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir ducha";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxElixier;
};

	FUNC VOID UseNectar3Potion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Elixier);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};



/******************************************************************************************/
//	SPEED-POTIONS																	      //
/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste1;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion;
	scemeName		=	"POTIONFAST";

	description		= "Nap�j lekko�ci";
	TEXT[1]			= "Pozwala na kr�tkotrwa�y sprint. ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste1/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste1);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");	
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste1;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion2;
	scemeName		=	"POTIONFAST";

	description		= "Nap�j szybko�ci";
	TEXT[1]			= "Pozwala szybciej biega�. ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste2/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion2()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste2);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");	
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste1;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion3;
	scemeName		=	"POTIONFAST";

	description		= "Nap�j przyspieszenia";
	TEXT[1]			= "Pozwala na d�u�sze sprinty. ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste3/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion3()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste3);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");	
	};
	