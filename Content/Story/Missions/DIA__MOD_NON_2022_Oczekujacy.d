//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Oczekujacy_EXIT(C_INFO)
{
	npc             = NON_2022_Oczekujacy;
	nr              = 999;
	condition	= DIA_Oczekujacy_EXIT_Condition;
	information	= DIA_Oczekujacy_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Oczekujacy_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Oczekujacy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Oczekujacy_HELLO1 (C_INFO)
{
   npc          = NON_2022_Oczekujacy;
   nr           = 1;
   condition    = DIA_Oczekujacy_HELLO1_Condition;
   information  = DIA_Oczekujacy_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Oczekujacy_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Oczekujacy_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Oczekujacy_HELLO1_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Oczekujacy_HELLO1_03_02"); //Czekam. Odczep siê.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Oczekujacy_HELLO2 (C_INFO)
{
   npc          = NON_2022_Oczekujacy;
   nr           = 2;
   condition    = DIA_Oczekujacy_HELLO2_Condition;
   information  = DIA_Oczekujacy_HELLO2_Info;
   permanent	= FALSE;
   description	= "Trochê kultury by ci nie zaszkodzi³o, œmieciu.";
};

FUNC INT DIA_Oczekujacy_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Oczekujacy_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Oczekujacy_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Oczekujacy_HELLO2_15_01"); //Trochê kultury by ci nie zaszkodzi³o, œmieciu. 
    AI_Output (self, other ,"DIA_Oczekujacy_HELLO2_03_02"); //Chcesz dostaæ w mordê?
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
};

//========================================
//-----------------> Attack
//========================================

INSTANCE DIA_Oczekujacy_Attack (C_INFO)
{
   npc          = NON_2022_Oczekujacy;
   nr           = 2;
   condition    = DIA_Oczekujacy_Attack_Condition;
   information  = DIA_Oczekujacy_Attack_Info;
   permanent	= FALSE;
   description	= "(krzywo spójrz i wywo³aj bójkê)";
};

FUNC INT DIA_Oczekujacy_Attack_Condition()
{
    if  (Npc_KnowsInfo (hero, DIA_Peratur_GoDown)) && (ArtegorIsDistracted == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Oczekujacy_Attack_Info()
{
    AI_Output (self, other ,"DIA_Oczekujacy_Attack_03_01"); //Prosisz siê!
	ArtegorIsDistracted = true;
	Npc_ExchangeRoutine (GRD_7001_Artegor,"distracted2");
	
	AI_StopProcessInfos	(NON_2022_Oczekujacy);
    Npc_SetTarget (NON_2022_Oczekujacy,other);
    AI_StartState (NON_2022_Oczekujacy,ZS_ATTACK,1,"");
	
	Npc_ExchangeRoutine (NON_3077_Peratur,"start");
	
	var c_npc abel;
	abel = Hlp_GetNpc(VLK_7003_Abel);
	AI_STANDUP (abel);
	
	CreateInvItem (Abel, ItFo_Potion_Haste_01);
	AI_USEITEM (Abel, ItFo_Potion_Haste_01);
	Npc_ExchangeRoutine (Abel,"run"); 
	AI_SetWalkmode(Abel, NPC_RUN);
	AI_GotoWP (ABel, "OW_PATH_266");
	
	B_LogEntry					(CH1_GhoransVine, "Wywo³a³em bójkê z K³ykaczem, a Abel za ten czas zdo³a³ uciec. Muszê go poszukaæ, gdzieœ w okolicach obozu.");
};
