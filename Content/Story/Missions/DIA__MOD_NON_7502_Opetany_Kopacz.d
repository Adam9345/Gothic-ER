// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Opetany_Kopacz_EXIT(C_INFO)
{
	npc             = NON_7502_Opetany_Kopacz;
	nr              = 999;
	condition	= DIA_Opetany_Kopacz_EXIT_Condition;
	information	= DIA_Opetany_Kopacz_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Opetany_Kopacz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Opetany_Kopacz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Opetany_Kopacz_GoAway (C_INFO)
{
   npc          = NON_7502_Opetany_Kopacz;
   nr           = 1;
   condition    = DIA_Opetany_Kopacz_GoAway_Condition;
   information  = DIA_Opetany_Kopacz_GoAway_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Opetany_Kopacz_GoAway_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Opetany_Kopacz_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Opetany_Kopacz_GoAway_03_01"); //Nie przeszkadzaj nam!
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Opetany_Kopacz_HELLO2 (C_INFO)
{
   npc          = NON_7502_Opetany_Kopacz;
   nr           = 2;
   condition    = DIA_Opetany_Kopacz_HELLO2_Condition;
   information  = DIA_Opetany_Kopacz_HELLO2_Info;
   permanent	= FALSE;
   description	= "Koniec tego dobrego! Szkoda, ¿e Stra¿nicy nie zagonili was do kopalni.";
};

FUNC INT DIA_Opetany_Kopacz_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Opetany_Kopacz_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Opetany_Kopacz_HELLO2_15_01"); //Koniec tego dobrego! Szkoda, ¿e Stra¿nicy nie zagonili was do kopalni.
    AI_Output (other, self ,"DIA_Opetany_Kopacz_HELLO2_15_02"); //Nie mielibyœcie czasu na bezczeszczenie grobów!
    AI_Output (self, other ,"DIA_Opetany_Kopacz_HELLO2_03_03"); //Wkrótce zgin¹ wszyscy, nawet Stra¿nicy Gomeza nie opr¹ siê potêdze Beliara!
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (NON_7503_Opetany_Kopacz, ATT_HOSTILE);
	Npc_SetPermAttitude (NON_7504_Opetany_Kopacz, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
    B_LogEntry                     (CH1_ZlecenieJima,"Kopacze z cmentarza niespecjalnie ucieszyli siê z mojej wizyty. Pomyœla³em, ¿e uda mi siê to rozwi¹zaæ pokojowo, ale nawet Sekciarze nie maj¹ tak zrytej bani jak te opêtane œwiry. ");
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Opetany_Kopacz03_EXIT(C_INFO)
{
	npc             = NON_7503_Opetany_Kopacz;
	nr              = 999;
	condition		= DIA_Opetany_Kopacz03_EXIT_Condition;
	information		= DIA_Opetany_Kopacz03_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Opetany_Kopacz03_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Opetany_Kopacz03_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Opetany_Kopacz04_EXIT(C_INFO)
{
	npc             = NON_7504_Opetany_Kopacz;
	nr              = 999;
	condition	= DIA_Opetany_Kopacz04_EXIT_Condition;
	information	= DIA_Opetany_Kopacz04_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Opetany_Kopacz04_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Opetany_Kopacz04_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};