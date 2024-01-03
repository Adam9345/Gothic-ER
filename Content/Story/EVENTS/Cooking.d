FUNC VOID COOKING_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_COOKING;
		Ai_ProcessInfos (her);
	};
}; 


//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

var int CookingFood;					
INSTANCE DIA_PC_Hero_Cook_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 99999;
	condition		= DIA_PC_Hero_Cook_EXIT_Condition;
	information		= DIA_PC_Hero_Cook_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Cook_EXIT_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)// (CookingFood == FALSE)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_Cook_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	CookingFood = FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;				 
	AI_StopProcessInfos	(self);
};

//*******************************************************
//Spezielle Tränke 
//*******************************************************
//----------------------
INSTANCE PC_Cooking_Food (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Cooking_Food_Condition;
	information		= PC_Cooking_Food_Info;
	permanent		= TRUE;
	description		= "Przygotuj posi³ek."; 
};

FUNC INT PC_Cooking_Food_Condition ()
{
	if (CookingFood == FALSE) 
	&&(PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)

	{	
		return TRUE;
	};
};

FUNC VOID PC_Cooking_Food_Info()
{
	CookingFood = TRUE;
};
//*******************************************************
INSTANCE PC_Cooking_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_Cooking_Stop_Condition;
	information		= PC_Cooking_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Cooking_Stop_Condition ()
{
	if (CookingFood == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	
	{	
		return TRUE;
	};
};
FUNC VOID PC_Cooking_Stop_Info()
{
	CookingFood = FALSE;
};
//*******************************************************
INSTANCE PC_ItFo_CheeseSoup (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_CheeseSoupId;
	npc				= PC_Hero;
	condition		= PC_ItFo_CheeseSoup_Condition;
	information		= PC_ItFo_CheeseSoup_Info;
	permanent		= TRUE;
	description		= "Zupa serowa"; 
};

FUNC INT PC_ItFo_CheeseSoup_Condition()
{	
	if (CheeseSoup_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_CheeseSoup_Info ()
{

	cookingmeals_instance = Recipe_CheeseSoup;

	if (playerHasRequiredIngredients(Recipe_CheeseSoup))
	{
		removeIngredientsFromPlayerInv(Recipe_CheeseSoup);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_CheeseSoup.recipeitem,1);
	}
    else 
    {
	PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("3x ser"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x surowe miêso"    ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x chleb"                 ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_CrawlerSoup (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_CrawelSoupId;
	npc				= PC_Hero;
	condition		= PC_ItFo_CrawlerSoup_Condition;
	information		= PC_ItFo_CrawlerSoup_Info;
	permanent		= TRUE;
	description		= "Zupa z pe³zacza"; 
};

FUNC INT PC_ItFo_CrawlerSoup_Condition()
{	
	if (MinecrawlerSoup_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_CrawlerSoup_Info ()
{
	cookingmeals_instance = Recipe_CrawelSoup;

	if (playerHasRequiredIngredients(Recipe_CrawelSoup))
	{
		removeIngredientsFromPlayerInv(Recipe_CrawelSoup);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_CrawelSoup.recipeitem,1);
	}
    else 
    {
	PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("1x wnêtrznoœci pe³zacza"  ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x sól"                   ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x miska ry¿u"            ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x leœne ziele"           ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
    //AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_ScavengerSoup (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_ScaSoupId;
	npc				= PC_Hero;
	condition		= PC_ItFo_ScavengerSoup_Condition;
	information		= PC_ItFo_ScavengerSoup_Info;
	permanent		= TRUE;
	description		= "Zupa ze œcierwojada"; 
};

FUNC INT PC_ItFo_ScavengerSoup_Condition()
{	
	if (ScavengerSoup_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_ScavengerSoup_Info ()
{
	cookingmeals_instance = Recipe_ScaSoup;

	if (playerHasRequiredIngredients(Recipe_ScaSoup))
	{
		removeIngredientsFromPlayerInv(Recipe_ScaSoup);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_ScaSoup.recipeitem,1);
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("3x surowe miêso"  ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x sól"                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x krucze ziela"       ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x gorzki chleb"       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    */
	};	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_MoleratSoup (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_MoleratSoupId;
	npc				= PC_Hero;
	condition		= PC_ItFo_MoleratSoup_Condition;
	information		= PC_ItFo_MoleratSoup_Info;
	permanent		= TRUE;
	description		= "Zupa z kretoszczura"; 
};

FUNC INT PC_ItFo_MoleratSoup_Condition()
{	
	if (MoleratSoup_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_MoleratSoup_Info ()
{
	cookingmeals_instance = Recipe_MoleratSoup;

	if (playerHasRequiredIngredients(Recipe_MoleratSoup))
	{
		removeIngredientsFromPlayerInv(Recipe_MoleratSoup);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_MoleratSoup.recipeitem,1);
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("1x piwo"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x sól"                    ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x surowe miêso"           ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("1x w¹troba kretoszczura"   ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
  //  AI_StopProcessInfos(self);
};

//***************************************************************************************
INSTANCE PC_ItFo_MeatbugSoup (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_SnafSoupId;
	npc				= PC_Hero;
	condition		= PC_ItFo_MeatbugSoup_Condition;
	information		= PC_ItFo_MeatbugSoup_Info;
	permanent		= TRUE;
	description		= "Potrawka z chrz¹szcza"; 
};

FUNC INT PC_ItFo_MeatbugSoup_Condition()
{	
	if (MeatbugSoup_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_MeatbugSoup_Info ()
{
	cookingmeals_instance = Recipe_SnafSoup;

	if (playerHasRequiredIngredients(Recipe_SnafSoup))
	{
		removeIngredientsFromPlayerInv(Recipe_SnafSoup);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_SnafSoup.recipeitem,1);
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("3x miêso chrz¹szcza",2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("5x piekielnik"      ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x ry¿"             ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    */
	};	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_Kompot01 (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_BerrysDrinkId;
	npc				= PC_Hero;
	condition		= PC_ItFo_Kompot01_Condition;
	information		= PC_ItFo_Kompot01_Info;
	permanent		= TRUE;
	description		= "Kompot z jagód"; 
};

FUNC INT PC_ItFo_Kompot01_Condition()
{	
	if (Kompot01_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_Kompot01_Info ()
{

	cookingmeals_instance = Recipe_BerrysDrink;

	if (playerHasRequiredIngredients(Recipe_BerrysDrink))
	{
		removeIngredientsFromPlayerInv(Recipe_BerrysDrink);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_BerrysDrink.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("2x woda"       ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("4x jagoda"     ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("2x serafis"    ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************

INSTANCE PC_ItFo_GhoranWine (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_GhoranWineId;
	npc				= PC_Hero;
	condition		= PC_ItFo_GhoranWine_Condition;
	information		= PC_ItFo_GhoranWine_Info;
	permanent		= TRUE;
	description		= "Wino Ghorana"; 
};

FUNC INT PC_ItFo_GhoranWine_Condition()
{	
	if (GhoranWine_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_GhoranWine_Info ()
{
	cookingmeals_instance = Recipe_GhoranWine;

	if (playerHasRequiredIngredients(Recipe_GhoranWine))
	{
		removeIngredientsFromPlayerInv(Recipe_GhoranWine);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_GhoranWine.recipeitem,1);
	}
    else 
    {
    PrintS_Ext("Brakuje ci sk³adników!", COL_RED);
	/*
    PrintScreen ("1x woda"                       ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x jagoda"                     ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
    PrintScreen ("3x roztarte bagienne ziele"    ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x cukier"                     ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("4x winogron"                   ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
  //  AI_StopProcessInfos(self);
};


//***************************************************************************************
INSTANCE PC_ItFo_Konfitura (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_JamId;
	npc				= PC_Hero;
	condition		= PC_ItFo_Konfitura_Condition;
	information		= PC_ItFo_Konfitura_Info;
	permanent		= TRUE;
	description		= "Konfitura"; 
};

FUNC INT PC_ItFo_Konfitura_Condition()
{	
	if (Konfitura_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_Konfitura_Info ()
{
	cookingmeals_instance = Recipe_Jam;

	if (playerHasRequiredIngredients(Recipe_Jam))
	{
		removeIngredientsFromPlayerInv(Recipe_Jam);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_Jam.recipeitem,1);
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("3x jagoda"    ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x serafis"   ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x Woda"      ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x Cukier"    ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
	//concattext = ConcatStrings(PRINT_MissingIntergients,IntToString(items));
	//PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_MeatStew (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_MeatStewId;
	npc				= PC_Hero;
	condition		= PC_ItFo_MeatStew_Condition;
	information		= PC_ItFo_MeatStew_Info;
	permanent		= TRUE;
	description		= "Miêsny gulasz"; 
};

FUNC INT PC_ItFo_MeatStew_Condition()
{	
	if (MeatStew_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_MeatStew_Info ()
{
	cookingmeals_instance = Recipe_MeatStew;

	if (playerHasRequiredIngredients(Recipe_MeatStew))
	{
		removeIngredientsFromPlayerInv(Recipe_MeatStew);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_MeatStew.recipeitem,1);
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("5x surowe miêso"         ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x zio³a uzdrawiaj¹ce"   ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x chleb"                ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x Woda"                 ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_MushroomStew (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_MushroomStewId;
	npc				= PC_Hero;
	condition		= PC_ItFo_MushroomStew_Condition;
	information		= PC_ItFo_MushroomStew_Info;
	permanent		= TRUE;
	description		= "Grzybowy gulasz"; 
};

FUNC INT PC_ItFo_MushroomStew_Condition()
{	
	if (MushroomStew_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_MushroomStew_Info ()
{
	cookingmeals_instance = Recipe_MushroomStew;

	if (playerHasRequiredIngredients(Recipe_MushroomStew))
	{
		removeIngredientsFromPlayerInv(Recipe_MushroomStew);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_MushroomStew.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("3x piekielnik"                   ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	/*
	PrintScreen ("3x piekielnik"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("4x gorzki chleb"                 ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x surowe miêso"                 ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x woda"                         ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_BigCasserole (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_BigCasseroleId;
	npc				= PC_Hero;
	condition		= PC_ItFo_BigCasserole_Condition;
	information		= PC_ItFo_BigCasserole_Info;
	permanent		= TRUE;
	description		= "Myœliwska zapiekanka"; 
};

FUNC INT PC_ItFo_BigCasserole_Condition()
{	
	if (MeatStew_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_BigCasserole_Info ()
{
	cookingmeals_instance = Recipe_BigCasserole;

	if (playerHasRequiredIngredients(Recipe_BigCasserole))
	{
		removeIngredientsFromPlayerInv(Recipe_BigCasserole);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_BigCasserole.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("3x piekielnik"                   ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	/*
	PrintScreen ("2x sma¿one miêso"                       ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x chleb"                               ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("3x piekielnik"                          ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x polne ziele"                         ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_HotWine (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_HotWineId;
	npc				= PC_Hero;
	condition		= PC_ItFo_HotWine_Condition;
	information		= PC_ItFo_HotWine_Info;
	permanent		= TRUE;
	description		= "Grzane wino"; 
};

FUNC INT PC_ItFo_HotWine_Condition()
{	
	if (HotWine_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_HotWine_Info ()
{
	cookingmeals_instance = Recipe_HotWine;

	if (playerHasRequiredIngredients(Recipe_HotWine))
	{
		removeIngredientsFromPlayerInv(Recipe_HotWine);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_HotWine.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x wino"                                          ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x czysty alkohol"                                ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x czarne ziele"                                  ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x nasiona czerwonego buka"                       ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
	
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************  
INSTANCE PC_ItFo_SoupFish2 (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_SoupFish2Id;
	npc				= PC_Hero;
	condition		= PC_ItFo_SoupFish2_Condition;
	information		= PC_ItFo_SoupFish2_Info;
	permanent		= TRUE;
	description		= "Zupa z pstr¹ga"; 
};

FUNC INT PC_ItFo_SoupFish2_Condition()
{	
	if (SoupFish2_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_SoupFish2_Info ()
{
	cookingmeals_instance = Recipe_SoupFish2;

	if (playerHasRequiredIngredients(Recipe_SoupFish2))
	{
		removeIngredientsFromPlayerInv(Recipe_SoupFish2);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_SoupFish2.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x pstr¹g"                                          ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x woda"                                            ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x piekielnik"                                      ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x roœlina lecznicza"                               ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x sól"                                             ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_SoupFish3 (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_SoupFish3Id;
	npc				= PC_Hero;
	condition		= PC_ItFo_SoupFish3_Condition;
	information		= PC_ItFo_SoupFish3_Info;
	permanent		= TRUE;
	description		= "Zupa z sandacza"; 
};

FUNC INT PC_ItFo_SoupFish3_Condition()
{	
	if (SoupFish3_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_SoupFish3_Info ()
{
	cookingmeals_instance = Recipe_SoupFish3;

	if (playerHasRequiredIngredients(Recipe_SoupFish3))
	{
		removeIngredientsFromPlayerInv(Recipe_SoupFish3);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_SoupFish3.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	/*
	PrintScreen ("2x sandacz"                                         ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x woda"                                            ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x gorzki chleb"                                    ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x ser"                                             ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x sól"                                             ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_SoupFish4 (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_SoupFish4Id;
	npc				= PC_Hero;
	condition		= PC_ItFo_SoupFish4_Condition;
	information		= PC_ItFo_SoupFish4_Info;
	permanent		= TRUE;
	description		= "Zupa z karasi"; 
};

FUNC INT PC_ItFo_SoupFish4_Condition()
{	
	if (SoupFish4_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_SoupFish4_Info ()
{
	cookingmeals_instance = Recipe_SoupFish4;

	if (playerHasRequiredIngredients(Recipe_SoupFish4))
	{
		removeIngredientsFromPlayerInv(Recipe_SoupFish4);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_SoupFish4.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("3x piekielnik"                   ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	/*
	PrintScreen ("2x karaœ"                                     ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x piwo"                                      ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x Twardzieñ"                                 ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x roœlina lecznicza"                         ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};

//***************************************************************************************
INSTANCE PC_ItFo_SoupFish5 (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_SoupFish5Id;
	npc				= PC_Hero;
	condition		= PC_ItFo_SoupFish5_Condition;
	information		= PC_ItFo_SoupFish5_Info;
	permanent		= TRUE;
	description		= "Zupa z pstr¹ga têczowego"; 
};

FUNC INT PC_ItFo_SoupFish5_Condition()
{	
	if (SoupFish5_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_SoupFish5_Info ()
{
	cookingmeals_instance = Recipe_SoupFish5;

	if (playerHasRequiredIngredients(Recipe_SoupFish5))
	{
		removeIngredientsFromPlayerInv(Recipe_SoupFish5);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_SoupFish5.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("3x piekielnik"                   ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	/*
	PrintScreen ("2x sól"                                                ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x pstr¹g têczowy"                                     ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x wino"                                               ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x ry¿"                                                ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x velais"                                             ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_ItFo_LurkerSoup (C_INFO)
{
	nr       		= start_meal_dlg_nr + Recipe_LurkerSoupId;
	npc				= PC_Hero;
	condition		= PC_ItFo_LurkerSoup_Condition;
	information		= PC_ItFo_LurkerSoup_Info;
	permanent		= TRUE;
	description		= "Zupa z topielca"; 
};

FUNC INT PC_ItFo_LurkerSoup_Condition()
{	
	if (LurkerSoup_Recipe == TRUE)  
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKING)
	&& (CookingFood == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_ItFo_LurkerSoup_Info ()
{
	cookingmeals_instance = Recipe_LurkerSoup;

	if (playerHasRequiredIngredients(Recipe_LurkerSoup))
	{
		removeIngredientsFromPlayerInv(Recipe_LurkerSoup);
		
		PrintS_Ext("Potrawa gotowa!", COL_WHITE);
		CreateInvItems (self, Recipe_LurkerSoup.recipeitem,1);
	}
    else 
    {
	
	
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	//PrintScreen ("3x piekielnik"                   ,2, 70, "FONT_OLD_10_WHITE.TGA", 2);
	/*
	PrintScreen ("4x sma¿one miêso topielca"                      ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x ry¿ówka"                                     ,2, 66, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("1x ry¿"                                         ,2, 64, "FONT_OLD_10_WHITE.TGA", 2);
	PrintScreen ("2x serafis"                                     ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	*/
	
    };	
   // AI_StopProcessInfos(self);
};

























































/*
// *Script was make in Easy Dialog Maker (EDM)
func void GOTOWANIE_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Gotowanie;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};






                    if (Npc_HasItems (hero, ItFo_Plants_Stoneroot_01) >=3) 
					{
					Doc_PrintLines	( nDocID,  0, "- 3 Twardzienie (mam)"					);
					}
					else
					{
					Doc_PrintLines	( nDocID,  0, "- 3 Twardzienie (brak)"					);
					};
*/