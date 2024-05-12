//poprawione i sprawdzone -  

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Mówi¹ na mnie Blizna.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "Czym siê zajmujesz?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Ja i Arto zapewniamy Gomezowi spokój przed nieproszonymi goœæmi.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Oprócz tego, do moich obowi¹zków nale¿y poskramianie co zadziorniejszych kobiet.
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "Kiedy mnie tu zrzucano, widzia³em kobietê opuszczan¹ na dó³ wraz z ³adunkiem.";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Kiedy mnie tu zrzucano, widzia³em kobietê opuszczan¹ na dó³ wraz z ³adunkiem.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //I co z tego?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Jest tutaj?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //S³uchaj, jeœli wi¹¿esz z ni¹ jakieœ nadzieje, dam ci dobr¹ radê: Zapomnij o niej.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Dopiero co j¹ dostarczono i Gomez kaza³ j¹ zamkn¹æ w swojej komnacie.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Jak ju¿ mu siê znudzi, mo¿e przyœle j¹ tu, na dó³. Ale póki co, ona nale¿y DO NIEGO, wiêc lepiej nie zawracaj sobie ni¹ g³owy.
	
	if MIS_Women == LOG_RUNNING
	{
	//Log_CreateTopic		(CH1_Women, LOG_MISSION); //fix
	//Log_SetTopicStatus    (CH1_Women, LOG_RUNNING);
    B_LogEntry                (CH1_Women,"Blizna powiedzia³ mi, ¿e tajemnicza kobieta, któr¹ widzia³em jest zamkniêta w komnacie Gomeza. Jak mu siê znudzi zamierza zes³aæ j¹ na dó³. Chyba powinienem przekraœæ siê na górê i porozmawiaæ z ni¹.");
	};
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 0;
	description = "Co mo¿esz mi powiedzieæ o Gomezie?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Co mo¿esz mi powiedzieæ o Gomezie?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //To najpotê¿niejszy cz³owiek w ca³ej Kolonii. To ci powinno wystarczyæ.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Dostaje wszystko, czego zapragnie, choæ tak naprawdê zale¿y mu tylko na w³adzy.
};
//========================================
//-----------------> Fight
//========================================

INSTANCE DIA_Scar_Fight (C_INFO)
{
   npc          = Ebr_101_Scar;
   nr           = 1;
   condition    = DIA_Scar_Fight_Condition;
   information  = DIA_Scar_Fight_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Scar_Fight_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_EBR)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scar_Fight_Info()
{
    AI_Output (self, other ,"DIA_Scar_Fight_03_01"); //Widzê, ¿e awansowa³eœ. Szybko pniesz siê do góry.
    AI_Output (self, other ,"DIA_Scar_Fight_03_02"); //Do bycia Magnatem nie wystarczy ci tylko pomyœlunek i krêtactwo.
    AI_Output (self, other ,"DIA_Scar_Fight_03_03"); //Musisz byæ dobry w walce. A szczerze mówi¹c na takiego nie wygl¹dasz.
    AI_Output (other, self ,"DIA_Scar_Fight_15_04"); //Chcesz to sprawdziæ?
    AI_Output (self, other ,"DIA_Scar_Fight_03_05"); //Liczy³em, ¿e to zaproponujesz.
    AI_Output (self, other ,"DIA_Scar_Fight_03_06"); //Spotkajmy siê na arenie. Dziœ wieczorem.
    AI_Output (other, self ,"DIA_Scar_Fight_15_07"); //No dobra!
    MIS_FightWithScar = LOG_RUNNING;
	
    Log_CreateTopic          (CH1_FightWithScar, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FightWithScar, LOG_RUNNING);
    B_LogEntry               (CH1_FightWithScar,"Blizna zaproponowa³ mi pojedynek na arenie dziœ wieczorem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FightArena
//========================================

INSTANCE DIA_Scar_FightArena (C_INFO)
{
   npc          = Ebr_101_Scar;
   nr           = 2;
   condition    = DIA_Scar_FightArena_Condition;
   information  = DIA_Scar_FightArena_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Scar_FightArena_Condition()
{
    if (MIS_FightWithScar == LOG_RUNNING)
    && (Npc_GetDistToWP (self, "OCR_ARENABATTLE_TRAIN") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scar_FightArena_Info()
{
    AI_Output (self, other ,"DIA_Scar_FightArena_03_01"); //Zobaczmy, na co ciê staæ.
    AI_StopProcessInfos	(self);
    self.npctype = npctype_FRIEND;
    Npc_ExchangeRoutine(self,"START");
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Scar_HELLO3 (C_INFO)
{
   npc          = Ebr_101_Scar;
   nr           = 3;
   condition    = DIA_Scar_HELLO3_Condition;
   information  = DIA_Scar_HELLO3_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Scar_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Scar_FightArena))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scar_HELLO3_Info()
{
    if (Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_01"); //Uda³o ci siê mnie pokonaæ. To doprawdy imponuj¹ce!
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_02"); //WeŸ tê rudê. Nale¿y ci siê.
        B_LogEntry                     (CH1_FightWithScar,"Pokona³em Bliznê w walce. By³ bardzo zadowolony.");
        Log_SetTopicStatus       (CH1_FightWithScar, LOG_SUCCESS);
        MIS_FightWithScar = LOG_SUCCESS;

        B_GiveXP (600);
        CreateInvItems (self, ItMiNugget, 1000);
        B_GiveInvItems (self, other, ItMiNugget, 1000);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_03"); //Tego siê spodziewa³em. Przegra³eœ!
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_04"); //No có¿. Musisz jeszcze nad sob¹ popracowaæ.
        B_LogEntry                     (CH1_FightWithScar,"Przegra³em walkê. No có¿... Muszê trochê poæwiczyæ.");
        Log_SetTopicStatus       (CH1_FightWithScar, LOG_FAILED);
        MIS_FightWithScar = LOG_FAILED;
    };
};

//========================================
//-----------------> Nakryci
//========================================

INSTANCE DIA_Scar_Nakryci (C_INFO)
{
   npc          = Ebr_101_Scar;
   nr           = 1;
   condition    = DIA_Scar_Nakryci_Condition;
   information  = DIA_Scar_Nakryci_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Scar_Nakryci_Condition()
{
    if (guardians_scar == true)
    && (Npc_GetDistToWP (self, "INNOS_BENCH2_OC") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scar_Nakryci_Info()
{
    AI_Output (self, other ,"DIA_Scar_Nakryci_03_01"); //A wiêc to tak! Braæ tych sukinsynów!
	AI_StopProcessInfos	(self);
    Npc_SetTarget (SLD_704_Blade, Ebr_101_Scar);
    AI_StartState (SLD_704_Blade, ZS_ATTACK, 1, "");
	
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

    Npc_SetPermAttitude (GRD_8800_Gardist, ATT_HOSTILE);

    Npc_SetPermAttitude (GRD_8801_Gardist, ATT_HOSTILE);

};

instance dia_scar_pickpocket(c_info) {
    npc = ebr_101_scar;
    nr = 900;
    condition = dia_scar_pickpocket_condition;
    information = dia_scar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_scar_pickpocket_condition() {
	e_beklauen(baseThfChanceEBR, 45);
};

func void dia_scar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_scar_pickpocket);
	info_addchoice(dia_scar_pickpocket, dialog_back, dia_scar_pickpocket_back);
	info_addchoice(dia_scar_pickpocket, dialog_pickpocket, dia_scar_pickpocket_doit);
};

func void dia_scar_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_scar_pickpocket);
};

func void dia_scar_pickpocket_back() {
    info_clearchoices(dia_scar_pickpocket);
};