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
	AI_Output (self, other,"DIA_Brago_Hello_09_01"); //Eee, podejdŸ tu na chwile m³ody.
	AI_Output (other, self,"DIA_Brago_Hello_15_02"); //Czego chcesz?
	AI_Output (self, other,"DIA_Brago_Hello_09_03"); //Wzbogaciæ siê tanim kosztem.
	AI_Output (other, self,"DIA_Brago_Hello_15_04"); //Poszukaj kogoœ innego, kto da ci na flaszkê!
	AI_Output (self, other,"DIA_Brago_Hello_09_05"); //Zaczekaj! Nie o to mi chodzi.
	AI_Output (other, self,"DIA_Brago_Hello_15_06"); //A niby o co?	
	AI_Output (self, other,"DIA_Brago_Hello_09_07"); //Proponuje ci prosty uk³ad. Zabawmy siê kosztem tych idiotów!
	AI_Output (other, self,"DIA_Brago_Hello_15_08"); //Kogo nazywasz idiotami?
	AI_Output (self, other,"DIA_Brago_Hello_09_09"); //Praktycznie wszystkich mieszkañców tej cholernej Sekty. Mo¿e to przez opary z s¹siedniego bagna pomiesza³o im siê we ³bach!
	AI_Output (self, other,"DIA_Brago_Hello_09_10"); //Czcz¹ tego urojonego Œni¹cego i licz¹, ¿e ich wypuœci z Kolonii! Banda skretynia³ych naiwniaków.
	AI_Output (other, self,"DIA_Brago_Hello_15_11"); //Skoro tak ci siê tu nie podoba to czemu st¹d nie odejdziesz?
	AI_Output (self, other,"DIA_Brago_Hello_09_12"); //Da³bym sobie radê w ka¿dym obozie ale... Tutaj jest darmowe ziele i nie trudno o ¿ywnoœæ i napitek. 
	AI_Output (self, other,"DIA_Brago_Hello_09_13"); //Gdzie indziej o wszystko trzeba walczyæ. Ale zeszliœmy z tematu. To jak m³ody chcesz siê wzbogaciæ kosztem tych szalonych sekciarzy?
	
			  
	    Info_ClearChoices (DIA_Brago_Hello);
	    Info_AddChoice    (DIA_Brago_Hello,"Nie.",DIA_Brago_Nie);
	    Info_AddChoice    (DIA_Brago_Hello,"Tak.",DIA_Brago_Tak);
			  
			  
};



FUNC VOID DIA_Brago_Tak()
  {
	AI_Output (other,self ,"DIA_Brago_Tak_15_00");  //Tak.
	AI_Output (self ,other,"DIA_Brago_Tak_11_01");  //Dobrze. Gwarantuje ci niez³y zarobek. Ale najpierw muszê ciê trochê przetestowaæ. W koñcu niewielu ludzi ma talent.
	AI_Output (other,self ,"DIA_Brago_Tak_15_02");  //Co niby mam robiæ?
	AI_Output (self ,other,"DIA_Brago_Tak_11_03");  //Có¿, jak wiesz w tym niby obozie roi siê od zaæpanych ³ysoli. Ich najni¿sza kasta to Nowicjusze.
	AI_Output (self ,other,"DIA_Brago_Tak_11_04");  //Jeden z nich imieniem Mosul ukrad³ mi cenn¹ figurkê. Jeœli masz jaja to za chwilê mi j¹ przyniesiesz.
	AI_Output (other,self ,"DIA_Brago_Tak_15_05");  //Niech bêdzie. Spróbuje siê tym zaj¹æ.
    MosulRobStatue = TRUE;
	
	   Log_CreateTopic          (ZlodziejskaWspolpraca, LOG_MISSION);
       Log_SetTopicStatus       (ZlodziejskaWspolpraca, LOG_RUNNING);
	   AI_StopProcessInfos	    (self);
		   B_LogEntry                     (ZlodziejskaWspolpraca,"Postanowi³em przyj¹æ ofertê Brago. Chcê on zabawiæ siê kosztem Sekciarzy i mam mu w tym pomóc. Oczywiœcie za odpowiedni¹ op³at¹ ma siê rozumieæ. Na pocz¹tek mam odzyskaæ figurkê skradzion¹ przez Nowicjusza imieniem Mosul.");
};


FUNC VOID DIA_Brago_Nie()
  {
	AI_Output               (other,self ,"DIA_Brago_Nie_15_00");  //Nie. Nie zamierzam zostaæ wci¹gniêty w twoje brudne zagrywki!
	AI_Output               (self ,other,"DIA_Brago_Nie_11_01");  //Zawiod³eœ mnie m³ody. ¯ycie to sztuka wykorzystywania okazji. A ty tego nie potrafisz potulny szczeniaku. ZejdŸ mi z oczu!
	Info_ClearChoices       (DIA_Brago_Hello);  
    AI_StopProcessInfos  	(self);
	 Log_CreateTopic          (ZlodziejskaWspolpraca, LOG_MISSION);
	 Log_SetTopicStatus        (ZlodziejskaWspolpraca, LOG_FAILED);
		   B_LogEntry                     (ZlodziejskaWspolpraca,"Odrzuci³em ofertê wspó³pracy od Brago. Nie trzeba byæ szczególnie czujnym by stwierdziæ, ¿e coœ tutaj œmierdzi. A ja nie chce z tym mieæ nic wspólnego.");

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
	description = "Mam figurkê. Trzymaj.";
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
	AI_Output (other, self,"DIA_Brago_Zarobek_15_00"); //Mam figurkê. Trzymaj.
    B_GiveInvItems      (hero,self, ItMi_Stuff_Idol_Mosul, 1);		
	AI_Output (self, other,"DIA_Brago_Zarobek_09_01"); //Wspaniale! Zaliczy³eœ pierwszy test. 
	AI_Output (other, self,"DIA_Brago_Zarobek_15_02"); //Ten Mosul wspomina³ coœ o Ghorimie...
	AI_Output (self, other,"DIA_Brago_Zarobek_09_03"); //A co mnie obchodz¹ uk³ady tych ³ysych imbecyli? Mam dla ciebie nastêpne zadanie.
	AI_Output (other, self,"DIA_Brago_Zarobek_15_04"); //Co tym razem?
	AI_Output (self, other,"DIA_Brago_Zarobek_09_05"); //Có¿, w obozie jest pewien by³y Kopacz imieniem Melvin. Zanim trafi³ do Kolonii by³ cieœl¹.
	AI_Output (self, other,"DIA_Brago_Zarobek_09_06"); //I wci¹¿ ma pewien cenny nó¿, który wykorzystywa³ w swoim fachu. Chcia³bym nim wystrugaæ sobie dobry ³uk.
	AI_Output (other, self,"DIA_Brago_Zarobek_15_07"); //Czemu wiêc sam go od niego nie odkupisz?
	AI_Output (self, other,"DIA_Brago_Zarobek_09_08"); //Nie przepadamy za sob¹. Ten frajer nie chce mi go tak po prostu odsprzedaæ. Ale co innego z tob¹...
	AI_Output (other, self,"DIA_Brago_Zarobek_15_09"); //Porozmawiam z nim.
	
	
  B_LogEntry                     (ZlodziejskaWspolpraca,"Odzyska³em figurkê od Mosula, który wypiera³ siê, ¿e to on ukrad³ figurkê. Teraz mam kupiæ od Melvina cenny nó¿ bo Brago chce nim sobie wystrugaæ ³uk.");
	
};



// ************************************************************
// 						No¿yk
// ************************************************************


INSTANCE DIA_Brago_Nozyk(C_INFO)
{
	npc			= NOV_40000_Brago;
	nr			= 1;
	condition	= DIA_Brago_Nozyk_Condition;
	information	= DIA_Brago_Nozyk_Info;
	permanent	= false;
	description = "Mam nó¿.";
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
	AI_Output (other, self,"DIA_Brago_Nozyk_15_00"); //Mam nó¿.
    B_GiveInvItems      (hero,self, ItMi_Knife_Melvin, 1);		
	AI_Output (self, other,"DIA_Brago_Nozyk_09_01"); //No to dawaj go tu.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_02"); //Nie. Musia³em daæ za niego 200 bry³ek. Najpierw mi zap³aæ!
	AI_Output (self, other,"DIA_Brago_Nozyk_09_03"); //Oj ch³opczê w³aœnie mieliœmy zrobiæ skok na, którym zdobylibyœmy sporo rudy. A ty dalej mi nie ufasz.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_04"); //WeŸ go. Ale ju¿ ze mn¹ nie pogrywaj.
	AI_Output (self, other,"DIA_Brago_Nozyk_09_05"); //Tak lepiej. W obozie jest cz³owiek imieniem Joru. To kolejny uduchowiony idiota.
	AI_Output (self, other,"DIA_Brago_Nozyk_09_06"); //Ma w swojej skrzyni cenny medalion. Jeœli go zdobêdziemy zap³acê ci 400 bry³ek bo tyle jest wart.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_07"); //No dobra, jaki jest plan ?
	AI_Output (self, other,"DIA_Brago_Nozyk_09_08"); //Ten naiwniak Joru myœli, ¿e jego misj¹ ¿yciow¹ jest nauczanie o Œni¹cym. Powiedz mu, ¿e postanowi³em siê nawróciæ.
	AI_Output (self, other,"DIA_Brago_Nozyk_09_09"); //Wtedy pójdzie do mnie, a ty bêdziesz mia³ czas by go obrabowaæ.
	AI_Output (other, self,"DIA_Brago_Nozyk_15_10"); //Zgoda.
    Ucieczka_Brago_Day = Wld_GetDay();   
	
	    B_LogEntry                     (ZlodziejskaWspolpraca,"Brago wci¹¿ nie chce mi zap³aciæ. ¯a³uje, ¿e siê w to wszystko wmiesza³em. Ale ciê¿ko siê teraz z tego wypl¹taæ. Brago proponuje mi 400 bry³ek za pomoc w okradzeniu Joru z jego cennego medalionu.");
	
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
	description = "Ukrad³em medalion.";
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
	AI_Output (other, self,"DIA_Brago_Medalion_15_00"); //Ukrad³em medalion.
    B_GiveInvItems      (hero,self, Amulett_Joru, 1);		
	B_GiveInvItems      (self,other, ItMiNugget, 100);		
	AI_Output (self, other,"DIA_Brago_Medalion_09_01"); //A ja musia³em wys³uchiwaæ tych durnych kazañ. Daj go tu!
	AI_Output (other, self,"DIA_Brago_Medalion_15_04"); //A ruda?
	AI_Output (self, other,"DIA_Brago_Medalion_09_03"); //No tak... Proszê.
	AI_Output (other, self,"DIA_Brago_Medalion_15_04"); //Zaraz to tylko 100 bry³ek. Mia³o byæ 400!
	AI_Output (self, other,"DIA_Brago_Medalion_09_06"); //Poczyni³em pewne inwestycje . Ale do jutrzejszego ranka zorganizuje ca³¹ rudê. Dorzucê nawet dodatkowe 100 bry³ek.
	AI_Output (other, self,"DIA_Brago_Medalion_15_07"); //Lepiej ¿ebyœ jutro mia³ tê rudê. Trzymaj medalion.
	AI_Output (self, other,"DIA_Brago_Medalion_09_08"); //Jasne, przyjacielu...	
    B_LogEntry                     (ZlodziejskaWspolpraca,"Brago da³ mi jedynie 100 bry³ek rudy za medalion zamiast obiecanych 400. Mam tego dosyæ. Jutro zakoñczê z nim wspó³pracê jak wyp³aci mi zaleg³¹ dzia³kê.");	
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
	AI_Output (self, other,"DIA_Brago_Karczma_09_01"); //Zaraz... To ci g³upole z Sekty ciê nie pojmali?
	AI_Output (other, self,"DIA_Brago_Karczma_15_02"); //Nie. Pozwolono oczyœciæ mi siê z zarzutów. No i przy okazji skopaæ ci ty³ek!
	AI_Output (self, other,"DIA_Brago_Karczma_09_03"); //Zabawny jesteœ. Od pocz¹tku kupowa³eœ ka¿d¹ g³upotê, któr¹ ci wciska³em.
	AI_Output (self, other,"DIA_Brago_Karczma_09_04"); //Pocz¹wszy od tego pos¹¿ka. Owszem Mosul ukrad³ go. Ale nie mi tylko Ghorimowi. Ja tylko chcia³em go zdobyæ. I dziêki tobie siê uda³o.
	AI_Output (self, other,"DIA_Brago_Karczma_09_05"); //Oprócz tego mam medalion, który drogo tu sprzedam. Mogê piæ do woli!
	AI_Output (other, self,"DIA_Brago_Karczma_15_06"); //Ty nic nie rozumiesz. Zaraz oddasz mi to wszystko , ale przedtem staniesz do walki. Wyzywam ciê!
	AI_Output (self, other,"DIA_Brago_Karczma_09_07"); //Przed solidn¹ wypitk¹ warto trochê siê poœmiaæ. I zaraz bêdê mia³ okazjê. Ale najpierw wygarbuje ci skórê.
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
	
	
};


// ************************************************************
// 						Schürfer
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
	AI_Output (self, other,"DIA_Brago_WALKA_09_00"); //Ty œmieciu, jeszcze mnie popamiêtasz!
	AI_Output (other, self,"DIA_Brago_WALKA_15_01"); //To na pewno. Te wszystkie szachrajstwa, moj¹ naiwnoœæ i twoj¹ obit¹ mordê.
	AI_Output (self, other,"DIA_Brago_WALKA_09_02"); //IdŸ ju¿ st¹d. Won!
	
	 B_LogEntry                     (ZlodziejskaWspolpraca,"Rozprawi³em siê z Brago i odzyska³em rzeczy, które ukrad³. Okazuje siê, ¿e Mosul wczeœniej okrad³ nie Brago lecz Ghorima. Teraz muszê szybko porozmawiaæ z Baalem Namibem.");
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
   description	= "Kim jesteœ?";
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
    AI_Output (other, self ,"DIA_Brago_ER_WHO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Brago_ER_WHO_03_02"); //Brago. I niech ci to wystarczy.
    AI_Output (self, other ,"DIA_Brago_ER_WHO_03_03"); //Jeœli bêdê mia³ do ciebie jakiœ interes to sam siê odezwê. Proste.
    AI_Output (other, self ,"DIA_Brago_ER_WHO_15_04"); //Nie chcesz pogadaæ?
    AI_Output (self, other ,"DIA_Brago_ER_WHO_03_05"); //A co mogê na tym zyskaæ? Jeœli nic to nie strzêpie sobie jêzyka kapujesz?
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







