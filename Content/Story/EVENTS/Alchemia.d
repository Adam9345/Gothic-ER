///////////////////////////////////////////////////////////////
// 1.4.02
///////////////////////////////////////////////////////////////

func void ALCHEMIA_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her)) 
	{	
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_POTIONALCHEMY;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};

var int BrewingLifePotion;
var int BrewingManaPotion;
var int BrewingSpecialPotion;
var int BrewingAlcohol;
var int BrewingPoison;
var int PrepareTobacco;

INSTANCE DIA_PC_Hero_Brewing_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 99999;
	condition		= DIA_PC_Hero_Brewing_EXIT_Condition;
	information		= DIA_PC_Hero_Brewing_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Brewing_EXIT_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_Brewing_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	BrewingLifePotion = FALSE;
	BrewingManaPotion = FALSE;
	BrewingSpecialPotion = FALSE;
	BrewingAlcohol = FALSE;
	BrewingPoison = FALSE;
	PrepareTobacco = FALSE;
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_PC_Hero_LifePotions (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LifePotions_Condition;
   information  = DIA_PC_Hero_LifePotions_Info;
   permanent	= TRUE;
   description	= "(Mikstury lecznicze)";
};

FUNC INT DIA_PC_Hero_LifePotions_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BrewingLifePotion == FALSE)
	&& (BrewingManaPotion == FALSE)
	&& (BrewingSpecialPotion == FALSE)
	&& (BrewingAlcohol == FALSE)
	&& (BrewingPoison == FALSE)
	&& (PrepareTobacco == FALSE)
	//&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_LifePotions_Info()
{
	BrewingLifePotion = TRUE;
};

INSTANCE DIA_PC_Hero_LifePotions_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= DIA_PC_Hero_LifePotions_Stop_Condition;
	information		= DIA_PC_Hero_LifePotions_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT DIA_PC_Hero_LifePotions_Stop_Condition ()
{
	if (BrewingLifePotion == TRUE)
	|| (BrewingManaPotion == TRUE)
	|| (BrewingSpecialPotion == TRUE)
	|| (BrewingAlcohol == TRUE)
	|| (BrewingPoison == TRUE)
	|| (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_PC_Hero_LifePotions_Stop_Info()
{
	BrewingLifePotion = FALSE;
	BrewingManaPotion = FALSE;
	BrewingSpecialPotion = FALSE;
	BrewingAlcohol = FALSE;
	BrewingPoison = FALSE;
	PrepareTobacco = FALSE;
};

INSTANCE DIA_PC_Hero_LifePotions_FullRegenerate (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Health_04Id;
	condition		= DIA_PC_Hero_LifePotions_FullRegenerate_Condition;
	information		= DIA_PC_Hero_LifePotions_FullRegenerate_Info;
	permanent		= TRUE;
	description		= "Pe³nia ¿ycia"; 
};

FUNC INT DIA_PC_Hero_LifePotions_FullRegenerate_Condition ()
{
	if (BrewingLifePotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyFullRegenarate)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_LifePotions_FullRegenerate_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Health_04))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Health_04);
		Print ("Uwarzy³eœ miksturê");
		CreateInvItem (hero, Recipe_Potion_Health_04.recipeitem);
		B_giveXP (20);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_LifePotions_Eliksir (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Health_03Id;
	condition		= DIA_PC_Hero_LifePotions_Eliksir_Condition;
	information		= DIA_PC_Hero_LifePotions_Eliksir_Info;
	permanent		= TRUE;
	description		= "Eliksir uzdrawiaj¹cy"; 
};

FUNC INT DIA_PC_Hero_LifePotions_Eliksir_Condition ()
{
	if (BrewingLifePotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_LifePotions_Eliksir_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Health_03))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Health_03);
		Print ("Uwarzy³eœ miksturê");
		CreateInvItem (hero, Recipe_Potion_Health_03.recipeitem);
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_LifePotions_Wyciag (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Health_02Id;
	condition		= DIA_PC_Hero_LifePotions_Wyciag_Condition;
	information		= DIA_PC_Hero_LifePotions_Wyciag_Info;
	permanent		= TRUE;
	description		= "Wyci¹g leczniczy"; 
};

FUNC INT DIA_PC_Hero_LifePotions_Wyciag_Condition ()
{
	if (BrewingLifePotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_LifePotions_Wyciag_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Health_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Health_02);
		CreateInvItem (hero, Recipe_Potion_Health_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (10);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_LifePotions_EsencjaV2 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Health_01v2Id;
	condition		= DIA_PC_Hero_LifePotions_EsencjaV2_Condition;
	information		= DIA_PC_Hero_LifePotions_EsencjaV2_Info;
	permanent		= TRUE;
	description		= "Esencja lecznicza"; 
};

FUNC INT DIA_PC_Hero_LifePotions_EsencjaV2_Condition ()
{
	if (BrewingLifePotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_LifePotions_EsencjaV2_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Health_01v2))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Health_01v2);
		CreateInvItem (hero, Recipe_Potion_Health_01v2.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (5);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_LifePotions_Esencja (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Health_01Id;
	condition		= DIA_PC_Hero_LifePotions_Esencja_Condition;
	information		= DIA_PC_Hero_LifePotions_Esencja_Info;
	permanent		= TRUE;
	description		= "Esencja lecznicza"; 
};

FUNC INT DIA_PC_Hero_LifePotions_Esencja_Condition ()
{
	if (BrewingLifePotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_LifePotions_Esencja_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Health_01))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Health_01);
		CreateInvItem (hero, Recipe_Potion_Health_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (5);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

/*
*
* MANA POTIONS
*
*/

INSTANCE DIA_PC_Hero_ManaPotions (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_ManaPotions_Condition;
   information  = DIA_PC_Hero_ManaPotions_Info;
   permanent	= true;
   description	= "(Mikstury many)";
};

FUNC INT DIA_PC_Hero_ManaPotions_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)
	&& (BrewingLifePotion == FALSE)
	&& (BrewingManaPotion == FALSE)
	&& (BrewingSpecialPotion == FALSE)
	&& (BrewingAlcohol == FALSE)
	&& (BrewingPoison == FALSE)
	&& (PrepareTobacco == FALSE)     
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_ManaPotions_Info()
{
	BrewingManaPotion = TRUE;
};

INSTANCE DIA_PC_Hero_ManaPotions_FullRegenerate (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Mana_04Id;
	condition		= DIA_PC_Hero_ManaPotions_FullRegenerate_Condition;
	information		= DIA_PC_Hero_ManaPotions_FullRegenerate_Info;
	permanent		= TRUE;
	description		= "Pe³nia many"; 
};

FUNC INT DIA_PC_Hero_ManaPotions_FullRegenerate_Condition ()
{
	if (BrewingManaPotion == TRUE)
	//&& (HeroKnows_AlchemyFullRegenarate)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_ManaPotions_FullRegenerate_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Mana_04))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Mana_04);
		CreateInvItem (hero, Recipe_Potion_Mana_04.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (20);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_ManaPotions_EliksirM (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Mana_03Id;
	condition		= DIA_PC_Hero_ManaPotions_EliksirM_Condition;
	information		= DIA_PC_Hero_ManaPotions_EliksirM_Info;
	permanent		= TRUE;
	description		= "Eliksir many"; 
};

FUNC INT DIA_PC_Hero_ManaPotions_EliksirM_Condition ()
{
	if (BrewingManaPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_ManaPotions_EliksirM_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Mana_03))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Mana_03);
		CreateInvItem (hero, Recipe_Potion_Mana_03.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (5);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_ManaPotions_WyciagM (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Mana_02Id;
	condition		= DIA_PC_Hero_ManaPotions_WyciagM_Condition;
	information		= DIA_PC_Hero_ManaPotions_WyciagM_Info;
	permanent		= TRUE;
	description		= "Wyci¹g magicznej energii"; 
};

FUNC INT DIA_PC_Hero_ManaPotions_WyciagM_Condition ()
{
	if (BrewingManaPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_ManaPotions_WyciagM_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Mana_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Mana_02);
		CreateInvItem (hero, Recipe_Potion_Mana_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (5);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_ManaPotions_EsencjaM2 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Mana_01v2Id;
	condition		= DIA_PC_Hero_ManaPotions_EsencjaM2_Condition;
	information		= DIA_PC_Hero_ManaPotions_EsencjaM2_Info;
	permanent		= TRUE;
	description		= "Esencja magicznej energii"; 
};

FUNC INT DIA_PC_Hero_ManaPotions_EsencjaM2_Condition ()
{
	if (BrewingManaPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_ManaPotions_EsencjaM2_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Mana_01v2))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Mana_01v2);
		CreateInvItem (hero, Recipe_Potion_Mana_01v2.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (5);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_ManaPotions_EsencjaM (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Mana_01Id;
	condition		= DIA_PC_Hero_ManaPotions_EsencjaM_Condition;
	information		= DIA_PC_Hero_ManaPotions_EsencjaM_Info;
	permanent		= TRUE;
	description		= "Esencja magicznej energii"; 
};

FUNC INT DIA_PC_Hero_ManaPotions_EsencjaM_Condition ()
{
	if (BrewingManaPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_ManaPotions_EsencjaM_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Mana_01))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Mana_01);
		CreateInvItem (hero, Recipe_Potion_Mana_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (5);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};


/*
*
* SPECIAL POTIONS
*
*/


INSTANCE DIA_PC_Hero_SpecialPotions (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_SpecialPotions_Condition;
   information  = DIA_PC_Hero_SpecialPotions_Info;
   permanent	= true;
   description	= "(Mikstury specjalne)";
};

FUNC INT DIA_PC_Hero_SpecialPotions_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 2)
	&& (BrewingLifePotion == FALSE)
	&& (BrewingManaPotion == FALSE)
	&& (BrewingSpecialPotion == FALSE)
	&& (BrewingAlcohol == FALSE)
	&& (BrewingPoison == FALSE)
	&& (PrepareTobacco == FALSE)     
	//AlchemyKnows == TRUE) 
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_Info()
{
	BrewingSpecialPotion = TRUE;
};

INSTANCE DIA_PC_Hero_SpecialPotions_MAGE (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Master_02Id;
	condition		= DIA_PC_Hero_SpecialPotions_MAGE_Condition;
	information		= DIA_PC_Hero_SpecialPotions_MAGE_Info;
	permanent		= TRUE;
	description		= "Napój w³adzy"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_MAGE_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyPotionsPower)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_MAGE_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Master_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Master_02);
		CreateInvItem (hero, Recipe_Potion_Master_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_KING (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Master_01Id;
	condition		= DIA_PC_Hero_SpecialPotions_KING_Condition;
	information		= DIA_PC_Hero_SpecialPotions_KING_Info;
	permanent		= TRUE;
	description		= "Napój potêgi"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_KING_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyPotionsPower)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_KING_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Master_01))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Master_01);
		CreateInvItem (hero, Recipe_Potion_Master_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_HPT1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_HealthTime_01Id;
	condition		= DIA_PC_Hero_SpecialPotions_HPT1_Condition;
	information		= DIA_PC_Hero_SpecialPotions_HPT1_Info;
	permanent		= TRUE;
	description		= "Wywar ¿ycia"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_HPT1_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyTimedPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_HPT1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_HealthTime_01))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_HealthTime_01);
		CreateInvItem (hero, Recipe_Potion_HealthTime_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_MAST1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_PotionTime_Master_01Id;
	condition		= DIA_PC_Hero_SpecialPotions_MAST1_Condition;
	information		= DIA_PC_Hero_SpecialPotions_MAST1_Info;
	permanent		= TRUE;
	description		= "Wywar potêgi"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_MAST1_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyTimedPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_MAST1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_PotionTime_Master_01))
    {
		removeIngredientsFromPlayerInv(Recipe_PotionTime_Master_01);
		CreateInvItem (hero, Recipe_PotionTime_Master_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_MANT1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_PotionTime_Mana_01Id;
	condition		= DIA_PC_Hero_SpecialPotions_MANT1_Condition;
	information		= DIA_PC_Hero_SpecialPotions_MANT1_Info;
	permanent		= TRUE;
	description		= "Wywar many"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_MANT1_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyTimedPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_MANT1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_PotionTime_Mana_01))
    {
		removeIngredientsFromPlayerInv(Recipe_PotionTime_Mana_01);
		CreateInvItem (hero, Recipe_PotionTime_Mana_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_DEXT1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_PotionTime_Dex_01Id;
	condition		= DIA_PC_Hero_SpecialPotions_DEXT1_Condition;
	information		= DIA_PC_Hero_SpecialPotions_DEXT1_Info;
	permanent		= TRUE;
	description		= "Wywar zwinnoœci"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_DEXT1_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyTimedPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_DEXT1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_PotionTime_Dex_01))
    {
		removeIngredientsFromPlayerInv(Recipe_PotionTime_Dex_01);
		CreateInvItem (hero, Recipe_PotionTime_Dex_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_STRT1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_PotionTime_Strength_01Id;
	condition		= DIA_PC_Hero_SpecialPotions_STRT1_Condition;
	information		= DIA_PC_Hero_SpecialPotions_STRT1_Info;
	permanent		= TRUE;
	description		= "Wywar si³y"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_STRT1_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyTimedPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_STRT1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_PotionTime_Strength_01))
    {
		removeIngredientsFromPlayerInv(Recipe_PotionTime_Strength_01);
		CreateInvItem (hero, Recipe_PotionTime_Strength_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_PLAGUE (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_ItMis_DrugId;
	condition		= DIA_PC_Hero_SpecialPotions_PLAGUE_Condition;
	information		= DIA_PC_Hero_SpecialPotions_PLAGUE_Info;
	permanent		= TRUE;
	description		= "Lekarstwo na zarazê"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_PLAGUE_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyAganistPlague)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_PLAGUE_Info ()
{
	if (playerHasRequiredIngredients(Recipe_ItMis_Drug))
    {
		removeIngredientsFromPlayerInv(Recipe_ItMis_Drug);
		CreateInvItem (hero, Recipe_ItMis_Drug.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (150);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_GUR (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Clear_StartId;
	condition		= DIA_PC_Hero_SpecialPotions_GUR_Condition;
	information		= DIA_PC_Hero_SpecialPotions_GUR_Info;
	permanent		= TRUE;
	description		= "Mikstura oczyszczenia"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_GUR_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyClarityMixture)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_GUR_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Clear_Start))
    {
		Info_ClearChoices		(DIA_PC_Hero_SpecialPotions_GUR);
		Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "1/8 soku z wilczej jagody", DIA_PC_Hero_SpecialPotions_GUR_18);
		Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "1/2 soku z wilczej jagody", DIA_PC_Hero_SpecialPotions_GUR_12);
		Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "1/4 soku z wilczej jagody ", DIA_PC_Hero_SpecialPotions_GUR_14);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

func void DIA_PC_Hero_SpecialPotions_GUR_18 ()
{
	Print ("Dobrze!");
	B_GiveXP (100);
	Npc_RemoveInvItems (hero, ItFo_Mod_WolfBerrys,1);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions_GUR);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Wyrzuæ wnêtrze liœci sza³wii", DIA_PC_Hero_SpecialPotions_GUR_WNE);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Wyrzuæ krawêdzie liœci sza³wii", DIA_PC_Hero_SpecialPotions_GUR_ZEW);
};
func void DIA_PC_Hero_SpecialPotions_GUR_12 ()
{
	Print ("le!");
	Npc_RemoveInvItems (hero, ItFo_Mod_WolfBerrys,1);
	AI_StopProcessInfos	(self);  
};
func void DIA_PC_Hero_SpecialPotions_GUR_14 ()
{
	Print ("le!");
	Npc_RemoveInvItems (hero, ItFo_Mod_WolfBerrys,1);
	AI_StopProcessInfos	(self);  
};
// FUNKCJE ZWI¥ZANE Z LIŒÆMI SZA£WII
func void DIA_PC_Hero_SpecialPotions_GUR_WNE ()
{
	Print ("le!");
	Npc_RemoveInvItems (hero, ItFo_Mod_Sage,1);
	AI_StopProcessInfos	(self); 
};
func void DIA_PC_Hero_SpecialPotions_GUR_ZEW ()
{
	Print ("Dobrze!");
	B_GiveXP (100);
	Npc_RemoveInvItems (hero, ItFo_Mod_Sage,1);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions_GUR);
 	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Wytnij górn¹ czêœæ kapelusza i dodaj", DIA_PC_Hero_SpecialPotions_GUR_KAPELUSZ);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Wytnij doln¹ czêœæ kapelusza i dodaj", DIA_PC_Hero_SpecialPotions_GUR_SPOD);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Wytnij nogê grzyba i dodaj do mikstury", DIA_PC_Hero_SpecialPotions_GUR_NOGA);
};
// FUNKCJE ZWI¥ZANE Z GRZYBEM 
func void  DIA_PC_Hero_SpecialPotions_GUR_KAPELUSZ ()
{
	Print ("le! Utraci³eœ cenny grzyb!");
	Npc_RemoveInvItems (hero, ItFo_Mod_LightMushroom,1);
	AI_StopProcessInfos	(self); 
};
func void  DIA_PC_Hero_SpecialPotions_GUR_SPOD ()
{
	Print ("Œwietnie! Teraz gotowanie!");
	B_GiveXP (100);
	Npc_RemoveInvItems (hero, ItFo_Mod_LightMushroom,1);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions_GUR);
 	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Podgrzewaj 15 minut", DIA_PC_Hero_SpecialPotions_GUR_T15);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Podgrzewaj 13 minut", DIA_PC_Hero_SpecialPotions_GUR_T13);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions_GUR, "Podgrzewaj 12 minut", DIA_PC_Hero_SpecialPotions_GUR_T12);
};
func void  DIA_PC_Hero_SpecialPotions_GUR_NOGA ()
{
	Print ("le! Utraci³eœ cenny grzyb!");
	Npc_RemoveInvItems (hero, ItFo_Mod_LightMushroom,1);
	AI_StopProcessInfos	(self); 
};
// FUNKCJE ZWI¥ZANE Z GOTOWANIEM
func void DIA_PC_Hero_SpecialPotions_GUR_T15 ()
{
	Print ("le! Rozgotowa³o siê!");
	AI_StopProcessInfos	(self); 
}; 
func void DIA_PC_Hero_SpecialPotions_GUR_T13 ()
{
	Print ("Œwietnie! Uwarzy³eœ miksturê!");
	CreateInvItem (hero,Recipe_Potion_Clear_Start.recipeitem);
  //  Npc_RemoveInvItems (hero, ItFo_Plants_Speed01,2);
  //  Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	//Print ("Uwarzy³eœ miksturê");
	B_giveXP (100);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions_GUR);
	AI_StopProcessInfos	(self); 
};
func void DIA_PC_Hero_SpecialPotions_GUR_T12 ()
{
	Print ("le! Niedogotowane!");
	AI_StopProcessInfos	(self); 
};

INSTANCE DIA_PC_Hero_SpecialPotions_EN (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Mana_Perma_02Id;
	condition		= DIA_PC_Hero_SpecialPotions_EN_Condition;
	information		= DIA_PC_Hero_SpecialPotions_EN_Info;
	permanent		= TRUE;
	description		= "Mikstura energii"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_EN_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyPermPotions2)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_EN_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Mana_Perma_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Mana_Perma_02);
		CreateInvItem (hero, Recipe_Potion_Mana_Perma_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_HP (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Health_Perma_02Id;
	condition		= DIA_PC_Hero_SpecialPotions_HP_Condition;
	information		= DIA_PC_Hero_SpecialPotions_HP_Info;
	permanent		= TRUE;
	description		= "Mikstura ¿ycia"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_HP_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyPermPotions2)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_HP_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Health_Perma_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Health_Perma_02);
		CreateInvItem (hero, Recipe_Potion_Health_Perma_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_DEX (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Dex_02Id;
	condition		= DIA_PC_Hero_SpecialPotions_DEX_Condition;
	information		= DIA_PC_Hero_SpecialPotions_DEX_Info;
	permanent		= TRUE;
	description		= "Mikstura zrêcznoœci"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_DEX_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyPermPotions1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_DEX_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Dex_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Dex_02);
		CreateInvItem (hero, Recipe_Potion_Dex_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_STR (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Strength_02Id;
	condition		= DIA_PC_Hero_SpecialPotions_STR_Condition;
	information		= DIA_PC_Hero_SpecialPotions_STR_Info;
	permanent		= TRUE;
	description		= "Mikstura si³y"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_STR_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemyPermPotions1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_STR_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Strength_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Strength_02);
		CreateInvItem (hero, Recipe_Potion_Strength_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (50);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_Q3 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Haste_03Id;
	condition		= DIA_PC_Hero_SpecialPotions_Q3_Condition;
	information		= DIA_PC_Hero_SpecialPotions_Q3_Info;
	permanent		= TRUE;
	description		= "Du¿a mikstura szybkoœci"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_Q3_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemySprintPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_Q3_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Haste_03))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Haste_03);
		CreateInvItem (hero, Recipe_Potion_Haste_03.recipeitem);
		//Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (10);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_Q2 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Haste_02Id;
	condition		= DIA_PC_Hero_SpecialPotions_Q2_Condition;
	information		= DIA_PC_Hero_SpecialPotions_Q2_Info;
	permanent		= TRUE;
	description		= "Œrednia mikstura szybkoœci"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_Q2_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemySprintPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_Q2_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Haste_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Haste_02);
		CreateInvItem (hero, Recipe_Potion_Haste_02.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (10);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_SpecialPotions_Q1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Potion_Haste_01Id;
	condition		= DIA_PC_Hero_SpecialPotions_Q1_Condition;
	information		= DIA_PC_Hero_SpecialPotions_Q1_Info;
	permanent		= TRUE;
	description		= "Ma³a mikstura szybkoœci"; 
};

FUNC INT DIA_PC_Hero_SpecialPotions_Q1_Condition ()
{
	if (BrewingSpecialPotion == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (HeroKnows_AlchemySprintPotions)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_SpecialPotions_Q1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Potion_Haste_01))
    {
		removeIngredientsFromPlayerInv(Recipe_Potion_Haste_01);
		CreateInvItem (hero, Recipe_Potion_Haste_01.recipeitem);
		Print ("Uwarzy³eœ miksturê");
		B_giveXP (10);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

/*
*
* ALKOHOLE
*
*/

INSTANCE DIA_PC_Hero_Alcohol (C_INFO)
{
   npc          = PC_Hero;
   nr           = 100;
   condition    = DIA_PC_Hero_Alcohol_Condition;
   information  = DIA_PC_Hero_Alcohol_Info;
   permanent	= true;
   description	= "(Gorza³ka)";
};

FUNC INT DIA_PC_Hero_Alcohol_Condition()
{
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	&& (BrewingLifePotion == FALSE)
	&& (BrewingManaPotion == FALSE)
	&& (BrewingSpecialPotion == FALSE)
	&& (BrewingAlcohol == FALSE)
	&& (BrewingPoison == FALSE)
	&& (PrepareTobacco == FALSE)     
 	//&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)    
 {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Alcohol_Info()
{
	BrewingAlcohol = TRUE;
};

INSTANCE DIA_PC_Hero_Alcohol_Sztylet (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_CiosSztyletuId;
	condition		= DIA_PC_Hero_Alcohol_Sztylet_Condition;
	information		= DIA_PC_Hero_Alcohol_Sztylet_Info;
	permanent		= TRUE;
	description		= "Cios sztyletu"; 
};

FUNC INT DIA_PC_Hero_Alcohol_Sztylet_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_Sztylet_Info ()
{
	if (playerHasRequiredIngredients(Recipe_CiosSztyletu))
    {
		removeIngredientsFromPlayerInv(Recipe_CiosSztyletu);
		CreateInvItem (hero, Recipe_CiosSztyletu.recipeitem);
		Print ("Przygotowa³eœ Cios sztyletu!");
		B_giveXP (40);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_Bimber (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_BimberId;
	condition		= DIA_PC_Hero_Alcohol_Bimber_Condition;
	information		= DIA_PC_Hero_Alcohol_Bimber_Info;
	permanent		= TRUE;
	description		= "Bimber"; 
};

FUNC INT DIA_PC_Hero_Alcohol_Bimber_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_Bimber_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Bimber))
    {
		removeIngredientsFromPlayerInv(Recipe_Bimber);
		CreateInvItem (hero, Recipe_Bimber.recipeitem);
		Print ("Przygotowa³eœ bimber!");
		B_giveXP (25);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_HoneyBeer (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_HoneyBeerId;
	condition		= DIA_PC_Hero_Alcohol_HoneyBeer_Condition;
	information		= DIA_PC_Hero_Alcohol_HoneyBeer_Info;
	permanent		= TRUE;
	description		= "Piwo miodowe"; 
};

FUNC INT DIA_PC_Hero_Alcohol_HoneyBeer_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_HoneyBeer_Info ()
{
	if (playerHasRequiredIngredients(Recipe_HoneyBeer))
    {
		removeIngredientsFromPlayerInv(Recipe_HoneyBeer);
		CreateInvItem (hero, Recipe_HoneyBeer.recipeitem);
		Print ("Przygotowa³eœ piwo miodowe!");
		B_giveXP (25);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_Honey1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_HoneyAlcoId;
	condition		= DIA_PC_Hero_Alcohol_Honey1_Condition;
	information		= DIA_PC_Hero_Alcohol_Honey1_Info;
	permanent		= TRUE;
	description		= "Miód pitny"; 
};

FUNC INT DIA_PC_Hero_Alcohol_Honey1_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_Honey1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_HoneyAlco))
    {
		removeIngredientsFromPlayerInv(Recipe_HoneyAlco);
		CreateInvItem (hero, Recipe_HoneyAlco.recipeitem);
		Print ("Przygotowa³eœ miód pitny!");
		B_giveXP (25);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_Absynt (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_AbsyntId;
	condition		= DIA_PC_Hero_Alcohol_Absynt_Condition;
	information		= DIA_PC_Hero_Alcohol_Absynt_Info;
	permanent		= TRUE;
	description		= "Absynt"; 
};

FUNC INT DIA_PC_Hero_Alcohol_Absynt_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_Absynt_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Absynt))
    {
		removeIngredientsFromPlayerInv(Recipe_Absynt);
		CreateInvItem (hero, Recipe_Absynt.recipeitem);
		Print ("Przygotowa³eœ absynt!");
		B_giveXP (25);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_Nalewkaplants (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_NalewkaPlantsId;
	condition		= DIA_PC_Hero_Alcohol_Nalewkaplants_Condition;
	information		= DIA_PC_Hero_Alcohol_Nalewkaplants_Info;
	permanent		= TRUE;
	description		= "Nalewka zio³owa"; 
};

FUNC INT DIA_PC_Hero_Alcohol_Nalewkaplants_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_Nalewkaplants_Info ()
{
	if (playerHasRequiredIngredients(Recipe_NalewkaPlants))
    {
		removeIngredientsFromPlayerInv(Recipe_NalewkaPlants);
		CreateInvItem (hero, Recipe_NalewkaPlants.recipeitem);
		Print ("Przygotowa³eœ nalewkê!");
		B_giveXP (25);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_Nalewkaberrys (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_NalewkaBerrysId;
	condition		= DIA_PC_Hero_Alcohol_Nalewkaberrys_Condition;
	information		= DIA_PC_Hero_Alcohol_Nalewkaberrys_Info;
	permanent		= TRUE;
	description		= "Nalewka jagodowa"; 
};

FUNC INT DIA_PC_Hero_Alcohol_Nalewkaberrys_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_Nalewkaberrys_Info ()
{
	if (playerHasRequiredIngredients(Recipe_NalewkaBerrys))
    {
		removeIngredientsFromPlayerInv(Recipe_NalewkaBerrys);
		CreateInvItem (hero, Recipe_NalewkaBerrys.recipeitem);
		Print ("Przygotowa³eœ nalewkê!");
		B_giveXP (10);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_NalewkaApple (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_NalewkaAppleId;
	condition		= DIA_PC_Hero_Alcohol_NalewkaApple_Condition;
	information		= DIA_PC_Hero_Alcohol_NalewkaApple_Info;
	permanent		= TRUE;
	description		= "Nalewka jab³kowa"; 
};

FUNC INT DIA_PC_Hero_Alcohol_NalewkaApple_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_NalewkaApple_Info ()
{
	if (playerHasRequiredIngredients(Recipe_NalewkaApple))
    {
		removeIngredientsFromPlayerInv(Recipe_NalewkaApple);
		CreateInvItem (hero, Recipe_NalewkaApple.recipeitem);
		Print ("Przygotowa³eœ nalewkê!");
		B_giveXP (10);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_VinoAlco (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_WineId;
	condition		= DIA_PC_Hero_Alcohol_VinoAlco_Condition;
	information		= DIA_PC_Hero_Alcohol_VinoAlco_Info;
	permanent		= TRUE;
	description		= "Wino"; 
};

FUNC INT DIA_PC_Hero_Alcohol_VinoAlco_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_VinoAlco_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Wine))
    {
		removeIngredientsFromPlayerInv(Recipe_Wine);
		CreateInvItem (hero, Recipe_Wine.recipeitem);
		Print ("Przygotowa³eœ wino!");
		B_giveXP (30);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Alcohol_RiceAlco (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_BoozeId;
	condition		= DIA_PC_Hero_Alcohol_RiceAlco_Condition;
	information		= DIA_PC_Hero_Alcohol_RiceAlco_Info;
	permanent		= TRUE;
	description		= "Ry¿ówka"; 
};

FUNC INT DIA_PC_Hero_Alcohol_RiceAlco_Condition ()
{
	if (BrewingAlcohol == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Alcohol_RiceAlco_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Booze))
    {
		removeIngredientsFromPlayerInv(Recipe_Booze);
		CreateInvItem (hero, Recipe_Booze.recipeitem);
		Print ("Przygotowa³eœ ry¿ówkê!");
		B_giveXP (30);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

/*
*
* Trucizny
*
*/

INSTANCE DIA_PC_Hero_Trucizny (C_INFO)
{
   npc          = PC_Hero;
   nr           = 6;
   condition    = DIA_PC_Hero_Trucizny_Condition;
   information  = DIA_PC_Hero_Trucizny_Info;
   permanent	= true;
   description	= "(Trucizny)";
};

FUNC INT DIA_PC_Hero_Trucizny_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)
	&& (BrewingLifePotion == FALSE)
	&& (BrewingManaPotion == FALSE)
	&& (BrewingSpecialPotion == FALSE)
	&& (BrewingAlcohol == FALSE)
	&& (BrewingPoison == FALSE)
	&& (PrepareTobacco == FALSE)        
	{
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Trucizny_Info()
{
	BrewingPoison = TRUE;
};

INSTANCE DIA_PC_Hero_Trucizny_Large (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Alchemy_trucizna_03Id;
	condition		= DIA_PC_Hero_Trucizny_Large_Condition;
	information		= DIA_PC_Hero_Trucizny_Large_Info;
	permanent		= TRUE;
	description		= "Silna trucizna"; 
};

FUNC INT DIA_PC_Hero_Trucizny_Large_Condition ()
{
	if (BrewingPoison == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Trucizny_Large_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Alchemy_trucizna_03))
    {
		removeIngredientsFromPlayerInv(Recipe_Alchemy_trucizna_03);
		CreateInvItem (hero, Recipe_Alchemy_trucizna_03.recipeitem);
		Print ("Przygotowa³eœ truciznê");
		B_giveXP (30);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Trucizny_Medium (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Alchemy_trucizna_02Id;
	condition		= DIA_PC_Hero_Trucizny_Medium_Condition;
	information		= DIA_PC_Hero_Trucizny_Medium_Info;
	permanent		= TRUE;
	description		= "Zwyk³a trucizna"; 
};

FUNC INT DIA_PC_Hero_Trucizny_Medium_Condition ()
{
	if (BrewingPoison == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Trucizny_Medium_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Alchemy_trucizna_02))
    {
		removeIngredientsFromPlayerInv(Recipe_Alchemy_trucizna_02);
		CreateInvItem (hero, Recipe_Alchemy_trucizna_02.recipeitem);
		Print ("Przygotowa³eœ truciznê");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Trucizny_Little (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Alchemy_trucizna_01Id;
	condition		= DIA_PC_Hero_Trucizny_Little_Condition;
	information		= DIA_PC_Hero_Trucizny_Little_Info;
	permanent		= TRUE;
	description		= "S³aba trucizna"; 
};

FUNC INT DIA_PC_Hero_Trucizny_Little_Condition ()
{
	if (BrewingPoison == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Trucizny_Little_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Alchemy_trucizna_01))
    {
		removeIngredientsFromPlayerInv(Recipe_Alchemy_trucizna_01);
		CreateInvItem (hero, Recipe_Alchemy_trucizna_01.recipeitem);
		Print ("Przygotowa³eœ truciznê!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

/*
*
* Tytoñ
*
*/

INSTANCE DIA_PC_Hero_Tyton_Alch (C_INFO)
{
   npc          = PC_Hero;
   nr           = 7;
   condition    = DIA_PC_Hero_Tyton_Alch_Condition;
   information  = DIA_PC_Hero_Tyton_Alch_Info;
   permanent	= true;
   description	= "(Tytoñ)";
};

FUNC INT DIA_PC_Hero_Tyton_Alch_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	//&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)
	&& (BrewingLifePotion == FALSE)
	&& (BrewingManaPotion == FALSE)
	&& (BrewingSpecialPotion == FALSE)
	&& (BrewingAlcohol == FALSE)
	&& (BrewingPoison == FALSE)
	&& (PrepareTobacco == FALSE)     
	{
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_Tyton_Alch_Info()
{
	PrepareTobacco = TRUE;
};

INSTANCE DIA_PC_Hero_Tyton_Alch_QUEST4 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Joint_PlantId;
	condition		= DIA_PC_Hero_Tyton_Alch_QUEST4_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_QUEST4_Info;
	permanent		= TRUE;
	description		= "Zio³owy Nowicjusz"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_QUEST4_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_QUEST4_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Joint_Plant))
    {
		removeIngredientsFromPlayerInv(Recipe_Joint_Plant);
		CreateInvItem (hero, Recipe_Joint_Plant.recipeitem);
		Print ("Przygotowa³eœ jointa!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Tyton_Alch_QUEST3 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Joint_MushId;
	condition		= DIA_PC_Hero_Tyton_Alch_QUEST3_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_QUEST3_Info;
	permanent		= TRUE;
	description		= "Grzybowy Nowicjusz"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_QUEST3_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_QUEST3_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Joint_Mush))
    {
		removeIngredientsFromPlayerInv(Recipe_Joint_Mush);
		CreateInvItem (hero, Recipe_Joint_Mush.recipeitem);
		Print ("Przygotowa³eœ jointa!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Tyton_Alch_QUEST2 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Joint_HoneyId;
	condition		= DIA_PC_Hero_Tyton_Alch_QUEST2_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_QUEST2_Info;
	permanent		= TRUE;
	description		= "Miodowy Nowicjusz"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_QUEST2_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_QUEST2_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Joint_Honey))
    {
		removeIngredientsFromPlayerInv(Recipe_Joint_Honey);
		CreateInvItem (hero, Recipe_Joint_Honey.recipeitem);
		Print ("Przygotowa³eœ jointa!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Tyton_Alch_QUEST1 (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Joint_AppleId;
	condition		= DIA_PC_Hero_Tyton_Alch_QUEST1_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_QUEST1_Info;
	permanent		= TRUE;
	description		= "Jab³kowy Nowicjusz"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_QUEST1_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_QUEST1_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Joint_Apple))
    {
		removeIngredientsFromPlayerInv(Recipe_Joint_Apple);
		CreateInvItem (hero, Recipe_Joint_Apple.recipeitem);
		Print ("Przygotowa³eœ jointa!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Tyton_Alch_Ziolo (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Tuton_4Id;
	condition		= DIA_PC_Hero_Tyton_Alch_Ziolo_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_Ziolo_Info;
	permanent		= TRUE;
	description		= "Grzybowy tytoñ"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_Ziolo_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_Ziolo_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Tuton_4))
    {
		removeIngredientsFromPlayerInv(Recipe_Tuton_4);
		CreateInvItem (hero, Recipe_Tuton_4.recipeitem);
		Print ("Przygotowa³eœ tytoñ!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Tyton_Alch_Little (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Tuton_1Id;
	condition		= DIA_PC_Hero_Tyton_Alch_Little_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_Little_Info;
	permanent		= TRUE;
	description		= "Tytoñ jab³kowy"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_Little_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_Little_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Tuton_1))
    {
		removeIngredientsFromPlayerInv(Recipe_Tuton_1);
		CreateInvItem (hero, Recipe_Tuton_1.recipeitem);
		Print ("Przygotowa³eœ tytoñ!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Tyton_Alch_Medium (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Tuton_2Id;
	condition		= DIA_PC_Hero_Tyton_Alch_Medium_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_Medium_Info;
	permanent		= TRUE;
	description		= "Tytoñ miodowy"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_Medium_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_Medium_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Tuton_2))
    {
		removeIngredientsFromPlayerInv(Recipe_Tuton_2);
		CreateInvItem (hero, Recipe_Tuton_2.recipeitem);
		Print ("Przygotowa³eœ tytoñ!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};

INSTANCE DIA_PC_Hero_Tyton_Alch_Large (C_Info)
{
	npc				= PC_Hero;
	nr				= start_potion_dlg_nr + Recipe_Tuton_3Id;
	condition		= DIA_PC_Hero_Tyton_Alch_Large_Condition;
	information		= DIA_PC_Hero_Tyton_Alch_Large_Info;
	permanent		= TRUE;
	description		= "Zio³owy tytoñ"; 
};

FUNC INT DIA_PC_Hero_Tyton_Alch_Large_Condition ()
{
	if (PrepareTobacco == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POTIONALCHEMY)
	{	
		return TRUE;
	};
};
func void DIA_PC_Hero_Tyton_Alch_Large_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Tuton_3))
    {
		removeIngredientsFromPlayerInv(Recipe_Tuton_3);
		CreateInvItem (hero, Recipe_Tuton_3.recipeitem);
		Print ("Przygotowa³eœ tytoñ!");
		B_giveXP (15);
    }
    else
    {
		Print ("Nie masz sk³adników");
        //AI_StopProcessInfos	(self);
    };
};