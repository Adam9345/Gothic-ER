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
	description = "Kim jeste�?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //M�wi� na mnie Blizna.
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
	description = "Czym si� zajmujesz?";
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
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Ja i Arto zapewniamy Gomezowi spok�j przed nieproszonymi go��mi.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Opr�cz tego, do moich obowi�zk�w nale�y poskramianie co zadziorniejszych kobiet.
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
	description = "Kiedy mnie tu zrzucano, widzia�em kobiet� opuszczan� na d� wraz z �adunkiem.";
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
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Kiedy mnie tu zrzucano, widzia�em kobiet� opuszczan� na d� wraz z �adunkiem.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //I co z tego?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Jest tutaj?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //S�uchaj, je�li wi��esz z ni� jakie� nadzieje, dam ci dobr� rad�: Zapomnij o niej.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Dopiero co j� dostarczono i Gomez kaza� j� zamkn�� w swojej komnacie.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Jak ju� mu si� znudzi, mo�e przy�le j� tu, na d�. Ale p�ki co, ona nale�y DO NIEGO, wi�c lepiej nie zawracaj sobie ni� g�owy.
	
	if MIS_Women == LOG_RUNNING
	{
	//Log_CreateTopic		(CH1_Women, LOG_MISSION); //fix
	//Log_SetTopicStatus    (CH1_Women, LOG_RUNNING);
    B_LogEntry                (CH1_Women,"Blizna powiedzia� mi, �e tajemnicza kobieta, kt�r� widzia�em jest zamkni�ta w komnacie Gomeza. Jak mu si� znudzi zamierza zes�a� j� na d�. Chyba powinienem przekra�� si� na g�r� i porozmawia� z ni�.");
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
	description = "Co mo�esz mi powiedzie� o Gomezie?";
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
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Co mo�esz mi powiedzie� o Gomezie?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //To najpot�niejszy cz�owiek w ca�ej Kolonii. To ci powinno wystarczy�.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Dostaje wszystko, czego zapragnie, cho� tak naprawd� zale�y mu tylko na w�adzy.
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
    AI_Output (self, other ,"DIA_Scar_Fight_03_01"); //Widz�, �e awansowa�e�. Szybko pniesz si� do g�ry.
    AI_Output (self, other ,"DIA_Scar_Fight_03_02"); //Do bycia Magnatem nie wystarczy ci tylko pomy�lunek i kr�tactwo.
    AI_Output (self, other ,"DIA_Scar_Fight_03_03"); //Musisz by� dobry w walce. A szczerze m�wi�c na takiego nie wygl�dasz.
    AI_Output (other, self ,"DIA_Scar_Fight_15_04"); //Chcesz to sprawdzi�?
    AI_Output (self, other ,"DIA_Scar_Fight_03_05"); //Liczy�em, �e to zaproponujesz.
    AI_Output (self, other ,"DIA_Scar_Fight_03_06"); //Spotkajmy si� na arenie. Dzi� wieczorem.
    AI_Output (other, self ,"DIA_Scar_Fight_15_07"); //No dobra!
    MIS_FightWithScar = LOG_RUNNING;
	
    Log_CreateTopic          (CH1_FightWithScar, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FightWithScar, LOG_RUNNING);
    B_LogEntry               (CH1_FightWithScar,"Blizna zaproponowa� mi pojedynek na arenie dzi� wieczorem.");
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
    AI_Output (self, other ,"DIA_Scar_FightArena_03_01"); //Zobaczmy, na co ci� sta�.
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
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_01"); //Uda�o ci si� mnie pokona�. To doprawdy imponuj�ce!
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_02"); //We� t� rud�. Nale�y ci si�.
        B_LogEntry                     (CH1_FightWithScar,"Pokona�em Blizn� w walce. By� bardzo zadowolony.");
        Log_SetTopicStatus       (CH1_FightWithScar, LOG_SUCCESS);
        MIS_FightWithScar = LOG_SUCCESS;

        B_GiveXP (600);
        CreateInvItems (self, ItMiNugget, 1000);
        B_GiveInvItems (self, other, ItMiNugget, 1000);
    }
    else
    {
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_03"); //Tego si� spodziewa�em. Przegra�e�!
        AI_Output (self, other ,"DIA_Scar_HELLO3_03_04"); //No c�. Musisz jeszcze nad sob� popracowa�.
        B_LogEntry                     (CH1_FightWithScar,"Przegra�em walk�. No c�... Musz� troch� po�wiczy�.");
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
    AI_Output (self, other ,"DIA_Scar_Nakryci_03_01"); //A wi�c to tak! Bra� tych sukinsyn�w!
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