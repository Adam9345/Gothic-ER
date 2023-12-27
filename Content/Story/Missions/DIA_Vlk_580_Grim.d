//poprawione i sprawdzone -Reflide

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Falle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Falle_Condition;
	information		= DIA_Grim_Falle_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grim_Falle_Condition()
{	
	if	(Grim_ProtectionBully == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Falle_Info()
{
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hej, ty! Czy to nie ty chcesz do��czy� do naszego Obozu?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //A je�li chc�?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //M�g�bym ci pom�c...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Jak?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Na zewn�trz Obozu siedzi dw�ch go�ci. Jeden z nich ukrad� co� cennego Magnatom. To cenny amulet, kt�ry mia� nam zosta� przys�any z ostatnim transportem ze �wiata Zewn�trznego.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Kt�ry� z nich powinien mie� ten amulet przy sobie. Je�li zaatakujemy ich razem, powinno nam si� uda�. Sam raczej nie dam rady. Co ty na to?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogo� innego."	,DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"A co si� stanie, gdy ju� zdob�dziemy amulet?"	,DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"P�jd� z tob�."							,DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //To nie dla mnie. Poszukaj sobie kogo� innego.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Z takim podej�ciem d�ugo tu miejsca nie zagrzejesz. Daj mi zna�, gdyby� zmieni� zdanie!
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //A co si� stanie, gdy ju� zdob�dziemy amulet?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //To proste. Zwr�c� go Magnatom i odbior� nagrod�. Przy okazji powiem im, �e mi pomog�e�. Ta wiadomo�� na pewno dotrze do Gomeza!
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogo� innego."	,DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Nie! Albo dzielimy si� po po�owie, albo baw si� sam!"	,DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"P�jd� z tob�."							,DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Nie! Albo dzielimy si� po po�owie, albo baw si� sam!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Niech b�dzie, p� na p�! Nagrody wystarczy dla nas dw�ch! To jak? Mog� na ciebie liczy�?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //P�jd� z tob�.
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //�wietnie, daj mi zna�, gdy b�dziesz got�w.
	Info_ClearChoices	(DIA_Grim_Falle );
	Log_CreateTopic		(CH1_GrimAmulet,LOG_MISSION);
	Log_SetTopicStatus	(CH1_GrimAmulet,LOG_RUNNING);
	B_LogEntry (CH1_GrimAmulet,"Kopacz Grim twierdzi, �e kilku rzezimieszk�w ukrad�o jaki� cenny amulet Magnatom. Prosi mnie, aby�my razem si� z nimi rozprawili.");
};

// **************************************************
// 				Bereit f�r Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Jestem gotowy. Chod�my po ten amulet.";
};

FUNC INT DIA_Grim_ReadyToGo_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_ReadyToGo_Info()
{
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Jestem gotowy. Chod�my po ten amulet.
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Zatem do dzie�a!
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"GUIDE");
};	

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance  DIA_Grim_AtOCdraussen(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 3;
	condition	= DIA_Grim_AtOCdraussen_Condition;
	information	= DIA_Grim_AtOCdraussen_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_AtOCdraussen_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Grim_AtOCdraussen_Info()
{
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Oto jeste�my - daleko od twojego kumpla, Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Mamy ci przekaza� pozdrowienia od Bloodwyna!
			Log_SetTopicStatus	(CH1_GrimAmulet,LOG_SUCCESS);
	B_LogEntry (CH1_GrimAmulet,"Grim mnie oszuka�. On i jego koledzy odwa�yli si� mnie zaatakowa�. Podobno wynaj�� ich Bloodwyn... Na przysz�o�� nie powinienem by� tak �atwowierny.");
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Mam ci przekaza� pozdrowienia od Bloodwyna!
			Log_SetTopicStatus	(CH1_GrimAmulet,LOG_SUCCESS);
	B_LogEntry (CH1_GrimAmulet,"Grim mnie oszuka�. Ponadto odwa�y� si� mnie zaatakowa�. Podobno wynaj�� go Bloodwyn... Na przysz�o�� nie powinienem by� tak �atwowierny.");
	};

 
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	
	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);
	var C_NPC Bu40162; Bu40162 = Hlp_GetNpc(VLK_40162_Buddler);
	if ( (Npc_GetDistToNpc(self,Bu520)<1300) && (!Npc_IsDead(Bu520)) )
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};
	
	if ( (Npc_GetDistToNpc(self,Bu534)<1300) && (!Npc_IsDead(Bu534)) )
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
	if ( (Npc_GetDistToNpc(self,Bu40162)<1300) && (!Npc_IsDead(Bu40162)) )
	{
		Npc_SetTarget(Bu40162,other);
		AI_StartState(Bu40162,ZS_ATTACK,1,"");
	};
	
};

// **************************************************
// 				NACH Falle
// **************************************************

INSTANCE DIA_Grim_NACHFalle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_NACHFalle_Condition;
	information		= DIA_Grim_NACHFalle_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grim_NACHFalle_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_NACHFalle_Info()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Ty g�upcze, chcia�e� mnie zwabi� w pu�apk�...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hej, stary! Jedziemy na tym samym w�zku! Ja te� nie zamierzam ry� pod ziemi� do ko�ca moich dni!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Dlatego wype�niam polecenia Stra�nik�w. Ja te� chc� do��czy� do Obozu!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Zreszt� sam zas�u�y�e� na ca�y ten bajzel. Dlaczego zadar�e� ze Stra�nikami?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Osobi�cie nic do ciebie nie mam. To jak b�dzie - wojna czy pok�j.
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Wojna."	,DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Pok�j."			,DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Nie mam nic przeciwko wojnie!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Stary, mam ju� tego do��...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Niech b�dzie pok�j.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Ciesz� si�, �e mogli�my to sobie wyja�ni�. Najlepiej zapomnijmy o ca�ej sprawie. Od tej chwili jestem po twojej stronie.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Gdyby� jeszcze kiedy� wpad� w tarapaty, mo�esz na mnie liczy�. W ko�cu jestem ci co� winien.
	Info_ClearChoices	(DIA_Grim_NACHFalle );

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver;				
// **************************************************

INSTANCE DIA_Grim_Hallo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 1;
	condition		= DIA_Grim_Hallo_Condition;
	information		= DIA_Grim_Hallo_Info;
	permanent		= 0;
	description		= "Jestem tu nowy.";
};

FUNC INT DIA_Grim_Hallo_Condition()
{	
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};
	
	if (FirstOver == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Hallo_Info()
{
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Jestem tu nowy.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //��todzi�b, co? Nazywam si� Grim - te� jestem tu od niedawna. Wrzucili mnie nied�ugo przed tob�.
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_Leben (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Leben_Condition;
	information		= DIA_Grim_Leben_Info;
	permanent		= 0;
	description		= "Jak wygl�da �ycie w Kolonii?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
if  (Kapitel < 4){
	return 1;
};
};
FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Jak wygl�da �ycie w Kolonii?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Nie jest �le, je�li zap�acisz Stra�nikom za ochron�.
};

// **************************************************
// 						Aufnahme
// **************************************************

INSTANCE DIA_Grim_Aufnahme (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Aufnahme_Condition;
	information		= DIA_Grim_Aufnahme_Info;
	permanent		= 0;
	description		= "Co mam zrobi�, je�li chc� zosta� przyj�ty do tego Obozu?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
if (Kapitel < 4){
	return 1;
};
};
FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Co mam zrobi�, je�li chc� zosta� przyj�ty do tego Obozu?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Na pocz�tek musisz zosta� Cieniem. W tym celu poszukaj sobie jakiego� wp�ywowego opiekuna. Kogo�, kto wyja�ni ci co w trawie piszczy i wska�e ci w�a�ciw� drog�.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Na twoim miejscu trzyma�bym si� blisko Diego - ja tak zrobi�em i nie �a�uj�!
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //On podda ci� testowi zaufania - dla ka�dego wygl�da on troch� inaczej. No i musisz wype�nia� jeszcze zadania zlecane ci przez Cienie.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Je�li ci si� uda, zostaniesz jednym z nas.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

INSTANCE DIA_Grim_HowFarAreYou (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_HowFarAreYou_Condition;
	information		= DIA_Grim_HowFarAreYou_Info;
	permanent		= 1;
	description		= "A ty, jak sobie radzisz?";
};

FUNC INT DIA_Grim_HowFarAreYou_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_HowFarAreYou_Info()
{
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //A ty, jak sobie radzisz?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Rozmawia�em ju� z Dexterem, Z�ym i R�czk�. To jedni najbardziej wp�ywowych ludzi w Zewn�trznym Pier�cieniu.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC, "Dexter, Z�y i R�czka nale�� do wp�ywowych Cieni.");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_YourPDV (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 5;
	condition		= DIA_Grim_YourPDV_Condition;
	information		= DIA_Grim_YourPDV_Info;
	permanent		= 0;
	description		= "A jak wygl�da� TW�J test zaufania?";
};

FUNC INT DIA_Grim_YourPDV_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme)) && (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_YourPDV_Info()
{
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //A jak wygl�da� TW�J test zaufania?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Tego nie mog� ci powiedzie�. O takich rzeczach lepiej nie m�wi� g�o�no!
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMO(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMO_Condition;
	information	= DIA_Grim_INEXTREMO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_INEXTREMO_Condition()
{
	if	(Kapitel == 2) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hej, s�ysza�e� ju� wie�ci?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //S� tu In Extremo! W�a�nie weszli na scen�!
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Pospiesz si�, albo przegapisz koncert!

	Npc_ExchangeRoutine	(self,	"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMOAWAY_Condition;
	information	= DIA_Grim_INEXTREMOAWAY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gdzie s� In Extremo?";
};                       

FUNC int  DIA_Grim_INEXTREMOAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Grim_INEXTREMO)
	&&	(Kapitel == 3) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Gdzie s� In Extremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Pojechali dalej. Szkoda. Zd��y�em si� przyzwyczai� do imprez pod scen�.

	AI_StopProcessInfos	(self);
};

//--------------------------------------------1.6.1-----------------

//========================================
//-----------------> Zjawa
//========================================

INSTANCE DIA_Grim_Zjawa (C_INFO)
{
   npc          = Vlk_580_Grim;
   nr           = 1;
   condition    = DIA_Grim_Zjawa_Condition;
   information  = DIA_Grim_Zjawa_Info;
   permanent	= FALSE;
   description	= "S�ysza�em, �e ostatnio co� nerwowo u ciebie...";
};

FUNC INT DIA_Grim_Zjawa_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Guy_Zjawa))
{
    return TRUE;
};
};
FUNC VOID DIA_Grim_Zjawa_Info()
{
    AI_Output (other, self ,"DIA_Grim_Zjawa_15_01"); //S�ysza�em, �e ostatnio co� nerwowo u ciebie...
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_02"); //U mnie sk�d�e...
    AI_Output (other, self ,"DIA_Grim_Zjawa_15_03"); //Widz�, po twoim wzroku, �e co� ukrywasz.
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_04"); //Mylisz si�.
    AI_Output (other, self ,"DIA_Grim_Zjawa_15_05"); //Obstawiam, �e masz co� wsp�lnego ze zjaw�, kt�ra nawiedza okolice.
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_06"); //Nie!
    AI_Output (other, self ,"DIA_Grim_Zjawa_15_07"); //Coraz bardziej jestem pewien, �e tak. Wydu� to wreszcie z siebie!
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_08"); //Jestem niewinny. Sk�d mog�em widzie� do czego to doprowadzi...
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_09"); //Wzi��em tylko pewien medalion z jakiego� grobu le��cego na uboczu przy obozie.
    AI_Output (other, self ,"DIA_Grim_Zjawa_15_10"); //Zaczynam rozumie�. To ty wywo�a�e� to ca�e zamieszanie.
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_11"); //Gdybym wiedzia�... Nigdy bym tego nie zrobi�. M�g�by� porozmawia� z jakim� magiem na ten temat?
    AI_Output (other, self ,"DIA_Grim_Zjawa_15_12"); //Zobacz� co da si� zrobi�.
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_13"); //Ach bym bym by� zapomnia�... We� ten cholerny medalion, mo�e do czego� si� przyda... 
	CreateInvItem (self, ItMi_Zjawa_Amulet);
	B_GiveInvItems (self,other, ItMi_Zjawa_Amulet, 1);
    AI_Output (other, self ,"DIA_Grim_Zjawa_15_14"); //Dobra... ja ju� p�jd�...
    AI_Output (self, other ,"DIA_Grim_Zjawa_03_15"); //Powodzenia i oby�cie pozbyli si� tego cholerstwa!
	B_LogEntry               (Zjawa,"Grim jest odpowiedzialny za ca�y zam�t zwi�zany ze zjaw�. Zabra� on jaki� medalion z grobu le��cego nieopodal obozu. Musz� si� rozm�wi� z Miltenem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Zjawa_droga
//========================================

INSTANCE DIA_Grim_Zjawa_droga (C_INFO)
{
   npc          = Vlk_580_Grim;
   nr           = 1;
   condition    = DIA_Grim_Zjawa_droga_Condition;
   information  = DIA_Grim_Zjawa_droga_Info;
   permanent	= FALSE;
   description	= "Rozmawia�em z Miltenem.";
};

FUNC INT DIA_Grim_Zjawa_droga_Condition()
{
if (Npc_KnowsInfo(hero,DIA_PC_MAGE_Zjawa))

{
    return TRUE;
};
};
FUNC VOID DIA_Grim_Zjawa_droga_Info()
{
    AI_Output (other, self ,"DIA_Grim_HELLO1_15_01"); //Rozmawia�em z Miltenem.
    AI_Output (self, other ,"DIA_Grim_HELLO1_03_02"); //I czego si� dowiedzia�e�?
	
    AI_Output (other, self ,"DIA_Grim_HELLO1_15_03"); //Tego, �e nawet zwrot medalionu to za ma�o. Trzeba b�dzie pokona� zjaw� w bezpo�rednim starciu.
    AI_Output (self, other ,"DIA_Grim_HELLO1_03_04"); //No to walcz z ni�...
    AI_Output (other, self ,"DIA_Grim_HELLO1_15_05"); //Nie tak pr�dko. To ty nawa�y�e� tego piwa. Wieczorem zaprowadzisz mnie do miejsca gdzie le�y ten rozkopany gr�b.
    AI_Output (self, other ,"DIA_Grim_HELLO1_03_06"); //Musz�?!
    AI_Output (other, self ,"DIA_Grim_HELLO1_15_07"); //Nie masz wyj�cia.
	
    AI_Output (self, other ,"DIA_Grim_HELLO1_03_08"); //Ehh... Niech b�dzie...

B_LogEntry               (Zjawa,"Rozmawia�em z Grimem. Zaprowadzi mnie (cho� mocno niech�tnie) do grobu sk�d zabra� medalion. Musz� do niego zajrze� wieczorem.");
	
};
//========================================
//-----------------> Grave
//========================================

INSTANCE DIA_Grim_Grave (C_INFO)
{
   npc          = Vlk_580_Grim;
   nr           = 1;
   condition    = DIA_Grim_Grave_Condition;
   information  = DIA_Grim_Grave_Info;
   permanent	= FALSE;
   description	= "Chod�my pod ten rozkopany gr�b.";
};

FUNC INT DIA_Grim_Grave_Condition()
{
if  (Npc_KnowsInfo(hero,DIA_Grim_Zjawa_droga))
&&  Wld_IsTime(19, 01,05,59) 
{
    return TRUE;
};
};
FUNC VOID DIA_Grim_Grave_Info()
{
    AI_Output (other, self ,"DIA_Grim_Grave_15_01"); //Chod�my pod ten rozkopany gr�b.
    AI_Output (self, other ,"DIA_Grim_Grave_03_02"); //Ehhh... Za mn�.
    AI_Output (other, self ,"DIA_Grim_Grave_15_03"); //Przesta� sie maza� i rusz si� wreszcie!
	Npc_ExchangeRoutine(self,"GuideZJ");
	Wld_InsertNpc		(SkeletonMage_Glest ,"WP_MAGES_GLEST");
	Wld_InsertNpc		(SkeletonScout ,	"WP_GLEST_MA1");
	Wld_InsertNpc		(SkeletonScout ,	"WP_GLEST_MA2");
	Wld_InsertNpc		(SkeletonScout ,	"WP_GLEST_MA3");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Zjawa_Dead
//========================================

INSTANCE DIA_Grim_Zjawa_Dead (C_INFO)
{
   npc          = Vlk_580_Grim;
   nr           = 1;
   condition    = DIA_Grim_Zjawa_Dead_Condition;
   information  = DIA_Grim_Zjawa_Dead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Grim_Zjawa_Dead_Condition()
{
if (Npc_GetDistToWP(hero,"OW_PATH_298")<5000)
&& (Npc_KnowsInfo(hero,DIA_Grim_Zjawa_droga))
{
    return TRUE;
};
};
FUNC VOID DIA_Grim_Zjawa_Dead_Info()
{
    AI_Output (self, other ,"DIA_Grim_Zjawa_Dead_03_01"); //Eeeeh o�ywie�cy... Nie podchodz� bli�ej. 
    AI_Output (other, self ,"DIA_Grim_Zjawa_Dead_15_02"); //Tch�rzysz? Wi�c sam si� tym zajm�.
    AI_Output (self, other ,"DIA_Grim_Zjawa_Dead_03_03"); //Powodzenia...
	B_LogEntry               (Zjawa,"Dotarli�my do grobu sk�d Grim zwin�� medalion. Tak jak m�wi� Milten � zjawa sprowadzi�a sobie wi�cej kumpli. Musz� si� z nimi rozprawi�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Z_KILL
//========================================

INSTANCE DIA_Grim_Z_KILL (C_INFO)
{
   npc          = Vlk_580_Grim;
   nr           = 2;
   condition    = DIA_Grim_Z_KILL_Condition;
   information  = DIA_Grim_Z_KILL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Grim_Z_KILL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Grim_Zjawa_Dead)) 
&& (Npc_IsDead (SkeletonMage_Glest))
{
    return TRUE;
};
};
FUNC VOID DIA_Grim_Z_KILL_Info()
{
    AI_Output (self, other ,"DIA_Grim_Z_KILL_03_01"); //Uda�o si�!
    AI_Output (self, other ,"DIA_Grim_Z_KILL_03_02"); //Kamie� mi spad� z serca.
    AI_Output (self, other ,"DIA_Grim_Z_KILL_03_03"); //We� t� rud� za wykonan� brudn� robot�.
		CreateInvItems	(self, Itminugget, 30);
		B_GiveInvItems (self,other, Itminugget, 30);
    AI_Output (other, self ,"DIA_Grim_Z_KILL_15_04"); //Dzi�ki. Tylko nie sprawiaj ju� wi�cej k�opot�w.
    AI_Output (self, other ,"DIA_Grim_Z_KILL_03_05"); //Obiecuje.
    AI_Output (other, self ,"DIA_Grim_Z_KILL_15_06"); //Trzymam za s�owo.
    AI_Output (self, other ,"DIA_Grim_Z_KILL_03_07"); //Na razie.
    AI_Output (other, self ,"DIA_Grim_Z_KILL_15_08"); //Do zobaczenia. 
	Npc_RemoveInvItems (other, ItMi_Zjawa_Amulet,1);
	Npc_ExchangeRoutine(self,"Start");
	B_LogEntry               (Zjawa,"Pokona�em o�ywie�c�w. Zwr�ci�em te� uwag� Grimowi by nigdy nie pope�ni� b��du z okradaniem grob�w. Pora bym pogada� o nagrodzie z Glestem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO_IM_STT
//========================================

INSTANCE DIA_Grim_HELLO_IM_STT (C_INFO)
{
   npc          = VLK_580_Grim;
   nr           = 1;
   condition    = DIA_Grim_HELLO_IM_STT_Condition;
   information  = DIA_Grim_HELLO_IM_STT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Grim_HELLO_IM_STT_Condition()
{
 if (Kapitel == 2) || (Kapitel == 3) 
{
    return TRUE;
};
};
FUNC VOID DIA_Grim_HELLO_IM_STT_Info()
{
    AI_Output (self, other ,"DIA_Grim_HELLO_IM_STT_03_01"); //Co tam u ciebie s�ycha�?
    AI_Output (other, self ,"DIA_Grim_HELLO_IM_STT_15_02"); //Sporo si� dzieje. Pr�buje si� w tym odnale��.
    AI_Output (other, self ,"DIA_Grim_HELLO_IM_STT_15_03"); //Ale widz�, �e i ty nie pr�nujesz.
    AI_Output (self, other ,"DIA_Grim_HELLO_IM_STT_03_04"); //Tak. Wreszcie uda�o mi si� zaskarbi� sobie na tyle powa�ania tutejszych , �e Diego zgodzi� si� mnie przyj��.
    AI_Output (other, self ,"DIA_Grim_HELLO_IM_STT_15_05"); //Gratuluje.
    AI_Output (self, other ,"DIA_Grim_HELLO_IM_STT_03_06"); //Wreszcie nie b�d� czu� si� tutaj obco. No i mo�e co nieco zarobi�.
    AI_Output (other, self ,"DIA_Grim_HELLO_IM_STT_15_07"); //Zatem masz perspektywy na dalszy rozw�j. Chcia�by� kiedy� zosta� Stra�nikiem?
    AI_Output (self, other ,"DIA_Grim_HELLO_IM_STT_03_08"); //P�ki co oswoje si� w w realiach bycia Cieniem a potem zobaczymy.
    AI_Output (other, self ,"DIA_Grim_HELLO_IM_STT_15_09"); //Zatem powodzenia.
    AI_Output (self, other ,"DIA_Grim_HELLO_IM_STT_03_10"); //Dzi�ki, przyda si�!
};

instance dia_grim_pickpocket(c_info) {
    npc = vlk_580_grim;
    nr = 900;
    condition = dia_grim_pickpocket_condition;
    information = dia_grim_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grim_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 15);
};

func void dia_grim_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grim_pickpocket);
	info_addchoice(dia_grim_pickpocket, dialog_back, dia_grim_pickpocket_back);
	info_addchoice(dia_grim_pickpocket, dialog_pickpocket, dia_grim_pickpocket_doit);
};

func void dia_grim_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grim_pickpocket);
};

func void dia_grim_pickpocket_back() {
    info_clearchoices(dia_grim_pickpocket);
};
