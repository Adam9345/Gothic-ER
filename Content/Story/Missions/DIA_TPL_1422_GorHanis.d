//poprawione i sprawdzone - Reflide

// **************************************************
//						 EXIT 
// **************************************************

instance Info_GorHanis_Exit (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 999;
	condition		= Info_GorHanis_Exit_Condition;
	information		= Info_GorHanis_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_GorHanis_Exit_Condition()
{
	return 1;
};

func VOID Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Co tu robisz?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
if (kapitel < 4) {
	return 1; };
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Co tu robisz?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Ja? Walcz� ku chwale wielkiego �ni�cego!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 1;
	description 	= "Walczysz na arenie?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena_15_00"); //Walczysz na arenie?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Zosta�em wybrany przez moich mistrz�w, by broni� na arenie honoru obozu na bagnie.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Przy�wieca mi wi�c wy�szy cel. Walcz�, by pokaza� niewiernym jak wielka jest pot�ga �ni�cego!
};

// **************************************************
//					Schl�fer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "Kim jest �ni�cy?";
};                       

FUNC INT Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Sleeper_Info()
{
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //W naszym Obozie znajdziesz �wi�tych m��w, kt�rzy odpowiedz� ci na to pytanie znacznie lepiej ni� ja.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Powiem ci tylko tyle: �ni�cy b�dzie naszym zbawicielem. Przyprowadzi� nas tutaj i z jego pomoc� uda si� nam st�d wydosta�.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //Chcesz przez to powiedzie�, �e czekacie a� wasz b�g zwr�ci wam wolno��?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //Tak! Nasze oczekiwanie wkr�tce dobiegnie ko�ca. W tej chwili przygotowujemy si� do rytua�u wielkiego przyzwania.
};

// **************************************************
//					Gro�e Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "Na czym polega rytua�, kt�ry planujecie?";
};                       

FUNC INT Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Summoning_Info()
{
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //Na czym polega rytua�, kt�ry planujecie?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //Nasi prorocy przewidzieli, �e wsp�lne przywo�anie �ni�cego jest jedyn� drog� do odzyskania wolno�ci!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Je�li chcesz si� jeszcze czego� dowiedzie�, powiniene� uda� si� do naszego obozu.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 0;
	condition		= Info_GorHanis_WayToST_Condition;
	information		= Info_GorHanis_WayToST_Info;
	permanent		= 1;
	description 	= "M�g�by� opisa� mi drog� do waszego Obozu?";
};                       

FUNC INT Info_GorHanis_WayToST_Condition()
{
	if (( Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning) )) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_WayToST_Info()
{
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //M�g�by� opisa� mi drog� do waszego Obozu?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, kt�rzy ch�tnie wska�� ci drog� do obozu na bagnie. Znajd� kt�rego� z nich i porozmawiaj z nim!
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_Charge_Condition;
	information		= Info_GorHanis_Charge_Info;
	permanent		= 0;
	description 	= "Wyzywam ci� na pojedynek na arenie!";
};                       

FUNC INT Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Arena)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_Charge_Info()
{
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //Wyzywam ci� na pojedynek na arenie!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //Zabicie kogo� takiego jak ty raczej nie przysporzy chwa�y �ni�cemu.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //Stan� z tob� w szranki dopiero w tedy, gdy oka�esz si� godnym rywalem.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Ale jestem pewien, �e wojownicy z Nowego Obozu nie b�d� mieli takich skrupu��w...
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_ChargeGood_Condition;
	information		= Info_GorHanis_ChargeGood_Info;
	permanent		= 1;
	description 	= "Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?";
};                       

FUNC INT Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Charge)) && (kapitel < 4)
	{
		return 1;
	};
};

func VOID Info_GorHanis_ChargeGood_Info()
{
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //Nie! Jeste� jeszcze zbyt s�aby. Nie sprostasz mi w walce!
};

//========================================
//-----------------> IFightWith
//========================================

INSTANCE DIA_GorHanis_IFightWith (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_IFightWith_Condition;
   information  = DIA_GorHanis_IFightWith_Info;
   permanent	= FALSE;
   description	= "Pokona�em wojownika.";
};

FUNC INT DIA_GorHanis_IFightWith_Condition()
{
    if ((Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	&& (MIS_HanisAsTeacher == LOG_RUNNING)
    && (Kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_IFightWith_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_IFightWith_15_01"); //Pokona�em wojownika.
    if (Grd_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_02"); //Masz racj�. Kirgo dosta� niez�y wycisk.
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_03"); //Dobra robota. Naucz� ci� tego co wiem.
		 B_LogEntry                     (CH1_HanisAsTeacher,"Uda�o mi si� pokona� Kirgo, wi�c Gor Hanis b�dzie mnie uczy�.");
        Log_SetTopicStatus       (CH1_HanisAsTeacher, LOG_SUCCESS);
        MIS_HanisAsTeacher = LOG_SUCCESS;

        B_GiveXP (50);
    }
    else if (Sld_729_Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
    {
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_04"); //Pokaza�e� Kharimowi, gdzie jego miejsce.
        AI_Output (other, self ,"DIA_GorHanis_IFightWith_15_05"); //Czy to znaczy, �e b�dziesz mnie uczy�?
        AI_Output (self, other ,"DIA_GorHanis_IFightWith_03_06"); //Tak.
        B_LogEntry                     (CH1_HanisAsTeacher,"Uda�o mi si� pokona� Kharima, wi�c Gor Hanis b�dzie mnie uczy�.");
        Log_SetTopicStatus       (CH1_HanisAsTeacher, LOG_SUCCESS);
        MIS_HanisAsTeacher = LOG_SUCCESS;

        B_GiveXP (75);
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Basdasdasd
//========================================

INSTANCE DIA_GorHanis_Basdasdasd (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 1;
   condition    = DIA_GorHanis_Basdasdasd_Condition;
   information  = DIA_GorHanis_Basdasdasd_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorHanis_Basdasdasd_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glest_First)) && (Kapitel == 10) //zastepuja ich najemnicy
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_Basdasdasd_Info()
{
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_01"); //Bracie, c� za rado�� wreszcie ci� ujrze�.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_02"); //O�ywie�cy nie daj� nam spokoju.
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_03"); //Co tutaj robicie?
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_04"); //Przys�a� nas Cor Angar.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_05"); //Dowiedzieli�my si�, �e poszed�e� sam do kopalni.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_06"); //Tak si� sk�ada, �e Cor Angar kaza� nam j� oczy�ci�.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_07"); //Co znajduje si� wewn�trz?
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_08"); //Kurz, troch� rudy i kilka pe�zaczy.
    AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_09"); //W kopalni znajdowa� si� artefakt, przez kt�ry pojawiali si� tu o�ywie�cy.
    AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_10"); //Masz przy sobie ten artefakt?
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_11"); //Oczywi�cie, �e go tu mam.
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_12"); //Jednak nie mog� ci go odda�.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_13"); //Ale� ja go nie potrzebuj�. Wykona�e� za nas ca�� prac�.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_14"); //We� t� rud� jako wynagrodzenie.
        CreateInvItems (self, ItMiNugget, 300);
        B_GiveInvItems (self, other, ItMiNugget, 300);
    B_LogEntry                     (CH4_PsiAbadonedMine,"Zdobywaj�c artefakt, oczy�ci�em kopalni� z o�ywie�c�w. Cor Angar b�dzie ze mnie bardzo zadowolony.");
    Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;

    B_GiveXP (500);
    }
    else
    {
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_15"); //Nie mam go tutaj.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_16"); //W takim razie p�jd� tam ponownie i przynie� go!
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_17"); //To polecenie samego Cor Angara.
        AI_Output (other, self ,"DIA_GorHanis_Basdasdasd_15_18"); //Z tego co mi wiadomo, to wy to mieli�cie zrobi�.
        AI_Output (self, other ,"DIA_GorHanis_Basdasdasd_03_19"); //Prosz�, bardzo mi na tym zale�y.
        MIS_PsiAbadonedMine = LOG_RUNNING;

        Log_CreateTopic            (CH4_PsiAbadonedMine, LOG_MISSION);
        Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_RUNNING);
        B_LogEntry                     (CH4_PsiAbadonedMine,"Gor Hanis w imieniu Cor Angara zleci� mi odnalezienie artefaktu z kopalni. W ten spos�b powstrzymam rozprzestrzenianie si� o�ywie�c�w.");
    };

    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> Guaz
//========================================

INSTANCE DIA_GorHanis_Guaz (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 1;
   condition    = DIA_GorHanis_Guaz_Condition;
   information  = DIA_GorHanis_Guaz_Info;
   permanent	= FALSE;
   description	= "Mam ten kamie�.";
};

FUNC INT DIA_GorHanis_Guaz_Condition()
{
    if (MIS_PsiAbadonedMine == LOG_RUNNING)
    && (Npc_HasItems (other, Focus_Corristo) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_Guaz_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_01"); //Mam ten kamie�.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_02"); //Czyli kopalnia jest ju� czysta?
    AI_Output (other, self ,"DIA_GorHanis_Guaz_15_03"); //Tak.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_04"); //We� go ze sob�. Nam si� nie przyda.
    AI_Output (self, other ,"DIA_GorHanis_Guaz_03_05"); //Zostaniemy tu na stra�y kopalni, a ty id� do Angara.
    B_LogEntry                     (CH4_PsiAbadonedMine,"Zdobywaj�c artefakt, oczy�ci�em kopalni� z o�ywie�c�w. Cor Angar b�dzie ze mnie bardzo zadowolony.");
    Log_SetTopicStatus       (CH4_PsiAbadonedMine, LOG_SUCCESS);
    MIS_PsiAbadonedMine = LOG_SUCCESS;
   B_GiveXP (500);  
  AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO2212e
//========================================

INSTANCE DIA_GorHanis_HELLO2212e (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLO2212e_Condition;
   information  = DIA_GorHanis_HELLO2212e_Info;
   permanent	= FALSE;
   description	= "Uciek�e� ze Starego Obozu?";
};

FUNC INT DIA_GorHanis_HELLO2212e_Condition()
{
    if (Kapitel == 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLO2212e_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_HELLO2212e_15_01"); //Uciek�e� ze Starego Obozu?
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_02"); //W ostatniej chwili! Co to by�a za ucieczka.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_03"); //W nocy us�ysza�em ha�asy. Pomy�la�em, �e �ni�cy chce mi si� objawi�!
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_04"); //Jednak okaza�o si�, �e to Stra�nicy podrzynali gard�o temu barbarzy�cy, Kharimowi.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_05"); //Czym pr�dzej zebra�em swoje rzeczy i uciek�em zanim weszli do mojej chaty.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_06"); //Stary Ob�z to bardzo niebezpieczne miejsce dla obcych.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212e_03_07"); //Lepiej tam nie id�.
   
};
//-------------------------------------------------------------------------1.6.1-------------------------------------------------------------------------------
//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_HELLO2212eS (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLO2212eS_Condition;
   information  = DIA_GorHanis_HELLO2212eS_Info;
   permanent	= FALSE;
   description	= "Masz ze mn� walczy� na arenie.";
};

FUNC INT DIA_GorHanis_HELLO2212eS_Condition()
{
    if Npc_KnowsInfo (hero,DIA_Scatty_Dlug2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLO2212eS_Info()
{
    AI_Output (other, self ,"DIA_GorHanis_HELLO2212eS_15_01"); //Masz ze mn� walczy� na arenie.
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212eS_03_02"); //S�ysza�em. Zatem czas skrzy�owa� miecze w imi� �ni�cego!
    AI_Output (self, other ,"DIA_GorHanis_HELLO2212eS_03_03"); //Chod�my.
   	AI_StopProcessInfos	( self );
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS] = 220;
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS_MAX] = 220;
	Hanis_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GuideS");
   
};

//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_HELLOBRON (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLOBRON_Condition;
   information  = DIA_GorHanis_HELLOBRON_Info;   
   important = TRUE;
};

FUNC INT DIA_GorHanis_HELLOBRON_Condition()
{
    if Npc_KnowsInfo (hero,DIA_GorHanis_HELLO2212eS)
	&&(Npc_GetDistToWP(TPL_1422_GorHanis,"OCR_ARENABATTLE_TRAIN")<300) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLOBRON_Info()
{
    AI_Output (self,other,"DIA_GorHanis_HELLOBRON_15_01"); //Wyci�gnij bro�!  
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	walczyl_HanisG = true;
};




//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_HELLODLUG (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_HELLODLUG_Condition;
   information  = DIA_GorHanis_HELLODLUG_Info;   
   important = TRUE;
};

FUNC INT DIA_GorHanis_HELLODLUG_Condition()
{
    if (TPL_1422_GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& (Npc_KnowsInfo(hero,DIA_GorHanis_HELLOBRON))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_HELLODLUG_Info()
{
    AI_Output (self,other,"DIA_GorHanis_HELLODLUG_15_01"); //A wi�c przegra�em ale to do�wiadczenie nie p�jdzie na marne!
    TPL_1422_GorHanis.attribute[ATR_HITPOINTS] = 220;
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS_MAX] = 220;
	HanisPokonany = TRUE;
	Npc_ExchangeRoutine( self,"start");
};

//========================================
//-----------------> Dlug Fletchera
//========================================

INSTANCE DIA_GorHanis_PRZEGRANA (C_INFO)
{
   npc          = TPL_1422_GorHanis;
   nr           = 2;
   condition    = DIA_GorHanis_PRZEGRANADLUG_Condition;
   information  = DIA_GorHanis_PRZEGRANADLUG_Info;   
   important = TRUE;
};

FUNC INT DIA_GorHanis_PRZEGRANADLUG_Condition()
{
    if (TPL_1422_GorHanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	&& (Npc_KnowsInfo(hero,DIA_GorHanis_HELLOBRON))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorHanis_PRZEGRANADLUG_Info()
{
    AI_Output (self,other,"DIA_GorHanis_PRZEGRANADLUG_15_01"); //To by�a dobra walka, ale musisz jeszcze troch� nad sob� popracowa�.
	Npc_ExchangeRoutine( self,"start");
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS] = 220;
	TPL_1422_GorHanis.attribute[ATR_HITPOINTS_MAX] = 220;
};

instance dia_hanis_pickpocket(c_info) {
    npc = tpl_1422_gorhanis;
    nr = 900;
    condition = dia_hanis_pickpocket_condition;
    information = dia_hanis_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_hanis_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_hanis_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_hanis_pickpocket);
	info_addchoice(dia_hanis_pickpocket, dialog_back, dia_hanis_pickpocket_back);
	info_addchoice(dia_hanis_pickpocket, dialog_pickpocket, dia_hanis_pickpocket_doit);
};

func void dia_hanis_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_hanis_pickpocket);
};

func void dia_hanis_pickpocket_back() {
    info_clearchoices(dia_hanis_pickpocket);
};
