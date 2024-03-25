FUNC VOID SMELTINGOT_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_SMELTINGOT;
		Ai_ProcessInfos (her);
	};
}; 

var int SztabkaStali;
var int SztabkaMagicznejStali;
var int SztabkaCiemnejStali;
var int SztabkaZlota;
var int SmeltIngot;
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_Smelt_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 99999;
	condition		= DIA_PC_Hero_Smelt_EXIT_Condition;
	information		= DIA_PC_Hero_Smelt_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Smelt_EXIT_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)// (SmeltIngot == FALSE)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_Smelt_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	SztabkaStali = False;
	SztabkaMagicznejStali = False;
	SztabkaCiemnejStali = False;
	SztabkaZlota = False;
	SmeltIngot = False;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	quantity = 1;				  		
	AI_StopProcessInfos	(self);
};

//*******************************************************
//Spezielle Tränke  NPC_TALENT_Smelt = 1;
//*******************************************************
//----------------------
INSTANCE PC_Smelting_Weapon (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Smelting_Weapon_Condition;
	information		= PC_Smelting_Weapon_Info;
	permanent		= TRUE;
	description		= "Wytop sztabkê"; 
};

FUNC INT PC_Smelting_Weapon_Condition ()
{
	if(SmeltIngot == FALSE) 
	&&(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&&(SztabkaStali == FALSE)
	&&(SztabkaMagicznejStali == FALSE)

	{	
		return TRUE;
	};
};

FUNC VOID PC_Smelting_Weapon_Info()
{
	SmeltIngot = TRUE;
};
//*******************************************************
INSTANCE PC_Smelting_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Smelting_Stop_Condition;
	information		= PC_Smelting_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Smelting_Stop_Condition ()
{
	if (SmeltIngot == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	
	{	
		return TRUE;
	};
};
FUNC VOID PC_Smelting_Stop_Info()
{
	if (SztabkaCiemnejStali)
	|| (SztabkaZlota)
	|| (SztabkaMagicznejStali)
	|| (SztabkaStali) 
	{
		SztabkaCiemnejStali   = FALSE;
		SztabkaZlota          = FALSE;
		SztabkaMagicznejStali = FALSE;
		SztabkaStali          = FALSE;
	} else {
		SmeltIngot            = FALSE;
	};
};
//***************************************************************************************
INSTANCE PC_Pr_SztabkaStali (C_INFO)
{
	nr       		=  1;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaStali_Condition;
	information		= PC_Pr_SztabkaStali_Info;
	permanent		= TRUE;
	description		= "Sztabka stali"; 
};

FUNC INT PC_Pr_SztabkaStali_Condition()
{	
	if (SmeltIngot == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&& (SztabkaStali            == FALSE)
	&& (SztabkaMagicznejStali   == FALSE)
	&& (SztabkaZlota            == FALSE)
	&& (SztabkaCiemnejStali     == FALSE)
	{		
			var int AFIP_ShowItem; AFIP_ShowItem = Pr_SztabkaStali;
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaStali_Info ()
{
  SztabkaStali = TRUE;
};
//***************************************************************************************
INSTANCE PC_Pr_SztabkaMagicznejStali (C_INFO)
{
	nr       		=  1;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaMagicznejStali_Condition;
	information		= PC_Pr_SztabkaMagicznejStali_Info;
	permanent		= TRUE;
	description		= "Sztabka magicznej stali"; 
};

FUNC INT PC_Pr_SztabkaMagicznejStali_Condition()
{	
	if (SmeltIngot              == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&& (SztabkaMagicznejStali   == FALSE)
	&& (SztabkaStali            == FALSE)
	&& (SztabkaZlota            == FALSE)
	&& (SztabkaCiemnejStali     == FALSE)
	{		
			var int AFIP_ShowItem; AFIP_ShowItem = Pr_SztabkaMagicznejStali;
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaMagicznejStali_Info ()
{
  SztabkaMagicznejStali = TRUE;
};
//***************************************************************************************
INSTANCE PC_Pr_SztabkaCiemnejStali (C_INFO)
{
	nr       		=  1;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaCiemnejStali_Condition;
	information		= PC_Pr_SztabkaCiemnejStali_Info;
	permanent		= TRUE;
	description		= "Sztabka ciemnej stali"; 
};

FUNC INT PC_Pr_SztabkaCiemnejStali_Condition()
{	
	if (SmeltIngot              == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	== MOBSI_SMELTINGOT)
	&& (SztabkaMagicznejStali   == FALSE)
	&& (SztabkaStali            == FALSE)
	&& (SztabkaZlota            == FALSE)
	&& (SztabkaCiemnejStali     == FALSE)
	{		
			var int AFIP_ShowItem; AFIP_ShowItem = Pr_SztabkaCiemnejStali;
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaCiemnejStali_Info ()
{
  SztabkaCiemnejStali = TRUE;
};
//***************************************************************************************
INSTANCE PC_Pr_SztabkaZlota (C_INFO)
{
	nr       		=  1;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaZlota_Condition;
	information		= PC_Pr_SztabkaZlota_Info;
	permanent		= TRUE;
	description		= "Sztabka z³ota"; 
};

FUNC INT PC_Pr_SztabkaZlota_Condition()
{	
	if (SmeltIngot              == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&& (SztabkaMagicznejStali   == FALSE)
	&& (SztabkaStali            == FALSE)
	&& (SztabkaCiemnejStali     == FALSE)
	&& (SztabkaZlota            == FALSE)
	{		
			var int AFIP_ShowItem; AFIP_ShowItem = Pr_SztabkaZlota;
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaZlota_Info ()
{
  SztabkaZlota = TRUE;
};
//***************************************************************************************
INSTANCE PC_Pr_SztabkaStali_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_Pr_SztabkaStaliId;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaStali_01_Condition;
	information		= PC_Pr_SztabkaStali_01_Info;
	permanent		= TRUE;
	description		= "Wytop sztabkê stali"; 
};

FUNC INT PC_Pr_SztabkaStali_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&& (SztabkaStali == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaStali_01_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Pr_SztabkaStali))
	{
		removeIngredientsFromPlayerInv(Recipe_Pr_SztabkaStali);
      

		
		if (quantity > 1) {
			PrintS_Ext("Wytopi³eœ sztabki", COL_WHITE);
		} else {
			PrintS_Ext("Wytopi³eœ sztabkê", COL_WHITE);
		};
		CreateInvItems (self, Recipe_Pr_SztabkaStali.recipeitem,quantity);
		SztabkaStali = False;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("10x Bry³ka ¿elaza"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    SztabkaStali = False;
    };	
  //  AI_StopProcessInfos(self);
};
INSTANCE PC_Pr_SztabkaMagicznejStali_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_Pr_SztabkaMagicznejStaliId;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaMagicznejStali_01_Condition;
	information		= PC_Pr_SztabkaMagicznejStali_01_Info;
	permanent		= TRUE;
	description		= "Wytop sztabkê magicznej stali"; 
};

FUNC INT PC_Pr_SztabkaMagicznejStali_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&& (SztabkaMagicznejStali == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaMagicznejStali_01_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Pr_SztabkaMagicznejStali))
	{
		removeIngredientsFromPlayerInv(Recipe_Pr_SztabkaMagicznejStali);
      

		
		if (quantity > 1) {
			PrintS_Ext("Wytopi³eœ sztabki", COL_WHITE);
		} else {
			PrintS_Ext("Wytopi³eœ sztabkê", COL_WHITE);
		};
		CreateInvItems (self, Recipe_Pr_SztabkaMagicznejStali.recipeitem,quantity);
		SztabkaMagicznejStali = False;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("60x Bry³ka rudy"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    SztabkaMagicznejStali = False;
    };	
   // AI_StopProcessInfos(self);
};

INSTANCE PC_Pr_SztabkaCiemnejStali_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_Pr_SztabkaCiemnejStaliId;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaCiemnejStali_01_Condition;
	information		= PC_Pr_SztabkaCiemnejStali_01_Info;
	permanent		= TRUE;
	description		= "Wytop sztabkê ciemnej stali"; 
};

FUNC INT PC_Pr_SztabkaCiemnejStali_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&& (SztabkaCiemnejStali == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaCiemnejStali_01_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Pr_SztabkaCiemnejStali)) 
	{
		removeIngredientsFromPlayerInv(Recipe_Pr_SztabkaCiemnejStali);

		
		if (quantity > 1) {
			PrintS_Ext("Wytopi³eœ sztabki", COL_WHITE);
		} else {
			PrintS_Ext("Wytopi³eœ sztabkê", COL_WHITE);
		};
		CreateInvItems (self, Recipe_Pr_SztabkaCiemnejStali.recipeitem,quantity);
		SztabkaCiemnejStali = False;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("60x Bry³ka rudy"                  ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	//PrintScreen ("10x Bry³ka ¿elaza"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    SztabkaCiemnejStali = False;
    };	
   // AI_StopProcessInfos(self);
};

INSTANCE PC_Pr_SztabkaZlota_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_Pr_SztabkaZlotaId;
	npc				= PC_Hero;
	condition		= PC_Pr_SztabkaZlota_01_Condition;
	information		= PC_Pr_SztabkaZlota_01_Info;
	permanent		= TRUE;
	description		= "Wytop sztabkê z³ota"; 
};

FUNC INT PC_Pr_SztabkaZlota_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMELTINGOT)
	&& (SztabkaZlota == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_Pr_SztabkaZlota_01_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Pr_SztabkaZlota))
	{
		removeIngredientsFromPlayerInv(Recipe_Pr_SztabkaZlota);
   
		if (quantity > 1) {
			PrintS_Ext("Wytopi³eœ sztabki", COL_WHITE);
		} else {
			PrintS_Ext("Wytopi³eœ sztabkê", COL_WHITE);
		};
		CreateInvItems (self, Recipe_Pr_SztabkaZlota.recipeitem,quantity);
		SztabkaZlota = False;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("12x Bry³ka z³ota"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    SztabkaZlota = False;
    };	
   // AI_StopProcessInfos(self);
};
