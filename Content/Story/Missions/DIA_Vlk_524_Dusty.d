//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> ABOUT_BONIE
//========================================

INSTANCE DIA_Dusty_ABOUT_BONIE (C_INFO)
{
   npc          = Vlk_524_Dusty;
   nr           = 1;
   condition    = DIA_Dusty_ABOUT_BONIE_Condition;
   information  = DIA_Dusty_ABOUT_BONIE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dusty_ABOUT_BONIE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Dusty_ABOUT_BONIE_Info()
{
    AI_Output (self, other ,"DIA_Dusty_ABOUT_BONIE_03_01"); //Hej, nowy! Zaczekaj!
    AI_Output (other, self ,"DIA_Dusty_ABOUT_BONIE_15_02"); //Nie mam rudy! Nic ci nie dam!
    AI_Output (self, other ,"DIA_Dusty_ABOUT_BONIE_03_03"); //Skoro nie masz rudy, to lepiej nie id� dalej. To teren Bonie.
    AI_Output (other, self ,"DIA_Dusty_ABOUT_BONIE_15_04"); //Co z nim nie tak?
    AI_Output (self, other ,"DIA_Dusty_ABOUT_BONIE_03_05"); //To morderca jeszcze gorszy ni� Herek. Torturowa� swoje ofiary przed �mierci�!
    AI_Output (self, other ,"DIA_Dusty_ABOUT_BONIE_03_06"); //To barbarzy�ca! Do tego ma chody u Stra�nik�w. Szakal jest pono� jego kumplem.
    AI_Output (self, other ,"DIA_Dusty_ABOUT_BONIE_03_07"); //Nie przepu�ci ci� dalej, je�li nie zap�acisz mu dwudziestu bry�ek rudy.
    AI_Output (self, other ,"DIA_Dusty_ABOUT_BONIE_03_08"); //Nawet nie pr�buj z nim walczy�. Ma op�acon� ochron�!
    AI_Output (other, self ,"DIA_Dusty_ABOUT_BONIE_15_09"); //Dzi�ki.
    AI_StopProcessInfos	(self);
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "Cze��, jestem tu nowy. Jak leci?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Cze��, jestem tu nowy. Jak leci?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Zejd� mi z oczu. Harowa�em pod ziemi� przez ostatnie dwa tygodnie. I za co?!
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Par� n�dznych bry�ek rudy - nic ponad to! Wi�kszo�� z tego musia�em wyda� na �ywno��.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Rozmawia�em niedawno z Baal Parvezem. Opowiedzia� mi wiele ciekawych rzeczy o Obozie Sekty.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Podobno jest tam o wiele lepiej. Przynajmniej nie trzeba harowa� na tych darmozjad�w Gomeza.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "Nie podoba ci si� tutaj? To dlaczego po prostu nie odejdziesz?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Nie podoba ci si� tutaj? To dlaczego po prostu nie odejdziesz?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Bo nie wiem, co mnie tam czeka. Mia�em tutaj kumpla - nazywa� si� Melvin. Poszed� do obozu na bagnie jaki� tydzie� temu.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Ale od tej pory nie mam od niego �adnych wie�ci. Dop�ki si� do mnie nie odezwie, wol� si� st�d nie rusza�!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Dusty, Kopacz ze Starego Obozu, ma ju� do�� pracy w kopalni. Zastanawia si� nad przej�ciem do Bractwa �ni�cego.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "By�em w Obozie Sekty i rozmawia�em z Melvinem.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //By�em w Obozie Sekty i rozmawia�em z Melvinem.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //Naprawd�?! I co powiedzia�?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Najwyra�niej przedk�ada �ycie w Bractwie nad ci�g�e zatargi ze Stra�nikami.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //No nie! Ten stary cap wyleguje si�, podczas gdy ja musz� tu tyra� jak w�! Ju� ja mu poka��... Ale nie uda mi si� opu�ci� tego obozu.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Dlaczego nie?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Stra�nicy dowiedzieli si�, �e zamierzam st�d odej��. Chyba za du�o o tym gada�em.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Potrzebuj� przynajmniej 100 bry�ek rudy, �eby ich przekupi�.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "A gdybym tak da� ci te 100 bry�ek?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	//&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //A gdybym tak da� ci te 100 bry�ek?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //Zrobi�by� to? Ale dlaczego?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //C�, powiedzmy, �e nie tylko ty wolisz �ycie w Bractwie od Starego Obozu.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //To znaczy, �e chcesz p�j�� ze mn�?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "To znaczy, �e odprowadz� ci� do Obozu Bractwa.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //To znaczy, �e odprowadz� ci� do Obozu Bractwa.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //To wspaniale! Jestem gotowy do drogi. Mo�emy rusza� w ka�dej chwili.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Ale nie zapominaj - potrzebujemy 100 bry�ek rudy dla Stra�nik�w.

	B_LogEntry	(CH1_RecruitDusty,	"Uda�o mi si� przekona� Kopacza imieniem Dusty do przej�cia do Bractwa. Najpierw b�d� jednak musia� przekupi� Stra�nik�w przy bramie. Potem zabior� go prosto do Baal Tondrala.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "Jestem gotowy - mo�emy rusza�.";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Jestem gotowy - mo�emy rusza�.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Dobra - wyjd�my po�udniow� bram�. Przy p�nocnym wyj�ciu nic nie wsk�ramy. Tamtejsi Stra�nicy s� nieprzekupni.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Wola�bym, �eby� to ty zaj�� si� ca�� t� spraw� z rud�. Ja si� nie nadaj� do takich rzeczy.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Dobrze - ruszajmy!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,	"Dusty radzi� mi omin�� p�nocn� bram�. Stra�nicy na po�udniu s� pono� bardziej przekupni.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

//========================================
//-----------------> RUNY_INFO_2
//========================================

INSTANCE DIA_Dusty_RUNY_INFO_2 (C_INFO)
{
   npc          = Vlk_524_Dusty;
   nr           = 1;
   condition    = DIA_Dusty_RUNY_INFO_2_Condition;
   information  = DIA_Dusty_RUNY_INFO_2_Info;
   permanent	= FALSE;
   description	= "Hej, Dusty. Jak sobie radzisz jako ucze� Tondrala?";
};

FUNC INT DIA_Dusty_RUNY_INFO_2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drago_HELLO3))
    && (kapitel < 3)
    && (dusty_bractwo == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dusty_RUNY_INFO_2_Info()
{
    AI_Output (other, self ,"DIA_Dusty_RUNY_INFO_2_15_01"); //Hej, Dusty. Jak sobie radzisz jako ucze� Tondrala?
    AI_Output (self, other ,"DIA_Dusty_RUNY_INFO_2_03_02"); //�yje mi si� tu sto razy lepiej ni� w Starym Obozie. Przynajmniej nie jestem wyzyskiwany przez tych dupk�w z Gomezem na czele.
    AI_Output (self, other ,"DIA_Dusty_RUNY_INFO_2_03_03"); //Baal Tondral to wymagaj�cy nauczyciel i potrafi da� w ko��, jednak lepsze to ni� u�eranie si� ze Stra�nikami.
    AI_Output (other, self ,"DIA_Dusty_RUNY_INFO_2_15_04"); //Skoro rozmawiamy o nauce, czy Baal Tondral uczy� ci� ju�, jak korzysta� z magicznych run?
    AI_Output (self, other ,"DIA_Dusty_RUNY_INFO_2_03_05"); //Taa... Pewnego dnia przyni�s� z chaty run� Uderzenia Wiatru. �wiczyli�my ca�ymi godzinami.
    AI_Output (self, other ,"DIA_Dusty_RUNY_INFO_2_03_06"); //Cz�owieku, jakbym teraz m�g� wr�ci� do Starego Obozu i potraktowa� tym Bloodwyna, da�by mi spok�j raz na zawsze. 
    AI_Output (other, self ,"DIA_Dusty_RUNY_INFO_2_15_07"); //Ciesz� si�, �e ci si� powodzi. Trzymaj si�.
    AI_Output (self, other ,"DIA_Dusty_RUNY_INFO_2_03_08"); //Do nast�pnego razu, przyjacielu.
    B_LogEntry                     (CH2_New_God,"W chacie Baal Tondrala znajd� run� Uderzenie Wiatru.");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};