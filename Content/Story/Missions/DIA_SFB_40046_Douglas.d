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
	AI_Output (self, other,"DIA_Douglas_Hello_09_00"); //Witaj, chyba m�g�by� mi pom�c.
	AI_Output (other, self,"DIA_Douglas_Hello_15_01"); //W czym?
	AI_Output (self, other,"DIA_Douglas_Hello_09_02"); //W odzyskaniu moich paru grat�w.
	AI_Output (other, self,"DIA_Douglas_Hello_15_03"); //Obawiam si�, �e nie mam czasu na odzyskiwanie jakich� grat�w.
	AI_Output (self, other,"DIA_Douglas_Hello_09_04"); //Spokojnie m�ody! To by�a tylko przeno�nia...
	AI_Output (self, other,"DIA_Douglas_Hello_09_05"); //Tak naprawd� chodzi mi o co� cennego.
	AI_Output (other, self,"DIA_Douglas_Hello_15_06"); //Co takiego?
	AI_Output (self, other,"DIA_Douglas_Hello_09_07"); //Musz� ci� uraczy� pewn� opowie�ci�...

	};

// ************************************************************
// 						Sch�rfer
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
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_01"); //Powiem tak. zajmuje si� g�rnictwem nie od dzi�. Nim zacz��em prac� w kotle, szwenda�em si� po Kolonii tu i tam.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_02"); //W poszukiwaniu zarobku i czego� do zjedzenia. Pewnego dnia trafi�a mi si� nie lada gratka.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_03"); //W pobli�u chaty my�liwego Aidana odnalaz�em spor� bry�� siarki. Oczywi�cie postanowi�em si� do niej dobra�.
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA_15_04"); //I co by�o dalej?
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_05"); //Pozyska�em tyle siarki ile by�em w stanie unie��. Potem postanowi�em uda� si� do Nowego Obozu gdzie od niedawna mieszka�em.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_06"); //Ale szybko pojawi� si� pewien problem... Dok�adnie m�wi�c czterech bandzior�w, kt�rzy postanowili mnie obrabowa�.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_07"); //Ale nie jestem jakim� wa�koniem, kt�ry �atwo si� poddaje!
	
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_08"); //Rzuci�em si� do ucieczki. I p�dzi�em gdzie popadnie, byle z dala od moich wrog�w.
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA_15_09"); //No i uciek�e� jak si� domy�lam...
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_10"); //Tak da�em nog�. Zgubi�em ich ale biegn�c na o�lep dotar�em do kamiennych kr�g�w. Nieprzyjemne miejsce jak na m�j gust...
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_11"); //Zacz�o si� �ciemnia�. A ja wci�� obawia�em si�, �e w pobli�u czyhaj� ci zb�je by przej�� ca�y m�j urobek.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_12"); //Znalaz�em star� skrzyni� i wierz lub nie ukry�em tam ca�� siark�, kt�r� mia�em.
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA_15_13"); //Czyli ca�a twoja siarka jest teraz przy kamiennych kr�gach? 
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_14"); //Je�li nikt si� do tego nie dobra�, to tak. Ale okolice nie by�a przesadnie zaludniona.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA_09_15"); //Mroczna aura a� unosi�a si� w powietrzu.
	
};





// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE DIA_DOUGLAS_SIARKA1(C_INFO)
{
	npc			= SFB_40046_Douglas;
	nr			= 1;
	condition	= DIA_DOUGLAS_SIARKA1_Condition;
	information	= DIA_DOUGLAS_SIARKA1_Info;
	permanent	= false;
	description = "Pewnie chcesz �ebym tam poszed� i przyni�s� ci te ca�� siark�?";
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
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA1_15_00"); //Pewnie chcesz �ebym tam poszed� i przyni�s� ci te ca�� siark�?
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_01"); //Tak. Ja wol� tu odpocz�� od pracy a nie zaszywa� si� w tamto przera�aj�ce miejsce.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_02"); //To jak, m�g�by� mi pom�c?	
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA1_15_03"); //By� mo�e. Je�li dobrze mi zap�acisz, m�g�bym odzyska� dla ciebie ukopan� siark�.	
    AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_04"); //Dzi�kuje. Wiedz, �e si� odwdzi�cz�.
	AI_Output (self, other,"DIA_DOUGLAS_SIARKA1_09_05"); //Masz tu map� z zaznaczonym miejsce, ukrycia siarki.
	
	CreateInvItems (self, ItDouglasMap, 1);
    B_GiveInvItems (self, other, ItDouglasMap, 1);
	
	
	
	AI_Output (other, self,"DIA_DOUGLAS_SIARKA1_15_06"); // Dzi�ki. Postaram si� tym zaj��.
	
	Wld_InsertNpc				(Gobbo_Warrior_US,"FP_ROAM_OW_GOBBO_BOSS_KR");
	  Log_CreateTopic          (UkrytaSiarka, LOG_MISSION);
      Log_SetTopicStatus       (UkrytaSiarka, LOG_RUNNING);
	  
	  B_LogEntry                     (UkrytaSiarka,"Kret Douglas poprosi� mnie bym pom�g� mu odzyska� jego wydobyt� siark�. Jest ona ukryta nieopodal kamiennych kr�g�w. Gdybym by� w pobli�u to m�g�bym si� tym zainteresowa�.");
	  AI_StopProcessInfos	(self);
};




// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE DIA_DOUGLAS_MAM_SIARKE(C_INFO)
{
	npc			= SFB_40046_Douglas;
	nr			= 1;
	condition	= DIA_DOUGLAS_MAM_SIARKE_Condition;
	information	= DIA_DOUGLAS_MAM_SIARKE_Info;
	permanent	= false;
	description = "Mam twoj� siark�.";
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
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_00");  //Mam twoj� siark�.
	AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_01");  //Wspaniale! Daj mi j�!
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_02");  //Prosz�.
	B_GiveInvItems (other,self, ItMi_Alchemy_Sulphur_01, 30);
	AI_Output  (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_03");  //A tu w zamian twoja ruda. Zas�u�y�e�.
	CreateInvItems (self, ItMiNugget, 60);
    B_GiveInvItems (self, other, ItMiNugget, 60);
    AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_04"); //No i jak by�o trudno to odzyska�?
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_05"); //Nie by�o najgorzej... Wy��czywszy spotkanie z paroma potworami, i... chocia�by stadem goblin�w...
	AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_06"); //Hmm... Wydaje mi si� �e nie chcesz mi czego� powiedzie�. Ale masz moj� siark� i skoro ze mn� rozmawiasz to nie b�d� wnika�...
    AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_07"); //Wydaje ci si�... Pos�a�em plugastwa do piachu.
    AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_08"); //To dobrze. To cz�owiek powinien rz�dzi� w tej Kolonii a nie jakie� stwory!
	AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_09"); //Racja.
	AI_Output (self, other,"DIA_DOUGLAS_MAM_SIARKE_09_10"); //Dzi�ki za pomoc. Nie mam ci nic do zarzucenia.
    AI_Output (other, self,"DIA_DOUGLAS_MAM_SIARKE_15_11"); //Ciesz� si�. Do zobaczenia.

      Log_SetTopicStatus       (UkrytaSiarka, LOG_SUCCESS);
	  B_GiveXP (150);
	  B_LogEntry                     (UkrytaSiarka,"Zwr�ci�em Douglasowi jego siark�. Teraz i on i ja jeste�my usatysfakcjonowani. Douglas bo odzyska� swoj� w�asno�� a uzyska�em troch� rudy w nagrod� za wycieczk� do kamiennych kr�g�w.");
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
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_02"); //Odpoczywam po ci�kiej pracy w Wolnej Kopalni.
    AI_Output (other, self ,"DIA_Douglas_HI_DOUGLAS_15_03"); //Jak tam jest?
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_04"); //Krety ostro zasuwaj� a Najemnicy pilnuj� tego ca�ego bajzlu.
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_05"); //Podobnie jak Stra�nicy stoj�cy nad Kopaczami w kopalni Gomeza.
    AI_Output (other, self ,"DIA_Douglas_HI_DOUGLAS_15_06"); //D�ugo ju� jeste� Kretem?
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_07"); //Od samego pocz�tku gdy tu trafi�em czyli 3 lata temu. Przysta�em do Nowego Obozu i zaj��em si� tym co robi� do dzi�. Ryciem w ziemi i ska�ach.
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_08"); //Nie zamierzam do��czy� do ludzi Laresa. Nie pasuj� tam.
    AI_Output (self, other ,"DIA_Douglas_HI_DOUGLAS_03_09"); //Wol� ju� sw�j aktualny los. Nie ma bogactwa i dobrobytu ale przynajmniej wci�� �yje i teraz mog� si� napi� w spokoju.
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