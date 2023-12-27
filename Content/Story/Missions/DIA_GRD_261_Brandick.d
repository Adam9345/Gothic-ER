//poprawione i sprawdzone - Reflide

// ************************ EXIT **************************

instance  GRD_261_Brandick_Exit (C_INFO)
{
	npc			=  GRD_261_Brandick;
	nr			= 999;
	condition	=  GRD_261_Brandick_Exit_Condition;
	information	=  GRD_261_Brandick_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos	( self );
};



//========================================
//-----------------> WALKING
//========================================

INSTANCE DIA_Brandick_WALKING (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_Brandick_WALKING_Condition;
   information  = DIA_Brandick_WALKING_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Brandick_WALKING_Condition()
{
if (Kapitel == 2)
{
    return TRUE;
};
};
FUNC VOID DIA_Brandick_WALKING_Info()
{
    AI_Output (self, other ,"DIA_Brandick_WALKING_03_01"); //Znowu tu �azisz?
    AI_Output (other, self ,"DIA_Brandick_WALKING_15_02"); //A co w tym z�ego?
    AI_Output (self, other ,"DIA_Brandick_WALKING_03_03"); //Pa��tasz si� po moim rewirze. A ja cenie spok�j, porz�dek i skrupulatno��. 
    AI_Output (other, self ,"DIA_Brandick_WALKING_15_04"); //Powia�o ch�odem.
    AI_Output (self, other ,"DIA_Brandick_WALKING_03_05"); //Jak chcesz si� rozgrza� to walnij mocn� gorza��. I nie wychylaj mi si� tu!
};


// ***************** Infos *****************************

instance  GRD_261_Brandick_ALEPH (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_ALEPH_Condition;
	information		= GRD_261_Brandick_ALEPH_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Wydaj Alepha)"; 
};

FUNC int  GRD_261_Brandick_ALEPH_Condition()
{	
	if ( Npc_KnowsInfo ( hero, VLK_585_Aleph_GUARDS) )
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_ALEPH_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_ALEPH_Info_15_01"); //S�uchaj, za ka�dym razem, kiedy si� odwracasz, Aleph siedzi bezczynnie i zbija b�ki.
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Czy�by?
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Wiesz jakich ludzi nienawidz� jeszcze bardziej od obibok�w? Donosicieli! Zejd� mi z oczu!
	
	AI_StopProcessInfos	(self);
};  

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_HELLO1 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_HELLO1_Condition;
   information  = DIA_brandick_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_brandick_HELLO1_Condition()
{

	if (kapitel < 4) 
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_02"); //Brandick. Pilnuj� porz�dku w Kopalni i dbam o to, �eby nasi ludzie si� nie obijali. Masz jaki� problem?
	AI_Output (other, self ,"DIA_brandick_HELLO1_15_03"); //Nie, a ty?
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_04"); //Ca�� mas� problem�w. W bocznych szybach roi si� od pe�zaczy i trolli ziemnych. Te skurwiele potrafi� napsu� nerw�w. 
    AI_Output (other, self ,"DIA_brandick_HELLO1_15_05"); //Trolle ziemne? My�la�em, �e trolle nie �yj� pod ziemi�, tylko w g�rach.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_06"); //Zwyk�e i czarne trolle jak najbardziej. Jednak ziemne trolle nieco si� r�ni� od swych pobratymc�w.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_07"); //S� mniejszej postury i lubi� ciemno�ci. Jak b�dziesz mia� pecha, to spotkasz jakiego� w jaskini na powierzchni. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_08"); //To, �e s� mniejsze, nie czyni ich jednak mniej niebezpiecznymi.
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_09"); //Jaki� czas temu grupa �wi�tynnych Stra�nik�w wybra�a si�, �eby troch� zredukowa� liczb� tego ta�atajstwa. 
    AI_Output (self, other ,"DIA_brandick_HELLO1_03_10"); //To, co z nich zosta�o nie nadawa�o si� nawet na naw�z, he he. Chyba przecenili swoje si�y.
	MIS_Brandick = TRUE;
};



//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_brandick_HELLO2 (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 2;
   condition    = DIA_brandick_HELLO2_Condition;
   information  = DIA_brandick_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_brandick_HELLO2_Condition()
{
if (kapitel < 4) 
{
    return TRUE; 
};
};

FUNC VOID DIA_brandick_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_brandick_HELLO2_15_01"); //Jak leci?
    if (!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH))
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_02"); //S�yszysz? Tam na dole, w dziurze czaj� si� pe�zacze. Mam nadziej�, �e nie towarzysz� im ziemne trolle...
		
		
    }
    else
    {
        AI_Output (self, other ,"DIA_brandick_HELLO2_03_03"); //G�wno ci� to obchodzi. Powiedzia�em, �e nie toleruj� donosicieli! Spadaj st�d darmozjadzie!
    
    AI_StopProcessInfos	(self);
};
};

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Brandick_DIE (C_INFO)
{
	npc			= GRD_261_Brandick;
	condition	= Info_Brandick_DIE_Condition;
	information	= Info_Brandick_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Brandick_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Brandick_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zdrajco! I pomy�le�, �e uwa�ali�my ci� za jednego z nas!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //To jeden z tych zdradzieckich Mag�w Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Witaj, ZDRAJCO! Teraz nie pomog� ci nawet znajomo�ci w�r�d Cieni!
		};			

		AI_Output		(hero,self,"Info_Brandick_DIE_15_04"); //O czym ty do diab�a m�wisz, Brandick?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Zadajesz si� z tymi bandziorami z Nowego Obozu! A mo�e nie?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zaczekaj...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //My�la�e�, �e si� nie domy�limy, co? CO?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Hej... Postrada�e� zmys�y?!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ja? Ale� sk�d. Za to TY za chwil� stracisz G�OW�, kolego.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //GI�, ZDRAJCO!!!

		if	Npc_KnowsInfo(hero, Info_aaron_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Aaron okopa� si� przy tylnej bramie. Na m�j widok zareagowa� podobnie jak Brandick. Mam wra�enie, �e ma to co� wsp�lnego z moimi poszukiwaniami kamienia ogniskuj�cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Brandick, kt�ry strze�e teraz g��wnej bramy Starego Obozu, nazwa� mnie zdrajc�. Nie chcia� mnie nawet wys�ucha� - od razu rzuci� si� do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl�da na to, �e zosta�em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //No prosz�. To go�� z Nowego Obozu!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Patrzcie no. To go�� z Sekty!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //I co z tego? Masz z tym jaki� problem?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Mie�, to ja b�d� wasz� ma�� kopalni�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Czy�by? Chyba �nisz!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Przykro mi, ale nie mo�emy pozwoli�, �eby� o tym komu� powiedzia�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zaczekaj, nie szukam k�opot�w.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Trzeba by�o o tym pomy�le� zanim tutaj przyszed�e�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co u...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Dalej ch�opcy! Na niego!
	};

	Npc_ExchangeRoutine	(self,	"FMTAKEN2");				// Verst�rkung vor das Haupttor (Anf�hrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor

	B_SetPermAttitude	(GRD_261_Brandick,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_aaron_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta�y zamkni�te i pozostaj� pilnie strze�one. Stra�nicy atakuj� ka�dego, kto podejdzie w pobli�e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};
//---------------------------------------------------------------------------------------1.6.1-----------------------------------------------------------------

// ***************** Sk�ry Trolli ziemnych *****************************

instance  GRD_261_Brandick_Skory (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Skory_Condition;
	information		= GRD_261_Brandick_Skory_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wspominaj�c o trollach ziemnych mia�e� dziwny wyraz twarzy."; 
};

FUNC int  GRD_261_Brandick_Skory_Condition()
{	
	if (MIS_Brandick == TRUE)
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Skory_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_Skory_Info_15_01"); //Wspominaj�c o trollach ziemnych mia�e� dziwny wyraz twarzy.
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_02"); //Gdyby� by� na tyle g�upi i szalony to...
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_03"); //M�g�by� mi przynie�� 3 sk�ry tych bestii. Wtedy m�g�bym je kapitalnie opchn�� Alberto lub Santino.
	AI_Output			(other, self,"GRD_261_Brandick_Skory_Info_15_04"); //Musz� si� zastanowi�.
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_05"); //Na twoim miejscu bym odm�wi�. Ale z drugiej strony zaoferuje ci za to naprawd� sporo rudy.
	AI_Output			(self, other,"GRD_261_Brandick_Skory_Info_06_06"); //Chocia� po co ruda trupowi...
	
	
};  

// ***************** Sk�ry Trolli ziemnych *****************************

instance  GRD_261_Brandick_Decyzja (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Decyzja_Condition;
	information		= GRD_261_Brandick_Decyzja_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zdecydowa�em si�."; 
};

FUNC int  GRD_261_Brandick_Decyzja_Condition()
{	
	if (MIS_Brandick == TRUE)
	&& (Npc_KnowsInfo (hero ,GRD_261_Brandick_Skory))
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Decyzja_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_Decyzja_Info_15_01"); //Zdecydowa�em si�.
	AI_Output			(self, other,"GRD_261_Brandick_Decyzja_Info_06_02"); //Albo jeste� cholernie odwa�ny albo twoje m�zgowie nie�le szwankuje.
	AI_Output			(self, other,"GRD_261_Brandick_Decyzja_Info_06_03"); //W ka�dym razie �ycz� powodzenia m�ody. W razie sukcesu czyli zdobycia sk�r, wiesz gdzie mnie szuka�.
	AI_Output			(other, self,"GRD_261_Brandick_Decyzja_Info_15_04"); //Jasne.
	Log_CreateTopic       (Skory, LOG_MISSION);
	Log_SetTopicStatus       (Skory, LOG_RUNNING);
	B_LogEntry                     (Skory,"Brandick wspomina� o �yj�cych w Starej Kopalni trollach ziemnych. M�wi�, �e ich sk�ry s� bardzo cenne. Gdybym by� na tyle odwa�ny lub g�upi m�g�bym je dla niego zdoby�. Oczywi�cie za stosown� nagrod�. ");
	
};  

// ***************** Sk�ry Trolli ziemnych *****************************

instance  GRD_261_Brandick_Mamskore (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Mamskore_Condition;
	information		= GRD_261_Brandick_Mamskore_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mam sk�ry trolli ziemnych."; 
};

FUNC int  GRD_261_Brandick_Mamskore_Condition()
{	
    if (Npc_HasItems(hero, ItAt_TrollFur)>=3)
	&& (Npc_KnowsInfo (hero ,GRD_261_Brandick_Decyzja))
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Mamskore_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_Mamskore_Info_15_01"); //Mam sk�ry trolli ziemnych.
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_02"); //�artujesz? Taki ��todzi�b zdo�a� pozyska� sk�ry trolli ziemnych?!
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_03"); //Jestem pod wielkim wra�eniem tego wyczynu. Niez�y z ciebie my�liwy, m�ody.
	AI_Output			(other, self,"GRD_261_Brandick_Mamskore_Info_15_04"); //Oto twoje sk�ry.
	B_GiveInvItems (other, self,ItAt_TrollFur, 3);
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_05"); //A to nagroda za nie. Zas�u�y�e� na ni� w pe�ni.
	B_GiveInvItems (self, other,ItMiNugget, 200);
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_06"); //W wolnej chwili dobije targu z handlarzami. Zacieram ju� r�ce na t� my�l.
	AI_Output			(self, other,"GRD_261_Brandick_Mamskore_Info_06_07"); //A p�ki co wracam do swoich obowi�zk�w.
	AI_Output			(other, self,"GRD_261_Brandick_Mamskore_Info_15_08"); //Dzi�ki za rud� i bywaj.
	AI_StopProcessInfos	(self);
    B_GiveXP (200);
	B_LogEntry                     (Skory,"Zdoby�em sk�ry trolli ziemnych i rozmawia�em z Brandickiem. By� zadowolony i wyp�aci� mi nale�n� rud�. Ryzyko jak wida� si� op�aci�o. Przynajmniej tym razem. ");
	Log_SetTopicStatus       (Skory, LOG_SUCCESS);
};  



// ***************** Ciekawe znalezisko *****************************

instance  GRD_261_Brandick_Amulet (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_Amulet_Condition;
	information		= GRD_261_Brandick_Amulet_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czy mog� co� dla ciebie zrobi�?"; 
};

FUNC int  GRD_261_Brandick_Amulet_Condition()
{	
     if  (Kapitel == 2)

	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_Amulet_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_Amulet_Info_15_01"); //Czy mog� co� dla ciebie zrobi�?
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_02"); //Tak, odej�� st�d....
	AI_Output			(other, self,"GRD_261_Brandick_Amulet_Info_15_03"); //Jak chcesz.
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_04"); //Czekaj... Jest co� do czego chyba m�g�by� mi si� przyda�, cho� troch� w�tpi� w to czy jeste� do tego odpowiedni� osob�.
	AI_Output			(other, self,"GRD_261_Brandick_Amulet_Info_15_05"); //O co chodzi?
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_06"); //Kilka tygodni temu w innym rewirze kopalni odkryto zw�oki �wi�tynnego wojownika z sekty. Wida� mia� mniej szcz�cia ni� jego towarzysze.
	AI_Output			(self, other,"GRD_261_Brandick_Amulet_Info_06_07"); //By�em jednym z pierwszych, kt�rzy go znale�li.


	 Info_ClearChoices (GRD_261_Brandick_Amulet);
	 Info_AddChoice    (GRD_261_Brandick_Amulet,"I co by�o dalej?",GRD_261_Brandick_Amulet_ADD);
};  
   // B_GiveXP (200);


FUNC VOID GRD_261_Brandick_Amulet_ADD()
  {
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_00");  //I co by�o dalej?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_01");  //Przeszuka�em zw�oki i znalaz�em przy nich pewien ciekawy medalion.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_02");  //Chwil� p�niej pojawili si� inni wojownicy �wi�tynni ale ja zapomnia�em o tej b�yskotce i zosta�a w mojej kieszeni.
    AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_03");  //Ale wiem co nale�y zrobi�.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_04");  //Po czasie, przyjrza�em si� medalionowi. Jest wykonany z �elaza, ponadto ma ciekawy zielony odcie� i mia� chyba jakie� w�a�ciwo�ci magiczne.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_05");  //Mia�?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_06");  //Niestety jest uszkodzony. A ja rzecz jasna nie wiem jak go naprawi�.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_07");  //Co to ma wsp�lnego ze mn�?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_08");  //B�yskotka pochodzi z sekty wi�c to tam szuka�bym pomocy w tej sprawie.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD_15_09");  //To czemu si� tam nie udasz?
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_10");  //Oszala�e�?! Mam tu wa�ny rewir do pilnowania a te nieroby kopacze tylko czekaj� �eby zacz�� si� obija� gdy nikt ich nie nadzoruje.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD_11_11");  //W zwi�zku z tym chc� �eby� wzi�� medalion i uda� si� do Bractwa. Tam dowiedz si� co to za b�yskotka i czy jej naprawa jest warta zachodu.
	
     Log_CreateTopic          (CiekaweZnalezisko, LOG_MISSION);
	 Log_SetTopicStatus       (CiekaweZnalezisko, LOG_RUNNING);
	 B_LogEntry               (CiekaweZnalezisko,"Brandick opowiedzia� mi ciekaw� histori�. W jednym z bocznych szyb�w odnaleziono zw�oki jednego ze �wi�tynnych wojownik�w z obozu Bractwa. Mia� on przy sobie pewien interesuj�cy medalion. Jest jednak uszkodzony. Brandick chcia�by si� dowiedzie� na ile jest on cenny. Musz� uda� si� do Sekty i pogada� z kim� zaufanym.");
	
};

//=======================================================


instance  GRD_261_Brandick_PSI_AMULET (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_PSI_AMULET_Condition;
	information		= GRD_261_Brandick_PSI_AMULET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dobrze, ale nie za nic!"; 
};

FUNC int  GRD_261_Brandick_PSI_AMULET_Condition()
{	
    if (Npc_KnowsInfo (hero ,GRD_261_Brandick_Amulet))
	
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_PSI_AMULET_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET_Info_15_01"); //Dobrze, ale nie za nic!
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET_Info_06_02"); //Dostaniesz 300 bry�ek rudy.
	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET_Info_15_03"); //To ju� brzmi lepiej.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET_Info_06_04"); //W takim razie masz go tutaj.
	B_GiveInvItems (self,other,Amulett_BrandickS, 1);
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET_Info_06_05"); //A ja wracam do swoich obowi�zk�w.
    AI_StopProcessInfos	(self);
    
};  
//===================================================================================================================

instance  GRD_261_Brandick_PSI_AMULET1 (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_PSI_AMULET1_Condition;
	information		= GRD_261_Brandick_PSI_AMULET1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mam tw�j medalion."; 
};

FUNC int  GRD_261_Brandick_PSI_AMULET1_Condition()
{	
    if (Npc_KnowsInfo (hero ,DIA_BaalOrun_Amulett_Ritual))
	&& (Brandick_Amulette == LOG_SUCCESS)
	&& (Npc_HasItems(hero, Amulett_Brandick_01)>=1)
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_PSI_AMULET1_Info()
{


	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET1_Info_15_01"); //Mam tw�j medalion.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET1_Info_06_02"); //Naprawi�e� go?
	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET1_Info_15_03"); //Tak, wymaga� zreperowania �elaznej obudowy i w�o�enia magicznego kamienia.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET1_Info_06_04"); //Jakie w�a�ciwo�ci ma to cacko?	
	AI_Output			(other, self,"GRD_261_Brandick_PSI_AMULET1_Info_15_05"); //Zwi�ksza �ywotno�� posiadacza.
	AI_Output			(self, other,"GRD_261_Brandick_PSI_AMULET1_Info_06_06"); //Znakomicie. Daj mi go.
	
	
	
	
	 Info_ClearChoices (GRD_261_Brandick_PSI_AMULET1);
	 Info_AddChoice    (GRD_261_Brandick_PSI_AMULET1,"Najpierw ruda.",GRD_261_Brandick_Amulet_ADD1);
	
};  

FUNC VOID GRD_261_Brandick_Amulet_ADD1()
  {
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_00");  //Najpierw ruda.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_01");  //No dobra. Tak jak si� umawiali�my 300 bry�ek.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_02");  //A ty trzymaj medalion.
    AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_03");  //Pi�kna rzecz. Licz�, �e mi si� przyda.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_04");  //Zapewne tak.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_05");  //No c�... Teraz pora powr�ci� do obowi�zk�w, czyli pilnowania ca�ego tego ba�aganu.
	AI_Output (self ,other,"GRD_261_Brandick_Amulet_ADD1_11_06");  //Na razie.
	AI_Output (other,self ,"GRD_261_Brandick_Amulet_ADD1_15_07");  //Do zobaczenia.
	B_GiveInvItems (other,self,Amulett_Brandick_01, 1);
	B_GiveInvItems (self,other,ItMiNugget,300);
	B_LogEntry               (CiekaweZnalezisko,"Wr�ci�em do Brandicka i odda�em magiczny medalion ponownie zdatny do u�ytku. Stra�nik by� ze mnie zadowolony i wyp�aci� mi um�wione 300 bry�ek rudy.");
	Log_SetTopicStatus       (CiekaweZnalezisko, LOG_SUCCESS);
	B_GiveXP (300);
};




//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Boba_Sword (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_Boba_Sword_Condition;
   information  = DIA_brandick_Boba_Sword_Info;
   permanent	= FALSE;
   description	= "Pono� zarekwirowa�e� Alephowi pewien cenny minera�.";
};

FUNC INT DIA_brandick_Boba_Sword_Condition()
{

	if (Npc_KnowsInfo(other, DIA_Aleph_Srebrny_Grom))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Boba_Sword_Info()
{
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_15_01"); //Pono� zarekwirowa�e� Alephowi pewien cenny minera�.
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_03_02"); //Ten obibok ci�gle si� leni, niech si� cieszy, �e nie dosta� po �bie.
	AI_Output (other, self ,"DIA_brandick_Boba_Sword_15_03"); //Chcia�bym kupi� ten surowiec od ciebie.
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_03_04"); //Nie jest na sprzeda�.
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_15_05"); //Jak to?
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_03_06"); //Nied�ugo wr�c� do Starego obozu. Tam spr�buje sprzeda� ten minera� Bartholo on b�dzie si� na tym lepiej zna�.
   
};

//========================================
//-----------------> Silver_Nugg_Robb
//========================================

INSTANCE DIA_Brandick_Silver_Nugg_Robb (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 99;
   condition    = DIA_Brandick_Silver_Nugg_Robb_Condition;
   information  = DIA_Brandick_Silver_Nugg_Robb_Info;
   permanent	= FALSE;
   description	= "Ukradnij srebrny grom. (Wymagana zr�czno�� - 50)";
};

FUNC INT DIA_Brandick_Silver_Nugg_Robb_Condition()
{
    if (Npc_KnowsInfo (other, DIA_brandick_Boba_Sword))
	&& !(Npc_KnowsInfo(hero,DIA_brandick_Boba_Sword_Nugget))
   // && (other.attribute[ATR_DEXTERITY] < 50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Brandick_Silver_Nugg_Robb_Info()
{

    
    AI_Output (other, self ,"DIA_Brandick_Silver_Nugg_Robb_15_01"); //Sk�d wiesz �e Bartholo b�dzie zainteresowany tym minera�em?
    AI_Output (self, other ,"DIA_Brandick_Silver_Nugg_Robb_03_02"); //Bo wiem.
	if (other.attribute[ATR_DEXTERITY] > 49)
 	{
 		 AI_Output (self, other ,"DIA_Brandick_Silver_Nugg_Robb_03_03"); //Zreszt� g�wno cie to obchodzi, Zje�d�aj!
	     B_GiveInvItems (self,hero, ItMi_SilverNugget, 10);
		 B_GiveXP(50);
		 AI_StopProcessInfos	(self);
		 
		 
	}
	else
	{
		 AI_Output (self, other ,"DIA_Brandick_Silver_Nugg_Robb_03_04"); //Ty parszywy z�odzieju! Czekaj no!
		 AI_StopProcessInfos	(self);
         Npc_SetTarget (self, other);
         AI_StartState (self, ZS_ATTACK, 1, "");

	};
   
	

};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Boba_Sword_Nugget (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 98;
   condition    = DIA_brandick_Boba_Sword_Nugget_Condition;
   information  = DIA_brandick_Boba_Sword_Nugget_Info;
   permanent	= FALSE;
   description	= "Hmm... Ode mnie dostaniesz wi�cej!";
};

FUNC INT DIA_brandick_Boba_Sword_Nugget_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_brandick_Boba_Sword))
	&& !(Npc_KnowsInfo(hero,DIA_Brandick_Silver_Nugg_Robb))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Boba_Sword_Nugget_Info()
{
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_Nugget_15_01"); //Hmm... Ode mnie dostaniesz wi�cej!
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_Nugget_03_02"); //Haha! Czy�by? W�tpie.
	AI_Output (other, self ,"DIA_brandick_Boba_Sword_Nugget_15_03"); //Na pewno jest jaki� spos�b �eby ci� przekona�.
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_Nugget_03_04"); //Gdyby� by� na tyle lekkomy�lny �eby p�j�� za pewn� star� map�...
    AI_Output (other, self ,"DIA_brandick_Boba_Sword_Nugget_15_05"); //Co? M�w dalej!
    AI_Output (self, other ,"DIA_brandick_Boba_Sword_Nugget_03_06"); //Mam star� map�, kt�ra pono� prowadzi do jakiego� skarbu. Ja mam robot� na g�owie poza tym miejsce jego po�o�enia nie jest zbyt przyjazne...

	
    
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Skarb (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_Skarb_Condition;
   information  = DIA_brandick_Skarb_Info;
   permanent	= FALSE;
   description	= "Mog� p�j�� po ten skarb.";
};

FUNC INT DIA_brandick_Skarb_Condition()
{

	if (Npc_KnowsInfo(hero,DIA_brandick_Boba_Sword_Nugget))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Skarb_Info()
{
    AI_Output (other, self ,"DIA_brandick_Skarb_15_01"); //Mog� p�j�� po ten skarb.
    AI_Output (self, other ,"DIA_brandick_Skarb_03_02"); //Odwa�ny jeste�. Widz�, �e bardzo ci zale�y na tym minerale.
	AI_Output (self, other ,"DIA_brandick_Skarb_03_03"); //Oto mapa.
	B_GiveInvItems (self,other, ItWr_BRANDICK_SKARB, 1);
    AI_Output (self, other ,"DIA_brandick_Skarb_03_04"); //To nie b�dzie �atwa wyprawa... Je�li mo�esz nie zgi�.
    AI_Output (other, self ,"DIA_brandick_Skarb_15_05"); //By�oby mi�o. Na razie.    
	AI_Output (self, other ,"DIA_brandick_Skarb_03_06"); //Cze��.
	
    B_LogEntry               (MieczGorBoby,"Brandick chc� bym uda� si� wiedziony jak�� star� map� po rzekomy skarb. Wtedy dostan� od niego ,,srebrny grom�, kt�ry zabra� Alephowi. Chyba b�d� musia� si� tego podj��.");
};






//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_brandick_Mapa (C_INFO)
{
   npc          = GRD_261_Brandick;
   nr           = 1;
   condition    = DIA_brandick_Mapa_Condition;
   information  = DIA_brandick_Mapa_Info;
   permanent	= FALSE;
   description	= "By�em na miejscu zaznaczonym na twojej mapie.";
};

FUNC INT DIA_brandick_Mapa_Condition()
{

	if (Npc_HasItems (other, ItRi_Brandick_S) >=1) && (Npc_KnowsInfo(hero,DIA_brandick_Skarb))
	{
    return TRUE; 
	};
};



FUNC VOID DIA_brandick_Mapa_Info()
{
    AI_Output (other, self ,"DIA_brandick_Mapa_15_01"); //By�em na miejscu zaznaczonym na twojej mapie.
    AI_Output (self, other ,"DIA_brandick_Mapa_03_02"); //O... Co to za skarb?
	AI_Output (other, self ,"DIA_brandick_Mapa_15_03"); //Pewien cenny pier�cie�.
    AI_Output (self, other ,"DIA_brandick_Mapa_03_04"); //Daj mi go.
    AI_Output (other, self ,"DIA_brandick_Mapa_15_05"); //Najpierw minera�.
    AI_Output (self, other ,"DIA_brandick_Mapa_03_06"); //Dobra. Trzymaj.
	CreateInvItem (self, ItMi_SilverNugget);
	B_GiveInvItems (self,hero, ItMi_SilverNugget, 10);
	AI_Output (other, self ,"DIA_brandick_Mapa_15_07"); //A to tw�j pier�cie�.
	B_GiveInvItems (other,self, ItRi_Brandick_S, 1);
	AI_Output (other, self ,"DIA_brandick_Mapa_15_08"); //No to dobili�my targu. 
	AI_Output (self, other ,"DIA_brandick_Mapa_03_09"); //Trzymaj si�. Odwa�ny z ciebie ch�opak.
  
   B_LogEntry               (MieczGorBoby,"Da�em Brandickowi zdobyty cenny pier�cie� a ten w zamian da� mi 10 bry�ek ,,srebrnego gromu�. Wygl�da na to, �e mam ju� komplet. Pora wraca� do Gor Boby.");
	B_GiveXP(150);

};

instance dia_brandick_pickpocket(c_info) {
    npc = grd_261_brandick;
    nr = 900;
    condition = dia_brandick_pickpocket_condition;
    information = dia_brandick_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brandick_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_brandick_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brandick_pickpocket);
	info_addchoice(dia_brandick_pickpocket, dialog_back, dia_brandick_pickpocket_back);
	info_addchoice(dia_brandick_pickpocket, dialog_pickpocket, dia_brandick_pickpocket_doit);
};

func void dia_brandick_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_brandick_pickpocket);
};

func void dia_brandick_pickpocket_back() {
    info_clearchoices(dia_brandick_pickpocket);
};






























