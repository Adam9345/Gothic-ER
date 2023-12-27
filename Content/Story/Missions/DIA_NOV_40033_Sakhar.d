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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Sakhar_WHOYOU_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Sakhar_WHOYOU_Info()
{
    AI_Output (other, self ,"DIA_Sakhar_WHOYOU_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Sakhar_WHOYOU_03_02"); //Nazywam siê Sakhar i jestem myœliwym.
   
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
   description	= "Mo¿esz mi opowiedzieæ o skutecznoœci broni...";
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
    AI_Output (other, self ,"DIA_Sakhar_HELLO1_15_01"); //Mo¿esz mi opowiedzieæ o skutecznoœci broni przeciwko danym przeciwnikom?
    AI_Output (self, other ,"DIA_Sakhar_HELLO1_03_02"); //Jasne ale daj mi piwo bo coœ strasznie mnie suszy.
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
   description	= "WeŸ to piwo.";
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
    AI_Output (other, self ,"DIA_Sakhar_HELLO2_15_01"); //WeŸ to piwo.
    B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_02"); //Dziêki stary.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_03"); //No wiêc nie ka¿da broñ jest skuteczna przeciwko danemu przeciwnikowi ale powiem ci w wielkim skrócie jak to wygl¹da.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_04"); //Na ludzi najlepsze s¹ proste rozwi¹nia. Dlatego sugeruje klasyczn¹ broñ sieczn¹.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_05"); //Przeciwko wrogom w grupie mam na myœli chocia¿by stado wilków proponuje broñ dystansow¹. To czy wolisz ³uk czy kuszê to ju¿ twoja sprawa.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_06"); //Przeciwko nieumar³ym przeciwnikom najlepsza jest broñ obuchowa jak maczugi czy pa³ki.
    AI_Output (other, self ,"DIA_Sakhar_HELLO2_15_07"); //A co z magicznymi bestiami?
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_08"); //Na tym cholerstwie siê akurat nie znam ale intuicja podpowiada mi, ¿e trzeba siêgn¹æ po magiczne sztuczki ¿eby uporaæ siê z takim ustrojstwem.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_09"); //Jak siê wchodzi miêdzy wrony trzeba krakaæ jak I ony haha!
    AI_Output (other, self ,"DIA_Sakhar_HELLO2_15_10"); //Dziêkuje. Te rady mog¹ byæ przydatne.
    AI_Output (self, other ,"DIA_Sakhar_HELLO2_03_11"); //One BÊD¥ przydatne, ch³opcze. Jeœli jednak chcesz siê dowiedzieæ nieco wiêcej polecam ci porozmawiaæ z Cor Angarem.
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
   description	= "Ponoæ strasznie smrodzisz...";
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
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_01"); //Ponoæ strasznie smrodzisz...
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_02"); //W jakim sensie?
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_03"); //Cuchnie martw¹ zwierzyn¹ geniuszu.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_04"); //Nic na to nie poradzê. Gdzie drwa r¹bi¹ tam wióry lec¹!
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_05"); //Przez ciebie Darrion nie mo¿e pracowaæ.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_06"); //Widocznie ma nadwra¿liwy nosek.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_07"); //Albo zaprzestaniesz tego procederu albo bêdziesz mia³ k³opoty.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_08"); //Grozisz mi?
    AI_Output (other, self ,"DIA_Sakhar_WDC_Fur_15_09"); //Mo¿e.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Fur_03_10"); //Skoro jesteœ taki wyrwyny to proponuje inne rozwi¹zanie.

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
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_02"); //W pobli¿u upatrzy³em sobie miejsce, które mog³oby byæ idealnym stanowiskiem pracy by oprawiaæ zwierzynê.
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_03"); //Tyle, ¿e lataj¹ tam krwiopijcy.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Bloodfly_15_04"); //Co z Ciebie za myœliwy skoro na przeszkodzie masz raptem kilka lataj¹cych insektów...
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_05"); //Rzecz w tym, ¿e to nie tacy zwykli krwiopijcy. To jakiœ dziwny rodzaj, silnie jadowity, o innym ubarwieniu ni¿ te które wczeœniej widzia³em.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Bloodfly_15_06"); //A gdybym pomóg³ Ci siê ich pozbyæ?
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_07"); //W³aœnie to mia³em zamiar zaproponowaæ.
    AI_Output (other, self ,"DIA_Sakhar_WDC_Bloodfly_15_08"); //Dobrze. Wybijemy tych krwiopijców a ty zmienisz stanowisko pracy, w porz¹dku?
    AI_Output (self, other ,"DIA_Sakhar_WDC_Bloodfly_03_09"); //Zgadzam siê.
		 B_LogEntry               (WiazankaDlaCorCaloma,"Sakhar ma pewien plan. Móg³by gdzie indziej oprawiaæ zwierzynê ale tam grasuj¹ krwiopijcy potrafi¹cy zatruwaæ oponenta swoim jadem. Muszê pomóc mu je wybiæ.");
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
   description	= "Zapolujmy na lataj¹ce robale!";
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
    AI_Output (other, self ,"DIA_Sakhar_WDC_BDFA_15_01"); //Zapolujmy na lataj¹ce robale!
    AI_Output (self, other ,"DIA_Sakhar_WDC_BDFA_03_02"); //Jasne. Do dzie³a.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BDFA_15_03"); //ProwadŸ.
	Npc_ExchangeRoutine(NOV_40033_Sakhar,"Guide");
    AI_Output (self, other ,"DIA_Sakhar_WDC_BDFA_03_04"); //Choæ za mn¹.
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
    AI_Output (self, other ,"DIA_Sakhar_WDC_BLDF_DEAD_03_02"); //Zgadza siê. Od teraz mogê tu normalnie pracowaæ.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BLDF_DEAD_15_03"); //Muszê pomówiæ z Darrionem.
    AI_Output (self, other ,"DIA_Sakhar_WDC_BLDF_DEAD_03_04"); //Wreszcie przestanie mi siê u¿alaæ.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BLDF_DEAD_15_05"); //Dziêkuje w imieniu nozdrzy mieszkañców tego obozu...
    AI_Output (self, other ,"DIA_Sakhar_WDC_BLDF_DEAD_03_06"); //Haha. Równy z ciebie facet.
    AI_Output (other, self ,"DIA_Sakhar_WDC_BLDF_DEAD_15_07"); //Na razie.
	Npc_ExchangeRoutine(NOV_40033_Sakhar,"Start");
	 B_LogEntry               (WiazankaDlaCorCaloma,"Ja I Sakhar pozbyliœmy siê jadowitych krwiopijców. Teraz mo¿e zmieniæ miejsce pracy co uwolni z opresji nozdrza Darriona. Pora wróciæ do kowala.");
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
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_02"); //Praca. Polowanie I oprawianie zwierzyny. Taka dola obozowego myœliwego. 
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_03"); //Jak ci siê wiedzie?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_04"); //Ró¿nie. ¯yje polowaniami I wiar¹ w Œni¹cego. I zabijam aligatory, i krwiopijców. Czasem nawinie siê jakiœ b³otny wê¿ ale raczej unikam tego...
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_05"); //A reszta bagiennych potworów?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_06"); //To dzia³ka Gor Na Pola. Jeœli chcesz wiedzieæ na ten temat wiêcej to z nim pogadaj.
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_07"); //Ja I on nie ¿yjemy najlepiej.
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_09"); //Mieliœmy parê sprzeczek. Jeszcze jedna I któryœ z nas niechybnie trafi³by pod ziemiê w¹chaæ bagno od spodu.
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_10"); //A¿ tak?
    AI_Output (self, other ,"DIA_Sakhar_HOW_ARE_YOU_03_11"); //Taa st¹d on ma swoj¹ dzia³kê a ja swoj¹.
    AI_Output (other, self ,"DIA_Sakhar_HOW_ARE_YOU_15_12"); //Có¿ wiodcznie wolicie towarzystwo potworów od swojego.
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
   description	= "Fortuno zastanawia siê dlaczego ostatnio nie kupujesz u niego ziela?";
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
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_01"); //Fortuno zastanawia siê dlaczego ostatnio nie kupujesz u niego ziela?
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_02"); //Mam inne sprawy na g³owie. le siê czuje bo nie œpiê od wielu nocy.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_03"); //Co ci przeszkadza w swobodnym œnie?
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_04"); //Nie wiem. Jakieœ krzyki I upiorne chichoty w oddali. Nie mogê zmru¿yæ od tego oka.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_05"); //Nie próbowa³eœ tego wyjaœniæ?
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_06"); //Rozejrza³em siê ale to dzieje siê nocami. Nie boje siê potworów ale obawiam siê , ¿e to coœ demonicznego.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_07"); //Mogê ci pomóc to wyjaœniæ.
    AI_Output (self, other ,"DIA_Sakhar_ZD_03_08"); //Naprawdê? By³by ci bardzo wdziêczny za pomoc. Kiedy wybije pó³noc przyjdŸ do mnie, udamy siê na zwiady.
    AI_Output (other, self ,"DIA_Sakhar_ZD_15_09"); //Dobra.
	B_LogEntry               (ZachciankiDiliona,"Sakhar narzeka, ¿e nocami nie mo¿e spaæ I rujnuje to jego samopoczucie. Postanowi³em mu pomóc. O pó³nocy mam do niego zajrzeæ by wyjaœniæ tajemnicz¹ kwestiê nocnych krzyków, które s¹ przyczyn¹ ca³ej sytuacji.");
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
    AI_Output (self, other ,"DIA_Sakhar_ZD_NIGHT_03_02"); //Tak. Czuje pewien niepokój.
    AI_Output (other, self ,"DIA_Sakhar_ZD_NIGHT_15_03"); //Bêdzie dobrze. A teraz prowadŸ, w stronê z której s³ysza³eœ te diabelskie odg³osy.
    AI_Output (self, other ,"DIA_Sakhar_ZD_NIGHT_03_04"); //Zgoda.
		B_LogEntry               (ZachciankiDiliona,"Uda³em siê z Sakharem na zwiad przekonamy siê sk¹d bior¹ siê podejrzane wrzaski. Sakhar podejrzewa, ¿e chodzi o coœ demonicznego.");
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
   description	= "Chyba wyjaœni³o siê sk¹d pochodzi³y te dziwne odg³osy. To tylko zwyk³e harpie.";
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
    AI_Output (other, self ,"DIA_Sakhar_ZD_HARPY_15_01"); //Chyba wyjaœni³o siê sk¹d pochodzi³y te dziwne odg³osy. To tylko zwyk³e harpie.
    AI_Output (self, other ,"DIA_Sakhar_ZD_HARPY_03_02"); //Paskudne istoty. Dot¹d ich nie spotka³em I obawiam siê, ¿e nie chce tego robiæ ponownie.
    AI_Output (other, self ,"DIA_Sakhar_ZD_HARPY_15_03"); //Nie dziwie siê. 
    AI_Output (self, other ,"DIA_Sakhar_ZD_HARPY_03_04"); //Teraz chyba wreszcie bêdê móg³ normalnie zasn¹æ. I wróciæ do dawnych zwyczajów.
    AI_Output (other, self ,"DIA_Sakhar_ZD_HARPY_15_05"); //W takim razie zajrzyj nied³ugo do Fortuno.
    AI_Output (self, other ,"DIA_Sakhar_ZD_HARPY_03_06"); //Tak zrobiê.
		B_LogEntry               (ZachciankiDiliona,"Tajemnicze krzyki pochodzi³y od stada harpii, które z jakiegoœ powodu siê tu pojawi³y. Zapewne nadlecia³y z gór. Teraz Sakhar powinien spaæ spokojnie I zachowywaæ siê jak dawniej. Fortuno znów bêdzie mia³ w nim sta³ego klienta.");
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

