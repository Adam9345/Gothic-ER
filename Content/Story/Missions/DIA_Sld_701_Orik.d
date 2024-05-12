//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Orik_EXIT(C_INFO)
{
	npc             = Sld_701_Orik;
	nr              = 999;
	condition		= DIA_Orik_EXIT_Condition;
	information		= DIA_Orik_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Orik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Orik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Orik_HELLO1 (C_INFO)
{
   npc          = Sld_701_Orik;
   nr           = 1;
   condition    = DIA_Orik_HELLO1_Condition;
   information  = DIA_Orik_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Orik_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Orik_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Orik_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Orik_HELLO1_03_02"); //Nazywam siê Orik. Jestem Najemnikiem, ale to ju¿ pewnie wiesz.
    AI_Output (other, self ,"DIA_Orik_HELLO1_15_03"); //Czym siê na ogó³ zajmujesz?
    AI_Output (self, other ,"DIA_Orik_HELLO1_03_04"); //Wykonujê specjalne zlecenia na ¿yczenie samego Lee.
};

//========================================
//-----------------> PORACHUNKI
//========================================

INSTANCE DIA_Orik_PORACHUNKI (C_INFO)
{
   npc          = Sld_701_Orik;
   nr           = 1;
   condition    = DIA_Orik_PORACHUNKI_Condition;
   information  = DIA_Orik_PORACHUNKI_Info;
   permanent	= FALSE;
   description	= "Blizna nie ¿yje.";
};

FUNC INT DIA_Orik_PORACHUNKI_Condition()
{
    if (MIS_ScarMurder == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orik_PORACHUNKI_Info()
{
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_01"); //Blizna nie ¿yje. 
    AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_02"); //A ty sk¹d o tym wiesz?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_03"); //Bo pomaga³em wysy³aæ go na tamten œwiat.
    AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_04"); //Ale czemu przychodzisz z tym do mnie?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_05"); //Kosa mnie przys³a³. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_06"); //To znaczy?
    AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_07"); //To ty zleci³eœ zabójstwo Blizny. Chce wiedzieæ dlaczego.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_08"); //Trochê by o tym opowiada³...
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_09"); //Nigdzie mi siê nie œpieszy. Przynajmniej do czasu kiedy Bariera jest na swoim miejscu.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_10"); //Gdy czêœæ osób opuœci³a Stary Obóz i utworzy³a now¹ frakcje wœród ludzi, którzy pozostali na swoim miejscu powsta³ niema³y chaos. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_11"); //Wiele wa¿nych stanowisk w Obozie zosta³o opuszczonych i ktoœ musia³ je zast¹piæ. 
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_12"); //Któr¹ ze stron wtedy wybra³eœ? 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_13"); //Zdecydowa³em siê pozostaæ w Obozie. Po prostu wydawa³ mi siê silniejszy i sprawniej zarz¹dzany. W dodatku by³em jednym z najlepszych Stra¿ników Gomeza. A¿ do momentu, gdy z³o¿y³ mi pewn¹ propozycjê...

	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_15"); //Jak¹?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_16"); //W tamtym czasie z naprawdê zaufanych ludzi przy boku Gomezowi zostali tylko Kruk i Bartholo. Gomez postanowi³ lekko poszerzyæ tê grupê, aby lepiej zarz¹dzaæ Kolonii.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_18"); //Wiadomo, handel ze Œwiatem Zewnêtrznym i Bractwem, obrona konwojów przed Szkodnikami i Bandytami z gór no i zagro¿enie ze strony Orków wymaga³y sta³ej kontroli.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_19"); //W tamtym czasie najlepszymi Stra¿nikami byli Thorus, Arto, ja no i Blizna. To z nich Gomez wybiera³ dwóch, którzy mieli zostaæ Magnatami, choæ wtedy nie stosowano jeszcze takiego okreœlenia.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_20"); //Gomez zdecydowa³ siê na mnie i Thorusa. Rozwœcieczy³o to Bliznê, bo liczy³, ¿e to on zostanie awansowany, a na dodatek nie znosi³ mnie.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_21"); //Thorusa?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_22"); //On wola³ jednak zostaæ formalnym przywódc¹ Stra¿ników. Ba³ siê przesadnej w³adzy i jadu jakim zatruwa cz³owieka. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_23"); //Zamiast niego wybrano wiêc Arto. Blizna znowu zosta³ pominiêty. Tyle, ¿e Arto by³ jego kumplem, wiêc pominiêty Blizna skupi³ siê na mnie. Postanowi³ mi zaszkodziæ w oczach Gomeza.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_24"); //Cokolwiek zrobi³ patrz¹c na to, gdzie dzisiaj znajdujesz siê w Kolonii chyba mu siê uda³o...
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_25"); //Daj mi dokoñczyæ. Gdy ja i Arto zostaliœmy awansowani, wydano na nasz¹ czêœæ przyjêcie. By³em bardzo uradowany i wypi³em parê butelek dobrego wina. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_26"); //Potem poszed³em do swojego pokoju. Wtedy pojawi³ siê Blizna z butelk¹ jakiegoœ alkoholu i udawa³, ¿e gratuluje mi sukcesu. By³em pijany i da³em siê oszukaæ.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_27"); //Wypi³em z nim flaszkê, a potem zasn¹³em. Rano obudzili mnie Stra¿nicy z wyci¹gniêtymi mieczami.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_28"); //Co takiego niby siê sta³o?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_29"); //ZnaleŸli przy mnie flakonik z trucizn¹, razem z moim rzekomym pamiêtnikiem, gdzie na jednej ze stron by³o napisane, ¿e zamierzam otruæ Gomeza i spróbowaæ przej¹æ w³adzê. Nie muszê mówiæ, kto mi to podrzuci³ i kiedy.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_30"); //Gomez wpad³ w sza³. Od zawsze ma obsesjê podpowiadaj¹c mu, ¿e ktoœ chce go zabiæ. Tylko interwencja Kruka ocali³a mnie przed natychmiastowym posiekaniem przez Stra¿ników. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_31"); //On przeczuwa³, ¿e jestem niewinny. W ka¿dym razie trafi³em do lochów. Jednak pewnej nocy ktoœ podrzuci³ mi klucz do celi. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_32"); //Uciek³em z Zamku i jakoœ wymkn¹³em siê przez bramê Obozu. Potem ruszy³em przed siebie i b³¹ka³em siê przez wiele dni po Kolonii. Kiedy nie mia³em ju¿ nic do stracenia poszed³em do Nowego Obozu. 
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_33"); //Wszyscy byli pocz¹tkowo nieufni wobec mnie i mieli prawo, bo dopiero co by³em jednym z najwa¿niejszych ludzi Gomeza. Jednak z czasem moje czyny zapewni³y mi szacunek.
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_34"); //Sta³em siê jednym z najwa¿niejszych Najemników, a Lee uczyni³ mnie swoim osobistym doradc¹.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_35"); //A co z Blizn¹?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_36"); //Osi¹gn¹³ swój cel. Zaj¹³ moje miejsce.
	AI_Output (other, self ,"DIA_Orik_PORACHUNKI_15_37"); //Nie rozumiem, dlaczego ja mia³em siê mœciæ za ciebie?
	AI_Output (self, other ,"DIA_Orik_PORACHUNKI_03_38"); //Koloniê doœæ szybko obieg³y wieœci o twoich czynach. To nie byle jakie zas³ugi. Sam nie mog³em siê pokazaæ w Obozie. Nadawa³eœ siê do tego zadania. 	
	B_GiveXP (200);	
};

instance dia_orik_pickpocket(c_info) {
    npc = sld_701_orik;
    nr = 900;
    condition = dia_orik_pickpocket_condition;
    information = dia_orik_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_orik_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 40);
};

func void dia_orik_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_orik_pickpocket);
	info_addchoice(dia_orik_pickpocket, dialog_back, dia_orik_pickpocket_back);
	info_addchoice(dia_orik_pickpocket, dialog_pickpocket, dia_orik_pickpocket_doit);
};

func void dia_orik_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_orik_pickpocket);
};

func void dia_orik_pickpocket_back() {
    info_clearchoices(dia_orik_pickpocket);
};
