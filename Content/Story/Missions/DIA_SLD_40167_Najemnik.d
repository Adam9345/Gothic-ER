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
   description	= "We� ten nap�j udrawiaj�cy kolego.";
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
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_01"); //We� ten nap�j udrawiaj�cy kolego.
	 B_GiveInvItems (other,self, ItFo_Potion_Health_01, 1);
	 AI_StandUP(self);
	 AI_UseItem(self,ItFo_Potion_Health_01);
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_02"); //Dzi�ki... Zdo�a�em zabi� jednego ale pozostali mnie osaczyli.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_03"); //I jak lepiej?
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_04"); //B�d� �y�.Akurat szed�em z Kot�a pom�wi� z Pascalem w obozie gdy ich napotka�em.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_05"); //My szli�my w�a�nie na polowanie.
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_06"); //Mo�ecie i�� dalej. Ja ju� sobie poradz�.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_07"); //Dobrze.
    AI_Output (self, other ,"DIA_Najemnik_HELLO1_03_08"); //Jeszcze raz wielkie dzi�ki za pomoc.
    AI_Output (other, self ,"DIA_Najemnik_HELLO1_15_09"); //Bywaj.
	 Npc_ExchangeRoutine(SLD_40167_Najemnik,"EndPW");
	
	SLD_40167_Najemnik.attribute[ATR_HITPOINTS] = 460;
};

instance dia_sld_40167_pickpocket(c_info) {
    npc = sld_40167_najemnik;
    nr = 900;
    condition = dia_sld_40167_pickpocket_condition;
    information = dia_sld_40167_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_40167_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 35);
};

func void dia_sld_40167_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_40167_pickpocket);
	info_addchoice(dia_sld_40167_pickpocket, dialog_back, dia_sld_40167_pickpocket_back);
	info_addchoice(dia_sld_40167_pickpocket, dialog_pickpocket, dia_sld_40167_pickpocket_doit);
};

func void dia_sld_40167_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_sld_40167_pickpocket);
};

func void dia_sld_40167_pickpocket_back() {
    info_clearchoices(dia_sld_40167_pickpocket);
};