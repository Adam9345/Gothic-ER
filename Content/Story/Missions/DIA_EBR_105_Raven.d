//poprawione i sprawdzone - Reflide

// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE) && (Kapitel < 4)
	{ 
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Co mog� dla ciebie zrobi�?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Kim jeste�?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
if (Kapitel < 4)
{
	return 1;
	};
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Nazywam si� Kruk. Jestem praw� r�k� Gomeza. Ka�dy, kto chce si� spotka� z szefem, musi najpierw porozmawia� ze mn�.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "Mam troch� bagiennego ziela dla Gomeza od Cor Kaloma.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Mam troch� bagiennego ziela dla Gomeza od Cor Kaloma.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Gomez nie zajmuje si� takimi rzeczami osobi�cie. To dzia�ka Bartholo.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Znajdziesz go w komnacie na prawo od wej�cia, albo w kuchni w du�ej wie�y.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Oczywi�cie w nocy pewnie �pi. Na twoim miejscu nie przeszkadza�bym mu do rana.

	B_LogEntry			(CH1_KrautBote,	"Ziele dla Gomeza nale�y dostarczy� do Bartholo. Znajd� go w rezydencji Magnat�w.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Chc� si� zobaczy� z Gomezem.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez)) || (Npc_KnowsInfo(hero,DIA_THORUS_FlintFindPath)))
	&& 	((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_VLK) || (Npc_KnowsInfo(hero,DIA_THORUS_FlintFindPath))	) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Chc� si� zobaczy� z Gomezem. Thorus powiedzia�, �e mog� zosta� Cieniem.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Dobrych ludzi nigdy nie za wielu. Chyba masz wystarczaj�co r�wno pod sufitem. Mo�esz si� nam przyda�.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Zabior� ci� do Gomeza. Chod� za mn�, tylko niczego nie dotykaj!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if (( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme))) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT")  
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez jest tam. Je�li nie oka�esz mu nale�nego szacunku, osobi�cie naucz� ci� dobrych manier. Zrozumiano?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "Jak idzie handel rud�?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Jak idzie handel rud�?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //Stara Kopalnia jako� radzi sobie z wydobyciem. Ostatni transport do zewn�trznego �wiata by� bardzo du�y.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Gomez powiedzia�, �e si� nadaj�.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	if (hero_join_fn == false)
	{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	};
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez powiedzia�, �e si� nadaj�.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //�wietnie! Tak si� sk�ada, �e mo�esz od razu udowodni�, na co ci� sta�. Jest dla ciebie robota.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //To nie powinno by� zbyt trudne, je�li rzeczywi�cie masz kontakty, o jakich m�wi�e�.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "Co mam zrobi�?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Prowadzimy intensywn� wymian� handlow� z Bractwem, co nie znaczy, �e im do ko�ca ufamy.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Id� na bagna.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Kiedy dotrzesz do Obozu Bractwa, miej uszy i oczy szeroko otwarte. Ka�dy strz�pek informacji mo�e si� okaza� niezwykle cenny.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Im wi�cej wyw�szysz, tym lepiej. Ta misja wymaga odrobiny taktu, je�li wiesz, co mam na my�li.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Bez obaw. Postaram si� ich nie rozz�o�ci�.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Wiedzia�em, �e si� zrozumiemy.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Kruk wys�a� mnie do Obozu Bractwa. Mam si� tam troch� rozejrze� i donie�� mu o wszystkich podejrzanych wydarzeniach. Mo�e uda mi si� dowiedzie� czego� ciekawego.");
};

// *********************************************
// 				Ausr�stung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Gdzie mog� dosta� lepsze wyposa�enie?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Gdzie mog� dosta� lepsze wyposa�enie?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Porozmawiaj z Diego, on da ci jak�� zbroj�. Ten pancerz nie tylko uchroni ci� przed �mierci�, ale b�dzie r�wnie� s�u�y� jako znak rozpoznawczy.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Dzi�ki niemu zyskasz dost�p do wszystkich wa�niejszych miejsc.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Gdyby� potrzebowa� broni, porozmawiaj ze Skipem. Znajdziesz go w tej wielkiej szopie, w lewym tylnym rogu zamkowego dziedzi�ca.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,	"Diego ma lepsze wyposa�enie dla Cieni Gomeza. Znajd� go przy zamkowej bramie.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,	"Skip, Stra�nik z tylnego dziedzi�ca, sprzedaje or�, ale tylko ludziom Gomeza.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Pomy�la�em, �e zdam ci raport...";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Pomy�la�em, �e zdam ci raport...
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //To dobrze. Lubi� by� informowany na bie��co.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //Odby�o si� wielkie przywo�anie.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobrze si� spisa�e�.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Kruk sp�awi� mnie byle gadk�. Nie potrzeba mi takich przyjaci�. Od tej pory dzia�am na w�asny rachunek.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Teraz Bractwo potrzebuje jaj kr�lowej pe�zaczy. Przygotuj� z nich nap�j, kt�ry umo�liwi im nawi�zanie kontaktu ze �ni�cym. Mam te jaja przy sobie.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Hmm, interesuj�ce. Ciekawe czy to zadzia�a. Zanie� jaja do �wi�tyni.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobrze si� spisa�e�.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Kruk sp�awi� mnie byle gadk�. Nie potrzeba mi takich przyjaci�. Od tej pory dzia�am na w�asny rachunek.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Niestety, jeszcze nie wiem, co planuj� ludzie z Bractwa.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //To dlaczego zawracasz mi g�ow�?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//========================================
//-----------------> GUEST
//========================================

INSTANCE DIA_Raven_GUEST (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 1;
   condition    = DIA_Raven_GUEST_Condition;
   information  = DIA_Raven_GUEST_Info;
   permanent	= FALSE;
   important = 1;
};

FUNC INT DIA_Raven_GUEST_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_GUEST_Info()
{
    AI_Output (self, other ,"DIA_Raven_GUEST_03_01"); //A kt� to taki do nas zawita�?
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Raven_GUEST_15_02"); //Tak ci spieszno do grobu?!
    AI_Output (self, other ,"DIA_Raven_GUEST_03_03"); //Spokojnie. W walce ze mn� i tak nie mia�by� najmniejszych szans.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_04"); //Jeste�my nastawieni pokojowo.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_05"); //Uciekli�my ze Starego Obozu w poszukiwaniu stabilizacji. Przynajmniej tymczasowej.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_06"); //Postanowi�em zebra� najcenniejszych ludzi i uciec.
    AI_Output (self, other ,"DIA_Raven_GUEST_03_07"); //Gomez niech sobie rz�dzi sam.
    AI_RemoveWeapon (other);
};

//========================================
//-----------------> PLANY_RAVENA
//========================================

INSTANCE DIA_Raven_PLANY_RAVENA (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 2;
   condition    = DIA_Raven_PLANY_RAVENA_Condition;
   information  = DIA_Raven_PLANY_RAVENA_Info;
   permanent	= FALSE;
   description	= "Co planujecie dalej?";
};

FUNC INT DIA_Raven_PLANY_RAVENA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raven_GUEST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_PLANY_RAVENA_Info()
{
    AI_Output (other, self ,"DIA_Raven_PLANY_RAVENA_15_01"); //Co planujecie dalej?
    AI_Output (self, other ,"DIA_Raven_PLANY_RAVENA_03_02"); //Czekamy na rozw�j wydarze�.
    AI_Output (self, other ,"DIA_Raven_PLANY_RAVENA_03_03"); //Marzy mi si� wolno�� i jaki� spokojny k�t bez w�adzy kr�lewskiej.
    AI_Output (self, other ,"DIA_Raven_PLANY_RAVENA_03_04"); //Chcia�bym znale�� takie miejsce. 
};

//========================================
//-----------------> GOMEZ_BEZCZELNY
//========================================

INSTANCE DIA_Raven_GOMEZ_BEZCZELNY (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 1;
   condition    = DIA_Raven_GOMEZ_BEZCZELNY_Condition;
   information  = DIA_Raven_GOMEZ_BEZCZELNY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Raven_GOMEZ_BEZCZELNY_Condition()
{
    if (kapitel == 4)
    && (Npc_KnowsInfo (hero, DIA_Raeuber_Ready))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_GOMEZ_BEZCZELNY_Info()
{
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_01"); //Co za sukinsyny! Jak mogli nas zaatakowa�?! Swoich zwierzchnik�w.
    AI_Output (other, self ,"DIA_Raven_GOMEZ_BEZCZELNY_15_02"); //Ju� nie jeste�cie przyjaci�mi.
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_03"); //Co z tego! Tyle lat si� mnie s�uchali. Liczyli, �e dadz� rad� we dw�ch. Reszta przemkn�a si� obok.
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_04"); //Pewnie udali si� na plac wymian...
    AI_Output (other, self ,"DIA_Raven_GOMEZ_BEZCZELNY_15_05"); //Raczej do Opuszczonej Kopalni. Gomez ma na ni� ch��.
    AI_Output (self, other ,"DIA_Raven_GOMEZ_BEZCZELNY_03_06"); //Co za g�upiec. Przecie� tam nic nie ma!
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> ZniewolonyAlex
//========================================

INSTANCE DIA_Raven_ZniewolonyAlex (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 1;
   condition    = DIA_Raven_ZniewolonyAlex_Condition;
   information  = DIA_Raven_ZniewolonyAlex_Info;
   permanent	= FALSE;
   description	= "Pono� zniewoli�e� my�liwego.";
};

FUNC INT DIA_Raven_ZniewolonyAlex_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cutter_PorwanieMysliwego))
    && (MIS_Kidnapping == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_ZniewolonyAlex_Info()
{
    AI_Output (other, self ,"DIA_Raven_ZniewolonyAlex_15_01"); //Pono� zniewoli�e� my�liwego.
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_02"); //Ten g�upiec nie chce wsp�pracowa� ze Starym Obozem.

    AI_Output (other, self ,"DIA_Raven_ZniewolonyAlex_15_03"); //Czego od niego chcesz?
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_04"); //Chcieli�my nawi�za� korzystn� dla obu stron relacj� handlow�.
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_05"); //Jednak zostali�my potraktowani jak z�odzieje i oszu�ci!
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_06"); //Pewnie przybywasz, �eby go uwolni�.
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_07"); //B�dzie ci� to kosztowa� 1000 bry�ek rudy.
    AI_Output (other, self ,"DIA_Raven_ZniewolonyAlex_15_08"); //Ile?!
    AI_Output (self, other ,"DIA_Raven_ZniewolonyAlex_03_09"); //Nie pr�buj �adnych sztuczek.
    B_LogEntry                     (CH3_Kidnapping,"Kruk �yczy sobie 1000 bry�ek rudy za wypuszczenie Alexa.");
};

//========================================
//-----------------> ZaplataZaWolnosc
//========================================

INSTANCE DIA_Raven_ZaplataZaWolnosc (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 2;
   condition    = DIA_Raven_ZaplataZaWolnosc_Condition;
   information  = DIA_Raven_ZaplataZaWolnosc_Info;
   permanent	= FALSE;
   description	= "Chc�, �eby� go wypu�ci�. (Uwolnij Alexa - 1000 bry�ek rudy)";
};

FUNC INT DIA_Raven_ZaplataZaWolnosc_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raven_ZniewolonyAlex))
    && (MIS_Kidnapping == LOG_RUNNING)
    && (Npc_HasItems (hero, ItMiNugget)>=1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Raven_ZaplataZaWolnosc_Info()
{
    AI_Output (other, self ,"DIA_Raven_ZaplataZaWolnosc_15_01"); //Chc�, �eby� go wypu�ci�. 
    AI_Output (self, other ,"DIA_Raven_ZaplataZaWolnosc_03_02"); //Dobrze. Skoro tego sobie �yczysz.
    B_LogEntry                     (CH3_Kidnapping,"Zap�aci�em Krukowi rud� za wolno�� Alexa. Dosta�em klucz. Pora zejs� do celi.");
    B_GiveInvItems (other, self, ItMiNugget, 1000);
	CreateInvItems (self, DUNGEONKEY_ALEX, 1);
    B_GiveInvItems (self, other, DUNGEONKEY_ALEX, 1);
    B_GiveXP (200);
    AI_Output (self, other ,"DIA_Raven_ZaplataZaWolnosc_03_03"); //Masz tu klucz do celi. Lepiej si� pochwal Stra�nikowi, �e zap�aci�e� okup, bo inaczej mo�esz dosta� niespodziewanie w czaszk�.
    AI_StopProcessInfos	(self);
};

//----------------------------------------------------------1.6.1.-------------------------------------------------------------------------------------

//========================================
//-----------------> LSZ_Adolf
//========================================

INSTANCE DIA_Raven_LSZ_Adolf (C_INFO)
{
   npc          = Ebr_105_Raven;
   nr           = 1;
   condition    = DIA_Raven_LSZ_Adolf_Condition;
   information  = DIA_Raven_LSZ_Adolf_Info;
   permanent	= FALSE;
   description	= "Poszukuje niejakiego Adolfa.";
};

FUNC INT DIA_Raven_LSZ_Adolf_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Ziggy_KUFER))
{
    return TRUE;
};
};
FUNC VOID DIA_Raven_LSZ_Adolf_Info()
{
    AI_Output (other, self ,"DIA_Raven_LSZ_Adolf_15_01"); //Poszukuje niejakiego Adolfa.
    AI_Output (self, other ,"DIA_Raven_LSZ_Adolf_03_02"); //A kto to do cholery jest? I czemu akurat mi zawracasz tym g�ow�?!
    AI_Output (other, self ,"DIA_Raven_LSZ_Adolf_15_03"); //S�ysza�em, �e jeden z was?
    AI_Output (self, other ,"DIA_Raven_LSZ_Adolf_03_04"); //Masz na my�li jakiego� nowego kopacza? 
    AI_Output (other, self ,"DIA_Raven_LSZ_Adolf_15_05"); //Nie, chodzi o Magnata.
    AI_Output (self, other ,"DIA_Raven_LSZ_Adolf_03_06"); //Hahah... Ubawi�e� mnie. Jestem tu na tyle d�ugo, �eby kojarzy� pozosta�ych Magnat�w hehe...
    AI_Output (self, other ,"DIA_Raven_LSZ_Adolf_03_07"); //Nie BY�O i NIE MA w�r�d nas nikogo o tym imieniu.
    AI_Output (other, self ,"DIA_Raven_LSZ_Adolf_15_08"); //Wiedzia�em...
    AI_Output (self, other ,"DIA_Raven_LSZ_Adolf_03_09"); //Ale je�li naprawd� szukasz kogo� takiego w obozie to pom�w z Gravo. On zna WSZYSTKICH.
    AI_Output (other, self ,"DIA_Raven_LSZ_Adolf_15_10"); //Dzi�ki za rad�.
    AI_Output (self, other ,"DIA_Raven_LSZ_Adolf_03_11"); //Nast�pnym razem nie zawracaj mi g�owy takimi bzdurami, a teraz id� ju�.
	B_LogEntry               (LatwySzmal,"Kruk wy�mia� mnie m�wi�c, �e nie ma �adnego Magnata od imieniu Adolf. Poleci� mi pogada� z Gravo. O co w tym chodzi?");
    AI_StopProcessInfos	(self);
};

instance dia_raven_pickpocket(c_info) {
    npc = ebr_105_raven;
    nr = 900;
    condition = dia_raven_pickpocket_condition;
    information = dia_raven_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_raven_pickpocket_condition() {
	e_beklauen(baseThfChanceEBR, 45);
};

func void dia_raven_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_raven_pickpocket);
	info_addchoice(dia_raven_pickpocket, dialog_back, dia_raven_pickpocket_back);
	info_addchoice(dia_raven_pickpocket, dialog_pickpocket, dia_raven_pickpocket_doit);
};

func void dia_raven_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_raven_pickpocket);
};

func void dia_raven_pickpocket_back() {
    info_clearchoices(dia_raven_pickpocket);
};
