//poprawione i sprawdzone -  

// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "Co robisz?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Co robisz?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Przygotowujê ry¿ówkê, ch³opcze.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Proszê - weŸ sobie jedn¹ butelkê. Tylko nie mów Silasowi.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "Jak idzie destylacja?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Jak idzie destylacja?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Przy tych facetach ledwie nad¹¿am z zamówieniami. Ci to potrafi¹ wypiæ!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //I nawet mi to na rêkê. Przynajmniej psy Ry¿owego Ksiêcia zostawiaj¹ mnie w spokoju.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mo¿esz mi powiedzieæ o Ry¿owym Ksiêciu?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //To zapchlony wieprz! Jego siepacze zmuszaj¹ s³abszych do pracy na polach.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jedyna osoba, która mog³aby siê mu przeciwstawiæ to Horacy. Ale on nie lubi przemocy.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //S³ysza³em, jak kiedyœ powiedzia³, ¿e ma ochotê pogruchotaæ Ksiêciu koœci, ale tak naprawdê nigdy by tego nie zrobi³.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //To by by³o wbrew jego zasadom.
};

//========================================
//-----------------> HelpMe
//========================================

INSTANCE DIA_Jeremiah_HelpMe (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_HelpMe_Condition;
   information  = DIA_Jeremiah_HelpMe_Info;
   permanent	= FALSE;
   description	= "Potrzebujê twojego specjalnego trunku.";
};

FUNC INT DIA_Jeremiah_HelpMe_Condition()
{
    if (Quest_GetAlcoForBandits == LOG_RUNNING)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_HelpMe_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_01"); //Potrzebujê twojego specjalnego trunku.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_02"); //Podobno na polach ry¿owych zrobi³ siê niez³y ba³agan.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_03"); //Tak, nikt nie pracuje.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_04"); //To jak bêdzie z tym 'specja³em'? Chcia³em poczêstowaæ kilku 'kolegów'...
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_06"); //Chêtnie bym pomóg³, ale Najemnicy regularnie sprawdzaj¹, czy nie da³em nikomu nic za darmo.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_07"); //Podliczaj¹ ka¿d¹ bry³kê zysku. Licz¹ butelki... Jeœli ci pomogê, zostanê ukarany.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_09"); //A gdybym zap³aci³?
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_10"); //Wtedy nie by³oby problemu. Móg³bym ci daæ 12 butelek za 240 bry³ek rudy.
	
    B_LogEntry                     (CH1_BuntZbieraczy,"Bêdê musia³ zap³aciæ Jeremiaszowi za alkohol. Najemnicy skrupulatnie podliczaj¹ ka¿d¹ wyprodukowan¹ przez niego butelkê.");
};

//========================================
//-----------------> BoughtAlco
//========================================

INSTANCE DIA_Jeremiah_BoughtAlco (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_BoughtAlco_Condition;
   information  = DIA_Jeremiah_BoughtAlco_Info;
   permanent	= 0;
   description	= "Daj mi ten trunek.";
};

FUNC INT DIA_Jeremiah_BoughtAlco_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_HelpMe))  
    && (Quest_GetAlcoForBandits == LOG_RUNNING)
	&& (MIS_BuntZbieraczy == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItMiNugget)>=240)
	{
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_BoughtAlco_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_BoughtAlco_15_01"); //Daj mi ten trunek.
    AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_02"); //Proszê bardzo.
    CreateInvItems (self, ItMi_SpecialBooze, 12);
    B_GiveInvItems (self, other, ItMi_SpecialBooze, 12);
    B_GiveInvItems (other, self, ItMiNugget, 240);
    
    B_LogEntry     (CH1_BuntZbieraczy,"Dosta³em od Jeremiasza kilka butelek jego specjalnego trunku. Lewusa i jego ludzi mamy ju¿ w garœci.");
};

//========================================
//-----------------> MOCNA_WODA
//========================================

INSTANCE DIA_Jeremiah_MOCNA_WODA (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_MOCNA_WODA_Condition;
   information  = DIA_Jeremiah_MOCNA_WODA_Info;
   permanent	= FALSE;
   description	= "Potrafisz przyrz¹dziæ jakiœ specjalny trunek?";
};

FUNC INT DIA_Jeremiah_MOCNA_WODA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Bartholo_HANDEL_ZEW))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_MOCNA_WODA_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_01"); //Potrafisz przyrz¹dziæ jakiœ specjalny trunek?
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_02"); //Specjalny? Mówisz o czymœ znacznie lepszym od ry¿ówki?
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_03"); //Owszem.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_04"); //Znam pewien przepis, jednak nie posiadam wszystkich sk³adników.
	//klasyg!
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_05"); //Cholera, znowu bêdê musia³ biegaæ po ca³ej Kolonii.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_06"); //Spokojnie, wszystko mogê kupiæ na miejscu, jednak potrzebujê 50 bry³ek rudy.
	//log
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz mo¿e przygotowaæ specjalny napój alkoholowy, jednak potrzebuje 50 bry³ek rudy na sk³adniki.");
	//exp
    B_GiveXP (50);
};

//========================================
//-----------------> ORE_50
//========================================

INSTANCE DIA_Jeremiah_ORE_50 (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_ORE_50_Condition;
   information  = DIA_Jeremiah_ORE_50_Info;
   permanent	= FALSE;
   description	= "Oto 50 bry³ek rudy.";
};

FUNC INT DIA_Jeremiah_ORE_50_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_MOCNA_WODA))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_ORE_50_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_ORE_50_15_01"); //Oto 50 bry³ek rudy.
    AI_Output (self, other ,"DIA_Jeremiah_ORE_50_03_02"); //Wróæ jutro, przyrz¹dzenie tego napoju mo¿e zaj¹æ sporo czasu.
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz zajmie siê wszystkim. Napój powinien byæ gotowy na jutro.");
	dzien_Jeremiash =	wld_getday();
	B_GiveInvItems (other, self, ItMiNugget, 50);
};

//========================================
//-----------------> WODA_TROLO
//========================================

INSTANCE DIA_Jeremiah_WODA_TROLO (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 3;
   condition    = DIA_Jeremiah_WODA_TROLO_Condition;
   information  = DIA_Jeremiah_WODA_TROLO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Jeremiah_WODA_TROLO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_ORE_50))
    && (dzien_Jeremiash != wld_getday())
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_WODA_TROLO_Info()
{
    AI_Output (self, other ,"DIA_Jeremiah_WODA_TROLO_03_01"); //Pracowa³em przez wiêkszoœæ nocy, ale przeszed³em samego siebie. Ten trunek to po prostu raj zamkniêty w butelce. Oto napój. Uwa¿aj na niego, jest wart fortunê.
    B_LogEntry                     (CH1_SzponyTopielca,"Ten napój wygl¹da smakowicie... Lepiej udam siê od razu do Bartholo. Mam nadziejê, ¿e przypadnie mu do gustu.");
	CreateInvItems (self, JeremiahMoonshine, 1);
    B_GiveInvItems (self, other, JeremiahMoonshine, 1);
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Cenny kwarcyt
//========================================

INSTANCE DIA_Jeremiah_Usypiajacy_Trunek (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_Usypiajacy_Trunek_Condition;
   information  = DIA_Jeremiah_Usypiajacy_Trunek_Info;
   permanent	= FALSE;
   description	= "Potrzebny mi napój usypiaj¹cy zmieszany z alkoholem.";
};

FUNC INT DIA_Jeremiah_Usypiajacy_Trunek_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Silas_Cyrus_Alcohol_Part1))
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_Usypiajacy_Trunek_Info()
{





    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_01"); //Potrzebny mi napój usypiaj¹cy zmieszany z alkoholem.
    AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_02"); //Wyczuwam k³opoty. Nie wiem czy powinienem siê w to mieszaæ.
    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_03"); //Chodzi o ukaranie pewnych z³odziei.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_04"); //To trochê zmienia postaæ rzeczy, o ile mówisz prawdê ch³opczê.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_05"); //To prawda, masz moje s³owo.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_06"); //Ehh no dobrze. Ile potrzebujesz tego napoju?
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_07"); //Jedna butelka wystarczy.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_08"); //W porz¹dku, sporz¹dzê teraz listê sk³adników potrzebn¹ do stworzenia napoju usypiaj¹cego. Zaczekaj chwilkê.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_09"); //Zgoda.
	B_LogEntry               (CennyKwarcyt,"Jeremiasz zgodzi³ siê przygotowaæ napój usypiaj¹cy, teraz ma przygotowaæ listê sk³adników, które muszê pozyskaæ. Mam siê zg³osiæ do niego za godzinê.");
};
//========================================
//-----------------> Cenny kwarcyt
//========================================

INSTANCE DIA_Jeremiah_Usypiajacy_Trunek1 (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_Usypiajacy_Trunek1_Condition;
   information  = DIA_Jeremiah_Usypiajacy_Trunek1_Info;
   permanent	= FALSE;
   description	= "Masz listê potrzebnych sk³adników?";
};

FUNC INT DIA_Jeremiah_Usypiajacy_Trunek1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_Usypiajacy_Trunek))
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_Usypiajacy_Trunek1_Info()
{

    
    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_01"); //Masz listê potrzebnych sk³adników?
	B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek1_03_02"); //Tak, oto ona.
    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_03"); //Dziêkuje.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek1_03_04"); //Wróæ do mnie ze sk³adnikami. Ja sporz¹dzê napój i zmieszam go z bimbrem.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_05"); //Dobrze. W takim razie teraz moja kolej na dzia³anie. Postaram siê wkrótce wróciæ.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek1_03_06"); //Do zobaczenia.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_07"); //Na razie.
	CreateInvItems (self, ItWr_JeremiachList, 1);
    B_GiveInvItems (self, other, ItWr_JeremiachList, 1);
	B_LogEntry               (CennyKwarcyt,"Dosta³em listê sk³adników od Jeremiasza. Muszê je zdobyæ i mu przekazaæ.");
};


//========================================
//-----------------> Cenny kwarcyt
//========================================

INSTANCE DIA_Jeremiah_Skladniki_Trunek (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_Skladniki_Trunek_Condition;
   information  = DIA_Jeremiah_Skladniki_Trunek_Info;
   permanent	= FALSE;
   description	= "Mam sk³adniki, których potrzebujesz.";
};

FUNC INT DIA_Jeremiah_Skladniki_Trunek_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_Usypiajacy_Trunek1))
    && (Npc_HasItems (hero, ItFo_Plants_OrcHerb_01)>=2)
    && (Npc_HasItems (hero, ItFo_Plants_Velayis_01)>=2)
    && (Npc_HasItems (hero, ItFo_Plants_Stoneroot_01)>=3)
    && (Npc_HasItems (hero, ItAt_Bloodfly_01)>=1)
    && (Npc_HasItems (hero, ItFo_Honey)>=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_Skladniki_Trunek_Info()
{

    AI_Output (other, self ,"DIA_Jeremiah_Skladniki_Trunek_15_01"); //Mam sk³adniki, których potrzebujesz.
    AI_Output (self, other ,"DIA_Jeremiah_Skladniki_Trunek_03_02"); //Wspaniale. Daj mi je.
    AI_Output (other, self ,"DIA_Jeremiah_Skladniki_Trunek_15_03"); //Oto one. 
	AI_Output (self, other ,"DIA_Jeremiah_Skladniki_Trunek_03_04"); //Hmmm... Bêdê potrzebowa³ trochê czasu by przygotowaæ napój i finalnie zmieszaæ go z bimbrem w odpowiednich proporcjach. PrzyjdŸ jutro.
	AI_Output (other, self ,"DIA_Jeremiah_Skladniki_Trunek_15_05"); //Rozumiem. Do jutra.
	B_LogEntry               (CennyKwarcyt,"Da³em listê Jeremiaszowi. Teraz muszê odczekaæ jeden dzieñ a¿ przygotuje stosowny wywar.");
	
    Jeremiah_QUARTZ_Day = Wld_GetDay();
	  B_GiveInvItems (other,self, ItFo_Honey,               1);
	  B_GiveInvItems (other,self, ItAt_Bloodfly_01,         1);
      B_GiveInvItems (other,self, ItFo_Plants_Stoneroot_01, 3);
	  B_GiveInvItems (other,self, ItFo_Plants_Velayis_01,   2);
	  B_GiveInvItems (other,self, ItFo_Plants_OrcHerb_01,   2);
};

//========================================
//-----------------> Cenny kwarcyt
//========================================

INSTANCE DIA_Jeremiah_Trunek_End (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 2;
   condition    = DIA_Jeremiah_Trunek_End_Condition;
   information  = DIA_Jeremiah_Trunek_End_Info;
   permanent	= FALSE;
   description	= "I jak masz to o co ciê prosi³em?";
};

FUNC INT DIA_Jeremiah_Trunek_End_Condition()
{
    if (Jeremiah_QUARTZ_Day<=(Wld_GetDay()-1))
    &&  (Npc_KnowsInfo (hero, DIA_Jeremiah_Skladniki_Trunek))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Jeremiah_Trunek_End_Info()
{

    AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_01"); //I jak masz to o co ciê prosi³em?
    AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_02"); //Tak. Proszê.
    AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_03"); //Dziêki. Ile chcesz za pomoc?
    AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_04"); //Daj spokój ch³opczê, jeszcze zd¹¿ysz wydaæ rudê w tej zatêch³ej kolonii. Ja jej nie potrzebuje.
	AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_05"); //Có¿... Skoro tak mówisz. Dziêkuje za wykonan¹ dla mnie pracê.
	AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_06"); //Nie ma sprawy. Domyœlam siê, ¿e chodzi o ludzi Laresa?
    AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_07"); //Yyy... Dok³adnie...
	AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_08"); //W takim razie s³usznie zrobi³em pomagaj¹c ci.
	AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_09"); //Trzymaj siê.
	AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_10"); //Do zobaczenia ch³opcze.
	Npc_ExchangeRoutine         (ORG_40017_Pomocnik,"Start");
	B_LogEntry               (CennyKwarcyt,"Odebra³em napój usypiaj¹cy od Jeremiasza. Nie chcia³ zap³aty. Teraz muszê udaæ siê do Szkodników i poczêstowaæ ich napojem.");
	  B_GiveInvItems (self,other, ItFo_Potion_Sleep,  1);
};








//========================================
//-----------------> Plaga
//========================================

INSTANCE DIA_Jeremiah_Plaga (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 5;
   condition    = DIA_Jeremiah_Plaga_Condition;
   information  = DIA_Jeremiah_Plaga_Info;
   permanent	= FALSE;
   description	= "W magazynie Ry¿owego Ksiêcia rozmno¿y³y siê szczury.";
};

FUNC INT DIA_Jeremiah_Plaga_Condition()

{
if (Npc_KnowsInfo(hero,DIA_Ricelord_Plaga_Szczury))
{
    return TRUE;
};
};

FUNC VOID DIA_Jeremiah_Plaga_Info()
{

    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_01"); //W magazynie Ry¿owego Ksiêcia rozmno¿y³y siê szczury. Potrzebna jest mikstura, która je odpêdzi.
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_02"); //Ten szubrawiec zaniedba³ sytuacjê. Teraz ma co chcia³.
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_03"); //Pomo¿esz nam?
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_04"); //Pomogê. Chocia¿ mam na g³owie kilka innych spraw, i nie zbyt przepadam za tym t³uœciochem.
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_05"); //Trzeba dzia³aæ szybko.
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_06"); //Zaczekaj... Dam ci listê potrzebnych sk³adników do sporz¹dzenia tej mikstury.
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_07"); //W porz¹dku.
    B_UseFakeScroll ();
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_09"); //Masz tê listê?
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_10"); //Tak. Oto ona.
	CreateInvItem (self, ItWr_Jeremiach_Plaga);
    B_GiveInvItems (self,other, ItWr_Jeremiach_Plaga, 1);
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_11"); //Jeszcze jedno. Jednym ze sk³adników jest sad³o kretoszczura. Powinien je mieæ Ry¿owy Ksi¹ze.

    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_12"); //Dobra.
    B_LogEntry               (Plaga,"Jeremiasz zgodzi³ siê pomóc w sprawie szczurów w magazynie. Sporz¹dzi³ listê potrzebnych mu sk³adników. Jednym z nich jest sad³o kretoszczura. Powinien mieæ je ry¿owy Ksi¹¿ê.");



};


var int Plaga_Day;

//========================================
//-----------------> P_Skladniki
//========================================

INSTANCE DIA_Jeremiah_P_Skladniki (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 1;
   condition    = DIA_Jeremiah_P_Skladniki_Condition;
   information  = DIA_Jeremiah_P_Skladniki_Info;
   permanent	= FALSE;
   description	= "Mam sk³adniki potrzebne do sporz¹dzenia mikstury przeciw szczurom.";
};

FUNC INT DIA_Jeremiah_P_Skladniki_Condition()
{
 if (Npc_HasItems (other, ItAt_Crawler_01) >=1)   
 && (Npc_KnowsInfo(hero,DIA_Jeremiah_Plaga))
 && (Npc_HasItems (other, ItMi_Alchemy_Moleratlubric_01) >=1)  
 && (Npc_HasItems (other, ItMi_Alchemy_Alcohol_01) >=1)  
 && (Npc_HasItems (other, ItFo_Plants_OrcHerb_01) >=3)
 && (Npc_HasItems (other, ItFo_Plants_Nightshadow_01) >=4)
 
{
    return TRUE;
};
};
FUNC VOID DIA_Jeremiah_P_Skladniki_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_P_Skladniki_15_01"); //Mam sk³adniki potrzebne do sporz¹dzenia mikstury przeciw szczurom.
    AI_Output (self, other ,"DIA_Jeremiah_P_Skladniki_03_02"); //Dobrze. W takim razie daj mi je.
	Plaga_Day = Wld_GetDay();
    AI_Output (other, self ,"DIA_Jeremiah_P_Skladniki_15_03"); //Oto one.

	B_GiveInvItems (other,self,ItMi_Alchemy_Moleratlubric_01,1);
	B_GiveInvItems (other,self,     ItMi_Alchemy_Alcohol_01, 1);
	B_GiveInvItems (other,self,             ItAt_Crawler_01, 1);
	B_GiveInvItems (other,self,      ItFo_Plants_OrcHerb_01, 3);
	B_GiveInvItems (other,self,  ItFo_Plants_Nightshadow_01, 4);
    AI_Output (self, other ,"DIA_Jeremiah_P_Skladniki_03_04"); //Wróæ jutro. Mikstura powinna byæ ju¿ gotowa.
    AI_Output (other, self ,"DIA_Jeremiah_P_Skladniki_15_05"); //Dobra.
   B_LogEntry               (Plaga,"Zdoby³em wszystkie sk³adniki do wywaru przeciw szczurom. Jeremiasz sporz¹dzi teraz miksturê, a ja muszê poczekaæ do jutra.");

};


//========================================
//-----------------> P_Potion
//========================================

INSTANCE DIA_Jeremiah_P_Potion (C_INFO)
{
   npc          = Bau_912_Jeremiah;
   nr           = 7;
   condition    = DIA_Jeremiah_P_Potion_Condition;
   information  = DIA_Jeremiah_P_Potion_Info;
   permanent	= FALSE;
   description	= "Czy mikstura jest ju¿ gotowa?";
};

FUNC INT DIA_Jeremiah_P_Potion_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Jeremiah_P_Skladniki))
&& (Plaga_Day != Wld_GetDay())
{
    return TRUE;
};
};

FUNC VOID DIA_Jeremiah_P_Potion_Info()
{
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_00"); //Czy mikstura jest ju¿ gotowa?
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_01"); //Tak. WeŸ j¹.
	CreateInvItem (self, ItMi_Plaga_Potion);
	B_GiveInvItems (self,other, ItMi_Plaga_Potion, 1);
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_02"); //Teraz wracam do Ry¿owego Ksiêcia.
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_03"); //Dziwie siê, ¿e pomagasz tej szui ch³opczê.
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_04"); //Po prawdzie ja te¿ ale przynajmniej ma mi zap³aciæ za ca³y ten cyrk.
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_05"); //Có¿, ruda to jedna z najpotrzebniejszych o ile nie najpotrzebniejsza rzecz w kolonii. Obyœ przynajmniej dobrze j¹ rozdysponowa³.
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_06"); //Postaram siê. Trzymaj siê.
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_07"); //Do zobaczenia.
B_LogEntry               (Plaga,"Zabra³em od Jeremiasza miksturê odganiaj¹c¹ szczury. Teraz pora pomówiæ z Ry¿owym Ksiêciem. Oby ten wa³ tym razem przesta³ krêciæ i po prostu mi zap³aci³.");

};


