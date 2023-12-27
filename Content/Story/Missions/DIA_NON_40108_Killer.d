// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Killer_EXIT(C_INFO)
{
	npc             = NON_40108_Killer;
	nr              = 999;
	condition	= DIA_Killer_EXIT_Condition;
	information	= DIA_Killer_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Killer_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Killer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Killer_HELLO1 (C_INFO)
{
   npc          = NON_40108_Killer;
   nr           = 1;
   condition    = DIA_Killer_HELLO1_Condition;
   information  = DIA_Killer_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Killer_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_PC_Thief_Othnielia))
{
    return TRUE;
};
};
FUNC VOID DIA_Killer_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Killer_HELLO1_03_01"); //Hej ty!
    AI_Output (self, other ,"DIA_Killer_HELLO1_03_02"); //Potrzebujê twojej pomocy.
    AI_Output (other, self ,"DIA_Killer_HELLO1_15_03"); //Tak? A niby w czym?
    AI_Output (self, other ,"DIA_Killer_HELLO1_03_04"); //Nie zadawaj zbêdnych pytañ, chodŸ za mn¹, szybko!
	Npc_ExchangeRoutine(self,"Ambush");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Killer_HELLO2 (C_INFO)
{
   npc          = NON_40108_Killer;
   nr           = 1;
   condition    = DIA_Killer_HELLO2_Condition;
   information  = DIA_Killer_HELLO2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Killer_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Killer_HELLO1))
&&  (Npc_GetDistToWP(NON_40108_Killer,"WP_ADD_02")<300)
{
    return TRUE;
};
};
FUNC VOID DIA_Killer_HELLO2_Info()
{
    AI_Output (self, other ,"DIA_Killer_HELLO2_03_01"); //Tu siê koñczy twoja droga.
	AI_DrawWeapon (self);
	AI_Output (self, other ,"DIA_Killer_HELLO2_03_02");//Pozdrowienia od Nortona!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	AI_StopProcessInfos	(self);
};

