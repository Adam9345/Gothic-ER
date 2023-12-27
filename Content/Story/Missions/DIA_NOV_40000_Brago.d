// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Brago_EXIT(C_INFO)
{
	npc			= NOV_40000_Brago ;
	nr			= 999;
	condition	= DIA_Brago_EXIT_Condition;
	information	= DIA_Brago_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Brago_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Brago_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Brago_Hello(C_INFO)
{
	npc			= NOV_40000_Brago;
	nr			= 1;
	condition	= DIA_Brago_Hello_Condition;
	information	= DIA_Brago_Hello_Info;
	permanent	= false;
	important   = TRUE;
};                       

FUNC INT DIA_Brago_Hello_Condition()
{
   if (kapitel == 2)
   && (Npc_GetTrueGuild (hero) == GIL_NOV)
{
	return 1;
};
};
FUNC VOID DIA_Brago_Hello_Info()
{	
	AI_Output (self, other,"DIA_Brago_Hello_09_01"); //Eee, podejd� tu na chwile m�ody.
	AI_Output (other, self,"DIA_Brago_Hello_15_02"); //Czego chcesz?
	AI_Output (self, other,"DIA_Brago_Hello_09_03"); //Wzbogaci� si� tanim kosztem.
	AI_Output (other, self,"DIA_Brago_Hello_15_04"); //Poszukaj kogo� innego, kto da ci na flaszk�!
	AI_Output (self, other,"DIA_Brago_Hello_09_05"); //Zaczekaj! Nie o to mi chodzi.
	AI_Output (other, self,"DIA_Brago_Hello_15_06"); //A niby o co?	
	AI_Output (self, other,"DIA_Brago_Hello_09_07"); //Proponuje ci prosty uk�ad. Zabawmy si� kosztem tych idiot�w!
	AI_Output (other, self,"DIA_Brago_Hello_15_08"); //Kogo nazywasz idiotami?
	AI_Output (self, other,"DIA_Brago_Hello_09_09"); //Praktycznie wszystkich mieszka�c�w tej cholernej Sekty. Mo�e to przez opary z s�siedniego bagna pomiesza�o im si� we �bach!
	AI_Output (self, other,"DIA_Brago_Hello_09_10"); //Czcz� tego urojonego �ni�cego i licz�, �e ich wypu�ci z Kolonii! Banda skretynia�ych naiwniak�w.
	AI_Output (other, self,"DIA_Brago_Hello_15_11"); //Skoro tak ci si� tu nie podoba to czemu st�d nie odejdziesz?
	AI_Output (self, other,"DIA_Brago_Hello_09_12"); //Da�bym sobie rad� w ka�dym obozie ale... Tutaj jest darmowe ziele i nie trudno o �ywno�� i napitek. 
	AI_Output (self, other,"DIA_Brago_Hello_09_13"); //Gdzie indziej o wszystko trzeba walczy�. Ale zeszli�my z tematu. To jak m�ody chcesz si� wzbogaci� kosztem tych szalonych sekciarzy?
	
			  
	    Info_ClearChoices (DIA_Brago_Hello);
	    Info_AddChoice    (DIA_Brago_Hello,"Nie.",DIA_Brago_Nie);
	    Info_AddChoice    (DIA_Brago_Hello,"Tak.",DIA_Brago_Tak);
			  
			  
};



FUNC VOID DIA_Brago_Tak()
  {
	AI_Output (other,self ,"DIA_Brago_Tak_15_00");  //Tak.
	AI_Output (self ,other,"DIA_Brago_Tak_11_01");  //Dobrze. Gwarantuje ci niez�y zarobek. Ale najpierw musz� ci� troch� przetestowa�. W ko�cu niewielu ludzi ma talent.
	AI_Output (other,self ,"DIA_Brago_Tak_15_02");  //Co niby mam robi�?
	AI_Output (self ,other,"DIA_Brago_Tak_11_03");  //C�, jak wiesz w tym niby obozie roi si� od za�panych �ysoli. Ich najni�sza kasta to Nowicjusze.
	AI_Output (self ,other,"DIA_Brago_Tak_11_04");  //Jeden z nich imieniem Mosul ukrad� mi cenn� figurk�. Je�li masz jaja to za chwil� mi j� przyniesiesz.
	AI_Output (other,self ,"DIA_Brago_Tak_15_05");  //Niech b�dzie. Spr�buje si� tym zaj��.
    MosulRobStatue = TRUE;
	
	   Log_CreateTopic          (ZlodziejskaWspolpraca, LOG_MISSION);
       Log_SetTopicStatus       (ZlodziejskaWspolpraca, LOG_RUNNING);
	   AI_StopProcessInfos	    (self);
		   B_LogEntry                     (ZlodziejskaWspolpraca,"Postanowi�em przyj�� ofert� Brago. Chc� on zabawi� si� kosztem Sekciarzy i mam mu w tym pom�c. Oczywi�cie za odpowiedni� op�at� ma si� rozumie�. Na pocz�tek mam odzyska� figurk� skradzion� przez Nowicjusza imieniem Mosul.");
};


FUNC VOID DIA_Brago_Nie()
  {
	AI_Output               (other,self ,"DIA_Brago_Nie_15_00");  //Nie. Nie zamierzam zosta� wci�gni�ty w twoje brudne zagrywki!
	AI_Output               (self ,other,"DIA_Brago_Nie_11_01");  //Zawiod�e� mnie m�ody. �ycie to sztuka wykorzystywania okazji. A ty tego nie potrafisz potulny szczeniaku. Zejd� mi z oczu!
	Info_ClearChoices       (DIA_Brago_Hello);  
    AI_StopProcessInfos  	(self);
	 Log_CreateTopic          (ZlodziejskaWspolpraca, LOG_MISSION);
	 Log_SetTopicStatus        (ZlodziejskaWspolpraca, LOG_FAILED);
		   B_LogEntry                     (ZlodziejskaWspolpraca,"Odrzuci�em ofert� wsp�pracy od Brago. Nie trzeba by� szczeg�lnie czujnym by stwierdzi�, �e co� tutaj �mierdzi. A ja nie chce z tym mie� nic wsp�lnego.");

};


// ************************************************************
// 						Zarobek
// ************************************************************

INSTANCE DIA_Brago_Zarobek(C_INFO)
{
	npc			= NOV_40000_Brago;
	nr			= 1;
	condition	= DIA_Brago_Zarobek_Condition;
	information	= DIA_Brago_Zarobek_Info;
	permanent	= false;
	description = "Mam figurk�. Trzymaj.";
};                       

FUNC INT DIA_Brago_Zarobek_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Brago_Hello)
	&& (Npc_HasItems(other,ItMi_Stuff_Idol_Mosul) >= 1) 
	
	{
		return 1;
	};
};

FUNC VOID DIA_Brago_Zarobek_Info()
{	
	AI_Output (other, self,"DIA_Brago_Zarobek_15_00"); //Mam figurk�. Trzymaj.
    B_GiveInvItems      (hero,self, ItMi_Stuff_Idol_Mosul, 1);		
	AI_Output (self, other,"DIA_Brago_Zarobek_09_01"); //Wspaniale! Zaliczy�e� pierwszy test. 
	AI_Output (other, self,"DIA_Brago_Zarobek_15_02"); //Ten Mosul wspomina� co� o Ghorimie...
	AI_Output (self, other,"DIA_Brago_Zarobek_09_03"); //A co mnie obchodz� uk�ady tych �ysych imbecyli? Mam dla ciebie nast�pne zadanie.
	AI_Output (other, self,"DIA_Brago_Zarobek_15_04"); //Co tym razem?
	AI_Output (self, other,"DIA_Brago_Zarobek_09_05"); //C�, w obozie jest pewien by�y Kopacz imieniem Melvin. Zanim trafi� do Kolonii by� cie�l�.
	AI_Output (self, other,"DIA_Brago_Zarobek_09_06"); //I wci�� ma pewien cenny n�, kt�ry wykorzystywa� w swoim fachu. Chcia�bym nim wystruga� sobie dobry �uk.
	AI_Output (other, self,"DIA_Brago_Zarobek_15_07"); //Czemu wi�c sam go od niego nie odkupisz?
	AI_Output (self, other,"DIA_Brago_Zarobek_09_08"); //Nie przepadamy za sob�. Ten frajer nie chce mi go tak po prostu odsprzeda�. Ale co innego z tob�...
	AI_Output (other, self,"DIA_Brago_Zarobek_15_09"); //Porozmawiam z nim.
	
	
  B_LogEntry                     (ZlodziejskaWspolpraca,"Odzyska�em figurk� od Mosula, kt�ry wypiera� si�, �e to on ukrad� figurk�. Teraz mam kupi� od Melvina cenny n� bo Brago chce nim sobie wystruga� �uk.");
	
};



// ************************************************************
// 						No�yk
// ************************************************************


INSTANCE DIA_Brago_Nozyk(C_INFO)
{
	npc			= NOV_40000_Brago;
	nr			= 1;
	condition	= DIA_Brago_Nozyk_Condition;
	information	= DIA_Brago_Nozyk_Info;
	permanent	= false;
	description = "Mam n�.";
};                       

FUNC INT DIA_Brago_Nozyk_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Brago_Zarobek)
	&& (Npc_HasItems(other,ItMi_Knife_Melvin) >= 1) 
	
	{
		return 1;
	};
};

FUNC VOID DIA_Brago_Nozyk_Info()
{	
	AI_Output (other, self,"DIA_Brago_Nozyk_15_00"); //Mam n�.
    B_GiveInvItems      (hero,self, ItMi_Knife_Melvin, 1);		
	AI_Output (self, other,"DIA_Brago_Nozyk_09_01"); //No to dawaj go tu.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_02"); //Nie. Musia�em da� za niego 200 bry�ek. Najpierw mi zap�a�!
	AI_Output (self, other,"DIA_Brago_Nozyk_09_03"); //Oj ch�opcz� w�a�nie mieli�my zrobi� skok na, kt�rym zdobyliby�my sporo rudy. A ty dalej mi nie ufasz.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_04"); //We� go. Ale ju� ze mn� nie pogrywaj.
	AI_Output (self, other,"DIA_Brago_Nozyk_09_05"); //Tak lepiej. W obozie jest cz�owiek imieniem Joru. To kolejny uduchowiony idiota.
	AI_Output (self, other,"DIA_Brago_Nozyk_09_06"); //Ma w swojej skrzyni cenny medalion. Je�li go zdob�dziemy zap�ac� ci 400 bry�ek bo tyle jest wart.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_07"); //No dobra, jaki jest plan ?
	AI_Output (self, other,"DIA_Brago_Nozyk_09_08"); //Ten naiwniak Joru my�li, �e jego misj� �yciow� jest nauczanie o �ni�cym. Powiedz mu, �e postanowi�em si� nawr�ci�.
	AI_Output (self, other,"DIA_Brago_Nozyk_09_09"); //Wtedy p�jdzie do mnie, a ty b�dziesz mia� czas by go obrabowa�.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_10"); //Zgoda.
    Ucieczka_Brago_Day = Wld_GetDay();   
	
	    B_LogEntry                     (ZlodziejskaWspolpraca,"Brago wci�� nie chce mi zap�aci�. �a�uje, �e si� w to wszystko wmiesza�em. Ale ci�ko si� teraz z tego wypl�ta�. Brago proponuje mi 400 bry�ek za pomoc w okradzeniu Joru z jego cennego medalionu.");
	
};
func void rutynaBrago()
{ 
 
    Ucieczka_Brago_Day<=(Wld_GetDay()-1) ;		
    Npc_ExchangeRoutine            (NOV_40000_Brago,"Mosul");
	Npc_ExchangeRoutine            (NOV_40001_Mosul,"Brago");

};
// ************************************************************
// 						Medalion
// ************************************************************


INSTANCE DIA_Brago_Medalion(C_INFO)
{
	npc			= NOV_40000_Brago;
	nr			= 1;
	condition	= DIA_Brago_Medalion_Condition;
	information	= DIA_Brago_Medalion_Info;
	permanent	= false;
	description = "Ukrad�em medalion.";
};                       

FUNC INT DIA_Brago_Medalion_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Joru_ORE1)
	&& (Npc_HasItems(other,Amulett_Joru) >= 1) 
	
	{
		return 1;
	};
};

FUNC VOID DIA_Brago_Medalion_Info()
{	
	AI_Output (other, self,"DIA_Brago_Medalion_15_00"); //Ukrad�em medalion.
    B_GiveInvItems      (hero,self, Amulett_Joru, 1);		
	B_GiveInvItems      (self,other, ItMiNugget, 100);		
	AI_Output (self, other,"DIA_Brago_Medalion_09_01"); //A ja musia�em wys�uchiwa� tych durnych kaza�. Daj go tu!
	AI_Output (other, self,"DIA_Brago_Medalion_15_04"); //A ruda?
	AI_Output (self, other,"DIA_Brago_Medalion_09_03"); //No tak... Prosz�.
	AI_Output (other, self,"DIA_Brago_Medalion_15_04"); //Zaraz to tylko 100 bry�ek. Mia�o by� 400!
	AI_Output (self, other,"DIA_Brago_Medalion_09_06"); //Poczyni�em pewne inwestycje . Ale do jutrzejszego ranka zorganizuje ca�� rud�. Dorzuc� nawet dodatkowe 100 bry�ek.
	AI_Output (other, self,"DIA_Brago_Medalion_15_07"); //Lepiej �eby� jutro mia� t� rud�. Trzymaj medalion.
	AI_Output (self, other,"DIA_Brago_Medalion_09_08"); //Jasne, przyjacielu...	
    B_LogEntry                     (ZlodziejskaWspolpraca,"Brago da� mi jedynie 100 bry�ek rudy za medalion zamiast obiecanych 400. Mam tego dosy�. Jutro zako�cz� z nim wsp�prac� jak wyp�aci mi zaleg�� dzia�k�.");	
    Npc_ExchangeRoutine            (NOV_1305_Joru,"start");
	rutynaBrago();
	
	
};


// ************************************************************
// 						Karczma
// ************************************************************


INSTANCE DIA_Brago_Karczma(C_INFO)
{
	npc			= NOV_40000_Brago;
	nr			= 1;
	condition	= DIA_Brago_Karczma_Condition;
	information	= DIA_Brago_Karczma_Info;
	permanent	= false;
    important   = TRUE;
};                       

FUNC INT DIA_Brago_Karczma_Condition()
{
	if Npc_KnowsInfo (hero,DIA_Lester_Zabojstwo)

	
	{
		return 1;
	};
};

FUNC VOID DIA_Brago_Karczma_Info()
{	
	AI_Output (self, other,"DIA_Brago_Karczma_09_01"); //Zaraz... To ci g�upole z Sekty ci� nie pojmali?
	AI_Output (other, self,"DIA_Brago_Karczma_15_02"); //Nie. Pozwolono oczy�ci� mi si� z zarzut�w. No i przy okazji skopa� ci ty�ek!
	AI_Output (self, other,"DIA_Brago_Karczma_09_03"); //Zabawny jeste�. Od pocz�tku kupowa�e� ka�d� g�upot�, kt�r� ci wciska�em.
	AI_Output (self, other,"DIA_Brago_Karczma_09_04"); //Pocz�wszy od tego pos��ka. Owszem Mosul ukrad� go. Ale nie mi tylko Ghorimowi. Ja tylko chcia�em go zdoby�. I dzi�ki tobie si� uda�o.
	AI_Output (self, other,"DIA_Brago_Karczma_09_05"); //Opr�cz tego mam medalion, kt�ry drogo tu sprzedam. Mog� pi� do woli!
	AI_Output (other, self,"DIA_Brago_Karczma_15_06"); //Ty nic nie rozumiesz. Zaraz oddasz mi to wszystko , ale przedtem staniesz do walki. Wyzywam ci�!
	AI_Output (self, other,"DIA_Brago_Karczma_09_07"); //Przed solidn� wypitk� warto troch� si� po�mia�. I zaraz b�d� mia� okazj�. Ale najpierw wygarbuje ci sk�r�.
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
	
	
};


// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE DIA_Brago_WALKA(C_INFO)
{
	npc			= NOV_40000_Brago;
	nr			= 1;
	condition	= DIA_Brago_WALKA_Condition;
	information	= DIA_Brago_WALKA_Info;
	permanent	= false;
	important = TRUE;
};                       

FUNC INT DIA_Brago_WALKA_Condition()
{
	if (NOV_40000_Brago.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& 	Npc_KnowsInfo (hero,DIA_Brago_Karczma)
	
	{
		return 1;
	};
};

FUNC VOID DIA_Brago_WALKA_Info()
{	
	AI_Output (self, other,"DIA_Brago_WALKA_09_00"); //Ty �mieciu, jeszcze mnie popami�tasz!
	AI_Output (other, self,"DIA_Brago_WALKA_15_01"); //To na pewno. Te wszystkie szachrajstwa, moj� naiwno�� i twoj� obit� mord�.
	AI_Output (self, other,"DIA_Brago_WALKA_09_02"); //Id� ju� st�d. Won!
	
	 B_LogEntry                     (ZlodziejskaWspolpraca,"Rozprawi�em si� z Brago i odzyska�em rzeczy, kt�re ukrad�. Okazuje si�, �e Mosul wcze�niej okrad� nie Brago lecz Ghorima. Teraz musz� szybko porozmawia� z Baalem Namibem.");
};


//========================================
//-----------------> ER_WHO
//========================================

INSTANCE DIA_Brago_ER_WHO (C_INFO)
{
   npc          = NOV_40000_Brago;
   nr           = 1;
   condition    = DIA_Brago_ER_WHO_Condition;
   information  = DIA_Brago_ER_WHO_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Brago_ER_WHO_Condition()
{
if !(Npc_KnowsInfo(hero,DIA_Brago_Hello))
{
    return TRUE;
};
};
FUNC VOID DIA_Brago_ER_WHO_Info()
{
    AI_Output (other, self ,"DIA_Brago_ER_WHO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Brago_ER_WHO_03_02"); //Brago. I niech ci to wystarczy.
    AI_Output (self, other ,"DIA_Brago_ER_WHO_03_03"); //Je�li b�d� mia� do ciebie jaki� interes to sam si� odezw�. Proste.
    AI_Output (other, self ,"DIA_Brago_ER_WHO_15_04"); //Nie chcesz pogada�?
    AI_Output (self, other ,"DIA_Brago_ER_WHO_03_05"); //A co mog� na tym zyska�? Je�li nic to nie strz�pie sobie j�zyka kapujesz?
};

instance dia_brago_pickpocket(c_info) {
    npc = nov_40000_brago;
    nr = 900;
    condition = dia_brago_pickpocket_condition;
    information = dia_brago_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brago_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 35);
};

func void dia_brago_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brago_pickpocket);
	info_addchoice(dia_brago_pickpocket, dialog_back, dia_brago_pickpocket_back);
	info_addchoice(dia_brago_pickpocket, dialog_pickpocket, dia_brago_pickpocket_doit);
};

func void dia_brago_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_brago_pickpocket);
};

func void dia_brago_pickpocket_back() {
    info_clearchoices(dia_brago_pickpocket);
};







