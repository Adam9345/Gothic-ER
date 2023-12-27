//poprawione i sprawdzone -  

/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_Exit (C_INFO)
{
	npc			=  Nov_1371_BaalNetbek;
	nr			=  999;
	condition	=  Nov_1371_BaalNetbek_Exit_Condition;
	information	=  Nov_1371_BaalNetbek_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							G�RTNER								
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_CRAZY (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_CRAZY_Condition;
	information		= Nov_1371_BaalNetbek_CRAZY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kim jeste�?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Kim jeste�?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Jestem Guru z obozu na bagnie. Moi s�udzy m�wi� na mnie Baal Netbek.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //S�udzy? Nie widz� tu �adnej s�u�by.
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Och, ale� oni s� wsz�dzie. Sp�jrz na drzewa. Jak one ta�cz�! 
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //Eee, rozumiem. C�, chyba p�jd� ju� dalej...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Zaczekaj, m�g�by� pom�c mi przekszta�ci� to bagno w ogromn� ��k� pe�n� kwiat�w!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Mo�e zaczniesz beze mnie? Wr�c�... nied�ugo.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //Ten cz�owiek raczej mi nie pomo�e...
	AI_StopProcessInfos	( self );
};  
/*------------------------------------------------------------------------
							AGAIN							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_AGAIN (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_AGAIN_Condition;
	information		= Nov_1371_BaalNetbek_AGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Cze��, co s�ycha�?"; 
};

FUNC int  Nov_1371_BaalNetbek_AGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};

};
FUNC void  Nov_1371_BaalNetbek_AGAIN_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Cze��, co s�ycha�?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Tylko uwa�aj, �eby� nie skrzywdzi� moich kochanych drzew! 
};  


/*------------------------------------------------------------------------
							QUEST							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_QUEST (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_QUEST_Condition;
	information		= Nov_1371_BaalNetbek_QUEST_Info;
	important		= 0;
	description		= "Wiesz co� o handlarzu, kt�ry sprzedaje amulety?"; 
};

FUNC int  Nov_1371_BaalNetbek_QUEST_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Talas_ABOUT_STEH))
	{
		return TRUE;
	};
};
FUNC void  Nov_1371_BaalNetbek_QUEST_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_01"); //Wiesz co� o handlarzu, kt�ry sprzedaje amulety?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_02"); //Krzywdzi drzewa...
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_03"); //Skupmy si� mo�e na czym� innym. Siedzisz tu ca�y czas. Widzia�e� co� podejrzanego?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_04"); //To by�o kilka dni temu. Rozmawia�em z moj� ulubion� paproci�, gdy spostrzeg�em jak kto� czai si� za chat� Nyrasa. 
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_05"); //Postanowi�em schowa� si� za du�ym drzewem rosn�cym nieopodal.
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_06"); //Nie uwierzysz co si� potem sta�o. Schyli�em si� i dostrzeg�em, �e na korzeniu mojego ulubionego drzewa ro�nie olbrzymi mech!
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_07"); //Pr�bowa�em go zerwa�, ale wr�s� strasznie mocno!
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_08"); //Moje pytanie brzmi: czy znasz jakie� magiczne preparaty nie bazuj�ce na alkoholu dzi�ki kt�rym pozb�d� si� tego paskudztwa?
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_09"); //...
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_10"); //Co si� sta�o dalej?! Handlarz! Pami�tasz?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_11"); //No pr�bowa�em oderwa� ten mech... Gdy ponownie si� rozejrza�em, zobaczy�em tylko sylwetk� biegn�c� w stron� tartaku. 
	B_LogEntry               (CH3_StrangeResearcher,"Baal Netbek podobno widzia� wieczorem Nowicjusza, kt�ry kr�ci� si� w okolicach chaty Nyrasa. Nie wiem co by�o p�niej, ale Nowicjusz oddali� si� w stron� tartaku. Czy�by to Hanson? ");
};  
	
//---------------------------------------------------------------1.6.1--------------------------------------------------------------
/*------------------------------------------------------------------------
							Dziwna Przypad�o��							
------------------------------------------------------------------------*/

instance  DIA_Nov_1371_BaalNetbek_DP (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= DIA_Nov_1371_BaalNetbek_DP_Condition;
	information		= DIA_Nov_1371_BaalNetbek_DP_Info;
	important		= 0;
	description		= "Potrzebuje nasion Rombowca Modrego. Wiesz co to jest prawda?"; 
};

FUNC int  DIA_Nov_1371_BaalNetbek_DP_Condition()
{	
	if (Npc_KnowsInfo (hero,Info_Riordian_Fiolka_Krwi))
	{
		return TRUE;
	};

};
FUNC void  DIA_Nov_1371_BaalNetbek_DP_Info()
{
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_01"); //Potrzebuje nasion Rombowca Modrego. Wiesz co to jest prawda?
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_02"); //Ja wiem... Ja wiele wiem... ale musz� dba� o swych przyjaci�.
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_03"); //Oni musz� dobrze wyrosn�� z ziemi.
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_04"); //Wiedzia�em, �e nie b�dzie �atwo..
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_05"); //Chcesz pom�c mi sadzi� nowych braci by by�o ich jak najwi�cej?
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_06"); //Nie, chce tylko...
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_07"); //Nie kr�puj si�. Sadzenie braci to sama przyjemno�� i dobry uczynek!
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_08"); //Czy�by?! A co je�li ja sadz� tylko braci, kt�rzy rosn� z nasion Rombowca Modrego?
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_09"); //Dam ci te nasiona. A ty rozsiewaj je by nowe dusze do��czy�y do nas i ubogaci�y �wiat!
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_10"); //No i gdzie te nasiona.
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_11"); //Mam, ma�y woreczek tych rzadkich nasion. Oto one.
	CreateInvItem (Nov_1371_BaalNetbek, ItMi_Netbek_Seed);
	B_GiveInvItems (self,other,ItMi_Netbek_Seed, 1);
	AI_Output (other, self,"DIA_Nov_1371_BaalNetbek_DP_Info_15_12"); //Dzi�ki, nie musisz si� ju� martwi� o te nasiona... znaczy swoich braci czy tam przyjaci�...
	AI_Output (self, other,"DIA_Nov_1371_BaalNetbek_DP_Info_03_13"); //Dzi�kuje za pomoc.
	 B_LogEntry               (DziwnaPrzypadlosc,"Rozmawia�em z Baalem Netbekiem. Uda�o mi si� go zmanipulowa� by da� mi nasiona rombowca modrego. Wi�c ten sk�adnik mam ju� z g�owy.");
	
};  	


//========================================
//-----------------> GRU_MUDPL
//========================================

INSTANCE DIA_BaalNetbek_GRU_MUDPL (C_INFO)
{
   npc          = Nov_1371_BaalNetbek;
   nr           = 1;
   condition    = DIA_BaalNetbek_GRU_MUDPL_Condition;
   information  = DIA_BaalNetbek_GRU_MUDPL_Info;
   permanent	= FALSE;
   description	= "Potrzebuje ro�lin z tej listy.";
};

FUNC INT DIA_BaalNetbek_GRU_MUDPL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Caine_Gruzlik))
{
    return TRUE;
};
};
FUNC VOID DIA_BaalNetbek_GRU_MUDPL_Info()
{
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDPL_15_01"); //Potrzebuje ro�lin z tej listy.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_02"); //Nie mam �adnej z tych wspania�ych ro�linek.
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDPL_15_03"); //Cholera...
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_04"); //Ale wiem gdzie s� nasiona B�otniaka przyjacielu.
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_05"); //Niestety tamtejszy teren zamieszkuj� te okropne b�otne w�e a ja nie mam zamiaru sk�czy� w paszczy kt�rego� z nich.
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDPL_15_06"); //M�g�by� mi wskaza� to mjejsce?
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDPL_03_07"); //A rozniesiesz po bagnie troch� nasionek?
    B_LogEntry               (Gruzlik,"Baal Netbek nie ma �adnej ro�liny z listy. Jednak wie gdzie s� nasiona B�otnika. Mo�e mnie tam zaprowadzi� je�li obiecam, �e potem roznios� po bagnie troch� jego nasion. C�, chyba mam lepsze rzeczy do roboty... Nie zaszkodzi jak przy pierwszej lepszej okazji wyrzuc� woreczek zi� a zajm� si� ratowaniem Fritza.");
    Info_ClearChoices	(DIA_BaalNetbek_GRU_MUDPL);
    Info_AddChoice		(DIA_BaalNetbek_GRU_MUDPL, "Tak (Sk�am).", DIA_BaalNetbek_GRU_ADD);
};

FUNC VOID DIA_BaalNetbek_GRU_ADD()
{
AI_Output (other, self ,"DIA_BaalNetbek_GRU_ADD_15_01"); //Tak...
AI_Output (self , other,"DIA_BaalNetbek_GRU_ADD_15_02"); //We� przyjacielu te kochane nasioneczka a ja najpierw ci poka�� gdzie s� nasiona B�otnika.
AI_Output (other, self ,"DIA_BaalNetbek_GRU_ADD_15_03"); //W porz�dku.
Wld_InsertItem			(ItFo_MudHerb,"FP_ITEM_GRU_MUDPLANT");
Wld_InsertItem			(ItFo_MudSeed,"FP_ITEM_GRU_MUDSEED3");
Wld_InsertItem			(ItFo_MudSeed,"FP_ITEM_GRU_MUDSEED1");
Npc_ExchangeRoutine(self,"gruzlik");
AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GRU_MUDSEED
//========================================

INSTANCE DIA_BaalNetbek_GRU_MUDSEED (C_INFO)
{
   npc          = Nov_1371_BaalNetbek;
   nr           = 1;
   condition    = DIA_BaalNetbek_GRU_MUDSEED_Condition;
   information  = DIA_BaalNetbek_GRU_MUDSEED_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_BaalNetbek_GRU_MUDSEED_Condition()
{
if (Npc_KnowsInfo(hero,DIA_BaalNetbek_GRU_MUDPL))
&& (Npc_GetDistToWP(self,"WP_GRU_NET_PTH4")<1000)
{
    return TRUE;
};
};
FUNC VOID DIA_BaalNetbek_GRU_MUDSEED_Info()
{

    AI_PointAt(Nov_1371_BaalNetbek,"WP_PLANT_NETGRU"); 
	AI_LookAt(Nov_1371_BaalNetbek,"WP_PLANT_NETGRU");
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDSEED_03_01"); //To tam jest to wspania�e miejsce. Gdzie rosn� mali b�otni bracia!
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDSEED_15_02"); //Dzi�ki za pomoc.
    AI_Output (self, other ,"DIA_BaalNetbek_GRU_MUDSEED_03_03"); //Tylko pami�taj o nasionkach. A teraz p�jd� obejrze� sw�j drzewny balet.
    AI_Output (other, self ,"DIA_BaalNetbek_GRU_MUDSEED_15_04"); //Jasne id�...
	Npc_ExchangeRoutine(self,"Start");
    AI_StopProcessInfos	(self);
};

instance dia_baalnetbek_pickpocket(c_info) {
    npc = nov_1371_baalnetbek;
    nr = 900;
    condition = dia_baalnetbek_pickpocket_condition;
    information = dia_baalnetbek_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalnetbek_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_baalnetbek_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalnetbek_pickpocket);
	info_addchoice(dia_baalnetbek_pickpocket, dialog_back, dia_baalnetbek_pickpocket_back);
	info_addchoice(dia_baalnetbek_pickpocket, dialog_pickpocket, dia_baalnetbek_pickpocket_doit);
};

func void dia_baalnetbek_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_baalnetbek_pickpocket);
};

func void dia_baalnetbek_pickpocket_back() {
    info_clearchoices(dia_baalnetbek_pickpocket);
};