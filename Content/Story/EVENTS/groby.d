//groby
func void grob1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: ge�ndert, damit kontrollierte NSCs nicht schlafen k�nnen!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_GRAVE;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
func void grob2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: ge�ndert, damit kontrollierte NSCs nicht schlafen k�nnen!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_GRAVE2;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
func void grob3_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: ge�ndert, damit kontrollierte NSCs nicht schlafen k�nnen!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_GRAVE3;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_EXIT_grob1(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition	= DIA_PC_HERO_EXIT_grob1_Condition;
	information	= DIA_PC_HERO_EXIT_grob1_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_grob1_Condition()
{
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GRAVE)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_grob1_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> CLEAR_K1
//========================================

INSTANCE DIA_PC_HERO_C45_CLEAR_K1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_HERO_C45_CLEAR_K1_Condition;
   information  = DIA_PC_HERO_C45_CLEAR_K1_Info;
   permanent	= FALSE;
   description	= "Oczy�� gr�b";
};

FUNC INT DIA_PC_HERO_C45_CLEAR_K1_Condition()
{
    if (Npc_HasItems (other, It_WodaSwiecona) >=1)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GRAVE)
	&& (MiS_Fire_Novize == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_C45_CLEAR_K1_Info()
{
    print ("Oczyszczono gr�b.");
    b_givexp (200);
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_EXIT_grob2(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition	= DIA_PC_HERO_EXIT_grob2_Condition;
	information	= DIA_PC_HERO_EXIT_grob2_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_grob2_Condition()
{
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GRAVE2)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_grob2_Info()
{
self.aivar[AIV_INVINCIBLE]=FALSE;
PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> CLEAR_K1
//========================================

INSTANCE DIA_PC_HERO_C42_CLEAR_K1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_HERO_C42_CLEAR_K1_Condition;
   information  = DIA_PC_HERO_C42_CLEAR_K1_Info;
   permanent	= FALSE;
   description	= "Oczy�� gr�b.";
};

FUNC INT DIA_PC_HERO_C42_CLEAR_K1_Condition()
{
    if (Npc_HasItems (other, It_WodaSwiecona) >=1)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GRAVE2)
	&& (MiS_Fire_Novize == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_C42_CLEAR_K1_Info()
{
    print ("Oczyszczono gr�b.");
    b_givexp (200);
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_EXIT_grob3(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition	= DIA_PC_HERO_EXIT_grob3_Condition;
	information	= DIA_PC_HERO_EXIT_grob3_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_PC_HERO_EXIT_grob3_Condition()
{
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GRAVE3)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_grob3_Info()
{
	AI_StopProcessInfos	(self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
};
//========================================
//-----------------> CLEAR_K1
//========================================

INSTANCE DIA_PC_HERO_C41_CLEAR_K1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_HERO_C41_CLEAR_K1_Condition;
   information  = DIA_PC_HERO_C41_CLEAR_K1_Info;
   permanent	= FALSE;
   description	= "Oczy�� gr�b.";
};

FUNC INT DIA_PC_HERO_C41_CLEAR_K1_Condition()
{
    if (Npc_HasItems (other, It_WodaSwiecona) >=1)
	&&  (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GRAVE3)
	&& (MiS_Fire_Novize == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_C41_CLEAR_K1_Info()
{
    print ("Oczyszczono gr�b.");
    b_givexp (200);
};