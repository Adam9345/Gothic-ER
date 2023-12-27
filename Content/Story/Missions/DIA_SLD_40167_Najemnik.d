// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Najemnik_EXIT(C_INFO)
{
	npc             = SLD_40167_Najemnik;
	nr              = 999;
	condition	= DIA_Najemnik_EXIT_Condition;
	information	= DIA_Najemnik_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Najemnik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Najemnik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Najemnik_HELLO1 (C_INFO)
{
   npc          = SLD_40167_Najemnik;
   nr           = 1;
   condition    = DIA_Najemnik_HELLO1_Condition;
   information  = DIA_Najemnik_HELLO1_Info;
   permanent	= FALSE;
   description	= "WeŸ ten napój udrawiaj¹cy kolego.";
};

FUNC INT DIA_Najemnik_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Cord_PW_SUKINSYNY))
{
    return TRUE;
};
};
FUNC VOID DIA_Najemnik_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_01"); //WeŸ ten napój udrawiaj¹cy kolego.
	 B_GiveInvItems (other,self, ItFo_Potion_Health_01, 1);
	 AI_StandUP(self);
	 AI_UseItem(self,ItFo_Potion_Health_01);
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_02"); //Dziêki... Zdo³a³em zabiæ jednego ale pozostali mnie osaczyli.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_03"); //I jak lepiej?
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_04"); //Bêdê ¿y³.Akurat szed³em z Kot³a pomówiæ z Pascalem w obozie gdy ich napotka³em.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_05"); //My szliœmy w³aœnie na polowanie.
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_06"); //Mo¿ecie iœæ dalej. Ja ju¿ sobie poradzê.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_07"); //Dobrze.
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_08"); //Jeszcze raz wielkie dziêki za pomoc.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_09"); //Bywaj.
	 Npc_ExchangeRoutine(SLD_40167_Najemnik,"EndPW");
	
	SLD_40167_Najemnik.attribute[ATR_HITPOINTS] = 460;
};

