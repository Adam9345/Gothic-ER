
// ********************************
// 				EXIT
// ********************************

instance DIA_Richard_EXIT (C_INFO)
{
	npc			= VLK_40053_Richard;
	nr			= 999;
	condition	= DIA_Richard_EXIT_Condition;
	information	= DIA_Richard_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Richard_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Richard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};



// ********************************
// 				Dziwna przypad³oœæ
// ********************************

instance DIA_Richard_Hallo (C_INFO)
{
	npc			= VLK_40053_Richard;
	nr			= 1;
	condition	= DIA_Richard_Hallo_Condition;
	information	= DIA_Richard_Hallo_Info;
	permanent	= 0;
    important   = TRUE;
};                       

FUNC int DIA_Richard_Hallo_Condition()
{
if (hero.level >= 5) 
{
	return 1;
};
};
FUNC VOID  DIA_Richard_Hallo_Info()
{
	AI_Output (self, other,"DIA_Richard_Hallo_04_00"); //Ch³opcze, proszê podejdŸ na chwile. Musisz mi pomóc.
	AI_Output (other, self,"DIA_Richard_Hallo_15_01"); //O co chodzi? O rudê, któr¹ mam ci po¿yczyæ na wieczne nieoddanie?
	AI_Output (self, other,"DIA_Richard_Hallo_04_02"); //Nie mierz wszystkich w tej brudnej Kolonii jedn¹ miar¹.
    AI_Output (self, other,"DIA_Richard_Hallo_04_03"); //Tu nie chodzi o parê marnych bry³ek rudy na piwo. To powa¿na sprawa!
	AI_Output (self, other,"DIA_Richard_Hallo_04_04"); //Cholera... Niedobrze mi! (Bierze g³êboki oddech).
	AI_Output (self, other,"DIA_Richard_Hallo_04_05"); //Fatalnie siê czuje, oblewa mnie zimny pot, mam gor¹czkê i ci¹gle wymiotuje. Jest coraz gorzej...
	
};


//========================================
//-----------------> Dziwna przypad³oœæ
//========================================

INSTANCE DIA_Richard_Why (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_Why_Condition;
   information  = DIA_Richard_Why_Info;
   permanent	= FALSE;
   description	= "Dlaczego jest z tob¹ tak Ÿle?";
};

FUNC INT DIA_Richard_Why_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Richard_Hallo))
{
    return TRUE;
};
};


FUNC VOID DIA_Richard_Why_Info()
{
    AI_Output (other, self ,"DIA_Richard_Why_15_01"); //Dlaczego jest z tob¹ tak Ÿle?
    AI_Output (self, other ,"DIA_Richard_Why_03_02"); //Zawsze lubi³em graæ w koœci z innymi kopaczami. Parê tygodni temu czu³em, ¿e mi siê poszczêœci.
    AI_Output (self, other ,"DIA_Richard_Why_03_03"); //Postawi³em wiêc prawie ca³¹ swoja rudê i przegra³em. Wkrótce moje zapasy ¿ywnoœci siê skoñczy³y a na now¹ nie by³o mnie staæ.
    AI_Output (self, other ,"DIA_Richard_Why_03_04"); //Pewnego dnia znalaz³em jakiegoœ niebieskiego grzyba i odk¹d go zjad³em to wszystko siê zacze³o.
    AI_Output (self, other ,"DIA_Richard_Why_03_05"); //Grimes poradzi³ mi bym wys³a³ kogoœ by pomówi³ z jakimœ Magiem na temat lekarstwa.
	
	
};

//========================================
//-----------------> Dziwna przypad³oœæ
//========================================

INSTANCE DIA_Richard_Decyzja (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 2;
   condition    = DIA_Richard_Decyzja_Condition;
   information  = DIA_Richard_Decyzja_Info;
   permanent	= FALSE;
   description	= "Ten ktoœ to oczywiœcie ja... jak zwykle.";
};

FUNC INT DIA_Richard_Decyzja_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Richard_Why))
  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Richard_Decyzja_Info()
{
    AI_Output (other, self ,"DIA_Richard_Decyzja_15_01"); //Ten ktoœ to oczywiœcie ja... jak zwykle.
    AI_Output (self, other ,"DIA_Richard_Decyzja_03_02"); //M³ody, nie traktuj tego jak zwyk³¹ b³ahostkê. Tu chodzi o moje ¿ycie i zdrowie.
	AI_Output (self, other ,"DIA_Richard_Decyzja_03_03"); //Obiecujê ¿e jakoœ ci siê odwdziêdzê.
    AI_Output (other, self ,"DIA_Richard_Decyzja_15_04"); //Ale co konkretnie mam zrobiæ? Tak po prostu podreptaæ do, któregoœ z Magów i powiedzieæ, ¿e zjad³eœ jakiegoœ grzyba i Ÿle siê czujesz?!
    AI_Output (self, other ,"DIA_Richard_Decyzja_03_05"); //Musimy byæ dok³adni inaczej nie wyrwie siê temu cholerstwu i zginê marnie...
   
    Info_ClearChoices (DIA_Richard_Decyzja);
	Info_AddChoice    (DIA_Richard_Decyzja,"Dobrze, pomogê ci.",DIA_Richard_D_Tak);
	Info_AddChoice    (DIA_Richard_Decyzja,"Poszukaj sobie innego ch³opca na posy³ki.",DIA_Richard_D_Nie);
};

FUNC VOID DIA_Richard_D_Tak()
  {
	AI_Output (other,self ,"DIA_Richard_D_Tak_15_00");  //Dobrze, pomogê ci. Ale mów jasno co mam robiæ.
	AI_Output (self ,other,"DIA_Richard_D_Tak_11_01");  //Dam ci fiolkê z moj¹ krwi¹ a ty zaniesiesz j¹ Magowi znaj¹cemu siê na alchemii. Musi j¹ zbadaæ a potem pomyœleæ nad antidotum. Oto ona.
	AI_Output (other,self ,"DIA_Richard_D_Tak_15_02");  //Mam z tym iœæ do Maga w Starym Obozie?
    B_GiveInvItems (self,other, ItMi_RichardBlood, 1);
    AI_Output (self ,other,"DIA_Richard_D_Tak_11_03");  //Nie! Magowie Ognia to banda tego starego podstêpnego Corristo. S³ysza³em o nim wiele z³ego...
	AI_Output (self ,other,"DIA_Richard_D_Tak_11_04");  //Lepiej udaæ siê do Nowego Obozu pomówiæ z Magami Wody. Oni wydaj¹ siê uczciwi.
	AI_Output (other,self ,"DIA_Richard_D_Tak_15_05");  //W takim razie nie umieraj zbyt szybko.
    AI_Output (self ,other,"DIA_Richard_D_Tak_11_06");  //Cholerny ¿artowniœ...
	Richard_DP_Yes = TRUE;
	Log_CreateTopic		(DziwnaPrzypadlosc,	LOG_MISSION);
	Log_SetTopicStatus	(DziwnaPrzypadlosc,	LOG_RUNNING);
    B_LogEntry               (DziwnaPrzypadlosc,"Kopacz Richard mia³ ostatnio ciê¿ko w ¿yciu. Wiedziony wielkim g³odem zjad³ jakiegoœ dziwnie wygl¹daj¹cego grzyba. Od tamtej pory czuje siê coraz gorzej. Poprosi³ mnie bym mu pomóg³. Mam udaæ siê do Magów Wody po pomoc.");
	
	
	AI_StopProcessInfos	     (self); 
};


FUNC VOID DIA_Richard_D_Nie()
  {
	AI_Output (other,self ,"DIA_Richard_D_Nie_15_00");  //Co¿... Poszukaj sobie innego ch³opca na posy³ki.
    AI_StopProcessInfos	     (self); 
    Log_SetTopicStatus	(DziwnaPrzypadlosc,	LOG_FAILED);
};





//========================================
//-----------------> Dziwna przypad³oœæ
//========================================

INSTANCE DIA_Richard_Antidotum (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_Antidotum_Condition;
   information  = DIA_Richard_Antidotum_Info;
   permanent	= FALSE;
   description	= "Oto twoje antidotum. Wypij je a wyzdrowiejesz.";
};

FUNC INT DIA_Richard_Antidotum_Condition()
{
if (Npc_KnowsInfo (hero, Info_Riordian_DP_Lekarstwo))
&& (Npc_HasItems (other, ItMi_Dp_Antidotum) >=1)
{
    return TRUE;
};
};


FUNC VOID DIA_Richard_Antidotum_Info()
{
    AI_StandUp( VLK_40053_Richard ); 
    AI_Output (other, self ,"DIA_Richard_Antidotum_15_01"); //Oto twoje antidotum. Wypij je a wyzdrowiejesz.
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_02"); //Ledwo mogê ustaæ na nogach... Eeee... Zaraz siê po¿ygam...
    AI_Output (other, self ,"DIA_Richard_Antidotum_15_03"); //Pij!
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_04"); //Dobrze...
	B_GiveInvItems (other,self, ItMi_Dp_Antidotum, 1);
	AI_UseItem(self,ItMi_Dp_Antidotum);
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_05"); //Ohyda!
	AI_Output (other, self ,"DIA_Richard_Antidotum_15_06"); //I jak lepiej?
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_07"); //Chyba nie. Wróæ jutro o ile go do¿yje, bêdê ju¿ wiedzia³ czy lekarstwo pomog³o.
    AI_Output (other, self ,"DIA_Richard_Antidotum_15_08"); //Do jutra.
	Richard_Heal_Day = Wld_GetDay();
	B_LogEntry               (DziwnaPrzypadlosc,"Da³em Richardowi lekarstwo. Nie by³o zbyt smaczne ale oka¿ê siê czy skuteczne. Pomówiê z nim jutro.");
	
};


//========================================
//-----------------> Dziwna przypad³oœæ
//========================================

INSTANCE DIA_Richard_Jak_Tam (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_Jak_Tam_Condition;
   information  = DIA_Richard_Jak_Tam_Info;
   permanent	= FALSE;
   description	= "I jak tam?";
};

FUNC INT DIA_Richard_Jak_Tam_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Richard_Antidotum))  
&& (Richard_Heal_Day != Wld_GetDay())
{
    return TRUE;
};
};


FUNC VOID DIA_Richard_Jak_Tam_Info()
{
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_01"); //I jak tam?
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_02"); //To niewiarygodne ale czuje siê znacznie lepiej!
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_03"); //Wymioty, dreszcze i gor¹czka ust¹pi³y. Pod koniec myœla³em ju¿, ¿e umrê.
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_04"); //Tak by siê sta³o. Zjad³eœ wyj¹tkowo truj¹cego grzyba, mia³eœ szczêœcie, ¿e Mag Riordian zna³ antidotum.
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_05"); //Jestem twoim d³u¿nikiem. Gdyby nie ty, by³bym w³aœnie wrzucany do do³u z robactwem...
	AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_06"); //Zapewne tak.
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_07"); //Umiem siê odwdziêczyæ. WeŸ to jako zap³atê chocia¿ tak naprawdê wyœwiadczy³eœ mi bezcenn¹ przys³ugê.
	B_GiveInvItems (self,other, itminugget, 60);
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_08"); //Dziêki. Nastêpnym razem nie ³aduj siê w takie tarapaty.
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_09"); //Wykorzystam drug¹ szanse od ¿ycia i postaram siê mieæ czêœciej g³owê na karku.
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_10"); //Sugerowa³bym mieæ j¹ tam zawsze. Trzymaj siê i powodzenia.
	AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_11"); //Dziêkuje ci za pomoc. Do zobaczenia.
	B_LogEntry               (DziwnaPrzypadlosc,"Richard czuje siê lepiej. Antidotum okaza³o siê skuteczne. Uda³o mi siê go uratowaæ. Kopacz by³ mi bardzo wdziêczny i wyp³aci³ nale¿n¹ nagrodê.");
	Npc_ExchangeRoutine(self,"Mine");
	Log_SetTopicStatus	(DziwnaPrzypadlosc,	LOG_SUCCESS);
	B_GiveXP(300);
	
};


//========================================
//-----------------> HI_RICHARD
//========================================

INSTANCE DIA_Richard_HI_RICHARD (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_HI_RICHARD_Condition;
   information  = DIA_Richard_HI_RICHARD_Info;
   permanent	= FALSE;
   description	= "Jak tam u ciebie?";
};

FUNC INT DIA_Richard_HI_RICHARD_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Richard_HI_RICHARD_Info()
{
    AI_Output (other, self ,"DIA_Richard_HI_RICHARD_15_01"); //Jak tam u ciebie?
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_02"); //Raz na wozie raz pod wozem.
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_03"); //Jakoœ jeszcze ¿yje.
    AI_Output (other, self ,"DIA_Richard_HI_RICHARD_15_04"); //Tutaj w kolonii to zawsze coœ, prawda?
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_05"); //Tak. Wielu ju¿ w ten czy inny sposób wybra³o siê na tamten œwiat pod barier¹.
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_06"); //Poza ni¹ nie by³o idylli ale przynajmniej mia³eœ wolny wybór.
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_07"); //No i jeszcze rodzinê.
    AI_Output (other, self ,"DIA_Richard_HI_RICHARD_15_08"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_09"); //Przepraszam ale to zbyt bolesne. Nie chce do tego wracaæ.
    AI_StopProcessInfos	(self);
};

instance dia_richard_pickpocket(c_info) {
    npc = vlk_40053_richard;
    nr = 900;
    condition = dia_richard_pickpocket_condition;
    information = dia_richard_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_richard_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_richard_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_richard_pickpocket);
	info_addchoice(dia_richard_pickpocket, dialog_back, dia_richard_pickpocket_back);
	info_addchoice(dia_richard_pickpocket, dialog_pickpocket, dia_richard_pickpocket_doit);
};

func void dia_richard_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_richard_pickpocket);
};

func void dia_richard_pickpocket_back() {
    info_clearchoices(dia_richard_pickpocket);
};