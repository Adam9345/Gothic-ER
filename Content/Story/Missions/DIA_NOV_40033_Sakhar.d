//poprawione i sprawdzone - Reflide

// ********************************
// 				EXIT
// ********************************

instance DIA_Sakhar_EXIT (C_INFO)
{
	npc			= NOV_40033_Sakhar;
	nr			= 999;
	condition	= DIA_Sakhar_EXIT_Condition;
	information	= DIA_Sakhar_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Sakhar_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sakhar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WHOYOU
//========================================

INSTANCE DIA_Sakhar_WHOYOU (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 1;
   condition    = DIA_Sakhar_WHOYOU_Condition;
   information  = DIA_Sakhar_WHOYOU_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Sakhar_WHOYOU_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Sakhar_WHOYOU_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_WHOYOU_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Sakhar_WHOYOU_03_02"); //Nazywam si� Sakhar i jestem my�liwym.
   
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Sakhar_HELLO1 (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 1;
   condition    = DIA_Sakhar_HELLO1_Condition;
   information  = DIA_Sakhar_HELLO1_Info;
   permanent	= FALSE;
   description	= "Mo�esz mi opowiedzie� o skuteczno�ci broni...";
};

FUNC INT DIA_Sakhar_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_WHOYOU))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_HELLO1_15_01"); //Mo�esz mi opowiedzie� o skuteczno�ci broni przeciwko danym przeciwnikom?
    AI_Output (self, other ,"DIA_Sakhar_HELLO1_03_02"); //Jasne ale daj mi piwo bo co� strasznie mnie suszy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Sakhar_HELLO2 (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 2;
   condition    = DIA_Sakhar_HELLO2_Condition;
   information  = DIA_Sakhar_HELLO2_Info;
   permanent	= FALSE;
   description	= "We� to piwo.";
};

FUNC INT DIA_Sakhar_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_HELLO2_Info()
{
    AI_StandUp(NOV_40033_Sakhar); 
    AI_Output (other, self ,"DIA_Sakhar_HELLO2_15_01"); //We� to piwo.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_02"); //Dzi�ki stary.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_03"); //No wi�c nie ka�da bro� jest skuteczna przeciwko danemu przeciwnikowi ale powiem ci w wielkim skr�cie jak to wygl�da.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_04"); //Na ludzi najlepsze s� proste rozwi�nia. Dlatego sugeruje klasyczn� bro� sieczn�.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_05"); //Przeciwko wrogom w grupie mam na my�li chocia�by stado wilk�w proponuje bro� dystansow�. To czy wolisz �uk czy kusz� to ju� twoja sprawa.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_06"); //Przeciwko nieumar�ym przeciwnikom najlepsza jest bro� obuchowa jak maczugi czy pa�ki.
    AI_Output (other, self ,"DIA_Sakhar_HELLO2_15_07"); //A co z magicznymi bestiami?
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_08"); //Na tym cholerstwie si� akurat nie znam ale intuicja podpowiada mi, �e trzeba si�gn�� po magiczne sztuczki �eby upora� si� z takim ustrojstwem.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_09"); //Jak si� wchodzi mi�dzy wrony trzeba kraka� jak I ony haha!
    AI_Output (other, self ,"DIA_Sakhar_HELLO2_15_10"); //Dzi�kuje. Te rady mog� by� przydatne.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_11"); //One B�D� przydatne, ch�opcze. Je�li jednak chcesz si� dowiedzie� nieco wi�cej polecam ci porozmawia� z Cor Angarem.
	B_GiveXP(150);
};


//========================================
//-----------------> WDC_Fur
//========================================

INSTANCE DIA_Sakhar_WDC_Fur (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 1;
   condition    = DIA_Sakhar_WDC_Fur_Condition;
   information  = DIA_Sakhar_WDC_Fur_Info;
   permanent	= FALSE;
   description	= "Pono� strasznie smrodzisz...";
};

FUNC INT DIA_Sakhar_WDC_Fur_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Darrion_WDC_Sakhar))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_WDC_Fur_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_01"); //Pono� strasznie smrodzisz...
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_02"); //W jakim sensie?
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_03"); //Cuchnie martw� zwierzyn� geniuszu.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_04"); //Nic na to nie poradz�. Gdzie drwa r�bi� tam wi�ry lec�!
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_05"); //Przez ciebie Darrion nie mo�e pracowa�.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_06"); //Widocznie ma nadwra�liwy nosek.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_07"); //Albo zaprzestaniesz tego procederu albo b�dziesz mia� k�opoty.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_08"); //Grozisz mi?
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_09"); //Mo�e.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_10"); //Skoro jeste� taki wyrwyny to proponuje inne rozwi�zanie.

};

//========================================
//-----------------> WDC_Bloodfly
//========================================

INSTANCE DIA_Sakhar_WDC_Bloodfly (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 2;
   condition    = DIA_Sakhar_WDC_Bloodfly_Condition;
   information  = DIA_Sakhar_WDC_Bloodfly_Info;
   permanent	= FALSE;
   description	= "Jakie?";
};

FUNC INT DIA_Sakhar_WDC_Bloodfly_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_WDC_Fur))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_WDC_Bloodfly_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_WDC_Bloodfly_15_01"); //Jakie?
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_02"); //W pobli�u upatrzy�em sobie miejsce, kt�re mog�oby by� idealnym stanowiskiem pracy by oprawia� zwierzyn�.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_03"); //Tyle, �e lataj� tam krwiopijcy.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Bloodfly_15_04"); //Co z Ciebie za my�liwy skoro na przeszkodzie masz raptem kilka lataj�cych insekt�w...
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_05"); //Rzecz w tym, �e to nie tacy zwykli krwiopijcy. To jaki� dziwny rodzaj, silnie jadowity, o innym ubarwieniu ni� te kt�re wcze�niej widzia�em.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Bloodfly_15_06"); //A gdybym pom�g� Ci si� ich pozby�?
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_07"); //W�a�nie to mia�em zamiar zaproponowa�.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Bloodfly_15_08"); //Dobrze. Wybijemy tych krwiopijc�w a ty zmienisz stanowisko pracy, w porz�dku?
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_09"); //Zgadzam si�.
		 B_LogEntry               (WiazankaDlaCorCaloma,"Sakhar ma pewien plan. M�g�by gdzie indziej oprawia� zwierzyn� ale tam grasuj� krwiopijcy potrafi�cy zatruwa� oponenta swoim jadem. Musz� pom�c mu je wybi�.");
};

//========================================
//-----------------> WDC_BDFA
//========================================

INSTANCE DIA_Sakhar_WDC_BDFA (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 1;
   condition    = DIA_Sakhar_WDC_BDFA_Condition;
   information  = DIA_Sakhar_WDC_BDFA_Info;
   permanent	= FALSE;
   description	= "Zapolujmy na lataj�ce robale!";
};

FUNC INT DIA_Sakhar_WDC_BDFA_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_WDC_Bloodfly))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_WDC_BDFA_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_WDC_BDFA_15_01"); //Zapolujmy na lataj�ce robale!
    AI_Output (self, other ,"DIA_Sakhar_WDC_BDFA_03_02"); //Jasne. Do dzie�a.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BDFA_15_03"); //Prowad�.
	Npc_ExchangeRoutine(NOV_40033_Sakhar,"Guide");
    AI_Output (self, other ,"DIA_Sakhar_WDC_BDFA_03_04"); //Cho� za mn�.
	Wld_InsertNpc				(BloodflySakhar1,"FP_ROAM_BLOOD_SAK1");
	Wld_InsertNpc				(BloodflySakhar2,"FP_ROAM_BLOOD_SAK2");
	Wld_InsertNpc				(BloodflySakhar3,"FP_ROAM_BLOOD_SAK3");
	Wld_InsertNpc				(BloodflySakhar4,"FP_ROAM_BLOOD_SAK4");
	Wld_InsertNpc				(BloodflySakhar5,"FP_ROAM_BLOOD_SAK5");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WDC_BLDF_DEAD
//========================================

INSTANCE DIA_Sakhar_WDC_BLDF_DEAD (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 2;
   condition    = DIA_Sakhar_WDC_BLDF_DEAD_Condition;
   information  = DIA_Sakhar_WDC_BLDF_DEAD_Info;
   permanent	= FALSE;
   description	= "No to po krwiopijcach.";
};

FUNC INT DIA_Sakhar_WDC_BLDF_DEAD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_WDC_BDFA))
&& (Npc_IsDead (BloodflySakhar1))
&& (Npc_IsDead (BloodflySakhar2))
&& (Npc_IsDead (BloodflySakhar3))
&& (Npc_IsDead (BloodflySakhar4))
&& (Npc_IsDead (BloodflySakhar5))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_WDC_BLDF_DEAD_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_WDC_BLDF_DEAD_15_01"); //No to po krwiopijcach.
    AI_Output (self, other ,"DIA_Sakhar_WDC_BLDF_DEAD_03_02"); //Zgadza si�. Od teraz mog� tu normalnie pracowa�.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BLDF_DEAD_15_03"); //Musz� pom�wi� z Darrionem.
    AI_Output (self, other ,"DIA_Sakhar_WDC_BLDF_DEAD_03_04"); //Wreszcie przestanie mi si� u�ala�.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BLDF_DEAD_15_05"); //Dzi�kuje w imieniu nozdrzy mieszka�c�w tego obozu...
    AI_Output (self, other ,"DIA_Sakhar_WDC_BLDF_DEAD_03_06"); //Haha. R�wny z ciebie facet.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BLDF_DEAD_15_07"); //Na razie.
	Npc_ExchangeRoutine(NOV_40033_Sakhar,"Start");
	 B_LogEntry               (WiazankaDlaCorCaloma,"Ja I Sakhar pozbyli�my si� jadowitych krwiopijc�w. Teraz mo�e zmieni� miejsce pracy co uwolni z opresji nozdrza Darriona. Pora wr�ci� do kowala.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HOW_ARE_YOU
//========================================

INSTANCE DIA_Sakhar_HOW_ARE_YOU (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 1;
   condition    = DIA_Sakhar_HOW_ARE_YOU_Condition;
   information  = DIA_Sakhar_HOW_ARE_YOU_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Sakhar_HOW_ARE_YOU_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Sakhar_HOW_ARE_YOU_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_01"); //Co u ciebie?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_02"); //Praca. Polowanie I oprawianie zwierzyny. Taka dola obozowego my�liwego. 
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_03"); //Jak ci si� wiedzie?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_04"); //R�nie. �yje polowaniami I wiar� w �ni�cego. I zabijam aligatory, i krwiopijc�w. Czasem nawinie si� jaki� b�otny w� ale raczej unikam tego...
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_05"); //A reszta bagiennych potwor�w?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_06"); //To dzia�ka Gor Na Pola. Je�li chcesz wiedzie� na ten temat wi�cej to z nim pogadaj.
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_07"); //Ja I on nie �yjemy najlepiej.
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_09"); //Mieli�my par� sprzeczek. Jeszcze jedna I kt�ry� z nas niechybnie trafi�by pod ziemi� w�cha� bagno od spodu.
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_10"); //A� tak?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_11"); //Taa st�d on ma swoj� dzia�k� a ja swoj�.
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_12"); //C� wiodcznie wolicie towarzystwo potwor�w od swojego.
};


//========================================
//-----------------> ZD
//========================================

INSTANCE DIA_Sakhar_ZD (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 1;
   condition    = DIA_Sakhar_ZD_Condition;
   information  = DIA_Sakhar_ZD_Info;
   permanent	= FALSE;
   description	= "Fortuno zastanawia si� dlaczego ostatnio nie kupujesz u niego ziela?";
};

FUNC INT DIA_Sakhar_ZD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Fortuno_ZD))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_ZD_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_01"); //Fortuno zastanawia si� dlaczego ostatnio nie kupujesz u niego ziela?
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_02"); //Mam inne sprawy na g�owie. �le si� czuje bo nie �pi� od wielu nocy.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_03"); //Co ci przeszkadza w swobodnym �nie?
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_04"); //Nie wiem. Jakie� krzyki I upiorne chichoty w oddali. Nie mog� zmru�y� od tego oka.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_05"); //Nie pr�bowa�e� tego wyja�ni�?
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_06"); //Rozejrza�em si� ale to dzieje si� nocami. Nie boje si� potwor�w ale obawiam si� , �e to co� demonicznego.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_07"); //Mog� ci pom�c to wyja�ni�.
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_08"); //Naprawd�? By�by ci bardzo wdzi�czny za pomoc. Kiedy wybije p�noc przyjd� do mnie, udamy si� na zwiady.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_09"); //Dobra.
	B_LogEntry               (ZachciankiDiliona,"Sakhar narzeka, �e nocami nie mo�e spa� I rujnuje to jego samopoczucie. Postanowi�em mu pom�c. O p�nocy mam do niego zajrze� by wyja�ni� tajemnicz� kwesti� nocnych krzyk�w, kt�re s� przyczyn� ca�ej sytuacji.");
};

//========================================
//-----------------> ZD_NIGHT
//========================================

INSTANCE DIA_Sakhar_ZD_NIGHT (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 2;
   condition    = DIA_Sakhar_ZD_NIGHT_Condition;
   information  = DIA_Sakhar_ZD_NIGHT_Info;
   permanent	= FALSE;
   description	= "To jak idziemy?";
};

FUNC INT DIA_Sakhar_ZD_NIGHT_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_ZD))
&& (Wld_IsTime(24,00,4,59))
{
    return TRUE;
};
};
FUNC VOID DIA_Sakhar_ZD_NIGHT_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_ZD_NIGHT_15_01"); //To jak idziemy?
    AI_Output (self, other ,"DIA_Sakhar_ZD_NIGHT_03_02"); //Tak. Czuje pewien niepok�j.
    AI_Output (other, self ,"DIA_Sakhar_ZD_NIGHT_15_03"); //B�dzie dobrze. A teraz prowad�, w stron� z kt�rej s�ysza�e� te diabelskie odg�osy.
    AI_Output (self, other ,"DIA_Sakhar_ZD_NIGHT_03_04"); //Zgoda.
		B_LogEntry               (ZachciankiDiliona,"Uda�em si� z Sakharem na zwiad przekonamy si� sk�d bior� si� podejrzane wrzaski. Sakhar podejrzewa, �e chodzi o co� demonicznego.");
	Npc_ExchangeRoutine(NOV_40033_Sakhar,"GZD");
	Wld_InsertNpc				(HarpieSak1,"FP_ROAM_BLOOD_SAK1");
	Wld_InsertNpc				(HarpieSak2,"FP_ROAM_BLOOD_SAK2");
	Wld_InsertNpc				(HarpieSak3,"FP_ROAM_BLOOD_SAK3");
	Wld_InsertNpc				(HarpieSak4,"FP_ROAM_BLOOD_SAK4");
	Wld_InsertNpc				(HarpieSak5,"FP_ROAM_BLOOD_SAK5");
	
	
};

//========================================//HarpieSak1 -5 
//-----------------> ZD_HARPY
//========================================

INSTANCE DIA_Sakhar_ZD_HARPY (C_INFO)
{
   npc          = NOV_40033_Sakhar;
   nr           = 3;
   condition    = DIA_Sakhar_ZD_HARPY_Condition;
   information  = DIA_Sakhar_ZD_HARPY_Info;
   permanent	= FALSE;
   description	= "Chyba wyja�ni�o si� sk�d pochodzi�y te dziwne odg�osy. To tylko zwyk�e harpie.";
};

FUNC INT DIA_Sakhar_ZD_HARPY_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Sakhar_ZD_NIGHT))
&& (Npc_IsDead (HarpieSak1))
&& (Npc_IsDead (HarpieSak2))
&& (Npc_IsDead (HarpieSak3))
&& (Npc_IsDead (HarpieSak4))
&& (Npc_IsDead (HarpieSak5))

{
    return TRUE;
};
};

FUNC VOID DIA_Sakhar_ZD_HARPY_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_ZD_HARPY_15_01"); //Chyba wyja�ni�o si� sk�d pochodzi�y te dziwne odg�osy. To tylko zwyk�e harpie.
    AI_Output (self, other ,"DIA_Sakhar_ZD_HARPY_03_02"); //Paskudne istoty. Dot�d ich nie spotka�em I obawiam si�, �e nie chce tego robi� ponownie.
    AI_Output (other, self ,"DIA_Sakhar_ZD_HARPY_15_03"); //Nie dziwie si�. 
    AI_Output (self, other ,"DIA_Sakhar_ZD_HARPY_03_04"); //Teraz chyba wreszcie b�d� m�g� normalnie zasn��. I wr�ci� do dawnych zwyczaj�w.
    AI_Output (other, self ,"DIA_Sakhar_ZD_HARPY_15_05"); //W takim razie zajrzyj nied�ugo do Fortuno.
    AI_Output (self, other ,"DIA_Sakhar_ZD_HARPY_03_06"); //Tak zrobi�.
		B_LogEntry               (ZachciankiDiliona,"Tajemnicze krzyki pochodzi�y od stada harpii, kt�re z jakiego� powodu si� tu pojawi�y. Zapewne nadlecia�y z g�r. Teraz Sakhar powinien spa� spokojnie I zachowywa� si� jak dawniej. Fortuno zn�w b�dzie mia� w nim sta�ego klienta.");
	Npc_ExchangeRoutine(NOV_40033_Sakhar,"Start");
};

instance dia_sakhar_pickpocket(c_info) {
    npc = nov_40033_sakhar;
    nr = 900;
    condition = dia_sakhar_pickpocket_condition;
    information = dia_sakhar_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sakhar_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_sakhar_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sakhar_pickpocket);
	info_addchoice(dia_sakhar_pickpocket, dialog_back, dia_sakhar_pickpocket_back);
	info_addchoice(dia_sakhar_pickpocket, dialog_pickpocket, dia_sakhar_pickpocket_doit);
};

func void dia_sakhar_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_sakhar_pickpocket);
};

func void dia_sakhar_pickpocket_back() {
    info_clearchoices(dia_sakhar_pickpocket);
};

