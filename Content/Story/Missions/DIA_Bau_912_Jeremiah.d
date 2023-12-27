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
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Przygotowuj� ry��wk�, ch�opcze.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Prosz� - we� sobie jedn� butelk�. Tylko nie m�w Silasowi.
	
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
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Przy tych facetach ledwie nad��am z zam�wieniami. Ci to potrafi� wypi�!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //I nawet mi to na r�k�. Przynajmniej psy Ry�owego Ksi�cia zostawiaj� mnie w spokoju.
	
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
	description = "Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?";
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
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //To zapchlony wieprz! Jego siepacze zmuszaj� s�abszych do pracy na polach.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jedyna osoba, kt�ra mog�aby si� mu przeciwstawi� to Horacy. Ale on nie lubi przemocy.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //S�ysza�em, jak kiedy� powiedzia�, �e ma ochot� pogruchota� Ksi�ciu ko�ci, ale tak naprawd� nigdy by tego nie zrobi�.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //To by by�o wbrew jego zasadom.
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
   description	= "Potrzebuj� twojego specjalnego trunku.";
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
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_01"); //Potrzebuj� twojego specjalnego trunku.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_02"); //Podobno na polach ry�owych zrobi� si� niez�y ba�agan.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_03"); //Tak, nikt nie pracuje.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_04"); //To jak b�dzie z tym 'specja�em'? Chcia�em pocz�stowa� kilku 'koleg�w'...
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_06"); //Ch�tnie bym pom�g�, ale Najemnicy regularnie sprawdzaj�, czy nie da�em nikomu nic za darmo.
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_07"); //Podliczaj� ka�d� bry�k� zysku. Licz� butelki... Je�li ci pomog�, zostan� ukarany.
    AI_Output (other, self ,"DIA_Jeremiah_HelpMe_15_09"); //A gdybym zap�aci�?
    AI_Output (self, other ,"DIA_Jeremiah_HelpMe_03_10"); //Wtedy nie by�oby problemu. M�g�bym ci da� 12 butelek za 240 bry�ek rudy.
	
    B_LogEntry                     (CH1_BuntZbieraczy,"B�d� musia� zap�aci� Jeremiaszowi za alkohol. Najemnicy skrupulatnie podliczaj� ka�d� wyprodukowan� przez niego butelk�.");
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
    AI_Output (self, other ,"DIA_Jeremiah_BoughtAlco_03_02"); //Prosz� bardzo.
    CreateInvItems (self, ItMi_SpecialBooze, 12);
    B_GiveInvItems (self, other, ItMi_SpecialBooze, 12);
    B_GiveInvItems (other, self, ItMiNugget, 240);
    
    B_LogEntry     (CH1_BuntZbieraczy,"Dosta�em od Jeremiasza kilka butelek jego specjalnego trunku. Lewusa i jego ludzi mamy ju� w gar�ci.");
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
   description	= "Potrafisz przyrz�dzi� jaki� specjalny trunek?";
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
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_01"); //Potrafisz przyrz�dzi� jaki� specjalny trunek?
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_02"); //Specjalny? M�wisz o czym� znacznie lepszym od ry��wki?
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_03"); //Owszem.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_04"); //Znam pewien przepis, jednak nie posiadam wszystkich sk�adnik�w.
	//klasyg!
    AI_Output (other, self ,"DIA_Jeremiah_MOCNA_WODA_15_05"); //Cholera, znowu b�d� musia� biega� po ca�ej Kolonii.
    AI_Output (self, other ,"DIA_Jeremiah_MOCNA_WODA_03_06"); //Spokojnie, wszystko mog� kupi� na miejscu, jednak potrzebuj� 50 bry�ek rudy.
	//log
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz mo�e przygotowa� specjalny nap�j alkoholowy, jednak potrzebuje 50 bry�ek rudy na sk�adniki.");
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
   description	= "Oto 50 bry�ek rudy.";
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
    AI_Output (other, self ,"DIA_Jeremiah_ORE_50_15_01"); //Oto 50 bry�ek rudy.
    AI_Output (self, other ,"DIA_Jeremiah_ORE_50_03_02"); //Wr�� jutro, przyrz�dzenie tego napoju mo�e zaj�� sporo czasu.
    B_LogEntry                     (CH1_SzponyTopielca,"Jeremiasz zajmie si� wszystkim. Nap�j powinien by� gotowy na jutro.");
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
    AI_Output (self, other ,"DIA_Jeremiah_WODA_TROLO_03_01"); //Pracowa�em przez wi�kszo�� nocy, ale przeszed�em samego siebie. Ten trunek to po prostu raj zamkni�ty w butelce. Oto nap�j. Uwa�aj na niego, jest wart fortun�.
    B_LogEntry                     (CH1_SzponyTopielca,"Ten nap�j wygl�da smakowicie... Lepiej udam si� od razu do Bartholo. Mam nadziej�, �e przypadnie mu do gustu.");
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
   description	= "Potrzebny mi nap�j usypiaj�cy zmieszany z alkoholem.";
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





    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_01"); //Potrzebny mi nap�j usypiaj�cy zmieszany z alkoholem.
    AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_02"); //Wyczuwam k�opoty. Nie wiem czy powinienem si� w to miesza�.
    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_03"); //Chodzi o ukaranie pewnych z�odziei.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_04"); //To troch� zmienia posta� rzeczy, o ile m�wisz prawd� ch�opcz�.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_05"); //To prawda, masz moje s�owo.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_06"); //Ehh no dobrze. Ile potrzebujesz tego napoju?
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_07"); //Jedna butelka wystarczy.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek_03_08"); //W porz�dku, sporz�dz� teraz list� sk�adnik�w potrzebn� do stworzenia napoju usypiaj�cego. Zaczekaj chwilk�.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek_15_09"); //Zgoda.
	B_LogEntry               (CennyKwarcyt,"Jeremiasz zgodzi� si� przygotowa� nap�j usypiaj�cy, teraz ma przygotowa� list� sk�adnik�w, kt�re musz� pozyska�. Mam si� zg�osi� do niego za godzin�.");
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
   description	= "Masz list� potrzebnych sk�adnik�w?";
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

    
    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_01"); //Masz list� potrzebnych sk�adnik�w?
	B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek1_03_02"); //Tak, oto ona.
    AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_03"); //Dzi�kuje.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek1_03_04"); //Wr�� do mnie ze sk�adnikami. Ja sporz�dz� nap�j i zmieszam go z bimbrem.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_05"); //Dobrze. W takim razie teraz moja kolej na dzia�anie. Postaram si� wkr�tce wr�ci�.
	AI_Output (self, other ,"DIA_Jeremiah_Usypiajacy_Trunek1_03_06"); //Do zobaczenia.
	AI_Output (other, self ,"DIA_Jeremiah_Usypiajacy_Trunek1_15_07"); //Na razie.
	CreateInvItems (self, ItWr_JeremiachList, 1);
    B_GiveInvItems (self, other, ItWr_JeremiachList, 1);
	B_LogEntry               (CennyKwarcyt,"Dosta�em list� sk�adnik�w od Jeremiasza. Musz� je zdoby� i mu przekaza�.");
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
   description	= "Mam sk�adniki, kt�rych potrzebujesz.";
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

    AI_Output (other, self ,"DIA_Jeremiah_Skladniki_Trunek_15_01"); //Mam sk�adniki, kt�rych potrzebujesz.
    AI_Output (self, other ,"DIA_Jeremiah_Skladniki_Trunek_03_02"); //Wspaniale. Daj mi je.
    AI_Output (other, self ,"DIA_Jeremiah_Skladniki_Trunek_15_03"); //Oto one. 
	AI_Output (self, other ,"DIA_Jeremiah_Skladniki_Trunek_03_04"); //Hmmm... B�d� potrzebowa� troch� czasu by przygotowa� nap�j i finalnie zmiesza� go z bimbrem w odpowiednich proporcjach. Przyjd� jutro.
	AI_Output (other, self ,"DIA_Jeremiah_Skladniki_Trunek_15_05"); //Rozumiem. Do jutra.
	B_LogEntry               (CennyKwarcyt,"Da�em list� Jeremiaszowi. Teraz musz� odczeka� jeden dzie� a� przygotuje stosowny wywar.");
	
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
   description	= "I jak masz to o co ci� prosi�em?";
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

    AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_01"); //I jak masz to o co ci� prosi�em?
    AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_02"); //Tak. Prosz�.
    AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_03"); //Dzi�ki. Ile chcesz za pomoc?
    AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_04"); //Daj spok�j ch�opcz�, jeszcze zd��ysz wyda� rud� w tej zat�ch�ej kolonii. Ja jej nie potrzebuje.
	AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_05"); //C�... Skoro tak m�wisz. Dzi�kuje za wykonan� dla mnie prac�.
	AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_06"); //Nie ma sprawy. Domy�lam si�, �e chodzi o ludzi Laresa?
    AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_07"); //Yyy... Dok�adnie...
	AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_08"); //W takim razie s�usznie zrobi�em pomagaj�c ci.
	AI_Output (other, self ,"DIA_Jeremiah_Trunek_End_15_09"); //Trzymaj si�.
	AI_Output (self, other ,"DIA_Jeremiah_Trunek_End_03_10"); //Do zobaczenia ch�opcze.
	Npc_ExchangeRoutine         (ORG_40017_Pomocnik,"Start");
	B_LogEntry               (CennyKwarcyt,"Odebra�em nap�j usypiaj�cy od Jeremiasza. Nie chcia� zap�aty. Teraz musz� uda� si� do Szkodnik�w i pocz�stowa� ich napojem.");
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
   description	= "W magazynie Ry�owego Ksi�cia rozmno�y�y si� szczury.";
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

    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_01"); //W magazynie Ry�owego Ksi�cia rozmno�y�y si� szczury. Potrzebna jest mikstura, kt�ra je odp�dzi.
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_02"); //Ten szubrawiec zaniedba� sytuacj�. Teraz ma co chcia�.
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_03"); //Pomo�esz nam?
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_04"); //Pomog�. Chocia� mam na g�owie kilka innych spraw, i nie zbyt przepadam za tym t�u�ciochem.
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_05"); //Trzeba dzia�a� szybko.
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_06"); //Zaczekaj... Dam ci list� potrzebnych sk�adnik�w do sporz�dzenia tej mikstury.
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_07"); //W porz�dku.
    B_UseFakeScroll ();
    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_09"); //Masz t� list�?
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_10"); //Tak. Oto ona.
	CreateInvItem (self, ItWr_Jeremiach_Plaga);
    B_GiveInvItems (self,other, ItWr_Jeremiach_Plaga, 1);
    AI_Output (self, other ,"DIA_Jeremiah_Plaga_03_11"); //Jeszcze jedno. Jednym ze sk�adnik�w jest sad�o kretoszczura. Powinien je mie� Ry�owy Ksi�ze.

    AI_Output (other, self ,"DIA_Jeremiah_Plaga_15_12"); //Dobra.
    B_LogEntry               (Plaga,"Jeremiasz zgodzi� si� pom�c w sprawie szczur�w w magazynie. Sporz�dzi� list� potrzebnych mu sk�adnik�w. Jednym z nich jest sad�o kretoszczura. Powinien mie� je ry�owy Ksi���.");



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
   description	= "Mam sk�adniki potrzebne do sporz�dzenia mikstury przeciw szczurom.";
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
    AI_Output (other, self ,"DIA_Jeremiah_P_Skladniki_15_01"); //Mam sk�adniki potrzebne do sporz�dzenia mikstury przeciw szczurom.
    AI_Output (self, other ,"DIA_Jeremiah_P_Skladniki_03_02"); //Dobrze. W takim razie daj mi je.
	Plaga_Day = Wld_GetDay();
    AI_Output (other, self ,"DIA_Jeremiah_P_Skladniki_15_03"); //Oto one.

	B_GiveInvItems (other,self,ItMi_Alchemy_Moleratlubric_01,1);
	B_GiveInvItems (other,self,     ItMi_Alchemy_Alcohol_01, 1);
	B_GiveInvItems (other,self,             ItAt_Crawler_01, 1);
	B_GiveInvItems (other,self,      ItFo_Plants_OrcHerb_01, 3);
	B_GiveInvItems (other,self,  ItFo_Plants_Nightshadow_01, 4);
    AI_Output (self, other ,"DIA_Jeremiah_P_Skladniki_03_04"); //Wr�� jutro. Mikstura powinna by� ju� gotowa.
    AI_Output (other, self ,"DIA_Jeremiah_P_Skladniki_15_05"); //Dobra.
   B_LogEntry               (Plaga,"Zdoby�em wszystkie sk�adniki do wywaru przeciw szczurom. Jeremiasz sporz�dzi teraz mikstur�, a ja musz� poczeka� do jutra.");

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
   description	= "Czy mikstura jest ju� gotowa?";
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
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_00"); //Czy mikstura jest ju� gotowa?
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_01"); //Tak. We� j�.
	CreateInvItem (self, ItMi_Plaga_Potion);
	B_GiveInvItems (self,other, ItMi_Plaga_Potion, 1);
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_02"); //Teraz wracam do Ry�owego Ksi�cia.
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_03"); //Dziwie si�, �e pomagasz tej szui ch�opcz�.
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_04"); //Po prawdzie ja te� ale przynajmniej ma mi zap�aci� za ca�y ten cyrk.
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_05"); //C�, ruda to jedna z najpotrzebniejszych o ile nie najpotrzebniejsza rzecz w kolonii. Oby� przynajmniej dobrze j� rozdysponowa�.
    AI_Output (other, self ,"DIA_Jeremiah_P_Potion_15_06"); //Postaram si�. Trzymaj si�.
    AI_Output (self, other ,"DIA_Jeremiah_P_Potion_03_07"); //Do zobaczenia.
B_LogEntry               (Plaga,"Zabra�em od Jeremiasza mikstur� odganiaj�c� szczury. Teraz pora pom�wi� z Ry�owym Ksi�ciem. Oby ten wa� tym razem przesta� kr�ci� i po prostu mi zap�aci�.");

};


