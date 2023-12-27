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
	description = "Szukasz czegoœ?";
};                       

FUNC INT DIA_Homer_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_Hello_Info()
{	
	AI_Output (other, self,"DIA_Homer_Hello_15_00"); //Szukasz czegoœ?
	AI_Output (self, other,"DIA_Homer_Hello_02_01"); //Szukam pêkniêæ w tamie. Chyba jakiœ topielec podgryza jej fundamenty.
	AI_Output (self, other,"DIA_Homer_Hello_02_02"); //Paskuda uszkadza zêbami i pazurami kamienie i drewniane pale pod wod¹.
	AI_Output (self, other,"DIA_Homer_Hello_02_03"); //Jeœli nie przestanie, ca³¹ tamê trafi szlag!
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
	description = "Czy to TY zbudowa³eœ tê tamê?";
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
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //Czy to TY zbudowa³eœ tê tamê?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Tak. Zbudowa³em j¹ dawno temu, gdy Nowy Obóz dopiero powstawa³.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //Oczywiœcie wszyscy pomagali, ale to ja nadzorowa³em budowê.
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
	description = "Mo¿e mogê ci jakoœ pomóc?";
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
	AI_Output (other, self,"DIA_Homer_WannaHelp_15_00"); //Mo¿e mogê ci jakoœ pomóc?
	AI_Output (self, other,"DIA_Homer_WannaHelp_02_01"); //Jasne. Spraw, ¿eby ta bestia przesta³a pod¿eraæ moj¹ tamê.
	
	Homer_DamLurker = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_DamLurker, LOG_MISSION);
	Log_SetTopicStatus	(CH1_DamLurker, LOG_RUNNING);
	B_LogEntry			(CH1_DamLurker, "Homer opowiedzia³ mi o topielcu, który podkopuje jego tamê. Jeœli uda mi siê powstrzymaæ potwora, tamê z pewnoœci¹ uda siê naprawiæ");

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
	description = "Gdzie mogê j¹ znaleŸæ?";
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
	AI_Output (other, self,"DIA_Homer_Running_15_00"); //Gdzie mogê j¹ znaleŸæ?
	AI_Output (self, other,"DIA_Homer_Running_02_01"); //Rozejrzyj siê po drugiej stronie jeziora. Nikt tam nigdy nie zagl¹da. Za³o¿ê siê, ¿e tam ma swoje le¿e!
	
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry	(CH1_DamLurker, "Topielec musi mieæ swoje le¿e w nieuczêszczanej czêœci zbiornika.");
	
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
	description = "Zabi³em bestiê!";
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
	AI_Output			(other, self,"DIA_Homer_Success_15_00"); //Zabi³em bestiê!
	AI_Output			(self, other,"DIA_Homer_Success_02_01"); //Œwietnie! Œci¹gn¹³em tu kilku ludzi Ry¿owego Ksiêcia, którzy pomogli mi naprawiæ uszkodzenia.
	AI_Output			(self, other,"DIA_Homer_Success_02_02"); //Nareszcie mogê siê porz¹dnie wyspaæ.
		
	Homer_DamLurker = 	LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_DamLurker,	LOG_SUCCESS);
	B_LogEntry			(CH1_DamLurker, "Topielec nie ¿yje. Homer mo¿e ju¿ spaæ spokojnie.");
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
	description = "Z tam¹ wszystko w porz¹dku?";
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
	AI_Output (other, self,"DIA_Homer_PERM_15_00"); //Z tam¹ wszystko w porz¹dku?
	AI_Output (self, other,"DIA_Homer_PERM_02_01"); //Mocna jak ska³a. Nic jej nie zaszkodzi!
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
   description	= "Lee w³aœnie przydzielil ci ochronê. Najemnicy bêda mieli na ciebie oko.";
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
    AI_Output (other, self ,"DIA_Homer_PZ_15_01"); //Lee w³aœnie przydzielil ci ochronê. Najemnicy bêda mieli na ciebie oko.
    AI_Output (self, other ,"DIA_Homer_PZ_03_02"); //Dlaczego to?
    AI_Output (other, self ,"DIA_Homer_PZ_15_03"); //Rozbójnicy chc¹ wykraœæ ci cenne dokumenty. Chodzi chocia¿by o plany fortyfikacji obozu.
    AI_Output (self, other ,"DIA_Homer_PZ_03_04"); //A to dranie po co im tego rodzaju pisma?
    AI_Output (other, self ,"DIA_Homer_PZ_15_05"); //Licz¹ na zysk. Chc¹ je odsprzedaæ Magnatom.
    AI_Output (self, other ,"DIA_Homer_PZ_03_06"); //Ale¿ to pod³e... Niedoczekanie ich.
    AI_Output (other, self ,"DIA_Homer_PZ_15_07"); //Mieli tutaj swoj¹ wtyczkê.
    AI_Output (self, other ,"DIA_Homer_PZ_03_08"); //Niby kogo?
    AI_Output (other, self ,"DIA_Homer_PZ_15_09"); //Foster by³ jednym z nich. Okrada³ dla nich innych zbieraczy potem postanowi przestaæ i wtedy kazali mu okraœæ ciebie.
    AI_Output (self, other ,"DIA_Homer_PZ_03_10"); //Foster? Znam go prawie odk¹d tu trafi³. To by³ równy goœæ ale ostatnio ewidentnie coœ go gryz³o. A wiêc o to chodzi³o...
    AI_Output (other, self ,"DIA_Homer_PZ_15_11"); //Czyta³em pewne pismo skierowane do niego. Nie by³o mi³e delikatnie mówi¹c.
    AI_Output (other, self ,"DIA_Homer_PZ_15_12"); //Wpakowa³ siê w to ³ajno sam ale postanowi³ siê poprawiæ. Szanta¿e, groŸby i wyrzuty sumienia to nic mi³ego.
    AI_Output (self, other ,"DIA_Homer_PZ_03_13"); //Zajrzyj do Fostera. Ciekawe jak to znosi skoro wkrótce Lee dobierze mu siê do skóry a jeszcze rozbójnicy w oddali...
    AI_Output (other, self ,"DIA_Homer_PZ_15_14"); //Pogadam z nim.
	Npc_ExchangeRoutine(BAU_924_Foster,"Robber");
	B_KillNpc(BAU_924_Foster);
	Wld_InsertNpc 	(Org_40159_Rozbojnik,        "NC_PATH_PEASANT");
	B_LogEntry           (PoszkodowaniZbieracze,"Powiedzia³em Homerowi o zaistnia³ej sytuacji. By³ zaskoczony i rozbójnikami i postaw¹ Fostera, którego doœæ d³ugo zna³. Pora bym zajrza³ do tego zbieracza.");
    AI_StopProcessInfos	(self);
};

