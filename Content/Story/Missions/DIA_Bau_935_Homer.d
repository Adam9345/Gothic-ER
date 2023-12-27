//poprawione i sprawdzone -  

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Homer_EXIT (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 999;
	condition	= DIA_Homer_EXIT_Condition;
	information	= DIA_Homer_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Homer_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Homer_Hello (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_Hello_Condition;
	information	= DIA_Homer_Hello_Info;
	permanent	= 0;
	description = "Szukasz czego�?";
};                       

FUNC INT DIA_Homer_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_Hello_Info()
{	
	AI_Output (other, self,"DIA_Homer_Hello_15_00"); //Szukasz czego�?
	AI_Output (self, other,"DIA_Homer_Hello_02_01"); //Szukam p�kni�� w tamie. Chyba jaki� topielec podgryza jej fundamenty.
	AI_Output (self, other,"DIA_Homer_Hello_02_02"); //Paskuda uszkadza z�bami i pazurami kamienie i drewniane pale pod wod�.
	AI_Output (self, other,"DIA_Homer_Hello_02_03"); //Je�li nie przestanie, ca�� tam� trafi szlag!
};

// ************************************************************
// 						Damm gebaut
// ************************************************************

INSTANCE DIA_Homer_BuiltDam (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_BuiltDam_Condition;
	information	= DIA_Homer_BuiltDam_Info;
	permanent	= 0;
	description = "Czy to TY zbudowa�e� t� tam�?";
};                       

FUNC INT DIA_Homer_BuiltDam_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Homer_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_BuiltDam_Info()
{	
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //Czy to TY zbudowa�e� t� tam�?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Tak. Zbudowa�em j� dawno temu, gdy Nowy Ob�z dopiero powstawa�.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //Oczywi�cie wszyscy pomagali, ale to ja nadzorowa�em budow�.
};

// ************************************************************
// 						Kann ich helfen?
// ************************************************************
	var int Homer_DamLurker;
// ************************************************************

INSTANCE DIA_Homer_WannaHelp (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_WannaHelp_Condition;
	information	= DIA_Homer_WannaHelp_Info;
	permanent	= 0;
	description = "Mo�e mog� ci jako� pom�c?";
};                       

FUNC INT DIA_Homer_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Homer_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_WannaHelp_Info()
{	
	AI_Output (other, self,"DIA_Homer_WannaHelp_15_00"); //Mo�e mog� ci jako� pom�c?
	AI_Output (self, other,"DIA_Homer_WannaHelp_02_01"); //Jasne. Spraw, �eby ta bestia przesta�a pod�era� moj� tam�.
	
	Homer_DamLurker = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_DamLurker, LOG_MISSION);
	Log_SetTopicStatus	(CH1_DamLurker, LOG_RUNNING);
	B_LogEntry			(CH1_DamLurker, "Homer opowiedzia� mi o topielcu, kt�ry podkopuje jego tam�. Je�li uda mi si� powstrzyma� potwora, tam� z pewno�ci� uda si� naprawi�");

};

// ************************************************************
// 						Running
// ************************************************************

INSTANCE DIA_Homer_Running (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_Running_Condition;
	information	= DIA_Homer_Running_Info;
	permanent	= 0;
	description = "Gdzie mog� j� znale��?";
};                       

FUNC INT DIA_Homer_Running_Condition()
{
	if (Homer_DamLurker == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Running_Info()
{	
	AI_Output (other, self,"DIA_Homer_Running_15_00"); //Gdzie mog� j� znale��?
	AI_Output (self, other,"DIA_Homer_Running_02_01"); //Rozejrzyj si� po drugiej stronie jeziora. Nikt tam nigdy nie zagl�da. Za�o�� si�, �e tam ma swoje le�e!
	
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry	(CH1_DamLurker, "Topielec musi mie� swoje le�e w nieucz�szczanej cz�ci zbiornika.");
	
};

// ************************************************************
// 						Success
// ************************************************************

INSTANCE DIA_Homer_Success (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_Success_Condition;
	information	= DIA_Homer_Success_Info;
	permanent	= 0;
	description = "Zabi�em besti�!";
};                       

FUNC INT DIA_Homer_Success_Condition()
{
	var C_NPC lurker; lurker = Hlp_GetNpc(DamLurker);
	PrintDebugString(PD_MISSION, "name: ", lurker.name);
	PrintDebugInt	(PD_MISSION, "hp: ", lurker.attribute[ATR_HITPOINTS]);
	if	(Homer_DamLurker==LOG_RUNNING)
	//&&	(Npc_IsDead(lurker))					//SN: auskommentiert, da Hlp_GetNpc() die C_NPC lurker nicht initialisieren kann!
	&&	(Npc_HasItems(hero,ItAt_DamLurker_01))		//SN: Workaround!
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Success_Info()
{	
	AI_Output			(other, self,"DIA_Homer_Success_15_00"); //Zabi�em besti�!
	AI_Output			(self, other,"DIA_Homer_Success_02_01"); //�wietnie! �ci�gn��em tu kilku ludzi Ry�owego Ksi�cia, kt�rzy pomogli mi naprawi� uszkodzenia.
	AI_Output			(self, other,"DIA_Homer_Success_02_02"); //Nareszcie mog� si� porz�dnie wyspa�.
		
	Homer_DamLurker = 	LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_DamLurker,	LOG_SUCCESS);
	B_LogEntry			(CH1_DamLurker, "Topielec nie �yje. Homer mo�e ju� spa� spokojnie.");
	B_GiveXP			(XP_ReportDeadDamLurker);
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"START");
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Homer_PERM (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_PERM_Condition;
	information	= DIA_Homer_PERM_Info;
	permanent	= 1;
	description = "Z tam� wszystko w porz�dku?";
};                       

FUNC INT DIA_Homer_PERM_Condition()
{
	if (Homer_DamLurker ==LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_PERM_Info()
{	
	AI_Output (other, self,"DIA_Homer_PERM_15_00"); //Z tam� wszystko w porz�dku?
	AI_Output (self, other,"DIA_Homer_PERM_02_01"); //Mocna jak ska�a. Nic jej nie zaszkodzi!
};
//========================================
//-----------------> PZ
//========================================

INSTANCE DIA_Homer_PZ (C_INFO)
{
   npc          = Bau_935_Homer;
   nr           = 1;
   condition    = DIA_Homer_PZ_Condition;
   information  = DIA_Homer_PZ_Info;
   permanent	= FALSE;
   description	= "Lee w�a�nie przydzielil ci ochron�. Najemnicy b�da mieli na ciebie oko.";
};

FUNC INT DIA_Homer_PZ_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_PZ_Problem))
{
    return TRUE;
};
};
FUNC VOID DIA_Homer_PZ_Info()
{
    AI_Output (other, self ,"DIA_Homer_PZ_15_01"); //Lee w�a�nie przydzielil ci ochron�. Najemnicy b�da mieli na ciebie oko.
    AI_Output (self, other ,"DIA_Homer_PZ_03_02"); //Dlaczego to?
    AI_Output (other, self ,"DIA_Homer_PZ_15_03"); //Rozb�jnicy chc� wykra�� ci cenne dokumenty. Chodzi chocia�by o plany fortyfikacji obozu.
    AI_Output (self, other ,"DIA_Homer_PZ_03_04"); //A to dranie po co im tego rodzaju pisma?
    AI_Output (other, self ,"DIA_Homer_PZ_15_05"); //Licz� na zysk. Chc� je odsprzeda� Magnatom.
    AI_Output (self, other ,"DIA_Homer_PZ_03_06"); //Ale� to pod�e... Niedoczekanie ich.
    AI_Output (other, self ,"DIA_Homer_PZ_15_07"); //Mieli tutaj swoj� wtyczk�.
    AI_Output (self, other ,"DIA_Homer_PZ_03_08"); //Niby kogo?
    AI_Output (other, self ,"DIA_Homer_PZ_15_09"); //Foster by� jednym z nich. Okrada� dla nich innych zbieraczy potem postanowi przesta� i wtedy kazali mu okra�� ciebie.
    AI_Output (self, other ,"DIA_Homer_PZ_03_10"); //Foster? Znam go prawie odk�d tu trafi�. To by� r�wny go�� ale ostatnio ewidentnie co� go gryz�o. A wi�c o to chodzi�o...
    AI_Output (other, self ,"DIA_Homer_PZ_15_11"); //Czyta�em pewne pismo skierowane do niego. Nie by�o mi�e delikatnie m�wi�c.
    AI_Output (other, self ,"DIA_Homer_PZ_15_12"); //Wpakowa� si� w to �ajno sam ale postanowi� si� poprawi�. Szanta�e, gro�by i wyrzuty sumienia to nic mi�ego.
    AI_Output (self, other ,"DIA_Homer_PZ_03_13"); //Zajrzyj do Fostera. Ciekawe jak to znosi skoro wkr�tce Lee dobierze mu si� do sk�ry a jeszcze rozb�jnicy w oddali...
    AI_Output (other, self ,"DIA_Homer_PZ_15_14"); //Pogadam z nim.
	Npc_ExchangeRoutine(BAU_924_Foster,"Robber");
	B_KillNpc(BAU_924_Foster);
	Wld_InsertNpc 	(Org_40159_Rozbojnik,        "NC_PATH_PEASANT");
	B_LogEntry           (PoszkodowaniZbieracze,"Powiedzia�em Homerowi o zaistnia�ej sytuacji. By� zaskoczony i rozb�jnikami i postaw� Fostera, kt�rego do�� d�ugo zna�. Pora bym zajrza� do tego zbieracza.");
    AI_StopProcessInfos	(self);
};

