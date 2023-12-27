//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Straznik_EXIT(C_INFO)
{
	npc             = NON_2701_Straznik;
	nr              = 999;
	condition	= DIA_Straznik_EXIT_Condition;
	information	= DIA_Straznik_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Straznik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Straznik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Wtf
//========================================

INSTANCE DIA_Straznik_Wtf (C_INFO)
{
   npc          = NON_2701_Straznik;
   nr           = 1;
   condition    = DIA_Straznik_Wtf_Condition;
   information  = DIA_Straznik_Wtf_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Straznik_Wtf_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Straznik_Wtf_Info()
{
    AI_Output (self, other ,"DIA_Straznik_Wtf_03_01"); //Czego tu do cholery szukasz?
    AI_Output (other, self ,"DIA_Straznik_Wtf_15_02"); //Spokojnie. Nie mam z�ych zamiar�w.
    if (Kapitel <= 4)
    {
        AI_Output (self, other ,"DIA_Straznik_Wtf_03_03"); //To imponuj�ce, �e uda�o ci si� tu dotrze�. Okolica roi si� od ork�w.
        AI_Output (self, other ,"DIA_Straznik_Wtf_03_04"); //B�d� ostro�ny i nie zapuszczaj si� dalej.

        B_GiveXP (100);
    }
    else
    {
        AI_Output (self, other ,"DIA_Straznik_Wtf_03_05"); //W tych czasach nikomu nie mo�na ufa�. B�d� ci� mia� na oku.
    };
};

//========================================
//-----------------> KtoWy
//========================================

INSTANCE DIA_Straznik_KtoWy (C_INFO)
{
   npc          = NON_2701_Straznik;
   nr           = 2;
   condition    = DIA_Straznik_KtoWy_Condition;
   information  = DIA_Straznik_KtoWy_Info;
   permanent	= FALSE;
   description	= "Kim jeste�cie?";
};

FUNC INT DIA_Straznik_KtoWy_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Straznik_KtoWy_Info()
{
    AI_Output (other, self ,"DIA_Straznik_KtoWy_15_01"); //Kim jeste�cie?
    AI_Output (self, other ,"DIA_Straznik_KtoWy_03_02"); //Jeste�my �owcami ork�w. Polujemy na to plugastwo dla trofe�w i do�wiadczenia.
};

//========================================
//-----------------> Kolonia
//========================================

INSTANCE DIA_Straznik_Kolonia (C_INFO)
{
   npc          = NON_2701_Straznik;
   nr           = 3;
   condition    = DIA_Straznik_Kolonia_Condition;
   information  = DIA_Straznik_Kolonia_Info;
   permanent	= FALSE;
   description	= "Znasz dobrze Koloni�?";
};

FUNC INT DIA_Straznik_Kolonia_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Straznik_Kolonia_Info()
{
    AI_Output (other, self ,"DIA_Straznik_Kolonia_15_01"); //Znasz dobrze Koloni�?
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_02"); //By�em tu i tam.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_03"); //Trzy lata sp�dzi�em w Nowym Obozie, jednak znudzi�o mi si� pilnowanie rudy.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_04"); //Uwa�am, �e ten ca�y plan Mag�w Wody to jaki� �art.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_05"); //By�em tak�e na klifie, przy Wie�y Mgie�. Polowa�em w tamtych lasach.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_06"); //Roi si� tam od cieniostwor�w i innego �miecia.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_07"); //Podobno w lesie mo�na znale�� jakich� my�liwych, ale nie mam pewno�ci.
    AI_Output (other, self ,"DIA_Straznik_Kolonia_15_08"); //Dzi�ki za informacj�.
};

//========================================
//-----------------> WILSON_BANDYCI
//========================================

INSTANCE DIA_Straznik_WILSON_BANDYCI (C_INFO)
{
   npc          = NON_2701_Straznik;
   nr           = 1;
   condition    = DIA_Straznik_WILSON_BANDYCI_Condition;
   information  = DIA_Straznik_WILSON_BANDYCI_Info;
   permanent	= FALSE;
   description	= "Nie poszed�e� z Wilsonem?";
};

FUNC INT DIA_Straznik_WILSON_BANDYCI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_Quest12)) && (kapitel ==10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Straznik_WILSON_BANDYCI_Info()
{
    AI_Output (other, self ,"DIA_Straznik_WILSON_BANDYCI_15_01"); //Nie poszed�e� z Wilsonem? Dlaczego?
    AI_Output (self, other ,"DIA_Straznik_WILSON_BANDYCI_03_02"); //My�l�, �e nie jestem tam potrzebny. Kilku Bandyt�w chce zaatakowa� ludzi Gomeza. Im ich wi�cej, tym bardziej si� b�d� rzuca� w oczy.
    AI_Output (self, other ,"DIA_Straznik_WILSON_BANDYCI_03_03"); //Lepiej dla nich, �eby nikt z Obozu ich nie dostrzeg�, bo mog� sprowadzi� wsparcie. 
    AI_Output (self, other ,"DIA_Straznik_WILSON_BANDYCI_03_04"); //Poza tym kto� musi pilnowa� ekwipunku. 
    AI_Output (other, self ,"DIA_Straznik_WILSON_BANDYCI_15_05"); //Rozumiem. 
};

//========================================
//-----------------> SYTUACJA_GERARDA
//========================================

INSTANCE DIA_Straznik_SYTUACJA_GERARDA (C_INFO)
{
   npc          = NON_2701_Straznik;
   nr           = 1;
   condition    = DIA_Straznik_SYTUACJA_GERARDA_Condition;
   information  = DIA_Straznik_SYTUACJA_GERARDA_Info;
   permanent	= FALSE;
   description	= "Gdzie jest Gerard?";
};

FUNC INT DIA_Straznik_SYTUACJA_GERARDA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_WERB_GERARD))
    && (Npc_KnowsInfo (hero, DIA_SZEFU_Quest12))
	&& (kapitel ==10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Straznik_SYTUACJA_GERARDA_Info()
{
    AI_Output (other, self ,"DIA_Straznik_SYTUACJA_GERARDA_15_01"); //Gdzie jest Gerard?
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_02"); //Zosta� w obozie.
    AI_Output (other, self ,"DIA_Straznik_SYTUACJA_GERARDA_15_03"); //Dlaczego?
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_04"); //Nie wiem. M�wi�, �e nie obawia si� ork�w i Stra�nik�w. Twierdzi, �e ma�o kto wie o tamtym obozie i byliby�my tam bezpieczniejsi.
    AI_Output (other, self ,"DIA_Straznik_SYTUACJA_GERARDA_15_05"); //Nie s�dzisz, �e mia� troch� racji?
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_06"); //By� mo�e, ale Wilson postanowi� inaczej. Moim zdaniem lepiej trzyma� si� razem. 
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_07"); //Patrol Stra�nik�w nam niestraszny! Nasze miecze s� d�u�sze od tych nizio�k�w. 
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_08"); //Gerard samemu nic nie zdzia�a. Tylko w grupie jeste�my co� warci. 
    AI_Output (other, self ,"DIA_Straznik_SYTUACJA_GERARDA_15_09"); //Mo�e p�jd� sprawdzi� czy wszytko u niego w porz�dku.
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_10"); //Jak chcesz.
	MIS_Stan_gerarda = LOG_RUNNING;
    Log_CreateTopic            (CH1_Stan_gerarda, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Stan_gerarda, LOG_RUNNING);
    B_LogEntry                     (CH1_Stan_gerarda,"Garett powiedzia� mi, �e Gerard postanowi� zosta� sam w dawnym obozie �owc�w ork�w. Lepiej sprawdz� co u niego. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SYTUACJA_GERARDA
//========================================

INSTANCE DIA_Straznik_KASTRAGIR (C_INFO)
{
   npc          = NON_2701_Straznik;
   nr           = 1;
   condition    = DIA_Straznik_KASTRAGIR_Condition;
   information  = DIA_Straznik_KASTRAGIR_Info;
   permanent	= FALSE;
   description	= "Pono� czego� ode mnie chcesz.";
};

FUNC INT DIA_Straznik_KASTRAGIR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_Garret))
   
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Straznik_KASTRAGIR_Info()
{
    AI_Output (other, self ,"DIA_Straznik_KASTRAGIR_15_01"); //Pono� czego� ode mnie chcesz.
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_02"); //Chc� ci� ostrzec przed Kastagirem. Trzy miesi�ce temu nasza grupa wraca�a ze swojej misji z g�r. Nagle zauwa�yli�my jakie� niewielkie orkowe wykopalisko. 
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_03"); //W pobli�u by�o kilku orkowych szaman�w i sporo elitarnych ork�w. Rzucili si� na nas broni�c swego znaleziska. Zdo�ali�my si� obroni� przed pierwsz� fal� Ork�w. 
    AI_Output (other, self ,"DIA_Straznik_KASTRAGIR_15_04"); //Co by�o potem?
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_05"); //Ja i Kastagir zdo�ali�my zajrze� do wykopanego przez Ork�w niewielkiego sarkofagu. Wewn�trz, znale�li�my czaszk� i jaki� kryszta�.
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_06"); //Kastagir wzi�� go w d�o� i nagle przeszy�a go jaka� moc, wydawa� si� by� zahipnotyzowany. R�wnocze�nie przyby�y posi�ki Ork�w. �owcy musieli si� wycofa�. 
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_07"); //Si�� odci�gn��em Kastagira, kt�remu wypad� z r�ki kryszta�. Od tamtej pory sta� si� samotnikiem z dziwnym, niebezpiecznym spojrzeniem. 
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_08"); //Nocami przez sen zdarza�o mu si� krzycze� o pot�nej mocy kryszta�u. Uwa�aj na niego.
    AI_Output (other, self ,"DIA_Straznik_KASTRAGIR_15_09"); //Masz racj� lepiej by� z nim ostro�nym. Z drugiej strony je�li ma zrobi� co� z�ego lepiej mie� go na oku w ko�cu ma ju� ksi�g�.
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_10"); //C�, zrobisz co uwa�asz za s�uszne.
	
      	B_LogEntry              (Kastragir,"�owca Garret ostrzeg� mnie przed Kastagirem. Rzekomo mia� on ju� mie� w r�ku magiczny kryszta� mocy lecz go utraci�. Nim si� to jednak sta�o zosta�a na niego wywarta jaka� tajemnicza si�a. Od tej pory Kastagir zmieni� si�, staj�c si� dziwnym samotnikiem. Z faktu, �e ma on ju� ksi�g� musz� mie� go na oku. Ale zachowa� niezb�dn� ostro�no�� i by� niezwykle uwa�nym.");

    AI_StopProcessInfos	(self);
};

instance dia_non_2701_pickpocket(c_info) {
    npc = non_2701_straznik;
    nr = 900;
    condition = dia_non_2701_pickpocket_condition;
    information = dia_non_2701_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_2701_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_non_2701_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_2701_pickpocket);
	info_addchoice(dia_non_2701_pickpocket, dialog_back, dia_non_2701_pickpocket_back);
	info_addchoice(dia_non_2701_pickpocket, dialog_pickpocket, dia_non_2701_pickpocket_doit);
};

func void dia_non_2701_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_non_2701_pickpocket);
};

func void dia_non_2701_pickpocket_back() {
    info_clearchoices(dia_non_2701_pickpocket);
};