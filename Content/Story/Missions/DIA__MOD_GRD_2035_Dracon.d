//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Dracon_EXIT(C_INFO)
{
	npc             = GRD_2035_Dracon;
	nr              = 999;
	condition	= DIA_Dracon_EXIT_Condition;
	information	= DIA_Dracon_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Dracon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dracon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Dracon_HELLO (C_INFO)
{
   npc          = GRD_2035_Dracon;
   nr           = 1;
   condition    = DIA_Dracon_HELLO_Condition;
   information  = DIA_Dracon_HELLO_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Dracon_HELLO_Condition()
{
    if (kapitel == 10)
	//(Npc_GetTrueGuild(hero) != GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dracon_HELLO_Info()
{
    AI_Output (self, other ,"DIA_Dracon_HELLO_03_01"); //Nie mo¿esz tutaj wejœæ! Wynoœ siê.
    AI_Output (other, self ,"DIA_Dracon_HELLO_15_02"); //Gdzie mogê têdy dojœæ?
    AI_Output (self, other ,"DIA_Dracon_HELLO_03_03"); //Do magazynu. IdŸ ju¿.
	AI_GotoWP (hero, "PATROL2");
	AI_StopProcessInfos	(self);
};

CONST STRING	Grd_Dracon_CHECKPOINT		= "PATROL1";

//***************************************************************
// STRA¯NIK MAGAZYNU W KOPALNI Dracon
// Atakuje, gdy podchodzimy do magazynu. 
//***************************************************************

INSTANCE Info_Grd_2035_FirstWarn (C_INFO)
{
	npc			= GRD_2035_Dracon;
	nr			= 1;
	condition	= Info_Grd_2035_FirstWarn_Condition;
	information	= Info_Grd_2035_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};  

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
FUNC INT Info_Grd_2035_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), "PATROL1")		))
	&&  (Npc_GetTrueGuild(hero) != GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Grd_2035_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Grd_2035_FirstWarn_Info_13_01"); //STÓJ!
	AI_Output (hero, self,"Info_Grd_2035_FirstWarn_Info_15_02"); //O co chodzi?
	AI_Output (self, hero,"Info_Grd_2035_FirstWarn_Info_13_03"); //Nie wolno ci wejœæ do magazynu. Wstêp do niego maj¹ wy³¹cznie Stra¿nicy.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Grd_Dracon_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
	AI_GotoWP (hero, "PATROL2");
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
INSTANCE Info_Grd_2035_LastWarn (C_INFO)
{
	npc			= GRD_2035_Dracon;
	nr			= 1;
	condition	= Info_Grd_2035_LastWarn_Condition;
	information	= Info_Grd_2035_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_2035_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_Dracon_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	&&  (Npc_GetTrueGuild(hero) != GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return TRUE;
	};
};

func int Info_Grd_2035_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Grd_2035_LastWarn_13_01"); 		//Og³uch³eœ? Jeszcze jeden krok, a nakarmiê tob¹ robaki!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Grd_Dracon_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	AI_GotoWP (hero, "PATROL2");
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
INSTANCE Info_Grd_2035_Attack (C_INFO)
{
	npc			= GRD_2035_Dracon;
	nr			= 1;
	condition	= Info_Grd_2035_Attack_Condition;
	information	= Info_Grd_2035_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_2035_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_Dracon_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	&&  (Npc_GetTrueGuild(hero) != GIL_GRD) //|| (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 			TRUE;
	};
};

func int Info_Grd_2035_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};


//========================================
//-----------------> PRZYLAPANI
//========================================

INSTANCE DIA_Dracon_PRZYLAPANI (C_INFO)
{
   npc          = GRD_2035_Dracon;
   nr           = 2;
   condition    = DIA_Dracon_PRZYLAPANI_Condition;
   information  = DIA_Dracon_PRZYLAPANI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dracon_PRZYLAPANI_Condition()
{
    if (MIS_ActionOM == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dracon_PRZYLAPANI_Info()
{
    AI_Output (self, other ,"DIA_Dracon_PRZYLAPANI_03_01"); //Nie wiem, co zrobiliœcie, ale coœ mi tu œmierdzi.
    AI_Output (other, self ,"DIA_Dracon_PRZYLAPANI_15_02"); //Chyba mnie z kimœ pomyli³eœ. 
    AI_Output (other, self ,"DIA_Dracon_PRZYLAPANI_15_03"); //Ja tutaj ciê¿ko pracujê.
    AI_Output (self, other ,"DIA_Dracon_PRZYLAPANI_03_04"); //Tak, tak. Uwa¿aj, ¿ebyœ siê nie przepracowa³.
};

//========================================
//-----------------> HOW_YOU
//========================================

INSTANCE DIA_Dracon_HOW_YOU (C_INFO)
{
   npc          = GRD_2035_Dracon;
   nr           = 1;
   condition    = DIA_Dracon_HOW_YOU_Condition;
   information  = DIA_Dracon_HOW_YOU_Info;
   permanent	= FALSE;
   description	= "Jak siê miewasz?";
};

FUNC INT DIA_Dracon_HOW_YOU_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Dracon_HOW_YOU_Info()
{
    AI_Output (other, self ,"DIA_Dracon_HOW_YOU_15_01"); //Jak siê miewasz?
    AI_Output (self, other ,"DIA_Dracon_HOW_YOU_03_02"); //Gówno ci do tego szczylu.
    AI_Output (other, self ,"DIA_Dracon_HOW_YOU_15_03"); //Krótka i zwiêz³a odpowiedŸ.
    AI_Output (self, other ,"DIA_Dracon_HOW_YOU_03_04"); //Jak sztylet, który mogê ci wbiæ w ³eb jeœli mi podpadniesz.
    AI_Output (other, self ,"DIA_Dracon_HOW_YOU_15_05"); //Ooo przeszed³eœ do konkretów.
    AI_Output (self, other ,"DIA_Dracon_HOW_YOU_03_06"); //Jeszcze nie. Ale radzê bym nie musia³ tego robiæ.
    AI_Output (other, self ,"DIA_Dracon_HOW_YOU_15_07"); //By³bym wdziêczny.
    AI_Output (self, other ,"DIA_Dracon_HOW_YOU_03_08"); //A teraz spadaj st¹d!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatItInMagazine
//========================================

INSTANCE DIA_Dracon_WhatItInMagazine (C_INFO)
{
   npc          = GRD_2035_Dracon;
   nr           = 1;
   condition    = DIA_Dracon_WhatItInMagazine_Condition;
   information  = DIA_Dracon_WhatItInMagazine_Info;
   permanent	= FALSE;
   description	= "Co jest w tym magazynie?";
};

FUNC INT DIA_Dracon_WhatItInMagazine_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Dracon_WhatItInMagazine_Info()
{
    AI_Output (other, self ,"DIA_Dracon_WhatItInMagazine_15_01"); //Co jest w tym magazynie?
    AI_Output (self, other ,"DIA_Dracon_WhatItInMagazine_03_02"); //Chcia³byœ wiedzieæ przyb³êdo!
    AI_Output (self, other ,"DIA_Dracon_WhatItInMagazine_03_03"); //Nigdy tam nie wlezierz. £apy z dala od tego.
    AI_Output (self, other ,"DIA_Dracon_WhatItInMagazine_03_04"); //A teraz won!
    AI_Output (other, self ,"DIA_Dracon_WhatItInMagazine_15_05"); //Niech bêdzie. Uprzejmoœæ to twój dar....
	AI_StopProcessInfos	(self);
};

instance dia_dracon_pickpocket(c_info) {
    npc = grd_2035_dracon;
    nr = 900;
    condition = dia_dracon_pickpocket_condition;
    information = dia_dracon_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_dracon_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_dracon_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_dracon_pickpocket);
	info_addchoice(dia_dracon_pickpocket, dialog_back, dia_dracon_pickpocket_back);
	info_addchoice(dia_dracon_pickpocket, dialog_pickpocket, dia_dracon_pickpocket_doit);
};

func void dia_dracon_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_dracon_pickpocket);
};

func void dia_dracon_pickpocket_back() {
    info_clearchoices(dia_dracon_pickpocket);
};