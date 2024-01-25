//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_BanditGhost_EXIT(C_INFO)
{
	npc             = WD_7049_BanditGhost;
	nr              = 999;
	condition	= DIA_BanditGhost_EXIT_Condition;
	information	= DIA_BanditGhost_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_BanditGhost_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BanditGhost_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> IMPORTANT
//========================================

INSTANCE DIA_BanditGhost_IMPORTANT (C_INFO)
{
   npc          = WD_7049_BanditGhost;
   nr           = 1;
   condition    = DIA_BanditGhost_IMPORTANT_Condition;
   information  = DIA_BanditGhost_IMPORTANT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BanditGhost_IMPORTANT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GhostKinggardist_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BanditGhost_IMPORTANT_Info()
{
    AI_Output (self, other ,"DIA_BanditGhost_IMPORTANT_03_01"); //Czego tu szukasz?
    AI_Output (other, self ,"DIA_BanditGhost_IMPORTANT_15_02"); //Kim jesteœ, zjawo?! 
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_BanditGhost_IMPORTANT_03_03"); //Jestem Krwawy Ruben. Najwiêkszy rabuœ rudy jakiego ta ziemia nosi³a! 
    AI_Output (self, other ,"DIA_BanditGhost_IMPORTANT_03_04"); //OdejdŸ st¹d pókim dobry!
    AI_Output (other, self ,"DIA_BanditGhost_IMPORTANT_15_05"); //Przyszed³em po coœ, co nie nale¿y do ciebie! 
    AI_Output (self, other ,"DIA_BanditGhost_IMPORTANT_03_06"); //Chodzi ci o ten tobo³ek? Ach! Czu³em, ¿e ktoœ mnie szuka.
    AI_Output (self, other ,"DIA_BanditGhost_IMPORTANT_03_07"); //NIKT nie bêdzie rozkazywa³ wielkiemu Rubenowi.
    AI_Output (self, other ,"DIA_BanditGhost_IMPORTANT_03_08"); //Braæ go, ch³opcy!
    AI_StopProcessInfos	(self);
	
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
	
	Wld_InsertNpc				(WD_7052_RubensBandit,"RUBEN_FRIEND1");	
	SetGhost(WD_7052_RubensBandit, 60);
	Npc_SetAttitude 	(WD_7052_RubensBandit, ATT_HOSTILE);
	
	
	Wld_InsertNpc				(WD_7054_RubensBandit,"RUBEN_FRIEND2");	
	SetGhost(WD_7054_RubensBandit, 60);
	Npc_SetTempAttitude (WD_7054_RubensBandit, ATT_HOSTILE);	

};
