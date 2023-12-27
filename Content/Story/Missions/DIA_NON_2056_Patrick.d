//poprawione i sprawdzone - Reflide

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Patrick_EXIT(C_INFO)
{
	npc             = NON_2056_Patrick;
	nr              = 999;
	condition		= DIA_Patrick_EXIT_Condition;
	information		= DIA_Patrick_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Patrick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Patrick_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Patrick_HELLO1 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_HELLO1_Condition;
   information  = DIA_Patrick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Patrick_HELLO1_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_02"); //Czekam na wej�cie do kopalni. Artegor nie chce nas wpu�ci�.
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_03"); //Ja ju� tu kiedy� by�em, ale tych dw�ch jest nowych.
    AI_Output (other, self ,"DIA_Patrick_HELLO1_15_04"); //Trudno jest si� dosta� do kopalni?
    AI_Output (self, other ,"DIA_Patrick_HELLO1_03_05"); //Trzeba mie� kontakty. Diego, Lorenzo, ktokolwiek wp�ywowy...
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Patrick_HELLO2 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 2;
   condition    = DIA_Patrick_HELLO2_Condition;
   information  = DIA_Patrick_HELLO2_Info;
   permanent	= FALSE;
   description	= "D�ugo ju� tu czekasz?";
};

FUNC INT DIA_Patrick_HELLO2_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO2_15_01"); //D�ugo ju� tu czekasz?
    AI_Output (self, other ,"DIA_Patrick_HELLO2_03_02"); //Kilka dni. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Patrick_HELLO3 (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 3;
   condition    = DIA_Patrick_HELLO3_Condition;
   information  = DIA_Patrick_HELLO3_Info;
   permanent	= TRUE;
   description	= "Opowiedz mi o...";
};

FUNC INT DIA_Patrick_HELLO3_Condition()
{
	if (kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Patrick_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_15_01"); //Opowiedz mi o...

    Info_ClearChoices		(DIA_Patrick_HELLO3);
	Info_Addchoice 		(DIA_Patrick_HELLO3, DIALOG_BACK, DIA_Patrick_HELLO3_back);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Artegorze", DIA_Patrick_HELLO3_Artegor);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Macie", DIA_Patrick_HELLO3_Matt);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Petro", DIA_Patrick_HELLO3_Gamal);
    Info_AddChoice		(DIA_Patrick_HELLO3, "Spike", DIA_Patrick_HELLO3_Spike);
};

FUNC VOID DIA_Patrick_HELLO3_Artegor()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_01"); //...Artegorze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_02"); //Pilnuje wej�cia do kopalni. To trudny cz�owiek. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_03"); //Nie jednego Kopacza ju� powiesi�.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_04"); //Pewnego dnia dw�ch robotnik�w postanowi�o wle�� na palisad� i szybko pobiec do kopalni.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_05"); //Gdy zeskakiwali, dorwa� ich i zmia�d�y� im czaszki. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_06"); //To by�o naprawd� imponuj�ce. Facet ma krzep� jak ma�o kto!
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Artegor_15_07"); //Lepiej z nim nie zadziera�.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Artegor_03_08"); //Dok�adnie. Cho� teraz jest spokojniejszy.
};

FUNC VOID DIA_Patrick_HELLO3_Matt()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Matt_15_01"); //...Macie.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_02"); //Matt to nasz kucharz.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_03"); //Mo�na u niego kupi� co� ciep�ego.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Matt_03_04"); //Jest ca�kiem w porz�dku, dop�ki nie nadepniesz mu na odcisk.
};

FUNC VOID DIA_Patrick_HELLO3_Gamal()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Gamal_15_01"); //...Petro.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_02"); //Petro? To pupilek Lorenzo. Wykonuje dla niego r�ne �mieciowe zlecenia.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_03"); //Ale jego g��wnym zadaniem jest pilnowanie, aby nowi Kopacze dotarli do Kopalni w jednym kawa�ku. 
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Gamal_03_04"); //Zarozumia�y typ. Nie przepadam za nim. 
};

FUNC VOID DIA_Patrick_HELLO3_Spike()
{
    AI_Output (other, self ,"DIA_Patrick_HELLO3_Spike_15_01"); //...Spike'u.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_02"); //Nie znam go za dobrze.
    AI_Output (self, other ,"DIA_Patrick_HELLO3_Spike_03_03"); //Wiem tylko, �e czego� tam pilnuje.
};
FUNC VOID DIA_Patrick_HELLO3_back()
{
Info_ClearChoices		(DIA_Patrick_HELLO3);
};

//========================================
//-----------------> IanQuest
//========================================

INSTANCE DIA_Patrick_IanQuest (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_IanQuest_Condition;
   information  = DIA_Patrick_IanQuest_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o Artchu i Mirzo?";
};

FUNC INT DIA_Patrick_IanQuest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mirzo_QuestIan)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_IanQuest_Info()
{
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_01"); //Co mo�esz mi powiedzenia o Artchu i Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_02"); //Czemu ci� interesuj�? To zwykli Stra�nicy. 
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_03"); //Jedyne co czyni wyr�nia ich wyr�nia to fakt, �e obaj zajmuj� si� przyjmowaniem dostaw jedzenia z Obozu.
	AI_Output (other, self ,"DIA_Patrick_IanQuest_15_04"); //O to w�a�nie mi chodzi. Kt�ry� z nich co� kombinuje.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_04"); //Artch jest sumienny. Boi si� Magnat�w. Jego poprzednik trafi� do piachu na jego oczach.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_05"); //My�l�, �e jest lojalny wzgl�dem Starego Obozu.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_06"); //A Mirzo?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_07"); //Hmm... Ten cz�owiek na mile �mierdzi brudnymi sprawkami.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_08"); //Kilka nocy temu nie mog�em zasn��. Postanowi�em wi�c przej�� si� po obozie.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_09"); //Widzia�em jak Mirzo obudzi� si�, rozejrza� nerwowo i cichaczem opu�ci� ob�z.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_10"); //Wiesz, dok�d m�g� si� uda�?
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_11"); //Nie, ale jak chcesz si� tego dowiedzie�, to lepiej poczekaj do p�nocy.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_12"); //Zaczaj si� gdzie� i jak zobaczysz, �e Mirzo opuszcza ob�z, id� za nim.
    AI_Output (other, self ,"DIA_Patrick_IanQuest_15_13"); //Dzi�ki za rad�.
    AI_Output (self, other ,"DIA_Patrick_IanQuest_03_14"); //Nie ma sprawy.
    B_LogEntry                     (CH1_FoodForOldMine,"W ko�cu jakie� konkrety. Patrick twierdzi, �e widzia� jak Mirzo opuszcza� ob�z po zmroku. Lepiej poczekam, do p�nocy i zaczn� go �ledzi�.");
	Npc_ExchangeRoutine (GRD_7007_Mirzo, "spisek");
};



//========================================
//-----------------> Nieidz
//========================================

INSTANCE DIA_Patrick_Nieidz (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Nieidz_Condition;
   information  = DIA_Patrick_Nieidz_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Patrick_Nieidz_Condition()
{
    if (kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Nieidz_Info()
{
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_01"); //Nie id� tam.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_02"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_03"); //Stra�nicy atakuj� kogo popadnie.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_04"); //Stara Kopalnia zosta�a zalana przez podziemn� rzek�.
    if (Npc_KnowsInfo (hero, Info_Diego_OCWARN))
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_05"); //Znam ju� t� histori�. Powiedz mi lepiej, co dzieje si� w obozie.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_06"); //Co tu du�o m�wi�, to wszystko to jaki� ob��d. W og�le od jakiego� czasu w obozie przed kopalni� nie dzia�o si� najlepiej. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_07"); //Gdy wysz�o na jaw, �e dostawy nie dochodz� w ca�o�ci Gomez przys�a� tu Arto by przej�� zarz�d nad obozem i by wszystkiego dopilnowa�.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_08"); //Nasi nie byli zachwyceni, �e przydzielono im kogo� kto mia� ich nadzorowa�. Tym bardziej, �e by� z zewn�trz, a oni dot�d rz�dzili si� liczy� sami. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_09"); //Wszystko jednak jako� si� trzyma�o i pewnie trzyma�oby si� nadal gdyby nie zawali�a si� kopalnia. Potem ju� wszystko potoczy�o si� lawinowo.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_10"); //Artegor korzystaj�c z zamieszania zebra� lojalnych mu stra�nik�w i zabi� Arto, samemu przejmuj�c w�adz�. Chyba d��y do stworzenia w�asnego obozu. 
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_11"); //Gomez ju� wie, �e straci� w�adz� nad obozem przy kopalni?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_12"); //Na szcz�cie nie. Gdy si� o tym dowie, rozp�ta si� tu piek�o!
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_13"); //Po tym ca�ym buncie zrobi�o si� tu cholernie niebezpiecznie, a ja nie zamierzam gin�� ani za Artegora ani tym bardziej za Gomeza. 
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_14"); //Co wi�c teraz zrobisz? 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_15"); //Nie wiem. Na razie pokr�c� si� tu i tam, a potem zobaczymy. 
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_16"); //Na pewno nie wr�c� jednak tam, gdzie mo�na straci� �ycie. 
    }
    else
    {
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_17"); //Nie s�ysza�em o tym! M�w dalej.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_18"); //Jeden z Kopaczy, kt�remu uda�o si� uratowa�, powiedzia�, �e kopi�c na najni�szym poziomie, trafili na podziemn� rzek�.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_19"); //Kiedy woda wdar�a si� do szyb�w, pop�ka�y podpory i run�a ca�a g�rna cz��.
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_20"); //Tylko garstce ludzi uda�o si� wydosta� na powierzchni�.
        AI_Output (other, self ,"DIA_Patrick_Nieidz_15_21"); //A co dzieje si� w Starym Obozie?
        AI_Output (self, other ,"DIA_Patrick_Nieidz_03_22"); //Tego nie wiem. Nie by�em tam. Nie mamy �adnych wie�ci.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_23"); //Co z obozem przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_24"); //Co tu du�o m�wi�, to wszystko to jaki� ob��d. W og�le od jakiego� czasu w obozie przed kopalni� nie dzia�o si� najlepiej. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_25"); //Gdy wysz�o na jaw, �e dostawy nie dochodz� w ca�o�ci Gomez przys�a� tu Arto by przej�� zarz�d nad obozem i by wszystkiego dopilnowa�.
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_26"); //Nasi nie byli zachwyceni, �e przydzielono im kogo� kto mia� ich nadzorowa�. Tym bardziej, �e by� z zewn�trz, a oni dot�d rz�dzili si� liczy� sami. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_27"); //Wszystko jednak jako� si� trzyma�o i pewnie trzyma�oby si� nadal gdyby nie zawali�a si� kopalnia. Potem ju� wszystko potoczy�o si� lawinowo.
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_28"); //Co si� dok�adnie sta�o?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_29"); //Artegor korzystaj�c z zamieszania zebra� lojalnych mu stra�nik�w i zabi� Arto, samemu przejmuj�c w�adz�. Chyba d��y do stworzenia w�asnego obozu. 
    AI_Output (other, self ,"DIA_Patrick_Nieidz_15_30"); //Gomez ju� wie, �e straci� w�adz� nad obozem przy kopalni?
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_31"); //Na szcz�cie nie. Gdy si� o tym dowie, rozp�ta si� tu piek�o! Zreszt� i bez tego po ca�ym tym buncie zrobi�o si� tam cholernie niebezpiecznie. 
    AI_Output (self, other ,"DIA_Patrick_Nieidz_03_32"); //A ja nie zamierzam gin�� ani za Artegora ani tym bardziej za Gomeza. 
    };

    if (MIS_BackToOldMine == LOG_RUNNING)
    {
        B_LogEntry                     (CH4_BackToOldMine,"Od Patricka dowiedzia�em si�, �e Gomez wys�a� Arto do obozu przy kopalni. Magnat mia� tam osobi�cie sprawowa� w�adz� i nadzorowa� sytuacje, jednak podst�pny szef Stra�nik�w, Artegor, postanowi� go zabi� i sam obj�� w�adz� w obozie. Gdy Gomez dowie si�, �e utraci� wp�ywy tak�e w obozie przed Star� kopalni�, w�cieknie si�.");

        B_GiveXP (150);
    };
 //   AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_Patrick_Brothers (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Brothers_Condition;
   information  = DIA_Patrick_Brothers_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o Stra�nikach z Bractwa?";
};

FUNC INT DIA_Patrick_Brothers_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Shan_Questdadasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Brothers_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_01"); //Wiesz co� o Stra�nikach z Bractwa?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_02"); //Chodzi ci o tych podobnych tobie?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_03"); //Zostali uwi�zieni za bram� do kopalni.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_04"); //Widzia�em tylko trzech.   
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_06"); //Masz zamiar ich odbi�?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_07"); //Zapomnij o tym! Stra�nicy od razu ci� poszatkuj�.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_08"); //Co wi�c mam zrobi�?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_09"); //Podobno Bandyci chc� poinformowa� Gomeza o tym, co si� tutaj sta�o.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_10"); //Je�eli Magnat dowie si�, �e do reszty straci� kontrol� nad tym miejscem, zaatakuje buntownik�w.
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_11"); //Przy odrobinie szcz�cia powybijaj� si� nawzajem.
    AI_Output (other, self ,"DIA_Patrick_Brothers_15_12"); //Gdzie znajd� tych Bandyt�w?
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_13"); //Jeden z nich stoi przy jaskini i bada sytuacj�. 
    AI_Output (self, other ,"DIA_Patrick_Brothers_03_14"); //Spr�buj zaoferowa� mu swoj� pomoc.
    B_LogEntry                     (CH1_HelpBrothersBra,"Kopacz Patrick zdradzi� mi, �e moi Bracia z obozu na bagnie �yj�, jednak s� uwi�zieni przez ludzi Artegora. Jedynym sposobem na dostanie si� do Stra�nik�w �wi�tynnych jest pozbycie si� Artegora i ca�ej tej jego bandy. Podobno Bandyci maj� na to jaki� spos�b.");

    B_GiveXP (50);

};

//-----------------------------------------------------------------------------------1.6.1--------------------------------------------------------

//========================================
//---------> Zawirowania w starej kopalni
//========================================

INSTANCE DIA_Patrick_Mine (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Mine_Condition;
   information  = DIA_Patrick_Mine_Info;
   permanent	= FALSE;
   description	= "S�ysza�em, �e w kopalni co rusz dochodzi do...";
};

FUNC INT DIA_Patrick_Mine_Condition()
{
    if (Npc_KnowsInfo (hero, ORG_801_Lares_Kopalnia))
	&& (MIS_Zawirowania == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Mine_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Mine_15_01"); //S�ysza�em, �e w kopalni co rusz dochodzi do uszkodze� sprz�tu s�u��cego do wydobycia.
    AI_Output (self, other ,"DIA_Patrick_Mine_03_02"); //Tak, a przez to Kopacze z kilofami musz� zasuwa� dwa razy szybciej! 
    AI_Output (self, other ,"DIA_Patrick_Mine_03_03"); //Skoro ten sprz�t stale si� psuje to niech ci t�pi Stra�nicy rusz� si� do roboty i nam pomog�!
    AI_Output (other, self ,"DIA_Patrick_Mine_15_04"); //Wiadomo ju� co planuj� Magnaci by wszystko wr�ci�o do normy?  
    AI_Output (self, other ,"DIA_Patrick_Mine_03_05"); //S�ysza�em, �e zamierzaj� tu przys�a� swojego najlepszego in�yniera. Ma on zarz�dza� wykonaniem wszelkich napraw.
    AI_Output (other, self ,"DIA_Patrick_Mine_15_06"); //Dzi�ki za informacje!
  
    B_LogEntry                     (Zawirowania,"Patrick twierdzi, �e Magnaci znale�li remedium na swoje problemy. Chc� wys�a� do kopalni swojego najlepszego in�yniera by poczyni� stosowne naprawy sprz�tu. Musz� o tym powiedzie� Laresowi.");

    B_GiveXP (50);

};

//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_Patrick_Potwor (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Potwor_Condition;
   information  = DIA_Patrick_Potwor_Info;
   permanent	= FALSE;
   description	= "Pono� widzia�e� jakiego� stwora...";
};

FUNC INT DIA_Patrick_Potwor_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Thorus_Potwor))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Potwor_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Potwor_15_01"); //Pono� widzia�e� jakiego� stwora grasuj�cego nieopodal placu wymian.
    AI_Output (self, other ,"DIA_Patrick_Potwor_03_02"); //O tak! Widzia�em tego sukinsyna pewnej nocy gdy akurat �erowa�.
    AI_Output (self, other ,"DIA_Patrick_Potwor_03_03"); //Wielki dwuno�ny gad. Stra�nik Joel widzia� kolejnego dnia zw�oki jakiego� nieszcz�nika zabitego przez to bydle.
    AI_Output (other, self ,"DIA_Patrick_Potwor_15_04"); //To cenna informacja. Dzi�ki za pomoc, pom�wi� z Joelem.
    AI_Output (self, other ,"DIA_Patrick_Potwor_03_05"); //Zajmijcie si� tym cholerstwem nim po�r� wi�cej os�b.
    AI_Output (other, self ,"DIA_Patrick_Potwor_15_06"); //Jasne, ju� nad tym pracujemy.
  
    B_LogEntry                     (PotworBramus,"Patrick potwierdzi�, �e widzia� potwora. To wielki gad. �erowa� noc� gdy zosta� zauwa�ony. Nast�pnego dnia odnaleziono zmasakrowane zw�oki. Dokona� tego stra�nik Joel.");

    B_GiveXP (50);

};


//========================================
//-----------------> Cenny Kwarcyt
//========================================

INSTANCE DIA_Patrick_Life (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_Life_Condition;
   information  = DIA_Patrick_Life_Info;
   permanent	= FALSE;
   description	= "Obi�o ci si� o uszy co� o z�o�ach kwarcytu?";
};

FUNC INT DIA_Patrick_Life_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_Thief_Quartz))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_Life_Info()
{
    AI_Output (other, self ,"DIA_Patrick_Life_15_01"); //Obi�o ci si� o uszy co� o z�o�ach kwarcytu?
    AI_Output (self, other ,"DIA_Patrick_Life_03_02"); //Mo�liwe, �e si� obi�o ale, �eby si� upewni�, �e tak by�o chcia�bym zobaczy� 100 bry�ek rudy.
    AI_Output (self, other ,"DIA_Patrick_Life_03_03"); //Taka informacja kosztuje.
    AI_Output (other, self ,"DIA_Patrick_Life_15_04"); //Mog�em si� tego spodziewa�.
    AI_Output (self, other ,"DIA_Patrick_Life_03_05"); //Takie �ycie...
    B_LogEntry(CennyKwarcyt ,"Patrick z obozowiska przed Star� Kopalni� zdaje si� co� wiedzie� na temat kwarcytu jednak b�dzie chcia� za informacj� 100 bry�ek rudy.");

};
//========================================
//-----------------> Cenny Kwarcyt
//========================================

INSTANCE DIA_Patrick_New_Camp_Quartz (C_INFO)
{
   npc          = NON_2056_Patrick;
   nr           = 1;
   condition    = DIA_Patrick_New_Camp_Quartz_Condition;
   information  = DIA_Patrick_New_Camp_Quartz_Info;
   permanent	= FALSE;
   description	= "Oto twoja ruda.";
};

FUNC INT DIA_Patrick_New_Camp_Quartz_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Patrick_Life))
	&&  (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Patrick_New_Camp_Quartz_Info()
{
    AI_Output (other, self ,"DIA_Patrick_New_Camp_Quartz_15_01"); //Oto twoja ruda.
    AI_Output (self, other ,"DIA_Patrick_New_Camp_Quartz_03_02"); //Dzi�ki. Ciekawa sprawa z tym kwarcytem. Szukano tego minera�u po ca�ej kolonii a okaza�o si�, �e niewielkie z�o�e znajduje si� tu w kopalni.
    AI_Output (self, other ,"DIA_Patrick_New_Camp_Quartz_03_03"); //By�o dosy� ma�e i szybko je wydobyto. Potem przygotowano do transportu do Starego obozu ale wtedy...
    AI_Output (self, other ,"DIA_Patrick_New_Camp_Quartz_03_04"); //Ludzie Laresa napadli na obozowisko i noc� skradli ca�y pozyskany kwarcyt.
    AI_Output (other, self ,"DIA_Patrick_New_Camp_Quartz_15_05"); //Cholera, czyli trzeba go szuka� go gdzie� w nowym obozie.
    AI_Output (self, other ,"DIA_Patrick_New_Camp_Quartz_03_06"); //Na to wychodzi. Pewnie te brudne kundle ju� si� opijaj� za rude jak� dostali za ten ca�y �adunek.
    AI_Output (other, self ,"DIA_Patrick_New_Camp_Quartz_15_07"); //Dzi�ki za informacje, zatem musz� uda� si� do Nowego obozu. Trzymaj si�.
    AI_Output (self, other ,"DIA_Patrick_New_Camp_Quartz_03_08"); //Na twoim miejscu da�by sobie spok�j bo ju� po herbacie ale jak chcesz to popytaj, mo�e odzyskasz par� sztuk kwarcytu.
    AI_Output (other, self ,"DIA_Patrick_New_Camp_Quartz_15_09"); //Na razie.
    AI_Output (self, other ,"DIA_Patrick_New_Camp_Quartz_03_10"); //�egnaj.
    B_giveinvitems (hero,self, ItMiNugget, 100);
    B_LogEntry                     (CennyKwarcyt ,"Patrick odp�atnie stwierdzi�, �e odnaleziono ma�e z�o�e kwarcytu w Starej Kopalni. Jednak gdy przygotowano go do transportu, zosta� on noc� skradziony przez Szkodnik�w z Nowego Obozu. Musz� si� tam uda� i wypyta� w odpowiednim miejscu kogo� kto ma du�o informacji. My�l�, �e tamtejsza karczma to dobre miejsce.");

};

instance dia_patrick_pickpocket(c_info) {
    npc = non_2056_patrick;
    nr = 900;
    condition = dia_patrick_pickpocket_condition;
    information = dia_patrick_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_patrick_pickpocket_condition() {
	e_beklauen(baseThfChanceNON, 20);
};

func void dia_patrick_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_patrick_pickpocket);
	info_addchoice(dia_patrick_pickpocket, dialog_back, dia_patrick_pickpocket_back);
	info_addchoice(dia_patrick_pickpocket, dialog_pickpocket, dia_patrick_pickpocket_doit);
};

func void dia_patrick_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_patrick_pickpocket);
};

func void dia_patrick_pickpocket_back() {
    info_clearchoices(dia_patrick_pickpocket);
};

