func void Mod_GhostAltar_Demon_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_GHOSTALTAR;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};

//========================================MOBSI_GHOSTALTAR
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_HERO_EXIT_GhostAltar(C_INFO)
{
	npc             		= PC_HERO;
	nr              		= 999;
	condition			= DIA_PC_HERO_EXIT_GhostAltar_Condition;
	information		= DIA_PC_HERO_EXIT_GhostAltar_Info;
	permanent		= TRUE;
	description     	= DIALOG_ENDE;
};

FUNC INT DIA_PC_HERO_EXIT_GhostAltar_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GHOSTALTAR)
	{
    return TRUE;
	};
};

FUNC VOID DIA_PC_HERO_EXIT_GhostAltar_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RecallGhosts
//========================================

INSTANCE DIA_PC_HERO_RecallGhosts (C_INFO)
{
   npc          = PC_HERO;
   nr           = 1;
   condition    = DIA_PC_HERO_RecallGhosts_Condition;
   information  = DIA_PC_HERO_RecallGhosts_Info;
   permanent	= true;
   description	= "(Przywo³aj ducha)";
};

FUNC INT DIA_PC_HERO_RecallGhosts_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GHOSTALTAR)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_HERO_RecallGhosts_Info()
{
    Info_ClearChoices		(DIA_PC_HERO_RecallGhosts);
    Info_AddChoice		(DIA_PC_HERO_RecallGhosts, DIALOG_BACK, DIA_PC_HERO_RecallGhosts_BACK);
	if (Npc_HasItems (hero, ItMi_FattersInPocket) >=1)
	{
    Info_AddChoice		(DIA_PC_HERO_RecallGhosts, "Felgor, ¯elazna Garota", DIA_PC_HERO_RecallGhosts_FELGOR);
	};
    ///Info_AddChoice		(DIA_PC_HERO_RecallGhosts, "Rayan, Bandyta", DIA_PC_HERO_RecallGhosts_RAYAN);
};

FUNC VOID DIA_PC_HERO_RecallGhosts_BACK()
{
    Info_ClearChoices		(DIA_PC_HERO_RecallGhosts);
};

FUNC VOID DIA_PC_HERO_RecallGhosts_FELGOR()
{
//Npc_RemoveInvItems (hero, ItMi_FattersInPocket,1);
Wld_InsertNPC	(NON_7055_Felgor,"GHOST_SPAWN_XT");
SetGhost(NON_7055_Felgor, 60);
};

FUNC VOID DIA_PC_HERO_RecallGhosts_RAYAN()
{
};

