FUNC VOID COOKPAN_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_COOKPAN;
		Ai_ProcessInfos (her);
	};
}; 

var int MuttonRaw;
var int MoleratLiver;
var int MuttonLurker;
var int CookMeat;				 
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_CookPan_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_Hero_CookPan_EXIT_Condition;
	information		= DIA_PC_Hero_CookPan_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_CookPan_EXIT_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (CookMeat                == FALSE) 
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_CookPan_EXIT_Info()
{
    MoleratLiver = False;
    MuttonRaw    = False;
	MuttonLurker = FALSE;
	CookMeat = FALSE;				  			  
	self.aivar[AIV_INVINCIBLE]=FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	AI_StopProcessInfos	(self);
};

//*******************************************************
//Spezielle Tränke  NPC_TALENT_CookPan = 1;
//*******************************************************
//----------------------
INSTANCE PC_CookPaning_Weapon (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_CookPaning_Weapon_Condition;
	information		= PC_CookPaning_Weapon_Info;
	permanent		= TRUE;
	description		= "Usma¿ miêso"; 
};

FUNC INT PC_CookPaning_Weapon_Condition ()
{
	if(CookMeat                 == FALSE) 
	&&(PLAYER_MOBSI_PRODUCTION	== MOBSI_COOKPAN)
	&&(MuttonRaw                == FALSE)
	&&(MoleratLiver             == FALSE)
	&&(MuttonLurker             == FALSE)

	{	
		return TRUE;
	};
};

FUNC VOID PC_CookPaning_Weapon_Info()
{
	CookMeat = TRUE;
};
//*******************************************************
INSTANCE PC_CookPaning_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_CookPaning_Stop_Condition;
	information		= PC_CookPaning_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_CookPaning_Stop_Condition ()
{
	if (CookMeat == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	
	{	
		return TRUE;
	};
};
FUNC VOID PC_CookPaning_Stop_Info()
{
	if (MuttonRaw)
	|| (MoleratLiver)
	|| (MuttonLurker) 
	{
		MuttonRaw           = FALSE;
		MoleratLiver        = FALSE;
		MuttonLurker        = FALSE;
	} else {
		CookMeat            = FALSE;
	};
};
//***************************************************************************************
INSTANCE PC_MuttonRaw (C_INFO)
{
	nr       		= 1;
	npc				= PC_Hero;
	condition		= PC_MuttonRaw_Condition;
	information		= PC_MuttonRaw_Info;
	permanent		= TRUE;
	description		= "Surowe miêso"; 
};

FUNC INT PC_MuttonRaw_Condition()
{	
	if (CookMeat                == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	== MOBSI_COOKPAN)
	&& (MuttonRaw               == FALSE)
	&& (MoleratLiver            == FALSE)
    && (MuttonLurker            == FALSE)
	{		
			var int AFIP_ShowItem; AFIP_ShowItem = ItFoMutton;
			return TRUE;
	};
};

FUNC VOID PC_MuttonRaw_Info ()
{
  MuttonRaw = TRUE;
};
//***************************************************************************************
INSTANCE PC_MoleratLiver (C_INFO)
{
	nr       		=  2;
	npc				= PC_Hero;
	condition		= PC_MoleratLiver_Condition;
	information		= PC_MoleratLiver_Info;
	permanent		= TRUE;
	description		= "W¹troba kretoszczura"; 
};

FUNC INT PC_MoleratLiver_Condition()
{	
	if (CookMeat                == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	== MOBSI_COOKPAN)
	&& (MoleratLiver            == FALSE)
	&& (MuttonRaw               == FALSE)
    && (MuttonLurker            == FALSE)
	{		
			var int AFIP_ShowItem; AFIP_ShowItem = ItFo_MoleratWS;
			return TRUE;
	};
};

FUNC VOID PC_MoleratLiver_Info ()
{
  MoleratLiver = TRUE;
};
//***************************************************************************************
INSTANCE PC_LurkerMutton (C_INFO)
{
	nr       		=  3;
	npc				= PC_Hero;
	condition		= PC_LurkerMutton_Condition;
	information		= PC_LurkerMutton_Info;
	permanent		= TRUE;
	description		= "Miêso topielca"; 
};

FUNC INT PC_LurkerMutton_Condition()
{	
	if (CookMeat                == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	== MOBSI_COOKPAN)
	&& (MoleratLiver            == FALSE)
	&& (MuttonRaw               == FALSE)
    && (MuttonLurker            == FALSE)
	{		
			var int AFIP_ShowItem; AFIP_ShowItem = ItFo_MuttonLurkerCooked;
			return TRUE;
	};
};

FUNC VOID PC_LurkerMutton_Info ()
{
  MuttonLurker = TRUE;
};
//***************************************************************************************
INSTANCE PC_MuttonRaw_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MuttonId;
	npc				= PC_Hero;
	condition		= PC_MuttonRaw_01_Condition;
	information		= PC_MuttonRaw_01_Info;
	permanent		= TRUE;
	description		= "Usma¿ 1 sztukê miêsa"; 
};

FUNC INT PC_MuttonRaw_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MuttonRaw == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MuttonRaw_01_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Mutton))
	{
		removeIngredientsFromPlayerInv(Recipe_Mutton);
      

		
		PrintS_Ext("Przygotowa³eœ miêso!", COL_WHITE);
		CreateInvItems (self, Recipe_Mutton.recipeitem,1);
		MuttonRaw = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!"         , COL_RED);
	PrintScreen ("1x surowe miêso"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonRaw = true;
    };	
  //  AI_StopProcessInfos(self);
};


//***************************************************************************************
INSTANCE PC_MuttonRaw_05 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_Mutton5Id;
	npc				= PC_Hero;
	condition		= PC_MuttonRaw_05_Condition;
	information		= PC_MuttonRaw_05_Info;
	permanent		= TRUE;
	description		= "Usma¿ 5 sztuk miêsa"; 
};

FUNC INT PC_MuttonRaw_05_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MuttonRaw == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MuttonRaw_05_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Mutton5))
	{
		removeIngredientsFromPlayerInv(Recipe_Mutton5);
		
		PrintS_Ext("Przygotowa³eœ miêso!", COL_WHITE);
		CreateInvItems (self, Recipe_Mutton5.recipeitem,5);
		MuttonRaw = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!"         , COL_RED);
	PrintScreen ("5x surowe miêso"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonRaw = true;
    };	
   // AI_StopProcessInfos(self);
};
var int MuttonRawAmount;
//***************************************************************************************
INSTANCE PC_MuttonRaw_All (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MuttonAllId;
	npc				= PC_Hero;
	condition		= PC_MuttonRaw_All_Condition;
	information		= PC_MuttonRaw_All_Info;
	permanent		= TRUE;
	description		= "Usma¿ wszystkie sztuki miêsa"; 
};

FUNC INT PC_MuttonRaw_All_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MuttonRaw == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MuttonRaw_All_Info ()
{
	if(playerHasRequiredIngredients(Recipe_MuttonAll))
	{
		
	MuttonRawAmount = Npc_hasitems (hero, ItFoMuttonRaw);
		
		
    if (MuttonRawAmount >0)
    {
			removeIngredientsFromPlayerInv(Recipe_MuttonAll);
			
			CreateInvItems (hero, Recipe_MuttonAll.recipeitem,MuttonRawAmount);
			
			var string WriteMutton;
			
			WriteMutton = ConcatStrings (InttoString (MuttonRawAmount)," sztuk miêsa usma¿ono.");
			PrintScreen (WriteMutton,-1,75,"FONT_OLD_10_WHITE.tga",3);
	};
	
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!"              , COL_RED);
	PrintScreen ("Surowe miêso"                        ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonRaw = true;
    };	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_MoleratLiver_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MoleratWSId;
	npc				= PC_Hero;
	condition		= PC_MoleratLiver_01_Condition;
	information		= PC_MoleratLiver_01_Info;
	permanent		= TRUE;
	description		= "Usma¿ 1 w¹trobe kretoszczura"; 
};

FUNC INT PC_MoleratLiver_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MoleratLiver == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MoleratLiver_01_Info ()
{
	if (playerHasRequiredIngredients(Recipe_MoleratWS))
	{
		removeIngredientsFromPlayerInv(Recipe_MoleratWS);
      

		
		PrintS_Ext("Przygotowa³eœ miêso!", COL_WHITE);
		CreateInvItems (self, Recipe_MoleratWS.recipeitem,1);
		MoleratLiver = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	PrintScreen ("1x w¹troba kretoszczura"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MoleratLiver = true;
    };	
   // AI_StopProcessInfos(self);
};


//***************************************************************************************
INSTANCE PC_MoleratLiver_05 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MoleratWS5Id;
	npc				= PC_Hero;
	condition		= PC_MoleratLiver_05_Condition;
	information		= PC_MoleratLiver_05_Info;
	permanent		= TRUE;
	description		= "Usma¿ 5 w¹trób kretoszczura"; 
};

FUNC INT PC_MoleratLiver_05_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MoleratLiver == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MoleratLiver_05_Info ()
{
	if (playerHasRequiredIngredients(Recipe_MoleratWS5))
	{
		removeIngredientsFromPlayerInv(Recipe_MoleratWS5);
      

		
		PrintS_Ext("Przygotowa³eœ miêso!", COL_WHITE);
		CreateInvItems (self, Recipe_MoleratWS5.recipeitem,5);
		MuttonRaw = False;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	PrintScreen ("5x w¹troba kretoszczura"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MoleratLiver = True;
    };	
   // AI_StopProcessInfos(self);
};
var int MoleratLiverAmount;
//***************************************************************************************
INSTANCE PC_MoleratLiver_All (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MoleratWSAllId;
	npc				= PC_Hero;
	condition		= PC_MoleratLiver_All_Condition;
	information		= PC_MoleratLiver_All_Info;
	permanent		= TRUE;
	description		= "Usma¿ wszystkie w¹troby kretoszczura"; 
};

//var int MoleratLiverAmount;

FUNC INT PC_MoleratLiver_All_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MoleratLiver == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MoleratLiver_All_Info ()
{


    if(playerHasRequiredIngredients(Recipe_MoleratWSAll))
	
	{
		
	MoleratLiverAmount = Npc_hasitems (hero, ItFo_MoleratW);
		
		
    if (MoleratLiverAmount >0)
    {
			removeIngredientsFromPlayerInv(Recipe_MoleratWSAll);
			
			CreateInvItems (hero, Recipe_MoleratWSAll.recipeitem,MoleratLiverAmount);
			
			var string WriteLiver;
			
			WriteLiver = ConcatStrings (InttoString (MoleratLiverAmount)," sztuk w¹tróbki kretoszczura usma¿ono.");
			PrintScreen (WriteLiver,-1,75,"FONT_OLD_10_WHITE.tga",3);
	};
	
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!"              , COL_RED);
	PrintScreen ("W¹troba kretoszczura"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MoleratLiver = True;
    };	
	
   // AI_StopProcessInfos(self);
};
//***************************************************************************************
INSTANCE PC_MuttonLurker_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MuttonLurkerCookedId;
	npc				= PC_Hero;
	condition		= PC_MuttonLurker_01_Condition;
	information		= PC_MuttonLurker_01_Info;
	permanent		= TRUE;
	description		= "Usma¿ 1 sztukê miêsa"; 
};

FUNC INT PC_MuttonLurker_01_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MuttonLurker == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MuttonLurker_01_Info ()
{
	if (playerHasRequiredIngredients(Recipe_MuttonLurkerCooked))
	{
		removeIngredientsFromPlayerInv(Recipe_MuttonLurkerCooked);
      

		
		PrintS_Ext("Przygotowa³eœ miêso!", COL_WHITE);
		CreateInvItems (self, Recipe_MuttonLurkerCooked.recipeitem,1);
		MuttonLurker = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!"         , COL_RED);
	PrintScreen ("1x surowe miêso topielca"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonLurker = true;
    };	
  //  AI_StopProcessInfos(self);
};


//***************************************************************************************
INSTANCE PC_MuttonLurker_05 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MuttonLurkerCooked5Id;
	npc				= PC_Hero;
	condition		= PC_MuttonLurker_05_Condition;
	information		= PC_MuttonLurker_05_Info;
	permanent		= TRUE;
	description		= "Usma¿ 5 sztuk miêsa"; 
};

FUNC INT PC_MuttonLurker_05_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MuttonLurker == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MuttonLurker_05_Info ()
{
	if (playerHasRequiredIngredients(Recipe_MuttonLurkerCooked5))
	{
		removeIngredientsFromPlayerInv(Recipe_MuttonLurkerCooked5);
		
		PrintS_Ext("Przygotowa³eœ miêso!", COL_WHITE);
		CreateInvItems (self, Recipe_MuttonLurkerCooked5.recipeitem,5);
		MuttonLurker = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!"         , COL_RED);
	PrintScreen ("5x surowe miêso topielca"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonLurker = true;
    };	
   // AI_StopProcessInfos(self);
};
var int MuttonLurkerAmount;
//***************************************************************************************
INSTANCE PC_MuttonLurker_All (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MuttonLurkerCookedAllId;
	npc				= PC_Hero;
	condition		= PC_MuttonLurker_All_Condition;
	information		= PC_MuttonLurker_All_Info;
	permanent		= TRUE;
	description		= "Usma¿ wszystkie sztuki miêsa"; 
};

FUNC INT PC_MuttonLurker_All_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COOKPAN)
	&& (MuttonLurker == TRUE)
   
	{		
			return TRUE;
	};
};

FUNC VOID PC_MuttonLurker_All_Info ()
{
	if(playerHasRequiredIngredients(Recipe_MuttonLurkerCookedAll))
	{
		
	MuttonLurkerAmount = Npc_hasitems (hero, ItFo_muttonLurker);
		
		
    if (MuttonLurkerAmount >0)
    {
			removeIngredientsFromPlayerInv(Recipe_MuttonLurkerCookedAll);
			
			CreateInvItems (hero, Recipe_MuttonLurkerCookedAll.recipeitem,MuttonLurkerAmount);
			
			var string WriteMuttonLurker;
			
			WriteMuttonLurker = ConcatStrings (InttoString (MuttonLurkerAmount)," sztuk miêsa topielca usma¿ono.");
			PrintScreen (WriteMuttonLurker,-1,75,"FONT_OLD_10_WHITE.tga",3);
	};
	
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk³adników!"              , COL_RED);
	PrintScreen ("Surowe miêso topielca"                        ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonLurker = true;
    };	
   // AI_StopProcessInfos(self);
};
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
