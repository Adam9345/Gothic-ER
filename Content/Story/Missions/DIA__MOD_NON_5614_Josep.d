//DIALOGI POPRAWIONE I SPRAWDZONE J�ZYKOWO //g1210
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Josep_EXIT(C_INFO)
{
	npc             = NON_5614_Josep;
	nr              = 999;
	condition	= DIA_Josep_EXIT_Condition;
	information	= DIA_Josep_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Josep_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Josep_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WODA
//========================================

INSTANCE DIA_Josep_WODA (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_WODA_Condition;
   information  = DIA_Josep_WODA_Info;
   permanent	= TRUE;
   description	= "Przynios�em ci wod�.";
};

FUNC INT DIA_Josep_WODA_Condition()
{
    if ((Lefty_Mission==LOG_RUNNING) || (Lefty_Mission==LOG_SUCCESS)) && Npc_HasItems(other, ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& (!Npc_KnowsInfo (hero, DIA_Josep_GoAway))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_WODA_Info()
{
    AI_Output (other, self ,"DIA_Josep_WODA_15_01"); //Przynios�em ci wod�.
  if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
    {
    AI_Output (self, other ,"DIA_Josep_WODA_03_02"); //O, dzi�ki. Umieram z pragnienia!
B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;  
    }
    else
    {
        AI_Output (self, other ,"DIA_Josep_WODA_03_03"); //Przecie� nie masz wody! Pr�bujesz ze mnie �artowa�?!
    };
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Angry
//========================================

INSTANCE DIA_Josep_Angry (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Angry_Condition;
   information  = DIA_Josep_Angry_Info;
   permanent	= FALSE;
   description	= "Nie wygl�dasz mi na zbieracza.";
};

FUNC INT DIA_Josep_Angry_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_NewQuest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Angry_Info()
{
    AI_Output (other, self ,"DIA_Josep_Angry_15_01"); //Nie wygl�dasz mi na zbieracza.
    AI_Output (self, other ,"DIA_Josep_Angry_03_02"); //A ty nie wygl�dasz mi na kogo� inteligentnego. Spadaj! Zostaw mnie w spokoju!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Sorry
//========================================

INSTANCE DIA_Josep_Sorry (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Sorry_Condition;
   information  = DIA_Josep_Sorry_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Josep_Sorry_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Angry))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Sorry_Info()
{
    AI_Output (self, other ,"DIA_Josep_Sorry_03_01"); //Ej, zaczekaj. Przepraszam. I tak, masz racj�. Nie jestem Zbieraczem.
	AI_Output (self, other ,"DIA_Josep_Sorry_03_02"); //By�em my�liwym. Nazywam si� Josep.
	AI_Output (other, self ,"DIA_Josep_Sorry_15_03"); //Co wi�c robisz na polach ry�owych?
	AI_Output (self, other ,"DIA_Josep_Sorry_03_04"); //Niewolniczo pracuj� na rzecz Ry�owego Ksi�cia. To Lewus mnie w to wpakowa�. Pod�y sukinsyn.
	AI_Output (other, self ,"DIA_Josep_Sorry_15_05"); //Spr�buj� ci� st�d wydosta�.
	AI_Output (self, other ,"DIA_Josep_Sorry_03_06"); //Wyjd� na wolno��, kiedy ten wieprz zginie.
	AI_Output (other, self ,"DIA_Josep_Sorry_15_07"); //Zobacz�, co da si� zrobi�. By� mo�e to nie b�dzie konieczne. 
	AI_Output (self, other ,"DIA_Josep_Sorry_03_08"); //Je�li mnie st�d wyci�gniesz, b�d� mia� u ciebie olbrzymi d�ug.
	
	B_LogEntry               (CH1_MissedJosep,"Odnalaz�em Josepa na polach ry�owych. Dowiedzia�em si�, �e jest je�cem Lewusa. Ciekawe co takiego zrobi�. Musz� porozmawia� ze Szkodnikiem.");
	
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Truth
//========================================

INSTANCE DIA_Josep_Truth (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Truth_Condition;
   information  = DIA_Josep_Truth_Info;
   permanent	= FALSE;
   description	= "Dlaczego mi nie powiedzia�e� o kradzie�y w magazynie?";
};

FUNC INT DIA_Josep_Truth_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lefty_WhatDidJosep))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Truth_Info()
{
	AI_Output (other, self ,"DIA_Josep_Truth_15_01"); //Dlaczego mi nie powiedzia�e� o kradzie�y w magazynie?
	AI_Output (self, other ,"DIA_Josep_Truth_03_02"); //Bo to nieistotne. 
	AI_Output (other, self ,"DIA_Josep_Truth_15_03"); //Faktycznie, taka ma�a drobnostka...
	AI_Output (self, other ,"DIA_Josep_Truth_03_04"); //S�uchaj, mia�em zlecenie. To tyle! Lepiej wymy�l jak mnie st�d wydosta�, je�li chcesz cokolwiek zarobi�.
	AI_Output (other, self ,"DIA_Josep_Truth_15_05"); //To nie takie proste. �mier� Lewusa poci�gn�aby za sob� kolejne. W tym moj�...
	AI_Output (self, other ,"DIA_Josep_Truth_03_06"); //Rozmawia�em z kilkoma Zbieraczami. Musisz znale�� jak�� kart� przetargow�. Ja w zamian za co� lub kogo�...
	AI_Output (self, other ,"DIA_Josep_Truth_03_07"); //Wtedy b�dziesz m�g� z nim negocjowa�. Tylko to nie mo�e by� byle co. Pomy�l chwil� zanim co� zrobisz.
	
	B_LogEntry               (CH1_MissedJosep,"Zabicie Lewusa nie wchodzi w gr�. Josep zaproponowa� wi�c, �ebym znalaz� co� lub kogo� cennego dla Lewusa. Wtedy b�d� m�g� dokona� wymiany.");
	
	if (Npc_KnowsInfo (hero, DIA_Zick_ValuableInfo)) && (MIS_MissedJosep == LOG_RUNNING)
	{
	B_LogEntry    (CH1_MissedJosep,"Przypomnia�em sobie, �e niejaki Zick wspomina� kiedy�, �e jest bratankiem Lewusa. Pami�tam, �e ten egoistyczny Szkodnik mieszka� w chacie niedaleko Laresa.");
	AI_Output (other, self ,"DIA_Josep_Truth_15_08"); //Lewus ma bratanka w obozie. Nazywa si� Zick. 
	AI_Output (self, other ,"DIA_Josep_Truth_03_09"); //Doskonale. Teraz tylko we� go jako zak�adnika i po problemie.
	};
    AI_StopProcessInfos	(self);
};

////////////////////////////////////////////////
//			Go Away
///////////////////////////////////////////////

INSTANCE DIA_Josep_GoAway (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_GoAway_Condition;
   information  = DIA_Josep_GoAway_Info;
   permanent	= FALSE;
   description	= "Zbierajmy si� st�d.";
};

FUNC INT DIA_Josep_GoAway_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Lefty_NowFree))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_GoAway_Info()
{
    AI_Output (other, self ,"DIA_Josep_GoAway_15_01"); //Zbierajmy si� st�d.
    AI_Output (self, other ,"DIA_Josep_GoAway_03_02"); //Nareszcie! Chod� za mn�. P�jdziemy razem do obozu my�liwych. 
    Npc_ExchangeRoutine (NON_5614_Josep,"guide");
	B_LogEntry    (CH1_MissedJosep,"Josep poprosi� mnie, aby wr�ci� do obozu razem z nim. Jest mi to na r�k�. Musz� przecie� odebra� zap�at� od Alexa.");
	Npc_ExchangeRoutine (ORG_823_Zick,"party");
	AI_Teleport (ORG_823_Zick,"OW_PATH_066");
	Wld_InsertNpc (ORG_895_Organisator,"OW_PATH_066");
	Wld_InsertNpc (ORG_896_Organisator,"OW_PATH_066");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> LeftRiceLord
//========================================

INSTANCE DIA_Josep_LeftRiceLord (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_LeftRiceLord_Condition;
   information  = DIA_Josep_LeftRiceLord_Info;
   permanent	= FALSE;
   description	= "Zmywajmy si� st�d.";
};

FUNC INT DIA_Josep_LeftRiceLord_Condition()
{
 if (Npc_KnowsInfo (hero,DIA_Lefty_Free))
 && !(Npc_KnowsInfo (hero,DIA_Lefty_NowFree))
 
{
    return TRUE;
};
};
FUNC VOID DIA_Josep_LeftRiceLord_Info()
{
    AI_Output (other, self ,"DIA_Josep_LeftRiceLord_15_01"); //Zmywajmy si� st�d. 
    AI_Output (self, other ,"DIA_Josep_LeftRiceLord_03_02"); //Nareszcie! Chod� za mn�. P�jdziemy razem do obozu my�liwych. 
    AI_Output (other, self ,"DIA_Josep_LeftRiceLord_15_03"); //Lewus chyba co� kombinuje, kaza� mi czeka� jeden dzie� nim mi cie wyda.
    AI_Output (self, other ,"DIA_Josep_LeftRiceLord_03_04"); //Faktycznie odrobin� to podejrzane, nie tra�my wi�c czasu. W drog�.
	Npc_ExchangeRoutine (NON_5614_Josep,"guide2");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
    AI_StopProcessInfos	(self);
};


////////////////////////////////////////////////
//			Enemies
///////////////////////////////////////////////

INSTANCE DIA_Josep_Enemies (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Enemies_Condition;
   information  = DIA_Josep_Enemies_Info;
   permanent	= FALSE;
   important 	= TRUE;
};

FUNC INT DIA_Josep_Enemies_Condition()
{
    if ((Npc_KnowsInfo (hero,DIA_Josep_GoAway)) || (Npc_KnowsInfo (hero,DIA_Josep_LeftRiceLord)))  && (Npc_GetDistToWP (NON_5614_Josep, "OW_PATH_065") < 300) && !(Npc_KnowsInfo (hero,DIA_Josep_LeftRiceLord))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Enemies_Info()
{
    AI_Output (self, other ,"DIA_Josep_Enemies_03_01"); //Czyli jednak nie obejdzie si� bez rozlewu krwi! Chc� tego, dobrze, niech maj�!
	AI_Output (self, other ,"DIA_Josep_Enemies_03_02"); //Nie bierz je�c�w.

	B_LogEntry    (CH1_MissedJosep,"Po drodze do obozu spotkali�my Zicka i dw�ch jego poplecznik�w. To pewnie dlatego musia�em czeka� jeden dzie�. Musieli si� zorganizowa� przeciwko nam. Josep kaza� mi zabija� bez lito�ci.");
	
	NON_5614_Josep.flags = 2;
	Npc_ExchangeRoutine (NON_5614_Josep,"guide2");
	AI_StopProcessInfos	(NON_5614_Josep);
	
	B_ChangeGuild    (ORG_895_Organisator,GIL_BDT);
	B_ChangeGuild    (ORG_896_Organisator,GIL_BDT);
	B_ChangeGuild    (ORG_823_Zick,GIL_BDT);
};

////////////////////////////////////////////////
//			Camp
///////////////////////////////////////////////

INSTANCE DIA_Josep_Camp (C_INFO)
{
   npc          = NON_5614_Josep;
   nr           = 1;
   condition    = DIA_Josep_Camp_Condition;
   information  = DIA_Josep_Camp_Info;
   permanent	= FALSE;
   important 	= TRUE;
};

FUNC INT DIA_Josep_Camp_Condition()
{
    if ((Npc_KnowsInfo (hero,DIA_Josep_GoAway)) || (Npc_KnowsInfo (hero,DIA_Josep_LeftRiceLord)))  && (Npc_GetDistToWP (NON_5614_Josep, "WP_ADD_08") < 1000) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Josep_Camp_Info()
{
    AI_Output (self, other ,"DIA_Josep_Camp_03_01"); //Jeste�my na miejscu! Jestem ci cholernie wdzi�czny za pomoc. 
	AI_Output (self, other ,"DIA_Josep_Camp_03_02"); //Postaram ci si� to jako� wynagrodzi� w przysz�o�ci. W ci�gu kilku tygodni powinienem si� odku� i zarobi� sporo rudy.
	AI_Output (self, other ,"DIA_Josep_Camp_03_03"); //Niestety te bandziory zabra�y mi wszystko co mia�em.
	AI_Output (other, self ,"DIA_Josep_Camp_15_04"); //W porz�dku. Wynagrodzenie od Alexa powinno wystarczy� na jaki� czas.

	B_LogEntry    (CH1_MissedJosep,"Razem z Josepem wr�cili�my do obozu my�liwych. ");
	
	NON_5614_Josep.flags = 0;
	Npc_ExchangeRoutine (NON_5614_Josep,"camp2");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
};

instance dia_josep_pickpocket(c_info) {
    npc = non_5614_josep;
    nr = 900;
    condition = dia_josep_pickpocket_condition;
    information = dia_josep_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_josep_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 25);
};

func void dia_josep_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_josep_pickpocket);
	info_addchoice(dia_josep_pickpocket, dialog_back, dia_josep_pickpocket_back);
	info_addchoice(dia_josep_pickpocket, dialog_pickpocket, dia_josep_pickpocket_doit);
};

func void dia_josep_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_josep_pickpocket);
};

func void dia_josep_pickpocket_back() {
    info_clearchoices(dia_josep_pickpocket);
};