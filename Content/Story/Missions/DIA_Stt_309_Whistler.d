// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "Cze��! Jestem tu nowy!";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE || Npc_GetTrueGuild(hero) == GIL_VLK) && (!Npc_KnowsInfo (hero,DIA_Whistler_WYNOCHA)) 
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Cze��! Jestem tu nowy!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Czego chcesz?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Chcia�bym zosta� jednym z was - chc� zosta� cz�onkiem Obozu.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Szukasz ludzi, kt�rzy ci� popr�, co?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Je�li chcesz, �ebym zarekomendowa� ci� u Diego, musisz co� dla mnie zrobi�.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "Co mam dla ciebie zrobi�?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Co mam dla ciebie zrobi�?
	if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Whistler_FavourRefuse_11_01"); //Najlepiej by by�o jakby� sobie st�d poszed�! Nie chc� mie� nic wsp�lnego z lud�mi Quentina.
	}
	else if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self,other,"DIA_Whistler_FavourRefuse_11_02"); //S�ysza�em, �e masz wykonywa� polecenia Gamala. Nie zawracaj mi wiec g�owy...
	}
	else
	{
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Chc� jedn� z broni, kt�r� ma na sk�adzie Fisk. To jeden z handlarzy na targowisku.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Ale on nie chce mi jej sprzeda�. To pewien szczeg�lnie pi�knie zdobiony miecz.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Dam ci 100 bry�ek rudy, za kt�re kupisz dla mnie ten miecz. Tylko nie m�w mu, �e ja ci� przys�a�em.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour, "Dobrze. Daj mi 100 bry�ek, a ja si� wszystkim zajm�."								,DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour, "Przysz�o ci do g�owy, �e m�g�bym po prostu uciec z twoj� rud�?"	,DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour, "Dlaczego Fisk nie chce ci sprzeda� tej broni?"									,DIA_Whistler_Favour_WhyNotSell);
	};
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dobrze. Daj mi 100 bry�ek, a ja si� wszystkim zajm�.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Masz. Tylko nie marud� za d�ugo!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"�wistak pomo�e mi, je�li porozmawiam z Fiskiem i kupi� od niego miecz dla �wistaka. Da� mi nawet 100 bry�ek rudy.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Przysz�o ci do g�owy, �e m�g�bym po prostu uciec z twoj� rud�?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Nie zapominaj, �e to jest niewielka Kolonia. Pr�dzej czy p�niej bym ci� znalaz�!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Dlaczego Fisk nie chce ci sprzeda� tej broni?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Troch� si� posprzeczali�my.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //I?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //I to wszystko, co powiniene� wiedzie�!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Fisk ��da teraz 110 bry�ek rudy za ten miecz.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk ��da teraz 110 bry�ek rudy za ten miecz.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //I pewnie mam ci teraz da� dodatkowe 10 bry�ek...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //My�la�em, �e zale�y ci na tym mieczu.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Masz. Tylko si� pospiesz!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "Nie mog� zdoby� tego miecza. Zwracam ci twoj� rud�.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nie mog� zdoby� tego miecza. Zwracam ci twoj� rud�.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idioto! Nie potrzebujemy tu takich jak ty! Zejd� mi z oczu!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Zawali�em spraw�. �wistak nigdy ju� nie dostanie tego miecza.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Ale ja tu nie widz� �adnych 100 bry�ek. Radz� ci, �eby szybko si� znalaz�y, bo inaczej...
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tu jeste�! Pr�bowa�e� zwia� z moj� rud�, co? Chod� no tu, ch�opcze!
	
	Whistler_BuyMySword = LOG_FAILED;
	B_LogEntry (CH1_JoinOC,"Zawali�em spraw�. �wistak nie chce mnie widzie� na oczy.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "Mam dla ciebie miecz...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Mam dla ciebie miecz...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //To nie by�o zbyt trudne. Tak, czy inaczej - wy�wiadczy�e� mi przys�ug�, teraz ja wy�wiadcz� przys�ug� tobie.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Je�li Diego zapyta mnie o ciebie, opowiem si� za tob�. P�ki co - trzymaj si�!
	
	B_LogEntry (CH1_JoinOC,"�wistak ucieszy� si�, gdy wr�czy�em mu jego miecz. Mog� liczy� na jego wsparcie u Diego.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"�wistak ucieszy� si�, gdy wr�czy�em mu jego miecz. Szkoda tylko, �e nie mog� ju� zosta� Cieniem.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "Jak leci...";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS ) && (!Npc_KnowsInfo (hero,DIA_Whistler_WYNOCHA))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Jak leci...
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //�wietnie! Wy�wiadczy�e� mi przys�ug�, teraz ja wy�wiadcz� przys�ug� tobie. Powiem Diego, �e mo�na na tobie polega�.
};

//========================================
//-----------------> WYPAD
//========================================

INSTANCE DIA_Whistler_WYPAD (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 5;
   condition    = DIA_Whistler_WYPAD_Condition;
   information  = DIA_Whistler_WYPAD_Info;
   permanent	= FALSE;
   description	= "Diego co� od ciebie chcia�...";
};

FUNC INT DIA_Whistler_WYPAD_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_WYPAD_Info()
{
    AI_Output (other, self ,"DIA_Whistler_WYPAD_15_01"); //Diego co� od ciebie chcia�...
    AI_Output (self, other ,"DIA_Whistler_WYPAD_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Whistler_WYPAD_15_03"); //Nie wiem. Id�, szybko.
	Npc_ExchangeRoutine (self,"diegos");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KURFA
//========================================

INSTANCE DIA_Whistler_KURFA (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 6;
   condition    = DIA_Whistler_KURFA_Condition;
   information  = DIA_Whistler_KURFA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Whistler_KURFA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_WYPAD)) && (Npc_GetDistToWP (hero, "BARTH") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_KURFA_Info()
{
    AI_Output (self, other ,"DIA_Whistler_KURFA_03_01"); //Ej, Diego nic ode mnie nie chcia�!
    AI_Output (self, other ,"DIA_Whistler_KURFA_03_02"); //Czemu to mia�o s�u�y�?!
    AI_Output (other, self ,"DIA_Whistler_KURFA_15_03"); //Przepraszam. Nie znam jeszcze wszystkich w Obozie. Pewnie pomyli�em ci� z kim� innym.
	Npc_ExchangeRoutine (self,"start");
	AI_StopProcessInfos	(self);
};
	
	// **************************************************
// 					 Ich bin neu hier 2
// **************************************************

INSTANCE DIA_Whistler_Zdrada2 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Zdrada2_Condition;
	information	= DIA_Whistler_Zdrada2_Info;
	permanent	= 0;
	description = "Pozbyli�my si� Mordraga!";
};                       

FUNC INT DIA_Whistler_Zdrada2_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE) && (Npc_KnowsInfo (hero, DIA_STT_315_Sly_Sukces))
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_Zdrada2_Info()
{
	AI_Output (other,self,"DIA_Whistler_Zdrada2_15_00"); //Pozbyli�my si� Mordraga!
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_01"); //Dobra robota. Zaj��em si� twoj� opini� w Obozie. 
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_03"); //R�wnie� Thorus z pewno�ci� ci� poprze. 
	AI_Output (other,self,"DIA_Whistler_Zdrada2_11_04"); //Wielkie dzi�ki.
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_05"); //Nie ma sprawy, ch�opcze. Potrzebujemy takich ludzi. 
	AI_Output (self,other,"DIA_Whistler_Zdrada2_11_07"); //Id� ju�. Powodzenia.
	talk_aboutOpinion_OC = true;
    B_LogEntry                     (CH1_KosztemQuentina,"�wistak za�atwi� mi dobr� opini� w Obozie. Pora i�� do Diego i Thorusa.");
    B_GiveXP (150);
	};
	
//========================================
//-----------------> WYNOCHA
//========================================

INSTANCE DIA_Whistler_WYNOCHA (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_WYNOCHA_Condition;
   information  = DIA_Whistler_WYNOCHA_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Whistler_WYNOCHA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_ZDRADA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_WYNOCHA_Info()
{
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_01"); //Ty pod�y sukinsynu!
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_02"); //Przez ciebie ca�y Ob�z ju� mnie zwietrzy�.
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_03"); //Ca�e szcz�cie, �e moje wp�ywy mnie ocali�y.
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_04"); //Mo�esz zapomnie� o jakimkolwiek handlowaniu ze mn�! Jeszcze ci� urz�dz�! 
    AI_Output (self, other ,"DIA_Whistler_WYNOCHA_03_05"); //A teraz zejd� mi z oczu.
};
	//========================================
//-----------------> FrinSprawa
//========================================

INSTANCE DIA_Whistler_FrinSprawa (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_FrinSprawa_Condition;
   information  = DIA_Whistler_FrinSprawa_Info;
   permanent	= FALSE;
   description	= "Firn pyta co u ciebie.";
};

FUNC INT DIA_Whistler_FrinSprawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_HELLO6))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_FrinSprawa_Info()
{
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_01"); //Firn pyta co u ciebie.
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_02"); //Co? Kto? Ehh... To niedobrze.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_03"); //Co si� dzieje?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_04"); //Od dw�ch tygodni nie mia�em wie�ci od moich szwaczy.
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_05"); //Nie wiem czy potrzebuj� nowych futer.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_06"); //Masz nielegaln� szwalnie?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_07"); //Sk�d wiesz, �e nielegaln�?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_08"); //A zreszt� niewa�ne. 
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_09"); //Id� do nich i sprawd� jak robota.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_10"); //No dobra, a gdzie jest ta ca�a szwalnia?
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_11"); //W jaskini w �rodku lasu. Co kilka dni przechodz� obok niej konwoje z rud� z kopalni. Nazywaj� to miejsce Wilczym Do�em.
    AI_Output (other, self ,"DIA_Whistler_FrinSprawa_15_12"); //Sprawdz� co si� tam dzieje.
    AI_Output (self, other ,"DIA_Whistler_FrinSprawa_03_13"); //Powodzenia.
    B_LogEntry                     (CH1_SprawaFirna,"Rozmawia�em ze �wistakiem na temat Firna. Okaza�o si�, �e Cie� od jakiego� czasu nie ma kontaktu ze swoimi pracownikami. Czeka mnie wi�c wizyta w prowizorycznej szwalni i sprawdzenie co u nich. Mam odszuka� jaskini� w lesie pomi�dzy Starym Obozem, a Star� Kopalni�.");
	Wld_InsertNpc				(VLK_5607_Szwacz,"OC1");	
	B_killnpc (VLK_5607_Szwacz);
	Wld_InsertNpc				(VLK_5604_Szwacz,"OC1");	
	B_killnpc (VLK_5604_Szwacz); //1.25
};
//========================================
//-----------------> GoToSzwalnia
//========================================

INSTANCE DIA_Whistler_GoToSzwalnia (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_GoToSzwalnia_Condition;
   information  = DIA_Whistler_GoToSzwalnia_Info;
   permanent	= FALSE;
   description	= "By�em w szwalni.";
};

FUNC INT DIA_Whistler_GoToSzwalnia_Condition()
{
    if (Npc_HasItems (other, ItMi_SzwaczNote) >=1)
    && (MIS_SprawaFirna == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_GoToSzwalnia_Info()
{
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_01"); //By�em w szwalni.
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_02"); //Twoi robotnicy zostali zabici przez wilki. 
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_03"); //Raczej nici z pancerzy i ubra�.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_04"); //Cholera. Zawsze musi si� co� spieprzy�.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_05"); //No dobra. Potrzebuj� dw�ch nowych robotnik�w.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_06"); //Postaraj si� co� skombinowa�.
    AI_Output (other, self ,"DIA_Whistler_GoToSzwalnia_15_07"); //A niby dlaczego ja?
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_08"); //Dobra. We� te kilka bry�ek za fatyg�.
    AI_Output (self, other ,"DIA_Whistler_GoToSzwalnia_03_09"); //Reszta jak b�d� mia� ludzi.
    B_LogEntry                     (CH1_SprawaFirna,"Ludzie �wistaka nie �yj�. Gdy mu o tym powiedzia�em, poprosi� mnie o znalezienie dw�ch nowych szwaczy. Pami�tam �e w obozie my�liwych by�o dw�ch w��cz�g�w, mo�e oni b�d� ch�tni.");

    B_GiveXP (100);
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RobotnicyNowi
//========================================

INSTANCE DIA_Whistler_RobotnicyNowi (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_RobotnicyNowi_Condition;
   information  = DIA_Whistler_RobotnicyNowi_Info;
   permanent	= FALSE;
   description	= "Mam dw�ch nowych pracownik�w!";
};

FUNC INT DIA_Whistler_RobotnicyNowi_Condition()
{
    if (RobotnicyWhistlera >= 2)
    && (Npc_KnowsInfo (hero, DIA_Whistler_GoToSzwalnia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_RobotnicyNowi_Info()
{
    AI_Output (other, self ,"DIA_Whistler_RobotnicyNowi_15_01"); //Mam dw�ch nowych pracownik�w!
    AI_Output (self, other ,"DIA_Whistler_RobotnicyNowi_03_02"); //�wietnie. Id� do tego swojego my�liwego i powiedz, �e spotykamy si� w um�wionym miejscu.
    AI_Output (other, self ,"DIA_Whistler_RobotnicyNowi_15_03"); //Dobra. Zrobi� to, ale obieca�e� mi jak�� rud�.
    AI_Output (self, other ,"DIA_Whistler_RobotnicyNowi_03_04"); //Ach tak. Trzymaj.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry                     (CH1_SprawaFirna,"�wistak dowiedzia� si� ode mnie o swoich nowych robotnikach. Najwy�szy czas wr�ci� do Firna i powiedzie� mu o spotkaniu z Cieniem.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> SELL
//========================================

INSTANCE DIA_Whistler_SELL (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 1;
   condition    = DIA_Whistler_SELL_Condition;
   information  = DIA_Whistler_SELL_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz co�?";
};

FUNC INT DIA_Whistler_SELL_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Whistler_SELL_Info()
{
    AI_Output (other, self ,"DIA_Whistler_SELL_15_01"); //Sprzedajesz co�?
    AI_Output (self, other ,"DIA_Whistler_SELL_03_02"); //Tak. Mo�esz u mnie kupi� solidne spodnie. Moje spodnie s� lepsze ni� u Fiska. Mam wi�kszy wyb�r.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"�wistak handluje spodniami. Jego chata jest przy drodze na plac targowy."); 
	
};

//========================================
//-----------------> GACIE
//========================================

instance  Stt_309_Whistler_ARMOR (C_INFO)
{
	npc				= Stt_309_Whistler;
	nr         		= 2;
	condition		= Stt_309_Whistler_ARMOR_Condition;
	information		= Stt_309_Whistler_ARMOR_Info;
	permanent		= true;
	description		= "Chc� kupi� spodnie."; 
};

FUNC int  Stt_309_Whistler_ARMOR_Condition()
{	
    if (Npc_KnowsInfo (hero, DIA_Whistler_SELL))
    
	{
		return TRUE;
	};

};
FUNC void  Stt_309_Whistler_ARMOR_Info()
{
	AI_Output (other, self,"Stt_309_Whistler_ARMOR_Info_15_01"); //Chc� kupi� spodnie.
	if  (!Npc_KnowsInfo (hero, DIA_Whistler_WYNOCHA))
    && (!Npc_KnowsInfo (hero, DIA_Whistler_MySword_TooLate))
	{
	AI_Output (self, other,"Stt_309_Whistler_ARMOR_Info_12_02"); //Jasne.
	Info_ClearChoices (Stt_309_Whistler_ARMOR);
	Info_Addchoice (Stt_309_Whistler_ARMOR,DIALOG_BACK,Stt_309_Whistler_ARMOR_BACK);
	Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Spodnie robotnika",500),Stt_309_Whistler_SFB_ARMOR_M);
	AFIP_SetChoiceItem(Stt_309_Whistler_SFB_ARMOR_M, SFB_ARMOR_M);
	//Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Zielone spodnie",VALUE_SFB_ARMOR_L + 120),Stt_309_Whistler_HEREK_ARMOR);
	//Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Niebieskie spodnie",VALUE_SFB_ARMOR_L + 150),Stt_309_Whistler_GRAVO_ARMOR);
	Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Ciemne spodnie",650),Stt_309_Whistler_SFB_ARMOR_DARK);
	AFIP_SetChoiceItem(Stt_309_Whistler_SFB_ARMOR_DARK, SFB_ARMOR_DARK);
	Info_Addchoice (Stt_309_Whistler_ARMOR,B_BuildBuyArmorString("Spodnie Cienia",1000),Stt_309_Whistler_VLK_ARMOR_H);
	AFIP_SetChoiceItem(Stt_309_Whistler_VLK_ARMOR_H, VLK_ARMOR_H);
	} 
	else
	{
    AI_Output (self, other ,"Stt_309_Whistler_ARMOR_Info_15_03"); //Chyba sobie kpisz. Po tym wszystkim masz czelno�� tu przychodzi�?!
    AI_Output (self, other ,"Stt_309_Whistler_ARMOR_Info_15_04"); //WYNO� SI�!
	Stt_309_Whistler_ARMOR.permanent = false;
	AI_StopProcessInfos	(self);
	B_LogEntry		(GE_TraderOC,"�wistak najwyra�niej si� na mnie obrazi�. Nie mog� u niego ju� nic kupi�."); 
	};
};  

func void Stt_309_Whistler_ARMOR_BACK()
{
	Info_ClearChoices (Stt_309_Whistler_ARMOR);
};

func void Stt_309_Whistler_SFB_ARMOR_M()
{
	var int AFIP_ShowItem;
	AI_Output (other, self,"Stt_309_Whistler_SFB_ARMOR_M_Info_15_01"); //Wezm� spodnie robotnika.
	
	if (Npc_HasItems (hero, ItMinugget) >= 500)
	{
		AI_Output		(self,	other,	"Stt_309_Whistler_SFB_ARMOR_M_Info_12_03"); //S� twoje!
		B_GiveInvItems	(hero,	self,	ItMinugget, 500);
		CreateInvItem	(self,			SFB_ARMOR_M);
		B_GiveInvItems	(self,	hero,	SFB_ARMOR_M, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,500);
	}
	else
	{
		AI_Output (self, other,"Stt_309_Whistler_SFB_ARMOR_M_Info_12_02"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	};
};

func void Stt_309_Whistler_HEREK_ARMOR()
{
	AI_Output (other, self,"Stt_309_Whistler_HEREK_ARMOR_Info_15_04"); //Wezm� zielone spodnie.
	if (Npc_HasItems (hero, ItMiNugget)>= VALUE_SFB_ARMOR_L + 120)
	{
	AI_Output		(self, other,"Stt_309_Whistler_HEREK_ARMOR_Info_12_06"); //S� twoje!
	B_GiveInvItems	(hero, self, ItMinugget, VALUE_SFB_ARMOR_L+120);
	CreateInvItem	(self, HEREK_ARMOR);
	B_GiveInvItems	(self,hero, HEREK_ARMOR, 1);
	
	Npc_RemoveInvItems (self,ItMinugget,VALUE_SFB_ARMOR_L+120);
	}
	else
	{
	AI_Output (self, other,"Stt_309_Whistler_HEREK_ARMOR_Info_12_05"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.		
	};
};

func void Stt_309_Whistler_GRAVO_ARMOR()
{
	AI_Output (other, self,"Stt_309_Whistler_GRAVO_ARMOR_Info_15_07"); //Wezm� niebieskie spodnie.
	if (Npc_HasItems (hero, ItMinugget) >= VALUE_SFB_ARMOR_L + 150)
	{
	AI_Output		(self, other,"Stt_309_Whistler_GRAVO_ARMOR_Info_12_09"); //S� twoje!
		B_GiveInvItems	(hero, self, ItMinugget, VALUE_SFB_ARMOR_L+150);
		CreateInvItem	(self, GRAVO_ARMOR);
		B_GiveInvItems	(self,hero, GRAVO_ARMOR, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,VALUE_SFB_ARMOR_L+150);
			}
	else
	{
	AI_Output (self, other,"Stt_309_Whistler_GRAVO_ARMOR_Info_12_08"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.	
	};
};

func void Stt_309_Whistler_SFB_ARMOR_DARK()
{
	var int AFIP_ShowItem;
	AI_Output (other, self,"Stt_309_Whistler_SFB_ARMOR_DARK_Info_15_10"); //Wezm� ciemne spodnie.
	if (Npc_HasItems (hero, ItMiNugget)>= 650)
	{
	AI_Output		(self, other,"Stt_309_Whistler_SFB_ARMOR_DARK_Info_12_12"); //S� twoje!
		B_GiveInvItems	(hero, self, ItMinugget, 650);
		CreateInvItem	(self, SFB_ARMOR_DARK);
		B_GiveInvItems	(self,hero, SFB_ARMOR_DARK, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,650);
	}
	else
	{
			AI_Output (self, other,"Stt_309_Whistler_SFB_ARMOR_DARK_Info_12_11"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.		
	};
};

func void Stt_309_Whistler_VLK_ARMOR_H()
{
	var int AFIP_ShowItem;
	AI_Output (other, self,"Stt_309_Whistler_VLK_ARMOR_H_Info_15_13"); //Wezm� spodnie Cienia.
	if (Npc_HasItems (hero, ItMiNugget)>= 1000)
	{
		AI_Output		(self, other,"Stt_309_Whistler_VLK_ARMOR_H_Info_12_15"); //S� twoje!
		B_GiveInvItems	(hero, self, ItMinugget, 1000);
		CreateInvItem	(self, VLK_ARMOR_H);
		B_GiveInvItems	(self,hero, VLK_ARMOR_H, 1);
		
		Npc_RemoveInvItems (self,ItMinugget,1000);
	}
	else
	{
			AI_Output (self, other,"Stt_309_Whistler_VLK_ARMOR_H_Info_12_14"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	};
};
/*
//========================================
//-----------------> GACIE_FAIL
//========================================

INSTANCE DIA_Whistler_GACIE_FAIL (C_INFO)
{
   npc          = STT_309_Whistler;
   nr           = 3;
   condition    = DIA_Whistler_GACIE_FAIL_Condition;
   information  = DIA_Whistler_GACIE_FAIL_Info;
   permanent	= FALSE;
   description	= "Chc� kupi� spodnie.";
};

FUNC INT DIA_Whistler_GACIE_FAIL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Whistler_SELL))
    && ((Npc_KnowsInfo (hero,DIA_Whistler_WYNOCHA ))
    || (Npc_KnowsInfo (hero, DIA_Whistler_MySword_TooLate)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Whistler_GACIE_FAIL_Info()
{
    AI_Output (other, self ,"DIA_Whistler_GACIE_FAIL_15_01"); //Chc� kupi� spodnie.
    AI_Output (self, other ,"DIA_Whistler_GACIE_FAIL_03_02"); //Chyba sobie kpisz. Po tym wszystkim masz czelno�� tu przychodzi�?!
    AI_Output (self, other ,"DIA_Whistler_GACIE_FAIL_03_03"); //WYNO� SI�!
    
};
*/

instance dia_whistler_pickpocket(c_info) {
    npc = stt_309_whistler;
    nr = 900;
    condition = dia_whistler_pickpocket_condition;
    information = dia_whistler_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_whistler_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT, 30);
};

func void dia_whistler_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_whistler_pickpocket);
	info_addchoice(dia_whistler_pickpocket, dialog_back, dia_whistler_pickpocket_back);
	info_addchoice(dia_whistler_pickpocket, dialog_pickpocket, dia_whistler_pickpocket_doit);
};

func void dia_whistler_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_whistler_pickpocket);
};

func void dia_whistler_pickpocket_back() {
    info_clearchoices(dia_whistler_pickpocket);
};