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
	description	= "Czeœæ, jestem tu nowy.";
};                       

FUNC int  DIA_Caine_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Hallo_Info()
{
	AI_Output (other, self,"DIA_Caine_Hallo_15_00"); //Czeœæ, jestem tu nowy.
	AI_Output (self, other,"DIA_Caine_Hallo_13_01"); //Ja... Ja jestem Caine, uczeñ Cor Kaloma. Zapewne ju¿ o nim s³ysza³eœ, co?
			
	Info_ClearChoices	(DIA_Caine_Hallo );
	Info_AddChoice		(DIA_Caine_Hallo,"Nie."	,DIA_Caine_Hallo_Nein);
	Info_AddChoice		(DIA_Caine_Hallo,"Tak."		,DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Ja_15_00"); //Tak.
	AI_Output (self, other,"DIA_Caine_Hallo_Ja_13_01"); //Zatem wiesz ju¿, ¿e to najwa¿niejszy cz³owiek w tym obozie, zaraz po Jaœnie Oœwieconym Y'Berionie.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Nein_15_00"); //Nie.
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_01"); //Nie?! Chyba jesteœ tu od niedawna, co?
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom to najwa¿niejszy cz³owiek w Bractwie, po Y'Berionie. To on decyduje, kto zostanie przyjêty w szeregi Nowicjuszy.
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
	description	= "A ty czym siê zajmujesz?";
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
	AI_Output (other, self,"DIA_Caine_Job_15_00"); //A ty czym siê zajmujesz?
	AI_Output (self, other,"DIA_Caine_Job_13_01"); //Pomagam mojemu mistrzowi w pracach nad jego magicznymi wywarami.
	AI_Output (self, other,"DIA_Caine_Job_13_02"); //G³ównie z ziela bagiennego i wydzieliny pe³zaczy. Swoj¹ drog¹, mój mistrz pilnie potrzebuje tej wydzieliny.
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
	description	= "Gdzie mogê zdobyæ tê... Wydzielinê pe³zaczy?";
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
	AI_Output (other, self,"DIA_Caine_WoSekret_15_00"); //Gdzie mogê zdobyæ tê... Wydzielinê pe³zaczy?
	AI_Output (self, other,"DIA_Caine_WoSekret_13_01"); //Stara Kopalnia a¿ roi siê od pe³zaczy, ale trzeba umieæ pozyskaæ ich wydzielinê.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_02"); //Jeœli powa¿nie myœlisz o walce z pe³zaczami, porozmawiaj z którymœ ze Stra¿ników trudni¹cych siê polowaniem na nie. Na przyk³ad z Gor Na Drakiem.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_03"); //On ka¿dego dnia wyrusza z naszego Obozu do Starej Kopalni. O œwicie znajdziesz go w pobli¿u laboratorium.
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
	description	= "Co mo¿esz mi jeszcze powiedzieæ o swoim mistrzu?";
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
	AI_Output (other, self,"DIA_Caine_AddInfoKalom_15_00"); //Co mo¿esz mi jeszcze powiedzieæ o swoim mistrzu?
	AI_Output (self, other,"DIA_Caine_AddInfoKalom_13_01"); //Jest inny ni¿ pozostali Guru. Ka¿dy mo¿e siê do niego odezwaæ, ale NIKOMU nie wolno marnowaæ jego cennego czasu.
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
	description		= "Jak mogê zdobyæ recepturê Kaloma?"; 
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
	AI_Output (other, self,"Nov_1301_Caine_CHEST_Info_15_01"); //Jak mogê zdobyæ recepturê Kaloma?
	AI_Output (self, other,"Nov_1301_Caine_CHEST_Info_13_02"); //Nie mo¿esz. Wszystkie receptury przechowywane s¹ w zamkniêtej skrzyni.
};  

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
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
    AI_Output (self, other ,"DIA_Caine_Exposed_03_01"); //Co ty tutaj robisz? Sk¹d wiedzia³eœ, ¿e tu bêdê?
    AI_Output (other, self ,"DIA_Caine_Exposed_15_02"); //Wyda³ ciê jeden z twoich odbiorców. Wystarczy³o go odpowiednio zmotykowaæ...
	AI_Output (self, other ,"DIA_Caine_Exposed_03_03"); //Dlaczego zacz¹³eœ wokó³ mnie wêszyæ? Na co ci to by³o? Powinieneœ rozumieæ, ¿e tutaj ten, kto nie kombinuje, szybko ginie.
    AI_Output (other, self ,"DIA_Caine_Exposed_15_04"); //Spraw¹ eliksiru zainteresowali siê Guru. Shan kaza³ mi to sprawdziæ.
    AI_Output (self, other ,"DIA_Caine_Exposed_03_05"); //Zaczekaj! Czy ty powiedzia³eœ Guru?
    AI_Output (self, other ,"DIA_Caine_Exposed_03_06"); //Nie chcê k³opotów.
    AI_Output (other, self ,"DIA_Caine_Exposed_15_07"); //Trochê na to za póŸno.

    AI_Output (self, other ,"DIA_Caine_Exposed_03_08"); //Poczekaj, dam ci wszystko co do tej pory zarobi³em, jeœli mnie nie wydasz. Bedzie tego z 500 bry³ek rudy!

	B_LogEntry     (CH3_SellElixer,"Noc¹, w umówionym miejscu spotka³em nikogo innego jak Caine'a. Mog³em siê tego domyœleæ. Ten Nowicjusz ca³e dnie spêdza z Cor Kalomem. Mia³ ³atwy dostêp do receptury. Zaproponowa³ mi, ¿e jeœli go nie wydam, otrzymam 500 bry³ek rudy. Muszê podj¹æ decyzjê, co z nim zrobiê.");
	
    Info_ClearChoices	(DIA_Caine_Exposed);
    Info_AddChoice		(DIA_Caine_Exposed, "Zapomnij. Mistrz Shan o wszystkim siê dowie!", DIA_Caine_Exposed_Nope);
    Info_AddChoice		(DIA_Caine_Exposed, "Dobra. Umowa stoi.", DIA_Caine_Exposed_Money);
};

FUNC VOID DIA_Caine_Exposed_Nope()
{
    AI_Output (other, self ,"DIA_Caine_Exposed_Nope_15_01"); //Zapomnij. Mistrz Shan o wszystkim siê dowie!
    AI_Output (self, other ,"DIA_Caine_Exposed_Nope_03_02"); //Jesteœ g³upcem. Bêdziesz tego ¿a³owa³, gdy przyciœnie ciê bieda jak mnie!
    AI_Output (other, self ,"DIA_Caine_Exposed_Nope_15_03"); //Skoñcz ju¿ tê paplaninê.
	
    B_LogEntry    (CH3_SellElixer,"Zdecydowa³em, ¿e Caine zas³u¿y³ na karê. Mam zamiar powiedzieæ o wszystkim Shan'owi.");
	CaineFriend = false;
    Info_ClearChoices		(DIA_Caine_Exposed);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"start");
};

FUNC VOID DIA_Caine_Exposed_Money()
{
    AI_Output (other, self ,"DIA_Caine_Exposed_Money_15_01"); //Dobra. Umowa stoi!
    AI_Output (self, other ,"DIA_Caine_Exposed_Money_03_02"); //Œwietnie. Oto twoja ruda. Jestem ci naprawdê wdziêczny...
    AI_Output (self, other ,"DIA_Caine_Exposed_Money_03_03"); //Tylko nikomu ani s³owa!
	
    B_LogEntry    (CH3_SellElixer,"Przyj¹³em rudê od Caine. Kolonia to miejsce, w którym najwa¿niejsza jest ruda. Pe³na sakiewka mo¿e mi kiedyœ uratowaæ ¿ycie. Muszê teraz jakoœ wyt³umaczyæ siê Shan'owi.");
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
   description	= "Potrzebujê odtrutki na jad jaszczura!";
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
    AI_Output (other, self ,"DIA_Caine_JadJaszczura_15_01"); //Potrzebujê odtrutki na jad jaszczura!
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_02"); //Mam teraz du¿o pracy dla Cor Kaloma...
    AI_Output (other, self ,"DIA_Caine_JadJaszczura_15_03"); //Nie rozumiesz?! Ten myœliwy mo¿e zgin¹æ.
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_04"); //Nie znam twojego przyjaciela. 
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_05"); //Nie obchodzi mnie jego ¿ycie, ale skoro tak ci na tym zale¿y, to pewnie nie posk¹pisz kilku bry³ek rudy.
    AI_Output (self, other ,"DIA_Caine_JadJaszczura_03_06"); //300 bry³ek i powiem ci co robiæ.
    B_LogEntry                     (CH2_SickHunter,"Caine pomo¿e mi za 300 bry³ek rudy. Chyba nie mam wyboru. ");
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
   description	= "No dobra! Bierz rudê! ";
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
    AI_Output (other, self ,"DIA_Caine_300Oreive_15_01"); //No dobra! Bierz rudê! 
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_02"); //Widaæ, bardzo ci zale¿y.
    B_GiveInvItems (other, self, ItMiNugget, 300);
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_03"); //W porz¹dku. Pomogê ci.
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_04"); //Aby stworzyæ odtrutkê, potrzebujê jadu jaszczura, który ugryz³ twojego przyjaciela.
    AI_Output (self, other ,"DIA_Caine_300Oreive_03_05"); //Przynieœ mi go jak najprêdzej.
    B_LogEntry                     (CH2_SickHunter,"Caine chce, abym przyniós³ mu jad jaszczura, który pogryz³ Clawa. ");
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
   description	= "Y'Berion nakaza³ ci sporz¹dziæ miksturê.";
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
    AI_Output (other, self ,"DIA_Caine_MusMixCaine_15_01"); //Y'Berion nakaza³ ci sporz¹dziæ miksturê.
    AI_Output (other, self ,"DIA_Caine_MusMixCaine_15_02"); //Nie obchodzi mnie czy tego chcesz. To rozkaz Mistrza!
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_03"); //Przekabaci³eœ staruszka?! He he. 
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_04"); //No dobra. Aby stworzyæ odtrutkê potrzebujê jadu jaszczura, który ugryz³ twojego przyjaciela.
    AI_Output (self, other ,"DIA_Caine_MusMixCaine_03_05"); //Przynieœ mi go jak najprêdzej.
	B_LogEntry                     (CH2_SickHunter,"Caine chce, abym przyniós³ mu jad jaszczura, który pogryz³ Clawa. ");
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
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_03"); //Potrzebny mi jeszcze jeden sk³adnik.
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_04"); //Co konkretnie?
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_05"); //Magiczne ziele.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_06"); //Jest jednak problem. Na bagnie ros³o tylko kilka tych zió³.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_07"); //Wszystkie zosta³y zebrane przez Nowicjuszy. 
    AI_Output (other, self ,"DIA_Caine_JadJaszczuraMAm_15_08"); //Co za problem je odkupiæ?
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_09"); //Nasi Nowicjusze nie s¹ tacy g³upi, jak ci siê wydaje.
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_10"); //Wiedz¹, ¿e to ziele jest niezwykle cenne. 
    AI_Output (self, other ,"DIA_Caine_JadJaszczuraMAm_03_11"); //Bêdziesz musia³ jakoœ zdobyæ jedn¹ sadzonkê.
    B_LogEntry                     (CH2_SickHunter,"Muszê zdobyæ sadzonkê magicznego ziela. Jednak te roœliny s¹ wy³¹cznie w posiadaniu Nowicjuszy pracuj¹cych na bagnie.");
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
   description	= "Zdoby³em magiczne ziele.";
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
    AI_Output (other, self ,"DIA_Caine_ZdobylemZiele_15_01"); //Zdoby³em magiczne ziele.
    AI_Output (self, other ,"DIA_Caine_ZdobylemZiele_03_02"); //Daj mi je. Zaraz sporz¹dzê miksturê.
    B_GiveInvItems (other, self, ItFo_Plants_MagicHerb_01, 1);
    B_LogEntry                     (CH2_SickHunter,"Nowicjusz Caine otrzyma³ wszystkie sk³adniki. Zaraz sporz¹dzi miksturê. ");

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
    AI_Output (self, other ,"DIA_Caine_AntidotumKuhwy_03_02"); //Tak. WeŸ j¹ i spiesz siê!
	
    CreateInvItems (self, ItMi_AnitdotumNaJad, 1);
    B_GiveInvItems (self, other, ItMi_AnitdotumNaJad, 1);
	
    B_LogEntry                     (CH2_SickHunter,"Caine sporz¹dzi³ antidotum na jad. Zmarnowa³em ju¿ wiele czasu. Mam kilka minut na dotarcie z powrotem do obozu myœliwych.");
	FastTravel_Locked = true;
	PrintS_Ext ("Szybka podró¿ chwilowo zablokowana!",COL_Red);
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
   description	= "Pos³aniec, którego wys³a³eœ do Fritza zosta³ zabity...";
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
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_01"); //Pos³aniec, którego wys³a³eœ do Fritza zosta³ zabity nim dostarczy³ mu miksturê od ciebie.
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_02"); //O Œni¹cy. To-to niemo¿liwe. Teraz ten bie-biedak umrze.
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_03"); //Jeszcze ¿yje. Ale ma chyba ma³o czasu. Przygotuj dla niego t¹ miksturê jeszcze raz a ja j¹ mu dostarczê.
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_04"); //Ale ja nie mam ju¿ sk³a-sk³adników!
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_05"); //Gdzie mogê je zdobyæ?
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_06"); //Porozmawiaj z Fortuno, Baalem Orunem oraz tym wariatem Netbekiem.
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_07"); //Oni powinni mieæ co trze-trzeba. 
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_08"); //A gdzie jest ta lista?
    AI_Output (self, other ,"DIA_Caine_Gruzlik_03_09"); //Trzy-trzymaj. Oto ona.
    B_GiveInvItems (self,other, ItWr_GRU_List, 1);	
    AI_Output (other, self ,"DIA_Caine_Gruzlik_15_10"); //Dziêki. Wkrótce bêdê z powrotem.
	B_LogEntry               (Gruzlik,"Caine móg³by przyrz¹dziæ miksturê lecznicz¹ dla Fritza ale brak mu sk³adników. Potrzeba : Wê¿owca, B³otnika i Mgie³ki. Roœliny te powinni mieæ Baal Netbek, Fortuno oraz Baal Orun.");
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
   description	= "Mam potrzebne roœliny.";
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
    AI_Output (other, self ,"DIA_Caine_GR_IHAVE_PLANTS_15_01"); //Mam potrzebne roœliny.
    AI_Output (self, other ,"DIA_Caine_GR_IHAVE_PLANTS_03_02"); //Zatem mi je daj.
    AI_Output (other, self ,"DIA_Caine_GR_IHAVE_PLANTS_15_03"); //Trzymaj.
    AI_Output (self, other ,"DIA_Caine_GR_IHAVE_PLANTS_03_04"); //Zaczekaj chwilê...
	B_GiveInvItems (other,self, ItFo_SnakeHerb, 1);
	B_GiveInvItems (other,self, ItFo_MudHerb, 1);
	B_GiveInvItems (other,self, ItFo_MgiHerb, 1);
	B_LogEntry               (Gruzlik,"Zanios³em roœliny do Caine’a.");
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
    AI_Output (self, other ,"DIA_Caine_GR_Potion_03_01"); //Proszê. O to lekarstwo.
	B_GiveInvItems (self,other, ItFo_Potion_Fritz02, 1);
    AI_Output (other, self ,"DIA_Caine_GR_Potion_15_02"); //Dziêki. Na mnie ju¿ czas.
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
   description	= "Ponoæ coœ ode mnie chcia³eœ.";
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
    AI_Output (other, self ,"DIA_Caine_BG_HEART_15_01"); //Ponoæ coœ ode mnie chcia³eœ.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_02"); //Tak istotnie mam dla ciebie pewn¹ misjê.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_03"); //Potrzebne mi serca bagiennych golemów do pewnego eksperymentu. Jakiœ pó³ tuzinnna dok³adnie mówi¹c.
    AI_Output (other,self  ,"DIA_Caine_BG_HEART_03_04"); //Mogê zgarn¹æ dla ciebie te serca. Ale to kosztuje.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_05"); //Oczywiœcie. Nagroda ciê nie ominie!
    AI_Output (other, self ,"DIA_Caine_BG_HEART_15_06"); //W porz¹dku. Idê na polowanie.
    AI_Output (self, other ,"DIA_Caine_BG_HEART_03_07"); //Powodzenia. Œni¹cy Ciê ochroni.
    AI_Output (other, self ,"DIA_Caine_BG_HEART_15_08"); //Zobaczymy. 
	B_LogEntry               (BagienneGolemy,"Caine chce pó³ tuzina (6) serc bagiennego golema do jakiegoœ eksperymentu.");
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
   description	= "Mam serca bagiennych golemów.";
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
    AI_Output (other, self ,"DIA_Caine_BG_IHAVE_15_01"); //Mam serca bagiennych golemów.
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_02"); //Dziêkuje babardzo. Mogê je zozobaczyæ?
    AI_Output (other, self ,"DIA_Caine_BG_IHAVE_15_03"); //Oto one.
	B_GiveInvItems (other,self,  ItAt_SwampGolem_Heart, 6);
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_04"); //Idealnie! Œwietna robota!
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_05"); //Widzê, ¿e dobry z ciebie wojownik!
    AI_Output (self, other ,"DIA_Caine_BG_IHAVE_03_06"); //WeŸ to. To nagroda dla ciebie.
    AI_Output (other, self ,"DIA_Caine_BG_IHAVE_15_07"); //Dziêki.
	B_LogEntry               (BagienneGolemy,"Caine wyj¹kiwa³ siê radoœnie i wyp³aci³ mi nale¿n¹ rudê za serca bagiennych golemów. To dobry interes.");
    AI_StopProcessInfos	(self);
};


