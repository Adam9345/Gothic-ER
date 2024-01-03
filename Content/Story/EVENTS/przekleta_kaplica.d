// *Script was make in Easy Dialog Maker (EDM)
// *Script was make in Easy Dialog Maker (EDM)
func void kaplica_przekleta_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_KAPLICA;
		self.aivar[AIV_INVINCIBLE]=TRUE;
		Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_C47_EXIT_Przekleta_kaplica(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition		= DIA_PC_HERO_C47_EXIT_Przekleta_kaplica_Condition;
	information		= DIA_PC_HERO_C47_EXIT_Przekleta_kaplica_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_C47_EXIT_Przekleta_kaplica_Condition()
{
if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_KAPLICA)
{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_C47_EXIT_Przekleta_kaplica_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CLEAR_K1
//========================================

INSTANCE DIA_PC_HERO_C47_CLEAR_K1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_HERO_C47_CLEAR_K1_Condition;
   information  = DIA_PC_HERO_C47_CLEAR_K1_Info;
   permanent	= FALSE;
   description	= "(Oczyœæ o³tarz)";
};

FUNC INT DIA_PC_HERO_C47_CLEAR_K1_Condition()
{
    if (Npc_HasItems (other, It_WodaSwiecona) >=1)
	&& (PLAYER_MOBSI_PRODUCTION	==	MOBSI_KAPLICA)
	&& (MiS_Fire_Novize == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_C47_CLEAR_K1_Info()
{
    b_givexp (50);
	kaplica_oczyszczona = true;
};


