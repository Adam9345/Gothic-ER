//poprawione i sprawdzone -  

// **************************************************
//						EXIT
// **************************************************

instance  DIA_BaalOrun_Exit (C_INFO)
{
	npc			=  Gur_1209_BaalOrun;
	nr			=  999;
	condition	=  DIA_BaalOrun_Exit_Condition;
	information	=  DIA_BaalOrun_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungl�ubiger) 
// ************************************************************
	var int BaalOrun_Ansprechbar;
	var int BaalOrun_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalOrun_NoTalk(C_INFO)
{
	npc				= GUR_1209_BaalOrun;
	nr				= 2;
	condition		= DIA_BaalOrun_NoTalk_Condition;
	information		= DIA_BaalOrun_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalOrun_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalOrun_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) && !(Npc_KnowsInfo(hero,DIA_Caine_Gruzlik)))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalOrun_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalOrun_NoTalk);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,DIALOG_ENDE					,DIA_BaalOrun_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Wszystko w porz�dku, kolego?"			,DIA_BaalOrun_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Niech �ni�cy b�dzie z tob�!"	,DIA_BaalOrun_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Cze��! Jestem tu nowy!"		,DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Hi_15_00"); //Cze��! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Hi_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Sleeper_15_00"); //Niech �ni�cy b�dzie z tob�!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Sleeper_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Imp_15_00"); //Wszystko w porz�dku, kolego?
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Imp_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//		Ghorim_KickHarlok Success + MISSION
// **************************************************
instance  DIA_BaalOrun_FirstTalk (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_FirstTalk_Condition;
	information	= DIA_BaalOrun_FirstTalk_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalOrun_FirstTalk_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_FirstTalk_Info()
{
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_00"); //Rozmawia�em z Ghorimem. Odda�e� jednemu z naszych braci nie lada przys�ug�. Twoja sprawa by�a s�uszna.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_01"); //Dlatego postanowi�em wyznaczy� ci� do pewnego szczeg�lnego zadania.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_02"); //Cor Kalom pilnie potrzebuje do swoich eksperyment�w �wie�ej dostawy bagiennego ziela.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_03"); //Nasi zbieracze pracuj� dniem i noc�. Id� do nich i przynie� wszystko co uzbierali do laboratorium alchemicznego Kaloma.
	
	B_GiveXP			(XP_BaalOrunTalks);
	B_LogEntry			(CH1_GhorimsRelief,	"Harlok wreszcie zast�pi� Ghorima. Cuda si� zdarzaj�.");
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_SUCCESS);

	Log_CreateTopic		(CH1_DeliverWeed,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_RUNNING);
	B_LogEntry			(CH1_DeliverWeed,	"Spos�b, w jaki poradzi�em sobie z Harlokiem wywar� wra�enie na Guru Baal Orunie. Powierzy� mi zaszczytne zadanie dostarczenia �wie�ego zbioru bagiennego ziela do laboratorium Cor Kaloma.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Nic nie m�w" ,DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Gdzie znajd� tych zbieraczy?"	,DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output (other, self,"DIA_BaalOrun_FirstTalk_Where_15_00"); //Gdzie znajd� tych zbieraczy?
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_01"); //Nie pozwoli�em ci zwraca� si� do mnie!
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_02"); //M�dl si�, aby �ni�cy wybaczy� ci to blu�nierstwo! A teraz odejd�! Twoje zadanie jest niezwykle wa�ne.
	
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos	(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos	(self);
	BaalOrun_Ansprechbar = FALSE;
};

// **************************************************
//					Kraut geholt
// **************************************************

instance  DIA_BaalOrun_GotWeed (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_GotWeed_Condition;
	information	= DIA_BaalOrun_GotWeed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalOrun_GotWeed_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS) //automatisch auch Kraut geholt
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_GotWeed_Info()
{
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_00"); //Obroni�e� naszych zbieraczy...
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_01"); //Nie tylko udowodni�e�, �e jeste� po naszej stronie - pokaza�e� r�wnie�, �e jeste� godnym s�ug� �ni�cego.
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_02"); //My�l�, �e jeste� godzien nosi� szat� Nowicjusza.
	BaalOrun_Ansprechbar = TRUE;

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_JoinPsi,	"Baal Orun nazwa� mnie godnym s�ug� �ni�cego, gdy� obroni�em Nowicjuszy na bagnie przed atakami krwiopijc�w.");
	B_GiveXP			(XP_ImpressedBaalOrun);
};

// **************************************************
//					Kraut abgeliefert!
// **************************************************

instance  DIA_BaalOrun_WeedAtKaloms (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_WeedAtKaloms_Condition;
	information	= DIA_BaalOrun_WeedAtKaloms_Info;
	permanent	= 0;
	description = "Zanios�em ziele Cor Kalomowi.";
};                       

FUNC int  DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_WeedAtKaloms_Info()
{
	AI_Output		(other, self,"DIA_BaalOrun_WeedAtKaloms_15_00"); //Zanios�em ziele Cor Kalomowi.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_01"); //Dobrze si� spisa�e�. Mam dla ciebie drobn� nagrod� za twoje trudy. Prosz�, we� to.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_02"); //To magiczne zakl�cie snu. Mo�esz go u�y� tylko jeden raz, ale jestem pewien, �e kiedy� ci si� przyda.
	
	BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
	B_GiveXP		(XP_ReportToBaalOrun);
	
	CreateInvItem	(self,ItArScrollSleep);
	B_GiveInvItems  (self,other,ItArScrollSleep, 1);
};

// **************************************************
//					Permanent
// **************************************************

instance  DIA_BaalOrun_Perm (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 2;
	condition	= DIA_BaalOrun_Perm_Condition;
	information	= DIA_BaalOrun_Perm_Info;
	permanent	= 1;
	description = "Jak przebiega produkcja ziela?";
};                       

FUNC int  DIA_BaalOrun_Perm_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_Perm_Info()
{
	AI_Output (other, self,"DIA_BaalOrun_Perm_15_00"); //Jak przebiega produkcja ziela?
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_01"); //Wyt�amy wszystkie si�y, �eby nad��y� z produkcj�. W ko�cu musimy zadba� o w�asne potrzeby, i jeszcze wymienia� cz�� towaru z innymi obozami.
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_02"); //Ale nasi Nowicjusze ch�tnie ponosz� t� ofiar�, ku wi�kszej chwale �ni�cego.
};

//========================================
//-----------------> ToxicFumes
//========================================

INSTANCE DIA_BaalOrun_ToxicFumes (C_INFO)
{
   npc          = Gur_1209_BaalOrun;
   nr           = 1;
   condition    = DIA_BaalOrun_ToxicFumes_Condition;
   information  = DIA_BaalOrun_ToxicFumes_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalOrun_ToxicFumes_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalOrun_ToxicFumes_Info()
{
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_01"); //Podejd� no tu, wojowniku.
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumes_15_02"); //Czym zas�u�y�em na taki zaszczyt?
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_03"); //Ostatnio w naszym Bractwie maj� miejsce niepokoj�ce zdarzenia.
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumes_15_04"); //To chyba wiadomo nie od dzi�...
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_05"); //Daj mi doko�czy�. Chodzi o plag� ci�kiej choroby, kt�ra dotyka mieszka�c�w naszego Obozu. 
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_06"); //D�ugo nie mogli�my odnale�� przyczyny tego zjawiska, lecz teraz znale�li�my pewn� poszlak�.
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumes_15_07"); //Jak�?
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_08"); //Jeden z Nowicjuszy zaobserwowa� chmury dziwnych opar�w nap�ywaj�ce z g�r. To na pewno z ich przyczyny wszyscy choruj�.
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumes_15_09"); //Fakt, cholernie tu �mierdzi. Bardziej ni� zazwyczaj. I to chyba nie przez nawyki dotycz�ce higieny. 
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_10"); //Do�� �art�w.
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumes_15_11"); //Co planujesz?
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_12"); //Wys�a�em Gor Na Rana na zwiad. Mia� rozejrze� si� po okolicy, bior�c jednak pod uwag� twoje zdolno�ci�.
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumes_15_13"); //Chcesz bym mu pom�g�.
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_14"); //Racja. I pami�taj, �e nagroda ci� nie ominie. Je�li oczywi�cie znajdziesz �r�d�o ostatnich epidemii. 
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumes_15_15"); //Zajrz� do Gor Na Rana. By� mo�e potrzebuje mojej pomocy. 
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumes_03_17"); //Pami�taj o wadze tej misji!
    AI_StopProcessInfos	(self);
	
	MIS_ToxicFumes = LOG_RUNNING;
	Log_CreateTopic		(CH4_ToxicFumes, LOG_MISSION);
	Log_SetTopicStatus	(CH4_ToxicFumes, LOG_RUNNING);
    B_LogEntry          (CH4_ToxicFumes,"Ostatnio w Obozie Bractwa wielu Nowicjuszy zapad�o na ci�kie choroby. Wed�ug Baal Oruna przyczyn� tego mog� by� opary unosz�ce si� z g�r. Wys�a� ju� w tamto miejsce Gor Na Rana. Powinienem go odszuka� i pom�c mu ustali� co si� tam dzieje.");
	
	Npc_ExchangeRoutine (TPL_1405_GorNaRan, "TOXIC");
	
	Wld_InsertNpc				(Orc_Guslarz_1,"OLTARZ_OCZYSZCZENIA");
	Wld_InsertNpc				(OrcScout,"FUMES01");
	Wld_InsertNpc				(OrcScout,"FUMES02");
	Wld_InsertNpc				(OrcScout,"FUMES03");
	Wld_InsertNpc				(OrcWarrior2,"WAY1");
};

//========================================
//-----------------> ToxicFumesOff
//========================================

INSTANCE DIA_BaalOrun_ToxicFumesOff (C_INFO)
{
   npc          = Gur_1209_BaalOrun;
   nr           = 2;
   condition    = DIA_BaalOrun_ToxicFumesOff_Condition;
   information  = DIA_BaalOrun_ToxicFumesOff_Info;
   permanent	= FALSE;
   description	= "Problem truj�cych opar�w, zosta� chyba za�egnany.";
};

FUNC INT DIA_BaalOrun_ToxicFumesOff_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(Orc_Guslarz_1);
    if (Npc_KnowsInfo (hero, DIA_BaalOrun_ToxicFumes))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalOrun_ToxicFumesOff_Info()
{
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumesOff_15_01"); //Problem truj�cych opar�w, zosta� chyba za�egnany.
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumesOff_03_02"); //Wspaniale. Jakie by�o jego �r�d�o?
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumesOff_15_03"); //Orkowi szamani urz�dzili wielki pogrzeb swoich wojownik�w poleg�ych na Cmentarzysku. Mia�o to zwi�zek z moj� wizyt� tam jaki� czas temu.
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumesOff_03_04"); //Ach, pami�tam. Wizja Y'Beriona i ekspedycja Baal Lukora.
    AI_Output (other, self ,"DIA_BaalOrun_ToxicFumesOff_15_05"); //Palone zw�oki ork�w wydziela�y truj�ce gazy, kt�re unosi�y si� i sp�ywamy z powietrzem nad bagna.
    AI_Output (self, other ,"DIA_BaalOrun_ToxicFumesOff_03_06"); //Dobrze, �e problem zosta� za�egnany. Wkr�tce powinni�my doleczy� ostatnich chorych. Oto obiecana nagroda. 
	
	if (Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR)
	{
	AI_Output (self, other ,"DIA_BaalOrun_ToxicFumesOff_03_07"); //Zanim p�jdziesz chcia�bym ci� prosi� o jeszcze jedn� rzecz. Robi� to tylko dlatego, �e jeste� cz�onkiem naszej spo�eczno�ci.
	AI_Output (self, other ,"DIA_BaalOrun_ToxicFumesOff_03_08"); //Na zaraz� cierpi wa�ny dla nas Nowicjusz - Hakan. Jest tutaj jedynym kucharzem i jego praca ma du�e znaczenie.
	AI_Output (self, other ,"DIA_BaalOrun_ToxicFumesOff_03_09"); //Pomimo zarazy wci�� pracuje i obawiam si�, �e mo�e nie wytrzyma� choroby.
	AI_Output (self, other ,"DIA_BaalOrun_ToxicFumesOff_03_10"); //Chcia�bym, �eby� si� do niego uda� i mu pom�g�.
	
	MIS_SickHakan = LOG_RUNNING;

    Log_CreateTopic          (CH4_SickHakan, LOG_MISSION);
    Log_SetTopicStatus       (CH4_SickHakan, LOG_RUNNING);
    B_LogEntry               (CH4_SickHakan,"Baal Orun poprosi� mnie, abym pom�g� kucharzowi Hakanowi. Jego praca jest bardzo wa�na dla Guru.");
	};
	
    CreateInvItems (self, ItFo_PotionTime_Master_01, 1);
    B_GiveInvItems (self, other, ItFo_PotionTime_Master_01, 1);
    AI_StopProcessInfos	(self);
	
	B_LogEntry               (CH4_ToxicFumes,"Powiedzia�em Baal Orunowi o tym, �e pozby�em si� orkowych szaman�w odprawiaj�cych obrz�dy.");
    Log_SetTopicStatus       (CH4_ToxicFumes, LOG_SUCCESS);
    MIS_ToxicFumes = LOG_SUCCESS;

    B_GiveXP (XP_ToxicFumes);
};
//========================================
//-----------------> ToxicFumes
//========================================

INSTANCE DIA_BaalOrun_Amulett_Brandick (C_INFO)
{
   npc          = Gur_1209_BaalOrun;
   nr           = 1;
   condition    = DIA_BaalOrun_Amulett_Brandick_Condition;
   information  = DIA_BaalOrun_Amulett_Brandick_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalOrun_Amulett_Brandick_Condition()
{
    if (Npc_HasItems(hero, Amulett_BrandickS)>=1)
    && (Npc_KnowsInfo (hero ,DIA_Lester_AMULET_PSI))
    {
    return TRUE;
    };
};

FUNC VOID DIA_BaalOrun_Amulett_Brandick_Info()
{
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_01"); //Hmm... wygl�dasz jak by� czego� odemnie chcia�...
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Brandick_15_02"); //Witaj Baalu, owszem mam do ciebie pewn� spraw�.
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_03"); //Tak?
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Brandick_15_04"); //Jeden z waszych wojownik�w poleg� w Starej Kopalni. Odnaleziono przy nim ten medalion, jest jednak uszkodzony.
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Brandick_15_05"); //Oto on.
    B_GiveInvItems (other,self,Amulett_BrandickS, 1);
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_06"); //Poznaje.... To medalion zwi�kszaj�cy �ywotno�� wojownika, cenna rzecz. Oczywi�cie gdy jest sprawny.
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_07"); //Ale ten ma uszkodzon� obudow� i brak w nim magicznego kamienia.
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Brandick_15_08"); //Czy jeste� w stanie mi pom�c?
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_09"); //Je�li obudowa amuletu zostanie naprawiona i w�o�y si� do niego magiczny kamie�. Wtedy mog� odprawi� rytua�, kt�ry ponownie na�aduje medalion energi� magiczn�.
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Brandick_15_10"); //Do kogo powinienem si� zatem uda�?
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_11"); //Obudow� amuletu m�g�by naprawi� nasz obozowy kowal - Darrion, oczywi�cie nie za darmo.
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_12"); //A magicznego kamienia szuka�bym u, kt�rego� z Mag�w Ognia.
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_13"); //We� z powrotem ten medalion.
	B_GiveInvItems (self,other,Amulett_BrandickS, 1);
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Brandick_03_14"); //I wr�� je�li spe�nisz warunki, kt�re ci wymieni�em.
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Brandick_15_15"); //Postaram si� jako� z tym upora�.
    AI_StopProcessInfos	(self);
	
	    B_LogEntry               (CiekaweZnalezisko,"Baal Orun wyja�ni� mi sytuacje z medalionem. Musz� naprawi� jego uszkodzon� obudow� u kowala chocia�by tutejszego o imieniu Darrion. Musz� tak�e zdoby� magiczny kamie� u kt�rego� z Mag�w Ognia. Potem Baal Orun b�dzie m�g� odprawi� magiczny rytua�, kt�ry ponownie na�aduje magiczn� energi� medalion.");
};

//========================================
//-----------------> ToxicFumes
//========================================

INSTANCE DIA_BaalOrun_Amulett_Ritual (C_INFO)
{
   npc          = Gur_1209_BaalOrun;
   nr           = 1;
   condition    = DIA_BaalOrun_Amulett_Ritual_Condition;
   information  = DIA_BaalOrun_Amulett_Ritual_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalOrun_Amulett_Ritual_Condition()
{
    if (Npc_HasItems(hero, Amulett_Brandick_03)>=1)
    && (Npc_KnowsInfo (hero ,DIA_Lester_AMULET_PSI))
    {
    return TRUE;
    };
};

FUNC VOID DIA_BaalOrun_Amulett_Ritual_Info()
{
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Ritual_15_01"); //Medalion ma ju� sprawn� obudow� i ma w�o�ony magiczny kamie�.
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Ritual_03_02"); //Dobrze, daj mi go.
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Ritual_15_03"); //Trzymaj.
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Ritual_03_04"); //Wygl�da dobrze, teraz tylko trzeba przeprowadzi� stosowny rytua�.
    AI_Output (other, self ,"DIA_BaalOrun_Amulett_Ritual_15_05"); //Mo�esz go odprawi�?
    B_GiveInvItems (other,self,Amulett_Brandick_03, 1);
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Ritual_03_06"); //Tak. Musz� si� skoncentrowa�...
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Ritual_03_07"); //(Wzdycha)
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Ritual_03_08"); //O �ni�cy! Wspom� sw� pot�g� ten medalion niech niesie zgub� nikczemnemu z�u tego �wiata!
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Ritual_03_09"); //Niech jego pan zazna mocy i twej szczodrej przychylno�ci!
    AI_Output (self, other ,"DIA_BaalOrun_Amulett_Ritual_03_10"); //(Wzdycha) 
    AI_PlayAni (Gur_1209_BaalOrun,"T_PRACTICEMAGIC2");

     Info_ClearChoices (DIA_BaalOrun_Amulett_Ritual);
	 Info_AddChoice    (DIA_BaalOrun_Amulett_Ritual,"Czy to ju�?",DIA_GUR_1209_BaalOrun_ADD_BAM);	
};
FUNC VOID DIA_GUR_1209_BaalOrun_ADD_BAM()
  {
	AI_Output (other,self ,"DIA_GUR_1209_BaalOrun_ADD_BAM_15_00");  //Czy to ju�?
	AI_Output (self ,other,"DIA_GUR_1209_BaalOrun_ADD_BAM_11_01");  //Wygl�da na to, �e si� powiod�o.
	AI_Output (self ,other,"DIA_GUR_1209_BaalOrun_ADD_BAM_11_02");  //Medalion zn�w dzia�a, mo�esz go wzi��.
    AI_Output (other,self ,"DIA_GUR_1209_BaalOrun_ADD_BAM_15_03");  //Jestem twoim d�u�nikiem Baalu.
	AI_Output (self ,other,"DIA_GUR_1209_BaalOrun_ADD_BAM_11_04");  //Oddaj ten d�ug �ni�cemu i wznie� ku niemu modlitwy. Bo to jedyna droga ku wolno�ci i szcz�ciu.
	Npc_RemoveInvItem	(Gur_1209_BaalOrun, Amulett_Brandick_03);
	AI_Output (other,self ,"DIA_GUR_1209_BaalOrun_ADD_BAM_15_05");  //Do zobaczenia.
	B_LogEntry               (CiekaweZnalezisko,"Baal Orun odprawi� magiczny rytua� i na�adowa� magiczn� energi� medalion. Wygl�da na to, �e odzyska� on swoj� dawn� moc. Pora pom�wi� z Brandickiem.");
	B_GiveInvItems (self,other,Amulett_Brandick_01, 1);
	Brandick_Amulette = LOG_SUCCESS;
};



//========================================
//-----------------> GRU_SNAKEPL
//========================================

INSTANCE DIA_BaalOrun_GRU_SNAKEPL (C_INFO)
{
   npc          = Gur_1209_BaalOrun;
   nr           = 1;
   condition    = DIA_BaalOrun_GRU_SNAKEPL_Condition;
   information  = DIA_BaalOrun_GRU_SNAKEPL_Info;
   permanent	= FALSE;
   description	= "Witaj Baalu. Potrzebuje ro�lin z tej listy.";
};

FUNC INT DIA_BaalOrun_GRU_SNAKEPL_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Caine_Gruzlik))
{
    return TRUE;
};
};
FUNC VOID DIA_BaalOrun_GRU_SNAKEPL_Info()
{
    AI_Output (other, self ,"DIA_BaalOrun_GRU_SNAKEPL_15_01"); //Witaj Baalu. Potrzebuje ro�lin z tej listy.
	B_GiveInvItems (other,self, ItWr_GRU_List, 1);
	B_UseFakeScroll( );        
    AI_Output (self, other ,"DIA_BaalOrun_GRU_SNAKEPL_03_02"); //Mam korzenie W�owca. Mog� ci je odsprzeda� za 95 bry�ek rudy.
	B_GiveInvItems (self,other, ItWr_GRU_List, 1);
	B_LogEntry               (Gruzlik,"Baal Orun mo�e mi odda� korzenie W�owca w zamian za 95 bry�ek rudy.");
};


//========================================
//-----------------> G_Plants
//========================================

INSTANCE DIA_BaalOrun_G_Plants (C_INFO)
{
   npc          = Gur_1209_BaalOrun;
   nr           = 2;
   condition    = DIA_BaalOrun_G_Plants_Condition;
   information  = DIA_BaalOrun_G_Plants_Info;
   permanent	= FALSE;
   description	= "Prosz�. We� t� rud�.";
};

FUNC INT DIA_BaalOrun_G_Plants_Condition()
{
if (Npc_KnowsInfo(hero,DIA_BaalOrun_GRU_SNAKEPL))
&& (Npc_HasItems (other, itminugget) >=95)
{
    return TRUE;
};
};
FUNC VOID DIA_BaalOrun_G_Plants_Info()
{
    AI_Output (other, self ,"DIA_BaalOrun_G_Plants_15_01"); //Prosz�. We� t� rud�.
	B_GiveInvItems (other,self, itminugget, 95);
	B_GiveInvItems (self,other, ItFo_SnakeHerb, 1);
    AI_Output (self, other ,"DIA_BaalOrun_G_Plants_03_02"); //Masz tu W�owca. Po co ci ta ro�lina?
    AI_Output (other, self ,"DIA_BaalOrun_G_Plants_15_03"); //D�uga historia. A pewien cz�owiek w�a�nie umiera. Musz� zanie�� mu antidotum na bazie tej ro�liny.
    AI_Output (self, other ,"DIA_BaalOrun_G_Plants_03_04"); //Zatem niech �ni�cy go ocali i niech nieszcz�nik zobaczy jego chwalebny powr�t!
    AI_Output (other, self ,"DIA_BaalOrun_G_Plants_15_05"); //Dzi�ki.
	B_LogEntry               (Gruzlik,"Zap�aci�em Baalowi Orunowi 95 bry�ek a ten odda� mi korzenie W�owca. T� ro�lin� mam z g�owy.");
    AI_StopProcessInfos	(self);
};



