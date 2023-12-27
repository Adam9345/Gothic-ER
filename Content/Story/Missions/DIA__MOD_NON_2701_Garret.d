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
    AI_Output (other, self ,"DIA_Straznik_Wtf_15_02"); //Spokojnie. Nie mam z³ych zamiarów.
    if (Kapitel <= 4)
    {
        AI_Output (self, other ,"DIA_Straznik_Wtf_03_03"); //To imponuj¹ce, ¿e uda³o ci siê tu dotrzeæ. Okolica roi siê od orków.
        AI_Output (self, other ,"DIA_Straznik_Wtf_03_04"); //B¹dŸ ostro¿ny i nie zapuszczaj siê dalej.

        B_GiveXP (100);
    }
    else
    {
        AI_Output (self, other ,"DIA_Straznik_Wtf_03_05"); //W tych czasach nikomu nie mo¿na ufaæ. Bêdê ciê mia³ na oku.
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
   description	= "Kim jesteœcie?";
};

FUNC INT DIA_Straznik_KtoWy_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Straznik_KtoWy_Info()
{
    AI_Output (other, self ,"DIA_Straznik_KtoWy_15_01"); //Kim jesteœcie?
    AI_Output (self, other ,"DIA_Straznik_KtoWy_03_02"); //Jesteœmy ³owcami orków. Polujemy na to plugastwo dla trofeów i doœwiadczenia.
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
   description	= "Znasz dobrze Koloniê?";
};

FUNC INT DIA_Straznik_Kolonia_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Straznik_Kolonia_Info()
{
    AI_Output (other, self ,"DIA_Straznik_Kolonia_15_01"); //Znasz dobrze Koloniê?
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_02"); //By³em tu i tam.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_03"); //Trzy lata spêdzi³em w Nowym Obozie, jednak znudzi³o mi siê pilnowanie rudy.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_04"); //Uwa¿am, ¿e ten ca³y plan Magów Wody to jakiœ ¿art.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_05"); //By³em tak¿e na klifie, przy Wie¿y Mgie³. Polowa³em w tamtych lasach.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_06"); //Roi siê tam od cieniostworów i innego œmiecia.
    AI_Output (self, other ,"DIA_Straznik_Kolonia_03_07"); //Podobno w lesie mo¿na znaleŸæ jakichœ myœliwych, ale nie mam pewnoœci.
    AI_Output (other, self ,"DIA_Straznik_Kolonia_15_08"); //Dziêki za informacjê.
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
   description	= "Nie poszed³eœ z Wilsonem?";
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
    AI_Output (other, self ,"DIA_Straznik_WILSON_BANDYCI_15_01"); //Nie poszed³eœ z Wilsonem? Dlaczego?
    AI_Output (self, other ,"DIA_Straznik_WILSON_BANDYCI_03_02"); //Myœlê, ¿e nie jestem tam potrzebny. Kilku Bandytów chce zaatakowaæ ludzi Gomeza. Im ich wiêcej, tym bardziej siê bêd¹ rzucaæ w oczy.
    AI_Output (self, other ,"DIA_Straznik_WILSON_BANDYCI_03_03"); //Lepiej dla nich, ¿eby nikt z Obozu ich nie dostrzeg³, bo mog¹ sprowadziæ wsparcie. 
    AI_Output (self, other ,"DIA_Straznik_WILSON_BANDYCI_03_04"); //Poza tym ktoœ musi pilnowaæ ekwipunku. 
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
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_02"); //Zosta³ w obozie.
    AI_Output (other, self ,"DIA_Straznik_SYTUACJA_GERARDA_15_03"); //Dlaczego?
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_04"); //Nie wiem. Mówi³, ¿e nie obawia siê orków i Stra¿ników. Twierdzi, ¿e ma³o kto wie o tamtym obozie i bylibyœmy tam bezpieczniejsi.
    AI_Output (other, self ,"DIA_Straznik_SYTUACJA_GERARDA_15_05"); //Nie s¹dzisz, ¿e mia³ trochê racji?
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_06"); //Byæ mo¿e, ale Wilson postanowi³ inaczej. Moim zdaniem lepiej trzymaæ siê razem. 
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_07"); //Patrol Stra¿ników nam niestraszny! Nasze miecze s¹ d³u¿sze od tych nizio³ków. 
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_08"); //Gerard samemu nic nie zdzia³a. Tylko w grupie jesteœmy coœ warci. 
    AI_Output (other, self ,"DIA_Straznik_SYTUACJA_GERARDA_15_09"); //Mo¿e pójdê sprawdziæ czy wszytko u niego w porz¹dku.
    AI_Output (self, other ,"DIA_Straznik_SYTUACJA_GERARDA_03_10"); //Jak chcesz.
	MIS_Stan_gerarda = LOG_RUNNING;
    Log_CreateTopic            (CH1_Stan_gerarda, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Stan_gerarda, LOG_RUNNING);
    B_LogEntry                     (CH1_Stan_gerarda,"Garett powiedzia³ mi, ¿e Gerard postanowi³ zostaæ sam w dawnym obozie ³owców orków. Lepiej sprawdzê co u niego. ");
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
   description	= "Ponoæ czegoœ ode mnie chcesz.";
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
    AI_Output (other, self ,"DIA_Straznik_KASTRAGIR_15_01"); //Ponoæ czegoœ ode mnie chcesz.
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_02"); //Chcê ciê ostrzec przed Kastagirem. Trzy miesi¹ce temu nasza grupa wraca³a ze swojej misji z gór. Nagle zauwa¿yliœmy jakieœ niewielkie orkowe wykopalisko. 
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_03"); //W pobli¿u by³o kilku orkowych szamanów i sporo elitarnych orków. Rzucili siê na nas broni¹c swego znaleziska. Zdo³aliœmy siê obroniæ przed pierwsz¹ fal¹ Orków. 
    AI_Output (other, self ,"DIA_Straznik_KASTRAGIR_15_04"); //Co by³o potem?
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_05"); //Ja i Kastagir zdo³aliœmy zajrzeæ do wykopanego przez Orków niewielkiego sarkofagu. Wewn¹trz, znaleŸliœmy czaszkê i jakiœ kryszta³.
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_06"); //Kastagir wzi¹³ go w d³oñ i nagle przeszy³a go jakaœ moc, wydawa³ siê byæ zahipnotyzowany. Równoczeœnie przyby³y posi³ki Orków. £owcy musieli siê wycofaæ. 
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_07"); //Si³¹ odci¹gn¹³em Kastagira, któremu wypad³ z rêki kryszta³. Od tamtej pory sta³ siê samotnikiem z dziwnym, niebezpiecznym spojrzeniem. 
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_08"); //Nocami przez sen zdarza³o mu siê krzyczeæ o potê¿nej mocy kryszta³u. Uwa¿aj na niego.
    AI_Output (other, self ,"DIA_Straznik_KASTRAGIR_15_09"); //Masz racjê lepiej byæ z nim ostro¿nym. Z drugiej strony jeœli ma zrobiæ coœ z³ego lepiej mieæ go na oku w koñcu ma ju¿ ksiêgê.
    AI_Output (self, other ,"DIA_Straznik_KASTRAGIR_03_10"); //Có¿, zrobisz co uwa¿asz za s³uszne.
	
      	B_LogEntry              (Kastragir,"£owca Garret ostrzeg³ mnie przed Kastagirem. Rzekomo mia³ on ju¿ mieæ w rêku magiczny kryszta³ mocy lecz go utraci³. Nim siê to jednak sta³o zosta³a na niego wywarta jakaœ tajemnicza si³a. Od tej pory Kastagir zmieni³ siê, staj¹c siê dziwnym samotnikiem. Z faktu, ¿e ma on ju¿ ksiêgê muszê mieæ go na oku. Ale zachowaæ niezbêdn¹ ostro¿noœæ i byæ niezwykle uwa¿nym.");

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