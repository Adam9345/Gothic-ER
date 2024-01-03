
func void PC_TimeTravel (var int t)
{
	AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gewährleisten
	self.aivar[AIV_INVINCIBLE]=FALSE;
	if	(Wld_IsTime(00,00,t,00))	
	{
		Wld_SetTime	(t,00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime	(t,00);
	};
	
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;

	//-------- AssessEnterRoom-Wahrnehmung versenden --------
	PrintGlobals		(PD_ITEM_MOBSI);
	//Npc_SendPassivePerc	(hero,	PERC_ASSESSENTERROOM, NULL, hero);		//...damit der Spieler dieses Feature nicht zum Hütteplündern ausnutzt!
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_TravelFast_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_Hero_TravelFast_EXIT_Condition;
	information		= DIA_PC_Hero_TravelFast_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_TravelFast_EXIT_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_FastTravel)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_TravelFast_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	AI_StopProcessInfos	(self);
};

var int traveltime;
//========================================
//-----------------> JustTravel
//========================================

INSTANCE DIA_PC_Hero_JustTravel (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_JustTravel_Condition;
   information  = DIA_PC_Hero_JustTravel_Info;
   permanent	= true;
   description	= "(Podró¿uj)";
};

FUNC INT DIA_PC_Hero_JustTravel_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_FastTravel) && (FastTravel_Locked == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_JustTravel_Info()
{
var int obecna_godzina;
obecna_godzina = Wld_GetHour ();
traveltime = obecna_godzina + 2;
	//traveltime = Hlp_Random( 23 );
    Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	Info_AddChoice			(DIA_PC_Hero_JustTravel, DIALOG_BACK, DIA_PC_Hero_JustTravel_Back);
	if (loc_citadel == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Cytadela", DIA_PC_Hero_JustTravel_citadel);
	};
	if (loc_cavalorn == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Chata Cavalorna", DIA_PC_Hero_JustTravel_cavalorn);
	};
	if (loc_aidan == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Chata Aidana", DIA_PC_Hero_JustTravel_aidan);
	};
	if (loc_klasztor == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Most przy klasztorze", DIA_PC_Hero_JustTravel_klasztor);
	};
	if (loc_fogtower == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Wie¿a Mgie³", DIA_PC_Hero_JustTravel_fogtower);
	};
	if (loc_klify == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Klify", DIA_PC_Hero_JustTravel_klify);
	};
	if (loc_psicamp == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Obóz Bractwa", DIA_PC_Hero_JustTravel_psicamp);
	};
	if (loc_swamp == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Bagno", DIA_PC_Hero_JustTravel_swamp);
	};
	if (loc_forest == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Wielki las", DIA_PC_Hero_JustTravel_forest);
	};
	if (loc_orcdesert == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Ziemie Orków", DIA_PC_Hero_JustTravel_orcdesert);
	};
	if (loc_OC == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Stary Obóz", DIA_PC_Hero_JustTravel_OC);
	};
	if (loc_ricefields == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Pola ry¿owe", DIA_PC_Hero_JustTravel_ricefields);
	};
	if (loc_NC_cave == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Nowy Obóz - jaskinia", DIA_PC_Hero_JustTravel_NCcave);
	};
	if (loc_FMC == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Kocio³", DIA_PC_Hero_JustTravel_FMC);
	};
	if (loc_OMC == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Stara Kopalnia", DIA_PC_Hero_JustTravel_OMC);
	};
	if (loc_QC == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Obóz Quentina", DIA_PC_Hero_JustTravel_QC);
	};
	if (loc_hunters == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Obóz myœliwych", DIA_PC_Hero_JustTravel_hunters);
	};
	if (loc_orchunters == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Obóz ³owców", DIA_PC_Hero_JustTravel_orchunters);
	};
	if (loc_abmine == true)
    {
    Info_AddChoice		(DIA_PC_Hero_JustTravel, "Opuszczona kopalnia", DIA_PC_Hero_JustTravel_abmine);
	};
};

func void DIA_PC_Hero_JustTravel_Back ()
{
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
};

func void DIA_PC_Hero_JustTravel_FMC ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "FMC_PATH06");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
	
};

func void DIA_PC_Hero_JustTravel_OC ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_PATH_1");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_ricefields ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "NC_PATH55");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_NCcave ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "NC_PATH_TO_PIT_04");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_OMC ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_OM_ENTRANCE01");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_QC ()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_AkcjaUkonczona)) && (!Npc_KnowsInfo (hero, DIA_Quentin_54))
	{
	PrintS_Ext ("Szybka podró¿ chwilowo niedostêpna!",COL_Red) ;
	}
	else
	{
	 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "LOCATION_11_06");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
	};
};

func void DIA_PC_Hero_JustTravel_hunters ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "SPAWN_TALL_PATH_BANDITOS2");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_orchunters ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "HUNTERS_LADDERR2");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_abmine ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_PATH_1_17");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_citadel ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "CASTLE_19");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_cavalorn ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "PATH_OC_NC_4");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_aidan ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "PATH_OC_NC_14");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_klasztor ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_PATH_BRIDGE_01");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_fogtower ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_PATH_174");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_klify ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "PATH_FOGTOWER_CLIFF04");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_psicamp ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "PSI_ENTRANCE");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_swamp ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_PATH_BLOODFLY08_SPAWN01");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_forest ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_PATH_292");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

func void DIA_PC_Hero_JustTravel_orcdesert ()
{
 Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	PC_TimeTravel (traveltime);
	AI_Teleport		(hero, "OW_ORC_LOOKOUT_2_02_MOVE2");
	Info_ClearChoices		(DIA_PC_Hero_JustTravel);
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};