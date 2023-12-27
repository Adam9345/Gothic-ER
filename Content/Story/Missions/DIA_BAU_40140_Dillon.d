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
   description	= "Mogê coœ dla Ciebie zrobiæ?";
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
    AI_Output (other, self ,"DIA_Dillon_ZD_15_01"); //Mogê coœ dla Ciebie zrobiæ?
    AI_Output (self, other ,"DIA_Dillon_ZD_03_02"); //Hmmm a wiesz, ¿e tak!
    AI_Output (other, self ,"DIA_Dillon_ZD_15_03"); //O co chodzi?
    AI_Output (self, other ,"DIA_Dillon_ZD_03_04"); //A co sobie bêdê ¿a³owa³.. Potrzebuje tuzin sma¿onego miêsa, tuzin chleba, specjalnego skrêta ,, Ryk d¿ungli” I grzane winko.
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
    AI_Output (self, other ,"DIA_Dillon_ZD_NO_03_02"); //Jak chcesz. Dosta³byœ niez³¹ sumkê a tak nici z tego.
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
   description	= "Mogê to za³atwiæ. Ale musisz mi oczywiœcie nieŸle zap³aciæ";
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
    AI_Output (other, self ,"DIA_Dillon_ZD_YES_15_01"); //Mogê to za³atwiæ. Ale musisz mi oczywiœcie nieŸle zap³aciæ.
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_02"); //No i tak¹ postawê rozumiem. 
    AI_Output (other, self ,"DIA_Dillon_ZD_YES_15_03"); //Ale sk¹d mam wzi¹æ to grzane wino I specjalnego skrêta?
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_04"); //Jak grzane wino to tylko od Silasa z karczmy na jeziorze w Nowym Obozie. A skrêta kupisz u Fortuno w Sekcie.
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_05"); //Miêso mo¿esz samemu pozyskaæ poluj¹c lub po prostu kupiæ. Dobry chleb sprzeda ci jakiœ handlarz ¿ywnoœci¹.
    AI_Output (other, self ,"DIA_Dillon_ZD_YES_15_06"); //Szykuj sakiewkê rudy, nied³ugo wrócê.
    AI_Output (self, other ,"DIA_Dillon_ZD_YES_03_07"); //Obyœ wróci³ nied³ugo z tym co trzeba.
	DILION_YES = TRUE;
	Zachcianki = LOG_RUNNING;
	Log_CreateTopic		(ZachciankiDiliona,	LOG_MISSION);
	Log_SetTopicStatus	(ZachciankiDiliona,	LOG_RUNNING);
    B_LogEntry          (ZachciankiDiliona,"Dillon chcê bym za³atwi³ dla niego tuzin sma¿onego miêsa, tuzin chleba specjalny skrêt o nazwie ,,Ryk d¿ungli” I grzane wino. Obieca³ nale¿ycie mi zap³aciæ. W takim razie móg³bym siê tym zaj¹æ. Ziele dostanê u Fortuno a grzane wino u Silasa.");
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
   description	= "Mam wszystko co chcia³eœ.";
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
    AI_Output (other, self ,"DIA_Dillon_ZD_END_15_01"); //Mam wszystko co chcia³eœ.
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_02"); //Œwietnie. Nie ma to jak odrobina luksusu!
    AI_Output (other, self ,"DIA_Dillon_ZD_END_15_03"); //Gdzie moja nagroda?
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_04"); //Oczywiœcie. Taka przys³uga musi kosztowaæ. 
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_05"); //Trzymaj, to twoja zap³ata. 
    AI_Output (self, other ,"DIA_Dillon_ZD_END_03_06"); //Jak bêdê mia³ do ciebie jakiœ biznes to siê odezwê.
    AI_Output (other, self ,"DIA_Dillon_ZD_END_15_07"); //W porz¹dku. A póki co wracam teraz do innych spraw.
	
		B_GiveInvItems (other,self, ItFo_HotWine, 1);
		B_GiveInvItems (other,self, ItMiJoint_ZD, 1);
		B_GiveInvItems (other,self, ItFoLoaf,    12);
		B_GiveInvItems (other,self, ItFoMutton,  12);
			Zachcianki = LOG_SUCCESS;
	B_GiveXP(400);
	B_GiveInvItems (self,other, itminugget, 250);
	B_GiveInvItems (self,other, ItMi_JeweleryChest_03, 2);
	B_LogEntry          (ZachciankiDiliona,"Dostarczy³em Dillonowi zamówione towary. By³ uradowany I wyp³aci³ mi nale¿n¹ sumkê. Doda³ te¿, ¿e nie wyklucza podobnych transakcji w przysz³oœci.");
	Log_SetTopicStatus	(ZachciankiDiliona,	LOG_SUCCESS);
};

