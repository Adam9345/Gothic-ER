// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Podejrzanys_EXIT(C_INFO)
{
	npc             = ORG_40152_Podejrzany;
	nr              = 999;
	condition	= DIA_Podejrzanys_EXIT_Condition;
	information	= DIA_Podejrzanys_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Podejrzanys_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Podejrzanys_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Podejrzanys_HELLO1 (C_INFO)
{
   npc          = ORG_40152_Podejrzany;
   nr           = 1;
   condition    = DIA_Podejrzanys_HELLO1_Condition;
   information  = DIA_Podejrzanys_HELLO1_Info;
   permanent	= FALSE;
   description	= "hs@FF0000 Co to podziwiasz architekoniczny geniusz Starego Obozu?";
};

FUNC INT DIA_Podejrzanys_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jarvis_PZ))
{
    return TRUE;
};
};
FUNC VOID DIA_Podejrzanys_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Podejrzanys_HELLO1_15_01"); //Co to podziwiasz architekoniczny geniusz Starego Obozu?
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_02"); //Eeee jak mu tam... Lares wys�a� mnie na przeszpiegi.
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_03"); //Mam si� rozezna� co knuj� ludzie Gomeza.
    AI_Output (other, self ,"DIA_Podejrzanys_HELLO1_15_04"); //Czy�by Stra�nicy nie chcieli wpusci� ci� do obozu?
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_05"); //Co ty wygadujesz?
    AI_Output (other, self ,"DIA_Podejrzanys_HELLO1_15_06"); //Wiem o wszystkim durniu. Pr�bowa�e� zg�adzi� Lee.
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_07"); //To kalumnie. M�wi�em ci ju�, �e...
    AI_Output (other, self ,"DIA_Podejrzanys_HELLO1_15_08"); //Nie jestem naiwanym idot�. Sko�cz t� komedie i stawaj do walki!
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_09"); //Ty psie! Widz�, �e nie da si� ciebie przekona�.
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_10"); //Niech ci b�dzie. Po misji w Nowym Obozie te barany nie chc� mnie wpu�ci� do �rodka. Wygonili mnie chocia� doskonale wiedz� o mojej roli , przekl�te pajace!
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_11"); //W takim razie pora si� st�d ulotni�. Ale wcze�niej po�l� ci� do piekie�.
    AI_Output (self, other ,"DIA_Podejrzanys_HELLO1_03_12"); //Umieraj b�karcie! 
    AI_Output (other, self ,"DIA_Podejrzanys_HELLO1_15_13"); //Z pewno�ci� nie dzisiaj. Walcz!
    AI_StopProcessInfos	(self);
	B_LogEntry               (PodejrzaneZamieszanie,"Skonfrontowa�em si� z drugim z zamachowc�w. Wartownicy przy bramie Starego Obozu nie wpu�cili go do �rodka. Zako�cz� �ywot ostatniego z zamachowc�w wys�anych przez Kruka. Pora zda� relacje Lee i zobaczy� jak si� miewa po �mierci Orika.");
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
  
};

instance dia_org_40152_pickpocket(c_info) {
    npc = org_40152_podejrzany;
    nr = 900;
    condition = dia_org_40152_pickpocket_condition;
    information = dia_org_40152_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40152_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40152_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40152_pickpocket);
	info_addchoice(dia_org_40152_pickpocket, dialog_back, dia_org_40152_pickpocket_back);
	info_addchoice(dia_org_40152_pickpocket, dialog_pickpocket, dia_org_40152_pickpocket_doit);
};

func void dia_org_40152_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_40152_pickpocket);
};

func void dia_org_40152_pickpocket_back() {
    info_clearchoices(dia_org_40152_pickpocket);
};