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
var int CookingPanFirstTime;		 
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
	quantity = 1;
	AI_StopProcessInfos	(self);
};

//*******************************************************
//Spezielle Tr�nke  NPC_TALENT_CookPan = 1;
//*******************************************************
//----------------------
INSTANCE PC_CookPaning_Weapon (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_CookPaning_Weapon_Condition;
	information		= PC_CookPaning_Weapon_Info;
	permanent		= TRUE;
	description		= "Usma� mi�so"; 
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
	if (CookingPanFirstTime != TRUE)
	{
	CookingPanFirstTime = TRUE;
	PrintS_Ext  ("Naci�nij < lub > aby zmieni� ilo��.", COL_GREEN);
	};
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
	description		= "Surowe mi�so"; 
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
	description		= "W�troba kretoszczura"; 
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
	description		= "Mi�so topielca"; 
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
	description		= "Usma� surowe mi�so"; 
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
      

		
		PrintS_Ext(cs3("Przygotowa�e� ", i2s(quantity), "x mi�so"), COL_WHITE);
		CreateInvItems (self, Recipe_Mutton.recipeitem,quantity);
		MuttonRaw = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk�adnik�w!"         , COL_RED);
	//PrintScreen ("1x surowe mi�so"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonRaw = true;
    };	
  //  AI_StopProcessInfos(self);
};


INSTANCE PC_MoleratLiver_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MoleratWSId;
	npc				= PC_Hero;
	condition		= PC_MoleratLiver_01_Condition;
	information		= PC_MoleratLiver_01_Info;
	permanent		= TRUE;
	description		= "Usma� w�trob� kretoszczura"; 
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
      

		
		PrintS_Ext(cs3("Przygotowa�e� ", i2s(quantity), "x mi�so"), COL_WHITE);
		CreateInvItems (self, Recipe_MoleratWS.recipeitem,quantity);
		MoleratLiver = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk�adnik�w!", COL_RED);
	//PrintScreen ("1x w�troba kretoszczura"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MoleratLiver = true;
    };	
   // AI_StopProcessInfos(self);
};

INSTANCE PC_MuttonLurker_01 (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_MuttonLurkerCookedId;
	npc				= PC_Hero;
	condition		= PC_MuttonLurker_01_Condition;
	information		= PC_MuttonLurker_01_Info;
	permanent		= TRUE;
	description		= "Usma� mi�so topielca"; 
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
      

		
		PrintS_Ext(cs3("Przygotowa�e� ", i2s(quantity), "x mi�so"), COL_WHITE);
		CreateInvItems (self, Recipe_MuttonLurkerCooked.recipeitem,quantity);
		MuttonLurker = true;
	}
    else 
    {
    PrintS_Ext  ("Brakuje ci sk�adnik�w!"         , COL_RED);
	//PrintScreen ("1x surowe mi�so topielca"                ,2, 62, "FONT_OLD_10_WHITE.TGA", 2);
    MuttonLurker = true;
    };	
  //  AI_StopProcessInfos(self);
};

