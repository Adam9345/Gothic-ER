// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Velaya_EXIT(C_INFO)
{
	npc             = EBR_108_Velaya;
	nr              = 999;
	condition	= DIA_Velaya_EXIT_Condition;
	information	= DIA_Velaya_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Velaya_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Velaya_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Velaya_HELLO1 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 1;
   condition    = DIA_Velaya_HELLO1_Condition;
   information  = DIA_Velaya_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Velaya_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Velaya_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Velaya_HELLO1_03_01"); //Hej, co ty tu robisz? Nie s�dzi�am, �e po magnackich komnatach mog� si� pa��ta� inni skaza�cy.
    AI_Output (self, other ,"DIA_Velaya_HELLO1_03_02"); //Jestem Velaya, niewolnica Gomeza.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Velaya_HELLO2 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 2;
   condition    = DIA_Velaya_HELLO2_Condition;
   information  = DIA_Velaya_HELLO2_Info;
   permanent	= FALSE;
   description	= "Szuka�em ci�. Gdy zrzucali mnie do Kolonii, widzia�em jak spuszczono ci� za Barier� wraz z �adunkiem. ";
};

FUNC INT DIA_Velaya_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Velaya_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO2_15_01"); //Szuka�em ci�. Gdy zrzucali mnie do Kolonii, widzia�em jak spuszczono ci� za Barier� wraz z �adunkiem. 
    AI_Output (other, self ,"DIA_Velaya_HELLO2_03_02"); //Zastanawia�em si�, co si� z tob� sta�o. Stra�nicy m�wili, �e kobiety w Kolonii zostaj� niewolnicami.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_03"); //Tak, niestety. To przekl�te miejsce a� si� roi od przest�pc�w, kt�rzy nie wiedz� jak traktowa� damy. Ciesz� si�, �e przynajmniej p�ki co mog� zosta� tu, na g�rze.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_04"); //Sira i Serafia, gdy znudzi�y si� Gomezowi, zosta�y wys�ane do szorowania pod��g.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_05"); //Jednak ja nie zamierzam pozwala� si� wykorzystywa� facetom. Przyjdzie dzie�, gdy wszyscy zap�ac� mi za takie traktowanie.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_06"); //Bardzo mi mi�o, �e si� mn� zainteresowa�e�. Od razu wida�, �e nie jeste� taki jak ci oble�ni skaza�cy.
	
	if MIS_Women == LOG_RUNNING
	{
	MIS_Women = LOG_SUCCESS;
	//Log_CreateTopic(CH1_Women, LOG_MISSION); //fix
	Log_SetTopicStatus   (CH1_Women, LOG_SUCCESS);
    B_LogEntry               (CH1_Women,"Pozna�em w ko�cu t� tajemnicz� kobiet� - nazywa si� Velaya. Opowiedzia�a mi swoj� histori�, o tym jak zosta�a nies�usznie oskar�ona przez S�dziego z Khorinis. My�l�, �e Velaya ma potencja�, o kt�rym kiedy� dowie si� ca�y �wiat. Ciesz� si�, �e jest ca�a i zdrowa.");
	b_givexp (100);
	};
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Velaya_HELLO3 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 3;
   condition    = DIA_Velaya_HELLO3_Condition;
   information  = DIA_Velaya_HELLO3_Info;
   permanent	= FALSE;
   description	= "Mam wra�enie, �e nies�usznie wrzucili ci� do Kolonii...";
};

FUNC INT DIA_Velaya_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO3_15_01"); //Mam wra�enie, �e nies�usznie wrzucili ci� do Kolonii...
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_02"); //Ech... nie chc� o tym gada�. Powiem ci tylko, �e mia�am kiedy� tendencje do ratowania �wiata. Chcia�am dobrze, ale kilku osobom si� to nie spodoba�o. 
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_03"); //Wrobili mnie w pewne przest�pstwo, a ja stawia�am op�r.
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_04"); //S�dzia z Khorinis nie chcia� mnie w og�le s�ucha�. To kawa� drania! Od razu wys�a� mnie za Barier�. 
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Velaya_HELLO4 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 4;
   condition    = DIA_Velaya_HELLO4_Condition;
   information  = DIA_Velaya_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o swoich kole�ankach?";
};

FUNC INT DIA_Velaya_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO4_15_01"); //Co mo�esz mi powiedzie� o swoich kole�ankach?
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_02"); //W�a�ciwie za dobrze ich nie znam. S� strasznie zapracowane i nie maj� czasu na pogaw�dki.
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_03"); //Serafia powiedzia�a mi jednak, �e gdy w zamku jest zbyt wiele kobiet, Magnaci wysy�aj� cz�� z nich do Obozu Bractwa jako prezent dla tamtejszego przyw�dcy. 
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_04"); //Pewnie ka�d� z nas to spotka, gdy znudzimy si� Gomezowi...
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_05"); //Co do moich kole�anek z do�u, to staraj si� ich nie zaczepia�. Nie mog� z nikim rozmawia� bez pozwolenia Gomeza.
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Velaya_HELLO5 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 5;
   condition    = DIA_Velaya_HELLO5_Condition;
   information  = DIA_Velaya_HELLO5_Info;
   permanent	= FALSE;
   description	= "Ruszam w dalsz� drog�. Mam nadziej�, �e jeszcze si� spotykamy.";
};

FUNC INT DIA_Velaya_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    && (Npc_KnowsInfo (hero, DIA_Velaya_HELLO3))
    && (Npc_KnowsInfo (hero, DIA_Velaya_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO5_15_01"); //Ruszam w dalsz� drog�. Mam nadziej�, �e jeszcze si� spotykamy.
    AI_Output (self, other ,"DIA_Velaya_HELLO5_03_02"); //Te� mam tak� nadzieje. Mi�o si� z tob� rozmawia�o. 
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Velaya_HELLO6 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 6;
   condition    = DIA_Velaya_HELLO6_Condition;
   information  = DIA_Velaya_HELLO6_Info;
   permanent	= FALSE;
   description	= "Zabi�em Gomeza. Teraz jeste�cie wolne!";
};

FUNC INT DIA_Velaya_HELLO6_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ebr_100_gomez);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO6_15_01"); //Zabi�em Gomeza. Teraz jeste�cie wolne!
    AI_Output (self, other ,"DIA_Velaya_HELLO6_03_02"); //Dzi�ki Innosowi! Widz�, �e �wietny z ciebie wojownik. Jeszcze nikomu nie uda�o si� obali� Magnat�w.
    AI_Output (self, other ,"DIA_Velaya_HELLO6_03_03"); //W ko�cu zako�cz� si� rz�dy terroru.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> VWN
//========================================

INSTANCE DIA_Velaya_VWN (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 1;
   condition    = DIA_Velaya_VWN_Condition;
   information  = DIA_Velaya_VWN_Info;
   permanent	= FALSE;
   description	= "Nie b�j si�. Najgorsze ju� za tob�.";
};

FUNC INT DIA_Velaya_VWN_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Balam_Velaya))
&& (Npc_IsDead (GRD_40155_Gardist))
&& (Npc_IsDead (GRD_40156_Gardist))
{
    return TRUE;
};
};
FUNC VOID DIA_Velaya_VWN_Info()
{
    AI_Output (other, self ,"DIA_Velaya_VWN_15_01"); //Nie b�j si�. Najgorsze ju� za tob�.
    AI_Output (self, other ,"DIA_Velaya_VWN_03_02"); //Dzi�kuje. Gdyby nie ty....
    AI_Output (other, self ,"DIA_Velaya_VWN_15_03"); //Nic ci nie zrobili?
    AI_Output (self, other ,"DIA_Velaya_VWN_03_04"); //Zanim zabrali si� do gwa�t�w i bicia chcieli jeszcze mocno si� upi�.
    AI_Output (self, other ,"DIA_Velaya_VWN_03_05"); //Zd��y�e� w ostatniej chwili. 
    AI_Output (other, self ,"DIA_Velaya_VWN_15_06"); //Nie mo�esz tu zosta�. Chod� ze mn�.
    AI_Output (self, other ,"DIA_Velaya_VWN_03_07"); //Mo�e znajdziemy bezpieczne miejsce.
    AI_Output (other, self ,"DIA_Velaya_VWN_15_08"); //Bezpieczniejsze. Tu nigdzie nie ma gwarancji bezpiecze�stwa.
	 Npc_ExchangeRoutine(EBR_108_Velaya,"Stone");
	B_LogEntry               (VelayaWNiebezbieczenstwie,"Uratowa�em Velaye przed pijanymi �o�dakami Gomeza. Teraz musimy poszuka� dla niej schronienia na te nieobliczalne czasy.");
};

//========================================
//-----------------> PZV
//========================================

INSTANCE DIA_Velaya_PZV (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 1;
   condition    = DIA_Velaya_PZV_Condition;
   information  = DIA_Velaya_PZV_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Velaya_PZV_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Stone_Velaya))
{
    return TRUE;
};
};
FUNC VOID DIA_Velaya_PZV_Info()
{
    AI_Output (self, other ,"DIA_Velaya_PZV_03_01"); //Jeszcze raz dzi�ki za pomoc.
    AI_Output (other, self ,"DIA_Velaya_PZV_15_02"); //Musia�em ci pom�c.
    AI_Output (self, other ,"DIA_Velaya_PZV_03_03"); //Nie musia�e� a mimo to zrobi�e�.
    AI_Output (other, self ,"DIA_Velaya_PZV_15_04"); //Szkoda, �e nie spotkali�my si� w bardziej spokojnych czasach.
    AI_Output (self, other ,"DIA_Velaya_PZV_03_05"); //Mo�e si� spotkamy. Nikt nie zna przysz�o�ci.
    AI_Output (other, self ,"DIA_Velaya_PZV_15_06"); //Wreszcie jaka� przyjemna perspektywa...
    AI_Output (self, other ,"DIA_Velaya_PZV_03_07"); //Wyruszasz gdzie� teraz?
    AI_Output (other, self ,"DIA_Velaya_PZV_15_08"); //Mam ,,co�" do zrobienia. 
    AI_Output (self, other ,"DIA_Velaya_PZV_03_09"); //�ycz� ci powodzenia cokolwiek znaczy to ,,co�".
    AI_Output (other, self ,"DIA_Velaya_PZV_15_10"); //Przyda si� z pewno�ci�. My�l�, �e nie b�d� narzeka� na brak emocji.
    AI_Output (other, self ,"DIA_Velaya_PZV_15_11"); //Ale pora ju� na mnie. Trzymaj si� Stone'a a gdy b�dzie tylko sposobno�� opu�� Stary Ob�z.
    AI_Output (self, other ,"DIA_Velaya_PZV_03_12"); //Postaram si�. Mam nadzieje, �e nic z�ego ci� nie spotka. Trzymaj si�. 
    AI_Output (other, self ,"DIA_Velaya_PZV_15_13"); //Do zobaczenia.
    AI_StopProcessInfos	(self);
};
