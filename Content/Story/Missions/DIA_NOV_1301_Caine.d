// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Caine_Exit (C_INFO)
{
	npc			=  Nov_1301_Caine;
	nr			=  999;
	condition	=  DIA_Caine_Exit_Condition;
	information	=  DIA_Caine_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Caine_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Caine_Hallo (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 1;
	condition	= DIA_Caine_Hallo_Condition;
	information	= DIA_Caine_Hallo_Info;
	permanent	= 0;
	description	= "Cze��, jestem tu nowy.";
};                       

FUNC int  DIA_Caine_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Hallo_Info()
{
	AI_Output (other, self,"DIA_Caine_Hallo_15_00"); //Cze��, jestem tu nowy.
	AI_Output (self, other,"DIA_Caine_Hallo_13_01"); //Ja... Ja jestem Caine, ucze� Cor Kaloma. Zapewne ju� o nim s�ysza�e�, co?
			
	Info_ClearChoices	(DIA_Caine_Hallo );
	Info_AddChoice		(DIA_Caine_Hallo,"Nie."	,DIA_Caine_Hallo_Nein);
	Info_AddChoice		(DIA_Caine_Hallo,"Tak."		,DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Ja_15_00"); //Tak.
	AI_Output (self, other,"DIA_Caine_Hallo_Ja_13_01"); //Zatem wiesz ju�, �e to najwa�niejszy cz�owiek w tym obozie, zaraz po Ja�nie O�wieconym Y'Berionie.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Nein_15_00"); //Nie.
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_01"); //Nie?! Chyba jeste� tu od niedawna, co?
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom to najwa�niejszy cz�owiek w Bractwie, po Y'Berionie. To on decyduje, kto zostanie przyj�ty w szeregi Nowicjuszy.
	Info_ClearChoices	(DIA_Caine_Hallo );
};


// **************************************************
//						Job = Substanzen 
// **************************************************

instance  DIA_Caine_Job (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_Job_Condition;
	information	= DIA_Caine_Job_Info;
	permanent	= 0;
	description	= "A ty czym si� zajmujesz?";
};                       

FUNC int  DIA_Caine_Job_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Hallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_Job_Info()
{
	AI_Output (other, self,"DIA_Caine_Job_15_00"); //A ty czym si� zajmujesz?
	AI_Output (self, other,"DIA_Caine_Job_13_01"); //Pomagam mojemu mistrzowi w pracach nad jego magicznymi wywarami.
	AI_Output (self, other,"DIA_Caine_Job_13_02"); //G��wnie z ziela bagiennego i wydzieliny pe�zaczy. Swoj� drog�, m�j mistrz pilnie potrzebuje tej wydzieliny.
};

// **************************************************
//						Wo Sekret
// **************************************************

instance  DIA_Caine_WoSekret (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_WoSekret_Condition;
	information	= DIA_Caine_WoSekret_Info;
	permanent	= 0;
	description	= "Gdzie mog� zdoby� t�... Wydzielin� pe�zaczy?";
};                       

FUNC int  DIA_Caine_WoSekret_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Job))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_WoSekret_Info()
{
	AI_Output (other, self,"DIA_Caine_WoSekret_15_00"); //Gdzie mog� zdoby� t�... Wydzielin� pe�zaczy?
	AI_Output (self, other,"DIA_Caine_WoSekret_13_01"); //Stara Kopalnia a� roi si� od pe�zaczy, ale trzeba umie� pozyska� ich wydzielin�.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_02"); //Je�li powa�nie my�lisz o walce z pe�zaczami, porozmawiaj z kt�rym� ze Stra�nik�w trudni�cych si� polowaniem na nie. Na przyk�ad z Gor Na Drakiem.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_03"); //On ka�dego dnia wyrusza z naszego Obozu do Starej Kopalni. O �wicie znajdziesz go w pobli�u laboratorium.
};

// **************************************************
//						AddInfoKalom
// **************************************************

instance  DIA_Caine_AddInfoKalom (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_AddInfoKalom_Condition;
	information	= DIA_Caine_AddInfoKalom_Info;
	permanent	= 0;
	description	= "Co mo�esz mi jeszcze powiedzie� o swoim mistrzu?";
};                       

FUNC int  DIA_Caine_AddInfoKalom_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Job))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_AddInfoKalom_Info()
{
	AI_Output (other, self,"DIA_Caine_AddInfoKalom_15_00"); //Co mo�esz mi jeszcze powiedzie� o swoim mistrzu?
	AI_Output (self, other,"DIA_Caine_AddInfoKalom_13_01"); //Jest inny ni� pozostali Guru. Ka�dy mo�e si� do niego odezwa�, ale NIKOMU nie wolno marnowa� jego cennego czasu.
};


/*------------------------------------------------------------------------
						REZEPT INNER TRUHE									
------------------------------------------------------------------------*/

instance  Nov_1301_Caine_CHEST (C_INFO)
{
	npc				= Nov_1301_Caine;
	condition		= Nov_1301_Caine_CHEST_Condition;
	information		= Nov_1301_Caine_CHEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mog� zdoby� receptur� Kaloma?"; 
};

FUNC int  Nov_1301_Caine_CHEST_Condition()
{	
	if 	(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  Nov_1301_Caine_CHEST_Info()
{
	AI_Output (other, self,"Nov_1301_Caine_CHEST_Info_15_01"); //Jak mog� zdoby� receptur� Kaloma?
	AI_Output (self, other,"Nov_1301_Caine_CHEST_Info_13_02"); //Nie mo�esz. Wszystkie receptury przechowywane s� w zamkni�tej skrzyni.
};  

//////////////////////////////////////////////
//	Zadanie: Sprzeda� eliksir�w
//////////////////////////////////////////////

//========================================
//-----------------> Exposed
//========================================

INSTANCE DIA_Caine_Exposed (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_Exposed_Condition;
   information  = DIA_Caine_Exposed_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Caine_Exposed_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cipher_WhoSellElixier)) && (Npc_GetDistToWP (self, "OW_NC_ABYSS2") < 700)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_Exposed_Info()
{
    AI_Output (self, other ,"DIA_Caine_Exposed_03_01"); //Co ty tutaj robisz? Sk�d wiedzia�e�, �e tu b�d�?
    AI_Output (other, self ,"DIA_Caine_Exposed_15_02"); //Wyda� ci� jeden z twoich odbiorc�w. Wystarczy�o go odpowiednio zmotykowa�...
	AI_Output (self, other ,"DIA_Caine_Exposed_03_03"); //Dlaczego zacz��e� wok� mnie w�szy�? Na co ci to by�o? Powiniene� rozumie�, �e tutaj ten, kto nie kombinuje, szybko ginie.
    AI_Output (other, self ,"DIA_Caine_Exposed_15_04"); //Spraw� eliksiru zainteresowali si� Guru. Shan kaza� mi to sprawdzi�.
    AI_Output (self, other ,"DIA_Caine_Exposed_03_05"); //Zaczekaj! Czy ty powiedzia�e� Guru?
    AI_Output (self, other ,"DIA_Caine_Exposed_03_06"); //Nie chc� k�opot�w.
    AI_Output (other, self ,"DIA_Caine_Exposed_15_07"); //Troch� na to za p�no.

    AI_Output (self, other ,"DIA_Caine_Exposed_03_08"); //Poczekaj, dam ci wszystko co do tej pory zarobi�em, je�li mnie nie wydasz. Bedzie tego z 500 bry�ek rudy!

	B_LogEntry     (CH3_SellElixer,"Noc�, w um�wionym miejscu spotka�em nikogo innego jak Caine'a. Mog�em si� tego domy�le�. Ten Nowicjusz ca�e dnie sp�dza z Cor Kalomem. Mia� �atwy dost�p do receptury. Zaproponowa� mi, �e je�li go nie wydam, otrzymam 500 bry�ek rudy. Musz� podj�� decyzj�, co z nim zrobi�.");
	
    Info_ClearChoices	(DIA_Caine_Exposed);
    Info_AddChoice		(DIA_Caine_Exposed, "Zapomnij. Mistrz Shan o wszystkim si� dowie!", DIA_Caine_Exposed_Nope);
    Info_AddChoice		(DIA_Caine_Exposed, "Dobra. Umowa stoi.", DIA_Caine_Exposed_Money);
};

FUNC VOID DIA_Caine_Exposed_Nope()
{
    AI_Output (other, self ,"DIA_Caine_Exposed_Nope_15_01"); //Zapomnij. Mistrz Shan o wszystkim si� dowie!
    AI_Output (self, other ,"DIA_Caine_Exposed_Nope_03_02"); //Jeste� g�upcem. B�dziesz tego �a�owa�, gdy przyci�nie ci� bieda jak mnie!
    AI_Output (other, self ,"DIA_Caine_Exposed_Nope_15_03"); //Sko�cz ju� t� paplanin�.
	
    B_LogEntry    (CH3_SellElixer,"Zdecydowa�em, �e Caine zas�u�y� na kar�. Mam zamiar powiedzie� o wszystkim Shan'owi.");
	CaineFriend = false;
    Info_ClearChoices		(DIA_Caine_Exposed);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"start");
};

FUNC VOID DIA_Caine_Exposed_Money()
{
    AI_Output (other, self ,"DIA_Caine_Exposed_Money_15_01"); //Dobra. Umowa stoi!
    AI_Output (self, other ,"DIA_Caine_Exposed_Money_03_02"); //�wietnie. Oto twoja ruda. Jestem ci naprawd� wdzi�czny...
    AI_Output (self, other ,"DIA_Caine_Exposed_Money_03_03"); //Tylko nikomu ani s�owa!
	
    B_LogEntry    (CH3_SellElixer,"Przyj��em rud� od Caine. Kolonia to miejsce, w kt�rym najwa�niejsza jest ruda. Pe�na sakiewka mo�e mi kiedy� uratowa� �ycie. Musz� teraz jako� wyt�umaczy� si� Shan'owi.");
	CaineFriend = true;
    Info_ClearChoices		(DIA_Caine_Exposed);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"start");
};

//========================================
//-----------------> JadJaszczura
//========================================

INSTANCE DIA_Caine_JadJaszczura (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_JadJaszczura_Condition;
   information  = DIA_Caine_JadJaszczura_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� odtrutki na jad jaszczura!";
};

FUNC INT DIA_Caine_JadJaszczura_Condition()
{
    if (MIS_SickHunter == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_JadJaszczura_Info()
{
    AI_Output (other, self ,"DIA_Caine_JadJaszczura_15_01"); //Potrzebuj� odtrutki na jad jaszczura!
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_02"); //Mam teraz du�o pracy dla Cor Kaloma...
    AI_Output (other, self ,"DIA_Caine_JadJaszczura_15_03"); //Nie rozumiesz?! Ten my�liwy mo�e zgin��.
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_04"); //Nie znam twojego przyjaciela. 
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_05"); //Nie obchodzi mnie jego �ycie, ale skoro tak ci na tym zale�y, to pewnie nie posk�pisz kilku bry�ek rudy.
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_06"); //300 bry�ek i powiem ci co robi�.
    B_LogEntry                     (CH2_SickHunter,"Caine pomo�e mi za 300 bry�ek rudy. Chyba nie mam wyboru. ");
};

//========================================
//-----------------> 300Oreive
//========================================

INSTANCE DIA_Caine_300Oreive (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_300Oreive_Condition;
   information  = DIA_Caine_300Oreive_Info;
   permanent	= FALSE;
   description	= "No dobra! Bierz rud�! ";
};

FUNC INT DIA_Caine_300Oreive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_JadJaszczura))
    && (Npc_HasItems (hero, ItMiNugget)>=300)
	&& (!Npc_KnowsInfo (hero, DIA_Caine_MusMixCaine))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_300Oreive_Info()
{
    AI_Output (other, self ,"DIA_Caine_300Oreive_15_01"); //No dobra! Bierz rud�! 
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_02"); //Wida�, bardzo ci zale�y.
    B_GiveInvItems (other, self, ItMiNugget, 300);
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_03"); //W porz�dku. Pomog� ci.
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_04"); //Aby stworzy� odtrutk�, potrzebuj� jadu jaszczura, kt�ry ugryz� twojego przyjaciela.
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_05"); //Przynie� mi go jak najpr�dzej.
    B_LogEntry                     (CH2_SickHunter,"Caine chce, abym przyni�s� mu jad jaszczura, kt�ry pogryz� Clawa. ");
};
//========================================
//-----------------> MusMixCaine
//========================================

INSTANCE DIA_Caine_MusMixCaine (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_MusMixCaine_Condition;
   information  = DIA_Caine_MusMixCaine_Info;
   permanent	= FALSE;
   description	= "Y'Berion nakaza� ci sporz�dzi� mikstur�.";
};

FUNC INT DIA_Caine_MusMixCaine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Yberion_MustMix))
    && (MIS_SickHunter == LOG_RUNNING)
    && (!Npc_KnowsInfo (hero, DIA_Caine_300Oreive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_MusMixCaine_Info()
{
    AI_Output (other, self ,"DIA_Caine_MusMixCaine_15_01"); //Y'Berion nakaza� ci sporz�dzi� mikstur�.
    AI_Output (other, self ,"DIA_Caine_MusMixCaine_15_02"); //Nie obchodzi mnie czy tego chcesz. To rozkaz Mistrza!
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_03"); //Przekabaci�e� staruszka?! He he. 
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_04"); //No dobra. Aby stworzy� odtrutk� potrzebuj� jadu jaszczura, kt�ry ugryz� twojego przyjaciela.
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_05"); //Przynie� mi go jak najpr�dzej.
	B_LogEntry                     (CH2_SickHunter,"Caine chce, abym przyni�s� mu jad jaszczura, kt�ry pogryz� Clawa. ");
};


//========================================
//-----------------> JadJaszczuraMAm
//========================================

INSTANCE DIA_Caine_JadJaszczuraMAm (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 2;
   condition    = DIA_Caine_JadJaszczuraMAm_Condition;
   information  = DIA_Caine_JadJaszczuraMAm_Info;
   permanent	= FALSE;
   description	= "Mam jad jaszczura!";
};

FUNC INT DIA_Caine_JadJaszczuraMAm_Condition()
{
    if ((Npc_KnowsInfo (hero, DIA_Caine_300Oreive)) || (Npc_KnowsInfo (hero, DIA_Caine_MusMixCaine)))
    && (Npc_HasItems (other, ItMi_TruciznaJaszczura) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_JadJaszczuraMAm_Info()
{
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_01"); //Mam jad jaszczura!
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_02"); //Dobrze. Daj mi go.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_03"); //Potrzebny mi jeszcze jeden sk�adnik.
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_04"); //Co konkretnie?
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_05"); //Magiczne ziele.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_06"); //Jest jednak problem. Na bagnie ros�o tylko kilka tych zi�.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_07"); //Wszystkie zosta�y zebrane przez Nowicjuszy. 
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_08"); //Co za problem je odkupi�?
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_09"); //Nasi Nowicjusze nie s� tacy g�upi, jak ci si� wydaje.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_10"); //Wiedz�, �e to ziele jest niezwykle cenne. 
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_11"); //B�dziesz musia� jako� zdoby� jedn� sadzonk�.
    B_LogEntry                     (CH2_SickHunter,"Musz� zdoby� sadzonk� magicznego ziela. Jednak te ro�liny s� wy��cznie w posiadaniu Nowicjuszy pracuj�cych na bagnie.");
	B_GiveInvItems (hero, self, ItMi_TruciznaJaszczura, 1); //1.24
    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZdobylemZiele
//========================================

INSTANCE DIA_Caine_ZdobylemZiele (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_ZdobylemZiele_Condition;
   information  = DIA_Caine_ZdobylemZiele_Info;
   permanent	= FALSE;
   description	= "Zdoby�em magiczne ziele.";
};

FUNC INT DIA_Caine_ZdobylemZiele_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_JadJaszczuraMAm))
    && (Npc_HasItems (other, ItFo_Plants_MagicHerb_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_ZdobylemZiele_Info()
{
    AI_Output (other, self ,"DIA_Caine_ZdobylemZiele_15_01"); //Zdoby�em magiczne ziele.
    AI_Output (self, other ,"DIA_Caine_ZdobylemZiele_03_02"); //Daj mi je. Zaraz sporz�dz� mikstur�.
    B_GiveInvItems (other, self, ItFo_Plants_MagicHerb_01, 1);
    B_LogEntry                     (CH2_SickHunter,"Nowicjusz Caine otrzyma� wszystkie sk�adniki. Zaraz sporz�dzi mikstur�. ");

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> AntidotumKuhwy
//========================================

INSTANCE DIA_Caine_AntidotumKuhwy (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_AntidotumKuhwy_Condition;
   information  = DIA_Caine_AntidotumKuhwy_Info;
   permanent	= FALSE;
   description	= "Mikstura gotowa?";
};

FUNC INT DIA_Caine_AntidotumKuhwy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_ZdobylemZiele))
    && (MIS_SickHunter == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Caine_AntidotumKuhwy_Info()
{
    AI_Output (other, self ,"DIA_Caine_AntidotumKuhwy_15_01"); //Mikstura gotowa?
    AI_Output (self, other ,"DIA_Caine_AntidotumKuhwy_03_02"); //Tak. We� j� i spiesz si�!
	
    CreateInvItems (self, ItMi_AnitdotumNaJad, 1);
    B_GiveInvItems (self, other, ItMi_AnitdotumNaJad, 1);
	
    B_LogEntry                     (CH2_SickHunter,"Caine sporz�dzi� antidotum na jad. Zmarnowa�em ju� wiele czasu. Mam kilka minut na dotarcie z powrotem do obozu my�liwych.");
	FastTravel_Locked = true;
	PrintS_Ext ("Szybka podr� chwilowo zablokowana!",COL_Red);
    timer_ClawQuest = 5 * 60;
    AI_StopProcessInfos	(self);
};



//========================================
//-----------------> Gruzlik
//========================================

INSTANCE DIA_Caine_Gruzlik (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_Gruzlik_Condition;
   information  = DIA_Caine_Gruzlik_Info;
   permanent	= FALSE;
   description	= "Pos�aniec, kt�rego wys�a�e� do Fritza zosta� zabity...";
};

FUNC INT DIA_Caine_Gruzlik_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Fritz_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Caine_Gruzlik_Info()
{
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_01"); //Pos�aniec, kt�rego wys�a�e� do Fritza zosta� zabity nim dostarczy� mu mikstur� od ciebie.
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_02"); //O �ni�cy. To-to niemo�liwe. Teraz ten bie-biedak umrze.
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_03"); //Jeszcze �yje. Ale ma chyba ma�o czasu. Przygotuj dla niego t� mikstur� jeszcze raz a ja j� mu dostarcz�.
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_04"); //Ale ja nie mam ju� sk�a-sk�adnik�w!
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_05"); //Gdzie mog� je zdoby�?
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_06"); //Porozmawiaj z Fortuno, Baalem Orunem oraz tym wariatem Netbekiem.
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_07"); //Oni powinni mie� co trze-trzeba. 
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_08"); //A gdzie jest ta lista?
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_09"); //Trzy-trzymaj. Oto ona.
    B_GiveInvItems (self,other, ItWr_GRU_List, 1);	
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_10"); //Dzi�ki. Wkr�tce b�d� z powrotem.
	B_LogEntry               (Gruzlik,"Caine m�g�by przyrz�dzi� mikstur� lecznicz� dla Fritza ale brak mu sk�adnik�w. Potrzeba : W�owca, B�otnika i Mgie�ki. Ro�liny te powinni mie� Baal Netbek, Fortuno oraz Baal Orun.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> GR_IHAVE_PLANTS
//========================================

INSTANCE DIA_Caine_GR_IHAVE_PLANTS (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_GR_IHAVE_PLANTS_Condition;
   information  = DIA_Caine_GR_IHAVE_PLANTS_Info;
   permanent	= FALSE;
   description	= "Mam potrzebne ro�liny.";
};

FUNC INT DIA_Caine_GR_IHAVE_PLANTS_Condition()
{
if (Npc_HasItems (other, ItFo_SnakeHerb) >=1)
&& (Npc_HasItems (other, ItFo_MudHerb) >=1)
&& (Npc_HasItems (other, ItFo_MgiHerb) >=1)
//&& (Npc_HasItems (other, ItMi_Mod_TondralStaff) >=1)
{
    return TRUE;
};
};

FUNC VOID DIA_Caine_GR_IHAVE_PLANTS_Info()
{
    AI_Output (other, self ,"DIA_Caine_GR_IHAVE_PLANTS_15_01"); //Mam potrzebne ro�liny.
    AI_Output (self, other ,"DIA_Caine_GR_IHAVE_PLANTS_03_02"); //Zatem mi je daj.
    AI_Output (other, self ,"DIA_Caine_GR_IHAVE_PLANTS_15_03"); //Trzymaj.
    AI_Output (self, other ,"DIA_Caine_GR_IHAVE_PLANTS_03_04"); //Zaczekaj chwil�...
	B_GiveInvItems (other,self, ItFo_SnakeHerb, 1);
	B_GiveInvItems (other,self, ItFo_MudHerb, 1);
	B_GiveInvItems (other,self, ItFo_MgiHerb, 1);
	B_LogEntry               (Gruzlik,"Zanios�em ro�liny do Caine�a.");
};

//========================================
//-----------------> GR_Potion
//========================================

INSTANCE DIA_Caine_GR_Potion (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 2;
   condition    = DIA_Caine_GR_Potion_Condition;
   information  = DIA_Caine_GR_Potion_Info;
   permanent	= FALSE;
   Important    = TRUE;
   
   
};

FUNC INT DIA_Caine_GR_Potion_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Caine_GR_IHAVE_PLANTS))
{
    return TRUE;
};
};
FUNC VOID DIA_Caine_GR_Potion_Info()
{
    AI_Output (self, other ,"DIA_Caine_GR_Potion_03_01"); //Prosz�. O to lekarstwo.
	B_GiveInvItems (self,other, ItFo_Potion_Fritz02, 1);
    AI_Output (other, self ,"DIA_Caine_GR_Potion_15_02"); //Dzi�ki. Na mnie ju� czas.
    AI_Output (self, other ,"DIA_Caine_GR_Potion_03_03"); //Do zobaczenia.
	Npc_RemoveInvItems (Nov_1301_Caine, ItFo_MudHerb,1);
	Npc_RemoveInvItems (Nov_1301_Caine, ItFo_SnakeHerb,1);
	Npc_RemoveInvItems (Nov_1301_Caine, ItFo_MgiHerb,1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BG_HEART
//========================================

INSTANCE DIA_Caine_BG_HEART (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 1;
   condition    = DIA_Caine_BG_HEART_Condition;
   information  = DIA_Caine_BG_HEART_Info;
   permanent	= FALSE;
   description	= "Pono� co� ode mnie chcia�e�.";
};

FUNC INT DIA_Caine_BG_HEART_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_GorNaPol_BG_GOLEMS))
{
    return TRUE;
};
};
FUNC VOID DIA_Caine_BG_HEART_Info()
{
    AI_Output (other, self ,"DIA_Caine_BG_HEART_15_01"); //Pono� co� ode mnie chcia�e�.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_02"); //Tak istotnie mam dla ciebie pewn� misj�.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_03"); //Potrzebne mi serca bagiennych golem�w do pewnego eksperymentu. Jaki� p� tuzinnna dok�adnie m�wi�c.
    AI_Output (other,self  ,"DIA_Caine_BG_HEART_03_04"); //Mog� zgarn�� dla ciebie te serca. Ale to kosztuje.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_05"); //Oczywi�cie. Nagroda ci� nie ominie!
    AI_Output (other, self ,"DIA_Caine_BG_HEART_15_06"); //W porz�dku. Id� na polowanie.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_07"); //Powodzenia. �ni�cy Ci� ochroni.
    AI_Output (other, self ,"DIA_Caine_BG_HEART_15_08"); //Zobaczymy. 
	B_LogEntry               (BagienneGolemy,"Caine chce p� tuzina (6) serc bagiennego golema do jakiego� eksperymentu.");
};

//========================================
//-----------------> BG_IHAVE
//========================================

INSTANCE DIA_Caine_BG_IHAVE (C_INFO)
{
   npc          = Nov_1301_Caine;
   nr           = 2;
   condition    = DIA_Caine_BG_IHAVE_Condition;
   information  = DIA_Caine_BG_IHAVE_Info;
   permanent	= FALSE;
   description	= "Mam serca bagiennych golem�w.";
};

FUNC INT DIA_Caine_BG_IHAVE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_GorNaPol_BG_END))
	&& (Npc_HasItems (other, ItAt_SwampGolem_Heart) >=6)
{
    return TRUE;
};
};
FUNC VOID DIA_Caine_BG_IHAVE_Info()
{
    AI_Output (other, self ,"DIA_Caine_BG_IHAVE_15_01"); //Mam serca bagiennych golem�w.
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_02"); //Dzi�kuje babardzo. Mog� je zozobaczy�?
    AI_Output (other, self ,"DIA_Caine_BG_IHAVE_15_03"); //Oto one.
	B_GiveInvItems (other,self,  ItAt_SwampGolem_Heart, 6);
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_04"); //Idealnie! �wietna robota!
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_05"); //Widz�, �e dobry z ciebie wojownik!
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_06"); //We� to. To nagroda dla ciebie.
    AI_Output (other, self ,"DIA_Caine_BG_IHAVE_15_07"); //Dzi�ki.
	B_LogEntry               (BagienneGolemy,"Caine wyj�kiwa� si� rado�nie i wyp�aci� mi nale�n� rud� za serca bagiennych golem�w. To dobry interes.");
    AI_StopProcessInfos	(self);
};


