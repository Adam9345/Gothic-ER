// *Script was make in Easy Dialog Maker (EDM)
var int Zachcianki;
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Dillon_EXIT(C_INFO)
{
	npc             = BAU_40140_Dillon;
	nr              = 999;
	condition	= DIA_Dillon_EXIT_Condition;
	information	= DIA_Dillon_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Dillon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dillon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZD
//========================================

INSTANCE DIA_Dillon_ZD (C_INFO)
{
   npc          = BAU_40140_Dillon;
   nr           = 1;
   condition    = DIA_Dillon_ZD_Condition;
   information  = DIA_Dillon_ZD_Info;
   permanent	= FALSE;
   description	= "Mog� co� dla Ciebie zrobi�?";
};

FUNC INT DIA_Dillon_ZD_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_BAU)
{
    return TRUE;
};
};
FUNC VOID DIA_Dillon_ZD_Info()
{
    AI_Output (other, self ,"DIA_Dillon_ZD_15_01"); //Mog� co� dla Ciebie zrobi�?
    AI_Output (self, other ,"DIA_Dillon_ZD_03_02"); //Hmmm a wiesz, �e tak!
    AI_Output (other, self ,"DIA_Dillon_ZD_15_03"); //O co chodzi?
    AI_Output (self, other ,"DIA_Dillon_ZD_03_04"); //A co sobie b�d� �a�owa�.. Potrzebuje tuzin sma�onego mi�sa, tuzin chleba, specjalnego skr�ta ,, Ryk d�ungli� I grzane winko.
	DILION_YES = false;
};

//========================================
//-----------------> ZD_NO
//========================================

INSTANCE DIA_Dillon_ZD_NO (C_INFO)
{
   npc          = BAU_40140_Dillon;
   nr           = 2;
   condition    = DIA_Dillon_ZD_NO_Condition;
   information  = DIA_Dillon_ZD_NO_Info;
   permanent	= FALSE;
   description	= "Nie mam czasu na twoje kaprysy.";
};

FUNC INT DIA_Dillon_ZD_NO_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Dillon_ZD))
	&& (DILION_YES == FALSE)
{
    return TRUE;
};
};
FUNC VOID DIA_Dillon_ZD_NO_Info()
{
    AI_Output (other, self ,"DIA_Dillon_ZD_NO_15_01"); //Nie mam czasu na twoje kaprysy.
    AI_Output (self, other ,"DIA_Dillon_ZD_NO_03_02"); //Jak chcesz. Dosta�by� niez�� sumk� a tak nici z tego.
	Zachcianki = LOG_FAILED;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZD_YES
//========================================

INSTANCE DIA_Dillon_ZD_YES (C_INFO)
{
   npc          = BAU_40140_Dillon;
   nr           = 3;
   condition    = DIA_Dillon_ZD_YES_Condition;
   information  = DIA_Dillon_ZD_YES_Info;
   permanent	= FALSE;
   description	= "Mog� to za�atwi�. Ale musisz mi oczywi�cie nie�le zap�aci�";
};

FUNC INT DIA_Dillon_ZD_YES_Condition()
{ 
	if (Npc_KnowsInfo(hero,DIA_Dillon_ZD))
	&& !(Npc_KnowsInfo(hero,DIA_Dillon_ZD_NO))
{
    return TRUE;
};
};

FUNC VOID DIA_Dillon_ZD_YES_Info()
{
    AI_Output (other, self ,"DIA_Dillon_ZD_YES_15_01"); //Mog� to za�atwi�. Ale musisz mi oczywi�cie nie�le zap�aci�.
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_02"); //No i tak� postaw� rozumiem. 
    AI_Output (other, self ,"DIA_Dillon_ZD_YES_15_03"); //Ale sk�d mam wzi�� to grzane wino I specjalnego skr�ta?
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_04"); //Jak grzane wino to tylko od Silasa z karczmy na jeziorze w Nowym Obozie. A skr�ta kupisz u Fortuno w Sekcie.
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_05"); //Mi�so mo�esz samemu pozyska� poluj�c lub po prostu kupi�. Dobry chleb sprzeda ci jaki� handlarz �ywno�ci�.
    AI_Output (other, self ,"DIA_Dillon_ZD_YES_15_06"); //Szykuj sakiewk� rudy, nied�ugo wr�c�.
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_07"); //Oby� wr�ci� nied�ugo z tym co trzeba.
	DILION_YES = TRUE;
	Zachcianki = LOG_RUNNING;
	Log_CreateTopic		(ZachciankiDiliona,	LOG_MISSION);
	Log_SetTopicStatus	(ZachciankiDiliona,	LOG_RUNNING);
    B_LogEntry          (ZachciankiDiliona,"Dillon chc� bym za�atwi� dla niego tuzin sma�onego mi�sa, tuzin chleba specjalny skr�t o nazwie ,,Ryk d�ungli� I grzane wino. Obieca� nale�ycie mi zap�aci�. W takim razie m�g�bym si� tym zaj��. Ziele dostan� u Fortuno a grzane wino u Silasa.");
};

//========================================
//-----------------> ZD_END
//========================================

INSTANCE DIA_Dillon_ZD_END (C_INFO)
{
   npc          = BAU_40140_Dillon;
   nr           = 1;
   condition    = DIA_Dillon_ZD_END_Condition;
   information  = DIA_Dillon_ZD_END_Info;
   permanent	= FALSE;
   description	= "Mam wszystko co chcia�e�.";
};

FUNC INT DIA_Dillon_ZD_END_Condition()

{
      if (Npc_KnowsInfo(hero,DIA_Silas_ZD_S_NUGG))
      && (Npc_HasItems (other, ItMiJoint_ZD)  >=1)
      && (Npc_HasItems (other,ItFo_HotWine)   >=1)
      && (Npc_HasItems (other,ItFoLoaf)      >=12)
      && (Npc_HasItems (other,ItFoMutton)    >=12)
{
    return TRUE;
};
};

FUNC VOID DIA_Dillon_ZD_END_Info()
{
    AI_Output (other, self ,"DIA_Dillon_ZD_END_15_01"); //Mam wszystko co chcia�e�.
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_02"); //�wietnie. Nie ma to jak odrobina luksusu!
    AI_Output (other, self ,"DIA_Dillon_ZD_END_15_03"); //Gdzie moja nagroda?
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_04"); //Oczywi�cie. Taka przys�uga musi kosztowa�. 
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_05"); //Trzymaj, to twoja zap�ata. 
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_06"); //Jak b�d� mia� do ciebie jaki� biznes to si� odezw�.
    AI_Output (other, self ,"DIA_Dillon_ZD_END_15_07"); //W porz�dku. A p�ki co wracam teraz do innych spraw.
	
		B_GiveInvItems (other,self, ItFo_HotWine, 1);
		B_GiveInvItems (other,self, ItMiJoint_ZD, 1);
		B_GiveInvItems (other,self, ItFoLoaf,    12);
		B_GiveInvItems (other,self, ItFoMutton,  12);
			Zachcianki = LOG_SUCCESS;
	B_GiveXP(400);
	B_GiveInvItems (self,other, itminugget, 250);
	B_GiveInvItems (self,other, ItMi_JeweleryChest_03, 2);
	B_LogEntry          (ZachciankiDiliona,"Dostarczy�em Dillonowi zam�wione towary. By� uradowany I wyp�aci� mi nale�n� sumk�. Doda� te�, �e nie wyklucza podobnych transakcji w przysz�o�ci.");
	Log_SetTopicStatus	(ZachciankiDiliona,	LOG_SUCCESS);
};

