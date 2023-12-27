// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Douglas_EXIT(C_INFO)
{
	npc			= SFB_40046_Douglas ;
	nr			= 999;
	condition	= Info_Douglas_EXIT_Condition;
	information	= Info_Douglas_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Douglas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Douglas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Douglas_Hello(C_INFO)
{
	npc			= SFB_40046_Douglas;
	nr			= 1;
	condition	= DIA_Douglas_Hello_Condition;
	information	= DIA_Douglas_Hello_Info;
	permanent	= false;
    important   = TRUE;
};                       

FUNC INT DIA_Douglas_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Douglas_Hello_Info()
{	
	AI_Output (self, other,"DIA_Douglas_Hello_09_00"); //Witaj, chyba móg³byœ mi pomóc.
	AI_Output (other, self,"DIA_Douglas_Hello_15_01"); //W czym?
	AI_Output (self, other,"DIA_Douglas_Hello_09_02"); //W odzyskaniu moich paru gratów.
	AI_Output (other, self,"DIA_Douglas_Hello_15_03"); //Obawiam siê, ¿e nie mam czasu na odzyskiwanie jakichœ gratów.
	AI_Output (self, other,"DIA_Douglas_Hello_09_04"); //Spokojnie m³ody! To by³a tylko przenoœnia...
	AI_Output (self, other,"DIA_Douglas_Hello_09_05"); //Tak naprawdê chodzi mi o coœ cennego.
	AI_Output (other, self,"DIA_Douglas_Hello_15_06"); //Co takiego?
	AI_Output (self, other,"DIA_Douglas_Hello_09_07"); //Muszê ciê uraczyæ pewn¹ opowieœci¹...

	};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE DIA_DOUGLAS_SIARKA(C_INFO)
{
	npc			= SFB_40046_Douglas;
	nr			= 1;
	condition	= DIA_DOUGLAS_SIARKA_Condition;
	information	= DIA_DOUGLAS_SIARKA_Info;
	permanent	= false;
	description = "To opowiadaj.";
};                       

FUNC INT DIA_DOUGLAS_SIARKA_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Douglas_Hello)
	
	{
		return 1;
	};
};

FUNC VOID DIA_DOUGLAS_SIARKA_Info()
{	
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA_15_00"); //To opowiadaj.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_01"); //Powiem tak. zajmuje siê górnictwem nie od dziœ. Nim zacz¹³em pracê w kotle, szwenda³em siê po Kolonii tu i tam.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_02"); //W poszukiwaniu zarobku i czegoœ do zjedzenia. Pewnego dnia trafi³a mi siê nie lada gratka.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_03"); //W pobli¿u chaty myœliwego Aidana odnalaz³em spor¹ bry³ê siarki. Oczywiœcie postanowi³em siê do niej dobraæ.
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA_15_04"); //I co by³o dalej?
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_05"); //Pozyska³em tyle siarki ile by³em w stanie unieœæ. Potem postanowi³em udaæ siê do Nowego Obozu gdzie od niedawna mieszka³em.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_06"); //Ale szybko pojawi³ siê pewien problem... Dok³adnie mówi¹c czterech bandziorów, którzy postanowili mnie obrabowaæ.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_07"); //Ale nie jestem jakimœ wa³koniem, który ³atwo siê poddaje!
	
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_08"); //Rzuci³em siê do ucieczki. I pêdzi³em gdzie popadnie, byle z dala od moich wrogów.
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA_15_09"); //No i uciek³eœ jak siê domyœlam...
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_10"); //Tak da³em nogê. Zgubi³em ich ale biegn¹c na oœlep dotar³em do kamiennych krêgów. Nieprzyjemne miejsce jak na mój gust...
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_11"); //Zaczê³o siê œciemniaæ. A ja wci¹¿ obawia³em siê, ¿e w pobli¿u czyhaj¹ ci zbóje by przej¹æ ca³y mój urobek.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_12"); //Znalaz³em star¹ skrzyniê i wierz lub nie ukry³em tam ca³¹ siarkê, któr¹ mia³em.
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA_15_13"); //Czyli ca³a twoja siarka jest teraz przy kamiennych krêgach? 
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_14"); //Jeœli nikt siê do tego nie dobra³, to tak. Ale okolice nie by³a przesadnie zaludniona.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_15"); //Mroczna aura a¿ unosi³a siê w powietrzu.
	
};





// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE DIA_DOUGLAS_SIARKA1(C_INFO)
{
	npc			= SFB_40046_Douglas;
	nr			= 1;
	condition	= DIA_DOUGLAS_SIARKA1_Condition;
	information	= DIA_DOUGLAS_SIARKA1_Info;
	permanent	= false;
	description = "Pewnie chcesz ¿ebym tam poszed³ i przyniós³ ci te ca³¹ siarkê?";
};                       

FUNC INT DIA_DOUGLAS_SIARKA1_Condition()
{
	if Npc_KnowsInfo (hero,DIA_DOUGLAS_SIARKA)
	
	{
		return 1;
	};
};

FUNC VOID DIA_DOUGLAS_SIARKA1_Info()
{	
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA1_15_00"); //Pewnie chcesz ¿ebym tam poszed³ i przyniós³ ci te ca³¹ siarkê?
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_01"); //Tak. Ja wolê tu odpocz¹æ od pracy a nie zaszywaæ siê w tamto przera¿aj¹ce miejsce.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_02"); //To jak, móg³byœ mi pomóc?	
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA1_15_03"); //Byæ mo¿e. Jeœli dobrze mi zap³acisz, móg³bym odzyskaæ dla ciebie ukopan¹ siarkê.	
    AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_04"); //Dziêkuje. Wiedz, ¿e siê odwdziêczê.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_05"); //Masz tu mapê z zaznaczonym miejsce, ukrycia siarki.
	
	CreateInvItems (self, ItDouglasMap, 1);
    B_GiveInvItems (self, other, ItDouglasMap, 1);
	
	
	
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA1_15_06"); // Dziêki. Postaram siê tym zaj¹æ.
	
	Wld_InsertNpc				(Gobbo_Warrior_US,"FP_ROAM_OW_GOBBO_BOSS_KR");
	  Log_CreateTopic          (UkrytaSiarka, LOG_MISSION);
      Log_SetTopicStatus       (UkrytaSiarka, LOG_RUNNING);
	  
	  B_LogEntry                     (UkrytaSiarka,"Kret Douglas poprosi³ mnie bym pomóg³ mu odzyskaæ jego wydobyt¹ siarkê. Jest ona ukryta nieopodal kamiennych krêgów. Gdybym by³ w pobli¿u to móg³bym siê tym zainteresowaæ.");
	  AI_StopProcessInfos	(self);
};




// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE DIA_DOUGLAS_MAM_SIARKE(C_INFO)
{
	npc			= SFB_40046_Douglas;
	nr			= 1;
	condition	= DIA_DOUGLAS_MAM_SIARKE_Condition;
	information	= DIA_DOUGLAS_MAM_SIARKE_Info;
	permanent	= false;
	description = "Mam twoj¹ siarkê.";
};                       

FUNC INT DIA_DOUGLAS_MAM_SIARKE_Condition()
{
	if Npc_KnowsInfo (hero,DIA_DOUGLAS_SIARKA1)
	&& (Npc_HasItems(other,ItMi_Alchemy_Sulphur_01) >= 30) 
	&& (Npc_IsDead (Gobbo_Warrior_US))
	{
		return 1;
	};
};

FUNC VOID DIA_DOUGLAS_MAM_SIARKE_Info()
{	
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_00");  //Mam twoj¹ siarkê.
	AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_01");  //Wspaniale! Daj mi j¹!
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_02");  //Proszê.
	B_GiveInvItems (other,self, ItMi_Alchemy_Sulphur_01, 30);
	AI_Output  (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_03");  //A tu w zamian twoja ruda. Zas³u¿y³eœ.
	CreateInvItems (self, ItMiNugget, 60);
    B_GiveInvItems (self, other, ItMiNugget, 60);
    AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_04"); //No i jak by³o trudno to odzyskaæ?
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_05"); //Nie by³o najgorzej... Wy³¹czywszy spotkanie z paroma potworami, i... chocia¿by stadem goblinów...
	AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_06"); //Hmm... Wydaje mi siê ¿e nie chcesz mi czegoœ powiedzieæ. Ale masz moj¹ siarkê i skoro ze mn¹ rozmawiasz to nie bêdê wnika³...
    AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_07"); //Wydaje ci siê... Pos³a³em plugastwa do piachu.
    AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_08"); //To dobrze. To cz³owiek powinien rz¹dziæ w tej Kolonii a nie jakieœ stwory!
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_09"); //Racja.
	AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_10"); //Dziêki za pomoc. Nie mam ci nic do zarzucenia.
    AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_11"); //Cieszê siê. Do zobaczenia.

      Log_SetTopicStatus       (UkrytaSiarka, LOG_SUCCESS);
	  B_GiveXP (150);
	  B_LogEntry                     (UkrytaSiarka,"Zwróci³em Douglasowi jego siarkê. Teraz i on i ja jesteœmy usatysfakcjonowani. Douglas bo odzyska³ swoj¹ w³asnoœæ a uzyska³em trochê rudy w nagrodê za wycieczkê do kamiennych krêgów.");
	  AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HI_DOUGLAS
//========================================

INSTANCE DIA_Douglas_HI_DOUGLAS (C_INFO)
{
   npc          = SFB_40046_Douglas;
   nr           = 1;
   condition    = DIA_Douglas_HI_DOUGLAS_Condition;
   information  = DIA_Douglas_HI_DOUGLAS_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Douglas_HI_DOUGLAS_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Douglas_HI_DOUGLAS_Info()
{
    AI_Output (other, self ,"DIA_Douglas_HI_DOUGLAS_15_01"); //Co u ciebie?
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_02"); //Odpoczywam po ciê¿kiej pracy w Wolnej Kopalni.
    AI_Output (other, self ,"DIA_Douglas_HI_DOUGLAS_15_03"); //Jak tam jest?
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_04"); //Krety ostro zasuwaj¹ a Najemnicy pilnuj¹ tego ca³ego bajzlu.
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_05"); //Podobnie jak Stra¿nicy stoj¹cy nad Kopaczami w kopalni Gomeza.
    AI_Output (other, self ,"DIA_Douglas_HI_DOUGLAS_15_06"); //D³ugo ju¿ jesteœ Kretem?
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_07"); //Od samego pocz¹tku gdy tu trafi³em czyli 3 lata temu. Przysta³em do Nowego Obozu i zaj¹³em siê tym co robiê do dziœ. Ryciem w ziemi i ska³ach.
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_08"); //Nie zamierzam do³¹czyæ do ludzi Laresa. Nie pasujê tam.
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_09"); //Wolê ju¿ swój aktualny los. Nie ma bogactwa i dobrobytu ale przynajmniej wci¹¿ ¿yje i teraz mogê siê napiæ w spokoju.
};

instance dia_douglas_pickpocket(c_info) {
    npc = sfb_40046_douglas;
    nr = 900;
    condition = dia_douglas_pickpocket_condition;
    information = dia_douglas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_douglas_pickpocket_condition() {
	e_beklauen(baseThfChanceSFB, 30);
};

func void dia_douglas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_douglas_pickpocket);
	info_addchoice(dia_douglas_pickpocket, dialog_back, dia_douglas_pickpocket_back);
	info_addchoice(dia_douglas_pickpocket, dialog_pickpocket, dia_douglas_pickpocket_doit);
};

func void dia_douglas_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_douglas_pickpocket);
};

func void dia_douglas_pickpocket_back() {
    info_clearchoices(dia_douglas_pickpocket);
};