///////////////////////////////////////////////
// 					S
///////////////////////////////////////////////

func void INNOSJO_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_PRAYJO;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};

//////////////////////////////////////////////
// 					CONST
//////////////////////////////////////////////


//////////////////////////////////////////////
// 					FUNC
//////////////////////////////////////////////


///////////////////////////////////////////
// 					EXIT
///////////////////////////////////////////

INSTANCE DIA_PC_HERO_EXIT_InnosJO(C_INFO)
{
	npc             = PC_HERO;
	nr              = 999;
	condition		= DIA_PC_HERO_EXIT_InnosJO_Condition;
	information		= DIA_PC_HERO_EXIT_InnosJO_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_InnosJO_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYJO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_InnosJO_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////
// 					PRAY
///////////////////////////////////////////

INSTANCE DIA_InnosShrine_PrayJO (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_InnosShrine_PrayJO_Condition;
   information  = DIA_InnosShrine_PrayJO_Info;
   permanent	= FALSE;
   description	= "Oczyœæ kaplicê";
};

FUNC INT DIA_InnosShrine_PrayJO_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYJO)
	{
    return TRUE;
	};
};

FUNC VOID DIA_InnosShrine_PrayJO_Info()
{
    Wld_InsertNpc				(DemonKastagir,"WP_JO_SKE_04");
    Snd_Play 	                ("MFX_DESTROYUNDEAD_CAST" );
	Wld_PlayEffect              ("spellFX_MassDeath",hero,DemonKastagir, 0, 0, 0, TRUE);
    Npc_ChangeAttribute(pc_hero,ATR_HITPOINTS,-50);
    B_GiveXP(200);
	
};


