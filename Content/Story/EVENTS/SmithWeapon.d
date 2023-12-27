FUNC VOID SMITHWEAPONS_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_SMITHWEAPON;
		Ai_ProcessInfos (her);
	};
}; 

var int SmithBelt;
var int SmithWeapon;
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_Smith_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 99999;
	condition		= DIA_PC_Hero_Smith_EXIT_Condition;
	information		= DIA_PC_Hero_Smith_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Smith_EXIT_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)// (SmithWeapon == FALSE)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_Smith_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//*******************************************************
//Spezielle Tränke  NPC_TALENT_SMITH = 1;
//*******************************************************

//----------------------
INSTANCE PC_Smithing_Weapon (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Smithing_Weapon_Condition;
	information		= PC_Smithing_Weapon_Info;
	permanent		= TRUE;
	description		= "Wykuj broñ"; 
};

FUNC INT PC_Smithing_Weapon_Condition ()
{
	if (SmithWeapon == FALSE) 
	&& (SmithBelt   == FALSE)
	&&(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)

	{	
		return TRUE;
	};
};

FUNC VOID PC_Smithing_Weapon_Info()
{
	SmithWeapon = TRUE;
};
//*******************************************************

//*******************************************************
INSTANCE PC_Smithing_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Smithing_Stop_Condition;
	information		= PC_Smithing_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Smithing_Stop_Condition ()
{
	if (SmithWeapon == TRUE)
	|| (SmithBelt   == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	
	{	
		return TRUE;
	};
};
FUNC VOID PC_Smithing_Stop_Info()
{
	SmithWeapon = FALSE;
	SmithBelt   = False;
};
//***************************************************************************************
INSTANCE PC_ItMw_Addon_BanditTrader (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_BanditTraderId;
	npc				= PC_Hero;
	condition		= PC_ItMw_Addon_BanditTrader_Condition;
	information		= PC_ItMw_Addon_BanditTrader_Info;
	permanent		= TRUE;
	description		= "Pa³asz"; 
};

FUNC INT PC_ItMw_Addon_BanditTrader_Condition()
{	
	if (ItMw_Addon_BanditTrader_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
	&& (NPC_TALENT_SMITH >= 1)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Addon_BanditTrader_Info ()
{

	weaponsmith_instance = Recipe_BanditTrader;

	if (playerHasRequiredIngredients(Recipe_BanditTrader))
	{
		removeIngredientsFromPlayerInv(Recipe_BanditTrader);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_BanditTrader.recipeitem,1);
	}
    else 
    {
	PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sztabka stali"                 ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x bry³ka ¿elaza"                 ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x ¿¹d³o krwiopijcy"              ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x bry³ka z³ota"                  ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    */
    };	
    AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItMw_Miecz1H6 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Miecz1H6Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_Miecz1H6_Condition;
	information		= PC_ItMw_Miecz1H6_Info;
	permanent		= TRUE;
	description		= "Miecz kowala"; 
};

FUNC INT PC_ItMw_Miecz1H6_Condition()
{	
	if (Miecz1H6_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Miecz1H6_Info ()
{
	weaponsmith_instance = Recipe_Miecz1H6;

	if (playerHasRequiredIngredients(Recipe_Miecz1H6))
	{
		removeIngredientsFromPlayerInv(Recipe_Miecz1H6);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Miecz1H6.recipeitem,1);
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sztabka stali"                ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x sztabka magicznej stali"      ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x pazury"                       ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x pociête drewno"               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItMw_Miecz1H11 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Miecz1H11Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_Miecz1H11_Condition;
	information		= PC_ItMw_Miecz1H11_Info;
	permanent		= TRUE;
	description		= "Porz¹dny miecz jednorêczny"; 
};

FUNC INT PC_ItMw_Miecz1H11_Condition()
{	
	if (Miecz1H11_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Miecz1H11_Info ()
{
	weaponsmith_instance = Recipe_Miecz1H11;

	if (playerHasRequiredIngredients(Recipe_Miecz1H11))
	{
		removeIngredientsFromPlayerInv(Recipe_Miecz1H11);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Miecz1H11.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("2x sztabka stali"                       ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x pociête drewno"                      ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x bry³ka wêgla"                        ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};

//***************************************************************************************
INSTANCE PC_ItMw_Miecz1H15 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Miecz1H15Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_Miecz1H15_Condition;
	information		= PC_ItMw_Miecz1H15_Info;
	permanent		= TRUE;
	description		= "B³ysk nocy"; 
};

FUNC INT PC_ItMw_Miecz1H15_Condition()
{	
	if (Miecz1H5_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Miecz1H15_Info ()
{
	weaponsmith_instance = Recipe_Miecz1H15;

	if (playerHasRequiredIngredients(Recipe_Miecz1H15))
	{
		removeIngredientsFromPlayerInv(Recipe_Miecz1H15);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Miecz1H15.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sztabka stali"                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x pociête drewno"               ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x sztabka magicznej stali"      ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};

//***************************************************************************************
INSTANCE PC_ItMw_1H_Sword_04 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Plan1bId;
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Sword_04_Condition;
	information		= PC_ItMw_1H_Sword_04_Info;
	permanent		= TRUE;
	description		= "Miecz bojowy"; 
};

FUNC INT PC_ItMw_1H_Sword_04_Condition()
{	
	if (ItMw_1H_Sword_04_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Sword_04_Info ()
{
	weaponsmith_instance = Recipe_Plan1b;

	if (playerHasRequiredIngredients(Recipe_Plan1b))
	{
		removeIngredientsFromPlayerInv(Recipe_Plan1b);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Plan1b.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sztabka stali"                ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x bry³ka wêgla"                 ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/

    };	
    AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItMw_1H_Sword_Long_01 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Plan1cId;
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Sword_Long_01_Condition;
	information		= PC_ItMw_1H_Sword_Long_01_Info;
	permanent		= TRUE;
	description		= "D³ugi miecz"; 
};

FUNC INT PC_ItMw_1H_Sword_Long_01_Condition()
{	
	if (ItMw_1H_Sword_Long_01_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Sword_Long_01_Info ()
{
	weaponsmith_instance = Recipe_Plan1c;

	if (playerHasRequiredIngredients(Recipe_Plan1c))
	{
		removeIngredientsFromPlayerInv(Recipe_Plan1c);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Plan1c.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sztabka stali"                ,2, 72, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x sztabka magicznej stali"      ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x wêgiel"                       ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("3x bry³ka ¿elaza"                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x k³y"                          ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x pociête drewno"               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/

    };	
    AI_StopProcessInfos(self);
};

/***************----------------------------------UMIEJÊTNOŒÆ POZIOM 2---------------------******************************/

//*******************************************************
INSTANCE PC_ItMw_Miecz1H7 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Miecz1H7Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_Miecz1H7_Condition;
	information		= PC_ItMw_Miecz1H7_Info;
	permanent		= TRUE;
	description		= "Szeroki miecz"; 
};

FUNC INT PC_ItMw_Miecz1H7_Condition()
{	
	if (Miecz1h7_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Miecz1H7_Info ()
{
	weaponsmith_instance = Recipe_Miecz1H7;

	if (playerHasRequiredIngredients(Recipe_Miecz1H7))
	{
		removeIngredientsFromPlayerInv(Recipe_Miecz1H7);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Miecz1H7.recipeitem,1);
	}
    else 
    {
	PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("1x sztabka magicznej stali"                   ,2, 74, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x sztabka stali"                             ,2, 72, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x k³y"                                       ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x bry³ka wêgla"                              ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x bry³ka z³ota"                              ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x pociête drewno"                            ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x skóra topielca"                            ,2, 62, 
	"FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItMw_Miecz1H9 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Miecz1H9Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_Miecz1H9_Condition;
	information		= PC_ItMw_Miecz1H9_Info;
	permanent		= TRUE;
	description		= "Miecz Rozpaczy"; 
};

FUNC INT PC_ItMw_Miecz1H9_Condition()
{	
	if (Miecz1h9_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Miecz1H9_Info ()
{
	weaponsmith_instance = Recipe_Miecz1H9;

	if (playerHasRequiredIngredients(Recipe_Miecz1H9))
	{
		removeIngredientsFromPlayerInv(Recipe_Miecz1H9);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Miecz1H9.recipeitem,1);
	}
    else 
    {
	PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("4x sztabka stali"                 ,2, 72, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("3x bry³ka ¿elaza"                 ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x bry³ka z³ota"                  ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("5x bry³ka wêgla"                  ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x k³y"                           ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x pazury trolla ziemnego"        ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};

//***************************************************************************************
INSTANCE PC_ItMw_Miecz1H8 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Miecz1H8Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_Miecz1H8_Condition;
	information		= PC_ItMw_Miecz1H8_Info;
	permanent		= TRUE;
	description		= "Œwiêty Mœciciel"; 
};

FUNC INT PC_ItMw_Miecz1H8_Condition()
{	
	if (Miecz1H8_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Miecz1H8_Info ()
{
	weaponsmith_instance = Recipe_Miecz1H8;

	if (playerHasRequiredIngredients(Recipe_Miecz1H8))
	{
		removeIngredientsFromPlayerInv(Recipe_Miecz1H8);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Miecz1H8.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("3x sztabka stali"            ,2, 74, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x sztabka magicznej stali"  ,2, 72, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x sztabka ciemnej stali"    ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x k³y"                      ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x pociête drewno"           ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x bry³ka z³ota"             ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x niebieski kryszta³"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};

//***************************************************************************************
INSTANCE PC_ItMw_Rapier (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_RapierId;
	npc				= PC_Hero;
	condition		= PC_ItMw_Rapier_Condition;
	information		= PC_ItMw_Rapier_Info;
	permanent		= TRUE;
	description		= "Rapier"; 
};

FUNC INT PC_ItMw_Rapier_Condition()
{	
	if (Rapier_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Rapier_Info ()
{
	weaponsmith_instance = Recipe_Rapier;

	if (playerHasRequiredIngredients(Recipe_Rapier))
	{
		removeIngredientsFromPlayerInv(Recipe_Rapier);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Rapier.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("2x sztabka stali"            ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x sztabka magicznej stali"  ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x ¿¹d³o krwiopijcy"         ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x pazury topielca"          ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x bry³ka z³ota"             ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItMw_2H_Sword_Light_01 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Plan3bId;
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Sword_Light_01_Condition;
	information		= PC_ItMw_2H_Sword_Light_01_Info;
	permanent		= TRUE;
	description		= "Lekki miecz dwurêczny"; 
};

FUNC INT PC_ItMw_2H_Sword_Light_01_Condition()
{	
	if (ItMw_2H_Sword_Light_01_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Sword_Light_01_Info ()
{
	weaponsmith_instance = Recipe_Plan3b;

	if (playerHasRequiredIngredients(Recipe_Plan3b))
	{
		removeIngredientsFromPlayerInv(Recipe_Plan3b);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Plan3b.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("4x sztabka stali"              ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x sztabka magicznej stali"    ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x bry³ka wêgla"               ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x bry³ka ¿elaza"              ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x pociête drewno"             ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItMw_2H_Sword_Light_04 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Plan3Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Sword_Light_04_Condition;
	information		= PC_ItMw_2H_Sword_Light_04_Info;
	permanent		= TRUE;
	description		= "Miecz królewski"; 
};

FUNC INT PC_ItMw_2H_Sword_Light_04_Condition()
{	
	if (ItMw_2H_Sword_Light_04_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Sword_Light_04_Info ()
{
	
	weaponsmith_instance = Recipe_Plan3;

	if (playerHasRequiredIngredients(Recipe_Plan3))
	{
		removeIngredientsFromPlayerInv(Recipe_Plan3);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Plan3.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("5x sztabka magicznej stali"         ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x bry³ka wêgla"                    ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x sztabka ciemnej stali"           ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x bry³ka ¿elaza"                   ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x róg cieniostwora"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
};

//***************************************************************************************
INSTANCE PC_ItMw_2H_Axe_light_01 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Plan5cId;
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Axe_light_01_Condition;
	information		= PC_ItMw_2H_Axe_light_01_Info;
	permanent		= TRUE;
	description		= "Lekki topór bojowy"; 
};

FUNC INT PC_ItMw_2H_Axe_light_01_Condition()
{	
	if (ItMw_2H_Axe_light_01_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Axe_light_01_Info ()
{
	weaponsmith_instance = Recipe_Plan5c;

	if (playerHasRequiredIngredients(Recipe_Plan5c))
	{
		removeIngredientsFromPlayerInv(Recipe_Plan5c);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Plan5c.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("6x sztabka magicznej stali"           ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x sztabka ciemnej stali"             ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x bry³ka wêgla"                      ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("5x bry³ka ¿elaza"                     ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("5x k³y"                               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
};

//***************************************************************************************
INSTANCE PC_ItMw_2H_AxeHevay_100 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_2H_AxeHevay_100Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_AxeHevay_100_Condition;
	information		= PC_ItMw_2H_AxeHevay_100_Info;
	permanent		= TRUE;
	description		= "Zdobiony dwurêczny topór"; 
};

FUNC INT PC_ItMw_2H_AxeHevay_100_Condition()
{	
	if (ItMw_2H_AxeHevay_100_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_AxeHevay_100_Info ()
{
	weaponsmith_instance = Recipe_2H_AxeHevay_100;

	if (playerHasRequiredIngredients(Recipe_2H_AxeHevay_100))
	{
		removeIngredientsFromPlayerInv(Recipe_2H_AxeHevay_100);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_2H_AxeHevay_100.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("5x sztabka magicznej stali"           ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x sztabka ciemnej stali"             ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x bry³ka ¿elaza"                    ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("5x k³y"                               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */

    };	
};



/***************----------------------------------UMIEJÊTNOŒÆ POZIOM 3---------------------******************************/
//***************************************************************************************
INSTANCE PC_ItMw_2H_Sword_02 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Plan4bId;
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Sword_02_Condition;
	information		= PC_ItMw_2H_Sword_02_Info;
	permanent		= TRUE;
	description		= "Ostrze bohatera"; 
};

FUNC INT PC_ItMw_2H_Sword_02_Condition()
{	
	if (ItMw_2H_Sword_02_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH == 3)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Sword_02_Info ()
{
	weaponsmith_instance = Recipe_Plan4b;

	if (playerHasRequiredIngredients(Recipe_Plan4b))
	{
		removeIngredientsFromPlayerInv(Recipe_Plan4b);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Plan4b.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("6x sztabka magicznej stali"           ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x sztabka ciemnej stali"             ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x sztabka z³ota"                     ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x k³y b³otnego wê¿a"                 ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x kie³ trolla"                       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
};

//***************************************************************************************
INSTANCE PC_ItMw_Miecz2H5 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Miecz2H5Id;
	npc				= PC_Hero;
	condition		= PC_ItMw_Miecz2H5_Condition;
	information		= PC_ItMw_Miecz2H5_Info;
	permanent		= TRUE;
	description		= "Pogromca orków"; 
};

FUNC INT PC_ItMw_Miecz2H5_Condition()
{	
	if (Miecz2H5_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH == 3)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_Miecz2H5_Info ()
{
	weaponsmith_instance = Recipe_Miecz2H5;

	if (playerHasRequiredIngredients(Recipe_Miecz2H5))
	{
		removeIngredientsFromPlayerInv(Recipe_Miecz2H5);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Miecz2H5.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("5x sztabka stali"            ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x sztabka magicznej stali"  ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x sztabka ciemnej stali"    ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x kie³ trolla"              ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x bry³ka ¿elaza"            ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   	*/
    };	
};
//***************************************************************************************
INSTANCE PC_ItMw_2H_Axe_Heavy_01 (C_INFO)
{
	nr       		= start_weapon_dlg_nr + Recipe_Plan7bId;
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Axe_Heavy_01_Condition;
	information		= PC_ItMw_2H_Axe_Heavy_01_Info;
	permanent		= TRUE;
	description		= "Topór wojenny"; 
};

FUNC INT PC_ItMw_2H_Axe_Heavy_01_Condition()
{	
	if (ItMw_2H_Axe_Heavy_01_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithWeapon == TRUE)
    && (NPC_TALENT_SMITH == 3)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Axe_Heavy_01_Info ()
{
	weaponsmith_instance = Recipe_Plan7b;

	if (playerHasRequiredIngredients(Recipe_Plan7b))
	{
		removeIngredientsFromPlayerInv(Recipe_Plan7b);
		
		PrintS_Ext("Stworzy³eœ broñ!", COL_WHITE);
		CreateInvItems (self, Recipe_Plan7b.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("8x sztabka magicznej stali"     ,2, 72, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x sztabka ciemnej stali"       ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x sztabka z³ota"               ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x skóra trolla"                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x k³y b³otnego wê¿a"           ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("5x bry³ka ¿elaza"               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
};



//Spezielle Tränke  NPC_TALENT_SMITH = 1;
//*******************************************************
//----------------------
INSTANCE PC_Smithing_Belt (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Smithing_Belt_Condition;
	information		= PC_Smithing_Belt_Info;
	permanent		= TRUE;
	description		= "Stwórz pas"; 
};

FUNC INT PC_Smithing_Belt_Condition ()
{
	if (SmithBelt == FALSE) 
	&& (SmithWeapon == FALSE)
	&&(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)

	{	
		return TRUE;
	};
};

FUNC VOID PC_Smithing_Belt_Info()
{
	SmithBelt = TRUE;
};
//**************************PASY*************************************************************
INSTANCE PC_ItBE_Addon_Leather_01 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_LeatherBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBE_Addon_Leather_01_Condition;
	information		= PC_ItBE_Addon_Leather_01_Info;
	permanent		= TRUE;
	description		= "Skórzany pas"; 
};

FUNC INT PC_ItBE_Addon_Leather_01_Condition()
{	
	if (LeatherBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBE_Addon_Leather_01_Info ()
{
	armorscrafting_instance = Recipe_LeatherBelt;

	if (playerHasRequiredIngredients(Recipe_LeatherBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_LeatherBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_LeatherBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("4x skóra wilka"                 ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x bry³ka ¿elaza"               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItBE_Addon_SLD_01 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_SldBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBE_Addon_SLD_01_Condition;
	information		= PC_ItBE_Addon_SLD_01_Info;
	permanent		= TRUE;
	description		= "Pas najemnika"; 
};

FUNC INT PC_ItBE_Addon_SLD_01_Condition()
{	
	if (SldBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBE_Addon_SLD_01_Info ()
{
	armorscrafting_instance = Recipe_SldBelt;

	if (playerHasRequiredIngredients(Recipe_SldBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_SldBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_SldBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sztabka stali"                ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x skóra wilka"                  ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("10x pazury"                      ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x bry³ka ¿elaza"               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};
//**************************PASY*************************************************************
INSTANCE PC_ItBE_Addon_NOV_01 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_FNovBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBE_Addon_NOV_01_Condition;
	information		= PC_ItBE_Addon_NOV_01_Info;
	permanent		= TRUE;
	description		= "Szarfa gotowoœci"; 
};

FUNC INT PC_ItBE_Addon_NOV_01_Condition()
{	
	if (FNOVBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBE_Addon_NOV_01_Info ()
{
	armorscrafting_instance = Recipe_FNovBelt;

	if (playerHasRequiredIngredients(Recipe_FNovBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_FNovBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_FNovBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x k³y"                         ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x skóra wilka"                 ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("5x siarka"                      ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("5x bry³ka ¿elaza"               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItRe_GrdBelt (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_GrdBeltId;
	npc				= PC_Hero;
	condition		= PC_ItRe_GrdBelt_Condition;
	information		= PC_ItRe_GrdBelt_Info;
	permanent		= TRUE;
	description		= "Pas stra¿nika"; 
};

FUNC INT PC_ItRe_GrdBelt_Condition()
{	
	if (GRDBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItRe_GrdBelt_Info ()
{
	armorscrafting_instance = Recipe_GrdBelt;

	if (playerHasRequiredIngredients(Recipe_GrdBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_GrdBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_GrdBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("10x k³y"                        ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x skóra wilka"                 ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x sztabka stali"               ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x bry³ka ¿elaza"              ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItBE_Addon_KDF_01 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_KdfBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBE_Addon_KDF_01_Condition;
	information		= PC_ItBE_Addon_KDF_01_Info;
	permanent		= TRUE;
	description		= "Szarfa ognia"; 
};

FUNC INT PC_ItBE_Addon_KDF_01_Condition()
{	
	if (KdfBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBE_Addon_KDF_01_Info ()
{
	armorscrafting_instance = Recipe_KdfBelt;

	if (playerHasRequiredIngredients(Recipe_KdfBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_KdfBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_KdfBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("10x siarka"                              ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("5x skrzyd³a krwiopijcy"                  ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x sztabka magicznej stali"              ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x skóra ognistego jaszczura"            ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("15x bry³ka ¿elaza"                       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};
//**************************PASY*************************************************************
INSTANCE PC_ItBE_Addon_MC (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_CrawlerBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBE_Addon_MC_Condition;
	information		= PC_ItBE_Addon_MC_Info;
	permanent		= TRUE;
	description		= "Pas Pe³zacza"; 
};

FUNC INT PC_ItBE_Addon_MC_Condition()
{	
	if (CrawlerBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBE_Addon_MC_Info ()
{
	armorscrafting_instance = Recipe_CrawlerBelt;

	if (playerHasRequiredIngredients(Recipe_CrawlerBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_CrawlerBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_CrawlerBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("1x skóra cieniostwora"           ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x skóra warga"                  ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("20x bry³ka ¿elaza"               ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x p³ytka pe³zacza"              ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x sztabka ciemnej stali"        ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};
//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_STR_5 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_StrengthBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_STR_5_Condition;
	information		= PC_ItBe_Addon_STR_5_Info;
	permanent		= TRUE;
	description		= "Pas Si³y"; 
};

FUNC INT PC_ItBe_Addon_STR_5_Condition()
{	
	if (StrengthBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_STR_5_Info ()
{
	armorscrafting_instance = Recipe_StrengthBelt;

	if (playerHasRequiredIngredients(Recipe_StrengthBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_StrengthBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_StrengthBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x skóra wilka"                    ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x skóra dzika"                    ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x pazury"                        ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("5x k³y"                            ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("5x bry³ka ¿elaza"                  ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x sztabka magicznej stali"        ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};
//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_STR_10 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_PowerBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_STR_10_Condition;
	information		= PC_ItBe_Addon_STR_10_Info;
	permanent		= TRUE;
	description		= "Pas Mocy"; 
};

FUNC INT PC_ItBe_Addon_STR_10_Condition()
{	
	if (PowerBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_STR_10_Info ()
{
	armorscrafting_instance = Recipe_PowerBelt;

	if (playerHasRequiredIngredients(Recipe_PowerBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_PowerBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_PowerBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("5x sztabka magicznej stali",2, 72, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x skóra trolla"           ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x róg cieniostwora"       ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("25x bry³ka ¿elza"          ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("8x k³y"                    ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x siarka"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};



//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_DEX_5 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_SkillBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_DEX_5_Condition;
	information		= PC_ItBe_Addon_DEX_5_Info;
	permanent		= TRUE;
	description		= "Pas Umiejêtnoœci"; 
};

FUNC INT PC_ItBe_Addon_DEX_5_Condition()
{	
	if (SkillBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_DEX_5_Info ()
{
	armorscrafting_instance = Recipe_SkillBelt;

	if (playerHasRequiredIngredients(Recipe_SkillBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_SkillBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_SkillBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("7x bry³ka ¿elaza"                 ,2, 72, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("3x skóra zêbacza"                 ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x skóra wilka"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("8x pazury"                        ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("12x k³y"                          ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x sztabka magicznej stali"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};



//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_DEX_10 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_DexterityBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_DEX_10_Condition;
	information		= PC_ItBe_Addon_DEX_10_Info;
	permanent		= TRUE;
	description		= "Pas Zrêcznoœci"; 
};

FUNC INT PC_ItBe_Addon_DEX_10_Condition()
{	
	if (DexterityBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_DEX_10_Info ()
{
	armorscrafting_instance = Recipe_DexterityBelt;

	if (playerHasRequiredIngredients(Recipe_DexterityBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_DexterityBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_DexterityBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("1x skóra cieniostwora"           ,2, 72, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("5x sztabka z³ota"                ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("4x skóra zêbacza"                ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("25x bry³ka ¿elaza"               ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("8x pazury"                       ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x skrzyd³a krwiopijcy"          ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
    };	
    AI_StopProcessInfos(self);
};



//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_Prot_EDGE (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_ArmorBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_Prot_EDGE_Condition;
	information		= PC_ItBe_Addon_Prot_EDGE_Info;
	permanent		= TRUE;
	description		= "Pas Ochrony"; 
};

FUNC INT PC_ItBe_Addon_Prot_EDGE_Condition()
{	
	if (ArmorBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_Prot_EDGE_Info ()
{
	armorscrafting_instance = Recipe_ArmorBelt;

	if (playerHasRequiredIngredients(Recipe_ArmorBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_ArmorBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_ArmorBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("4x skóra jaszczura"               ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("10x bry³ka ¿elaza"                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x pazury"                       ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("3x sztabka magicznej stali"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
   
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_Prot_Point (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_DefendBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_Prot_Point_Condition;
	information		= PC_ItBe_Addon_Prot_Point_Info;
	permanent		= TRUE;
	description		= "Pas Obrony"; 
};

FUNC INT PC_ItBe_Addon_Prot_Point_Condition()
{	
	if (DefendBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_Prot_Point_Info ()
{
	armorscrafting_instance = Recipe_DefendBelt;

	if (playerHasRequiredIngredients(Recipe_DefendBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_DefendBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_DefendBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("4x skóra dzika"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("10x bry³ka ¿elaza"                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x k³y"                          ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("3x sztabka magicznej stali"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
   
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_Prot_MAGIC (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_MagicArmorBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_Prot_MAGIC_Condition;
	information		= PC_ItBe_Addon_Prot_MAGIC_Info;
	permanent		= TRUE;
	description		= "Pas Magicznej Obrony"; 
};

FUNC INT PC_ItBe_Addon_Prot_MAGIC_Condition()
{	
	if (MagicArmorBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_Prot_MAGIC_Info ()
{
	armorscrafting_instance = Recipe_MagicArmorBelt;

	if (playerHasRequiredIngredients(Recipe_MagicArmorBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_MagicArmorBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_MagicArmorBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("3x skóra warga"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x skóra jaszczura"               ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("8x bry³ka ¿elaza"                 ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("4x sztabka magicznej stali"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
   
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_Prot_FIRE (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_FireRunnerBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_Prot_FIRE_Condition;
	information		= PC_ItBe_Addon_Prot_FIRE_Info;
	permanent		= TRUE;
	description		= "Pas ognistego biegacza"; 
};

FUNC INT PC_ItBe_Addon_Prot_FIRE_Condition()
{	
	if (FireRunnerBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_Prot_FIRE_Info ()
{
	armorscrafting_instance = Recipe_FireRunnerBelt;

	if (playerHasRequiredIngredients(Recipe_FireRunnerBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_FireRunnerBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_FireRunnerBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x skóra ognistego jaszczura",2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("15x k³y"                     ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("8x pazury"                   ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x skóra aligatora"          ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
   
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItBe_Addon_Prot_EdgPoi (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_ProtectionBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBe_Addon_Prot_EdgPoi_Condition;
	information		= PC_ItBe_Addon_Prot_EdgPoi_Info;
	permanent		= TRUE;
	description		= "Ciê¿ki Pas Ochrony"; 
};

FUNC INT PC_ItBe_Addon_Prot_EdgPoi_Condition()
{	
	if (ProtectionBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBe_Addon_Prot_EdgPoi_Info ()
{
	armorscrafting_instance = Recipe_ProtectionBelt;

	if (playerHasRequiredIngredients(Recipe_ProtectionBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_ProtectionBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_ProtectionBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sztabka magicznej stali"               ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("4x skóra aligatora"               ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x skóra warga"                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("10x pazury"                       ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("8x bry³ka ¿elaza"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
   
    };	
    AI_StopProcessInfos(self);
};

//**************************PASY*************************************************************
INSTANCE PC_ItBE_TPL_01 (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_TempleBeltId;
	npc				= PC_Hero;
	condition		= PC_ItBE_TPL_01_Condition;
	information		= PC_ItBE_TPL_01_Info;
	permanent		= TRUE;
	description		= "Pas Œwi¹tynny"; 
};

FUNC INT PC_ItBE_TPL_01_Condition()
{	
	if (TempleBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_ItBE_TPL_01_Info ()
{
	armorscrafting_instance = Recipe_TempleBelt;

	if (playerHasRequiredIngredients(Recipe_TempleBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_TempleBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_TempleBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("3x skóra b³otnego wê¿a"          ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x skóra aligatora"              ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x skrzyd³a krwiopijcy"          ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("15x bry³ka ¿elaza"               ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   */
   
    };	
    AI_StopProcessInfos(self);
};
//**************************PASY*************************************************************
INSTANCE PC_OrcHunterBelt_Recipe (C_INFO)
{
	nr       		= start_armor_dlg_nr + Recipe_OrcHunterBeltId;
	npc				= PC_Hero;
	condition		= PC_OrcHunterBelt_Recipe_Condition;
	information		= PC_OrcHunterBelt_Recipe_Info;
	permanent		= TRUE;
	description		= "Pas £owcy"; 
};

FUNC INT PC_OrcHunterBelt_Recipe_Condition()
{	
	if (OrcHunterBelt_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON)
	&& (SmithBelt == TRUE)
    && (NPC_TALENT_SMITH >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_OrcHunterBelt_Recipe_Info ()
{
	armorscrafting_instance = Recipe_OrcHunterBelt;

	if (playerHasRequiredIngredients(Recipe_OrcHunterBelt))
	{
		removeIngredientsFromPlayerInv(Recipe_OrcHunterBelt);

		PrintS_Ext("Stworzy³eœ pas!", COL_WHITE);
		CreateInvItems (self, Recipe_OrcHunterBelt.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("4x skóra orkowego psa"            ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("12x k³y"                          ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x p³ytka pe³zacza"               ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x róg cieniostwora"              ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("6x sztabka magicznej stali"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
   
   */
    };	
    AI_StopProcessInfos(self);
};



















































