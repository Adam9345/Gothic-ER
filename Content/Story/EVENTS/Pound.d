// *Script was make in Easy Dialog Maker (EDM)
func void POUND_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
	    PLAYER_MOBSI_PRODUCTION	=	MOBSI_POUND;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
var int PoundingSeeds;
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_Pound_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 99999;
	condition	    = DIA_PC_Hero_Pound_EXIT_Condition;
	information	    = DIA_PC_Hero_Pound_EXIT_Info;
	permanent	    = TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Pound_EXIT_Condition()
{
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POUND)//(PoundingSeeds == false)

{
	return TRUE;
	};
};

FUNC VOID DIA_PC_Hero_Pound_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Pound
//========================================

INSTANCE DIA_PC_Hero_Pound (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_Pound_Condition;
   information  = DIA_PC_Hero_Pound_Info;
   permanent	= true;
   description	= "Utrzyj nasiona lub owoce.";
};

FUNC INT DIA_PC_Hero_Pound_Condition()
{
    if(PoundingSeeds == FALSE) 
	&&(PLAYER_MOBSI_PRODUCTION	==	MOBSI_POUND)

    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Pound_Info()
{
    PoundingSeeds = TRUE;
};
//*******************************************************
INSTANCE PC_Pound_Stop (C_Info)
{
	npc				= PC_Hero;
	nr				= 9;
	condition		= PC_Pound_Stop_Condition;
	information		= PC_Pound_Stop_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK; 
};

FUNC INT PC_Pound_Stop_Condition ()
{
	if (PoundingSeeds == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_POUND)
	
	{	
		return TRUE;
	};
};
FUNC VOID PC_Pound_Stop_Info()
{
	PoundingSeeds = FALSE;
};

//*******************************************************
INSTANCE PC_Pound_Flameberry (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_Plants_utarteJagody_01Id;
	npc				= PC_Hero;
	condition		= PC_Pound_Flameberry_Condition;
	information		= PC_Pound_Flameberry_Info;
	permanent		= TRUE;
	description		= "Rozetrzyj nasiona ogniociernia"; 
};

FUNC INT PC_Pound_Flameberry_Condition()
{	

	if (PLAYER_MOBSI_PRODUCTION	== MOBSI_POUND)
	&& (PoundingSeeds == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_Pound_Flameberry_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Plants_utarteJagody_01))
	{
		removeIngredientsFromPlayerInv(Recipe_Plants_utarteJagody_01);
		

		
		PrintS_Ext("Utar³eœ nasiona.", COL_WHITE);
		CreateInvItems (self, Recipe_Plants_utarteJagody_01.recipeitem,1);
	}
    else 
    {
	PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	PrintScreen ("1x Ogniocierñ"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	
    };	

};
//*******************************************************
INSTANCE PC_Pound_SwampHerb (C_INFO)
{
	nr       		= start_other_dlg_nr + Recipe_Plants_PapkaZzielaId;
	npc				= PC_Hero;
	condition		= PC_Pound_SwampHerb_Condition;
	information		= PC_Pound_SwampHerb_Info;
	permanent		= TRUE;
	description		= "Rozetrzyj bagienne ziele"; 
};

FUNC INT PC_Pound_SwampHerb_Condition()
{	

	if (PLAYER_MOBSI_PRODUCTION	== MOBSI_POUND)
	&& (PoundingSeeds == TRUE)

	{		
			return TRUE;
	};
};

FUNC VOID PC_Pound_SwampHerb_Info ()
{
	if (playerHasRequiredIngredients(Recipe_Plants_PapkaZziela))
	{
		removeIngredientsFromPlayerInv(Recipe_Plants_PapkaZziela);
		

		
		PrintS_Ext("Utar³eœ nasiona.", COL_WHITE);
		CreateInvItems (self, Recipe_Plants_PapkaZziela.recipeitem,1);
	}
    else 
    {
	PrintS_Ext  ("Brakuje ci sk³adników!", COL_RED);
	PrintScreen ("1x Bagienne Ziele"                   ,2, 68, "FONT_OLD_10_WHITE.TGA", 2);
	
    };	

};






