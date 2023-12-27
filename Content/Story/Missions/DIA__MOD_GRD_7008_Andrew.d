//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Andrew_EXIT(C_INFO)
{
	npc             = GRD_7008_Tukash;
	nr              = 999;
	condition		= DIA_Andrew_EXIT_Condition;
	information		= DIA_Andrew_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Andrew_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Andrew_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Andrew_HELLO (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_HELLO_Condition;
   information  = DIA_Andrew_HELLO_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Andrew_HELLO_Condition()
{
	if (Kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HELLO_15_01");//Kim jesteœ?
    AI_Output (self, other ,"DIA_Andrew_HELLO_15_02");//Nazywam siê Andrew, handlarz. W zamian za rudê mogê ciê porz¹dnie wyposa¿yæ. Kilofy, ubrania robocze, dobre ¿arcie. Ogólnie mówi¹c mam wszystko, co potrzeba. 
	AI_Output (self, other ,"DIA_Andrew_HELLO_15_03");//W Starej Kopalni jest naprawdê ciê¿ko dostaæ przyzwoite towary. Zachêcam, sprawdŸ moj¹ ofertê.
	
	Log_CreateTopic (GE_MineCamp,LOG_NOTE);
    B_LogEntry      (GE_MineCamp,"Tukash handluje ró¿noœciami. Znajdê go w obozie przy Starej Kopalni.");
};

//========================================
//-----------------> HANDEL
//========================================

INSTANCE DIA_Andrew_HANDEL (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 99;
   condition    = DIA_Andrew_HANDEL_Condition;
   information  = DIA_Andrew_HANDEL_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy.";
};

FUNC INT DIA_Andrew_HANDEL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_HELLO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_HANDEL_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HANDEL_15_01"); //Pohandlujmy.
    AI_Output (self, other ,"DIA_Andrew_HANDEL_03_02"); //Proszê, wybierz coœ!
	B_ClearTreaderAmmo(self);

};

//========================================
//-----------------> WEJSCIE
//========================================

INSTANCE DIA_Andrew_WEJSCIE (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 3;
   condition    = DIA_Andrew_WEJSCIE_Condition;
   information  = DIA_Andrew_WEJSCIE_Info;
   permanent	= FALSE;
   description	= "Pomo¿esz mi wejœæ do kopalni?";
};

FUNC INT DIA_Andrew_WEJSCIE_Condition()
{
	if (Kapitel < 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_WEJSCIE_Info()
{
    AI_Output (other, self ,"DIA_Andrew_WEJSCIE_15_01"); //Pomo¿esz mi wejœæ do kopalni?
    AI_Output (self, other ,"DIA_Andrew_WEJSCIE_03_02"); //Dopóki nie bêdziesz jednym z nas lub tych œwirów z Sekty, nie masz najmniejszych szans siê tam dostaæ. 
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_03_03"); //Od niedawna wesz³y nowe zasady, których Stra¿nicy bardzo wiernie pilnuj¹. ¯adna szumowina nie wejdzie ju¿ do Starej Kopalni. 
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_15_04"); //Wczeœniej ka¿dy móg³ swobodnie tam wchodziæ?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_03_05"); //Raczej nie by³o wiêkszych k³opotów. Stra¿ników ³atwo mo¿na by³o przekupiæ, albo zdobyæ ich zaufanie. Ale nie teraz...
	Info_ClearChoices	(DIA_Andrew_WEJSCIE);
	//Info_AddChoice		(DIA_Andrew_WEJSCIE, DIALOG_BACK, DIA_Andrew_WEJSCIE_BACK);
    Info_AddChoice		(DIA_Andrew_WEJSCIE, "Dlaczego Sekciarze wchodz¹ swobodnie?", DIA_Andrew_WEJSCIE_PSI);
	Info_AddChoice		(DIA_Andrew_WEJSCIE, "Dlaczego wprowadzono nowe zasady?", DIA_Andrew_WEJSCIE_RULES);
	Info_AddChoice		(DIA_Andrew_WEJSCIE, "Stra¿ników na pewno nie da siê przekupiæ?", DIA_Andrew_WEJSCIE_PAY);
	Info_AddChoice		(DIA_Andrew_WEJSCIE, "To jak najszybciej siê tam dostaæ?", DIA_Andrew_WEJSCIE_QUICKLY);	
};

//func void DIA_Andrew_WEJSCIE_BACK ()
//{
//	Info_ClearChoices	(DIA_Andrew_WEJSCIE);
//};

func void DIA_Andrew_WEJSCIE_PSI ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_PSI_15_01"); //Dlaczego Sekciarze wchodz¹ swobodnie?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PSI_03_02"); //Miêdzy Bractwem, a Starym Obozem istnieje pewna umowa. To ju¿ wielka polityka, tak¿e nie pytaj mnie o to. 
};

func void DIA_Andrew_WEJSCIE_RULES ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_RULES_15_01"); //Dlaczego wprowadzono nowe zasady?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_RULES_03_02"); //Jak to dlaczego? Przez Szkodników i tych cholernych Bandziorów. Te sukinsyny pojawia³y siê w Kopalni, ¿eby wyci¹gaæ informacje o konwojach.
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_RULES_03_03"); //Dziêki temu planowali napady i rabowali wszystko co siê da morduj¹c naszych ludzi. Niektórzy szmuglowali rudê, podjudzali Kopaczy do buntu...
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_RULES_03_04"); //Problemów by³o co nie miara. Teraz jest w miarê spokojnie. 
};

func void DIA_Andrew_WEJSCIE_PAY ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_PAY_15_01"); //Stra¿ników na pewno nie da siê przekupiæ?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PAY_03_02"); //Nie ma takiej mo¿liwoœci. Wielu cwaniaczków ju¿ próbowa³o. Ich trupy s¹ teraz zakopane gdzieœ przy Kopalni. 
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PAY_03_03"); //Nasi ludzie s¹ BARDZO konsekwentni jeœli chodzi o nowe zasady. Nie³atwo zdobyæ teraz zaufanie. Ka¿dy mo¿e byæ szpiegiem, rabusiem czy inn¹ gnid¹.
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_PAY_03_04"); //Chocia¿... Mój ojciec zawsze mawia³, ¿e ludzie to sukinsyny i nie nale¿y im ufaæ. Byæ mo¿e gdybym go pos³ucha³, nie siedzia³bym tu teraz.
};

func void DIA_Andrew_WEJSCIE_QUICKLY ()
{
	AI_Output (other, self ,"DIA_Andrew_WEJSCIE_QUICKLY_15_01"); //To jak najszybciej siê tam dostaæ?
	AI_Output (self, other ,"DIA_Andrew_WEJSCIE_QUICKLY_03_02"); //Diego? Lorenzo? Mówi¹ ci coœ te imiona? Z nimi pogadaj. Nie ma INNEGO sposobu, ¿eby zostaæ jednym z nas. 
};

//========================================
//-----------------> QUEST
//========================================
var int can_andrewhelp;
INSTANCE DIA_Andrew_QUEST (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 4;
   condition    = DIA_Andrew_QUEST_Condition;
   information  = DIA_Andrew_QUEST_Info;
   permanent	= 1;
   description	= "Mogê ci jakoœ pomóc?";
};

FUNC INT DIA_Andrew_QUEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_HELLO)) && (Kapitel < 4) && (can_andrewhelp == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_QUEST_Info()
{
    AI_Output (other, self ,"DIA_Andrew_QUEST_15_01"); //Mogê ci jakoœ pomóc?
	if (Npc_GetTrueGuild(hero) == GIL_STT) ||  (Npc_GetTrueGuild(hero) == GIL_GRD)
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_02"); //Widzê, ¿e do nas do³¹czy³eœ i przeszed³eœ ju¿ jakieœ przeszkolenie bojowe. Nie jesteœ ju¿ tym samym frajerem, który zjawi³ siê tu tak niedawno.
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_03"); //M¹drze wybra³eœ. To siê bardzo chwali. Stary Obóz jest miejscem dla ciebie. 
    AI_Output (other, self ,"DIA_Andrew_QUEST_15_04"); //Powiedz mi co mam zrobiæ.
    AI_Output (self, other ,"DIA_Andrew_QUEST_03_05"); //Pójdziesz ze mn¹ na spotkanie z pewnym paserem z Nowego Obozu. Zalegam mu z op³atami i chcia³em trochê przed³u¿yæ termin sp³aty. 
    AI_Output (self, other ,"DIA_Andrew_QUEST_03_06"); //Jednak spodziewam siê brudnych sztuczek z jego strony. W razie czego pomo¿esz mi, jeœli dosz³oby do rêkoczynów.
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_07"); //Interesuje ciê taka robota?
	
	DIA_Andrew_QUEST.permanent = 0;
	can_andrewhelp = true;
	Info_ClearChoices	(DIA_Andrew_QUEST);
	Info_AddChoice		(DIA_Andrew_QUEST, "Raczej nie.", DIA_Andrew_QUEST_NOPE);
    Info_AddChoice		(DIA_Andrew_QUEST, "Jasne, powinniœmy sobie pomagaæ.", DIA_Andrew_QUEST_OFC);
	} 
	else if (Npc_GetTrueGuild(hero) == GIL_VLK) || (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_08"); //Co? Taki nêdzy brudas na nic mi siê nie przyda. Gdybyœ umia³ walczyæ mo¿e mia³bym coœ dla ciebie. Choæ te¿ nie dzisiaj. Sprawa siê musi wyjaœniæ.
	AI_Output (other,self  ,"DIA_Andrew_QUEST_15_09"); //Co musia³bym spe³niæ ¿eby dostaæ to zlecenie?
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_10"); //Byæ rozgarniêtym i potrafiæ siê obroniæ. 
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_11"); //Do Starego Obozu byle kogo nie przyjmuj¹.
	AI_Output (other,self  ,"DIA_Andrew_QUEST_15_12"); //Czyli jeœli siê do niego przy³¹cze bêdziesz mia³ dla mnie t¹ robotê?
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_13"); //Wtedy tak.
	}
	else if (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_GUR)
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_14"); //Umiesz walczyæ? Nie wiem jak w tym waszym Obozie wygl¹da przeszkolenie bojowe...
	AI_Output (other, self ,"DIA_Andrew_QUEST_15_15"); //Jasne, mów czego ci potrzeba.
	
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_16"); //Pójdziesz ze mn¹ na spotkanie z pewnym paserem z Nowego Obozu. Zalegam mu z op³atami i chcia³em trochê przed³u¿yæ termin sp³aty. 
    AI_Output (self, other ,"DIA_Andrew_QUEST_03_17"); //Jednak spodziewam siê brudnych sztuczek z jego strony. W razie czego pomo¿esz mi, jeœli dosz³oby do rêkoczynów.
	AI_Output (self, other ,"DIA_Andrew_QUEST_03_18"); //Interesuje ciê taka robota?
	
	can_andrewhelp = true;
	Info_ClearChoices	(DIA_Andrew_QUEST);
	Info_AddChoice		(DIA_Andrew_QUEST, "Raczej nie.", DIA_Andrew_QUEST_NOPE);
    Info_AddChoice		(DIA_Andrew_QUEST, "Jasne, powinniœmy sobie pomagaæ.", DIA_Andrew_QUEST_OFC);
	}
	else 
	{
	AI_Output (self, other ,"DIA_Andrew_QUEST_15_19"); //Nie potrzebujê pomocy kogoœ takiego jak ty!
	
	DIA_Andrew_QUEST.permanent = 0;
	can_andrewhelp = true;
	};
};

func void DIA_Andrew_QUEST_NOPE ()
{
	AI_Output (other, self ,"DIA_Andrew_QUEST_NOPE_15_01"); //Raczej nie.
	AI_Output (self, other ,"DIA_Andrew_QUEST_NOPE_03_02"); //le ciê oceni³em... 
	AI_StopProcessInfos (self);
	Info_ClearChoices (DIA_Andrew_QUEST);
};

func void DIA_Andrew_QUEST_OFC ()
{
	AI_Output (other, self ,"DIA_Andrew_QUEST_OFC_15_01"); //Jasne, powinniœmy sobie pomagaæ.
	AI_Output (self, other ,"DIA_Andrew_QUEST_OFC_03_02"); //I takiej odpowiedzi oczekiwa³em! Powiedz, gdy bêdziesz gotów.
	
	MIS_Bodyguard = LOG_RUNNING;

    Log_CreateTopic            	(CH1_Bodyguard, LOG_MISSION);
    Log_SetTopicStatus       	(CH1_Bodyguard, LOG_RUNNING);
    B_LogEntry                  (CH1_Bodyguard,"Andrew ma niema³e k³opoty z paserem z Nowego Obozu. Handlarz z obozu przed kopalni¹ jest winny Szkodnikowi 250 bry³ek rudy. Mam iœæ z nim i chroniæ go, podczas gdyby jego kontrahent nie by³ zbyt skory do negocjacji.");
	Info_ClearChoices 	(DIA_Andrew_QUEST);
};
    
//========================================
//-----------------> LETSGONNAHATE
//========================================

INSTANCE DIA_Andrew_LETSGONNAHATE (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 6;
   condition    = DIA_Andrew_LETSGONNAHATE_Condition;
   information  = DIA_Andrew_LETSGONNAHATE_Info;
   permanent	= FALSE;
   description	= "ChodŸmy do Sharky'ego!";
};

FUNC INT DIA_Andrew_LETSGONNAHATE_Condition()
{
    if  (MIS_Bodyguard == LOG_RUNNING) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_LETSGONNAHATE_Info()
{
    AI_Output (other, self ,"DIA_Andrew_LETSGONNAHATE_15_01"); //ChodŸmy do Sharky'ego!
    AI_Output (self, other ,"DIA_Andrew_LETSGONNAHATE_03_02"); //Dobra, ruszajmy.
    AI_Output (self, other ,"DIA_Andrew_LETSGONNAHATE_03_03"); //Zaprowadzê ciê.
	if (!Npc_KnowsInfo (hero, DIA_Berg_GIVE_RING)) || (!Npc_KnowsInfo (hero, DIA_Berg_WARN))
	{
	Npc_ExchangeRoutine (GRD_3934_Berg,"quest_aidan");
	};
   	GRD_7008_Tukash.aivar[AIV_PARTYMEMBER] = TRUE;
   	Npc_ExchangeRoutine (GRD_7008_Tukash,"atak");
	
	Npc_ExchangeRoutine (ORG_810_Organisator,"przydupas");
	Npc_ExchangeRoutine (ORG_807_Organisator,"przydupas");
	Npc_ExchangeRoutine (SLD_5575_Alvaro,"przydupas");

	//B_ChangeGuild    (ORG_810_Organisator,GIL_DMB);
	//B_ChangeGuild    (ORG_807_Organisator,GIL_DMB);
	//B_ChangeGuild    (SLD_5575_Alvaro,GIL_DMB);
	
	Npc_ExchangeRoutine (ORG_843_Sharky,"catch");
	
	B_SetPermAttitude	(GRD_7008_Tukash,	ATT_FRIENDLY);
	GRD_7008_Tukash.flags = 2;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO7
//========================================

INSTANCE DIA_Andrew_HELLO7 (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 7;
   condition    = DIA_Andrew_HELLO7_Condition;
   information  = DIA_Andrew_HELLO7_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Andrew_HELLO7_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_LETSGONNAHATE))
    && (Npc_GetDistToWP (self, "OW_PATH_058") < 1000)
    {
    return TRUE;
    };
};
 

FUNC VOID DIA_Andrew_HELLO7_Info()
{
    AI_Output (self, other ,"DIA_Andrew_HELLO7_03_01"); //Spójrz, s¹ po drugiej stronie mostu. Wydaje mi siê, ¿e nie s¹ przyjaŸnie nastawieni. 
    AI_Output (self, other ,"DIA_Andrew_HELLO7_03_02"); //Jest tam gdzieœ Sharky? Nie widzê go co znaczy, ¿e drañ nas oszuka³.
	AI_Output (self, other ,"DIA_Andrew_HELLO7_03_03"); //Widzisz tego Najemnika? To Alvaro, wielki si³acz. Zaatakujmy z zaskoczenia. To da nam przewagê.
    AI_Output (other, self ,"DIA_Andrew_HELLO7_15_04"); //Czyli ju¿ po negocjacjach. Wobec tego jak dowiemy siê gdzie jest Sharky? 
    AI_Output (self, other ,"DIA_Andrew_HELLO7_03_05"); //Oszczêdzimy Szkodnika Greavera. Nie raz gra³em z cwaniakiem w koœci. Teraz pora mu je obiæ wtedy wszystko wyœpiewa. 
    AI_Output (self, other ,"DIA_Andrew_HELLO7_03_06"); //A pozosta³ych dwóch zabij!
    B_LogEntry                     (CH1_Bodyguard,"Sharky nie pojawi³ siê na moœcie. Zamiast niego sta³o tam trzech osi³ków. Andrew postanowi³, ¿e od razu zaatakujemy przeciwników. Muszê uwa¿aæ na Alvaro. Ponoæ to silny Najemnik z Nowego Obozu. Natomiast Szkodnik Greaver musi prze¿yæ by powiedzia³ gdzie jest Sharky.");
	Npc_ExchangeRoutine (GRD_7008_Tukash,"atak2");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Wygrana
//========================================

INSTANCE DIA_Andrew_Wygrana (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_Wygrana_Condition;
   information  = DIA_Andrew_Wygrana_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Andrew_Wygrana_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_HELLO7))
	&& (Npc_KnowsInfo (hero, DIA_Organisator_ANDREW))
    && (Npc_IsDead(ORG_810_Organisator))
    && (Npc_IsDead(SLD_5575_Alvaro))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_Wygrana_Info()
{
    AI_Output (self, other ,"DIA_Andrew_Wygrana_03_01"); //Zatem wszystko jasne z naszym ulubionym paserem.
    AI_Output (other, self ,"DIA_Andrew_Wygrana_15_02"); //Poœpieszmy siê bo znowu gdzieœ czmychnie. 
    AI_Output (self, other ,"DIA_Andrew_Wygrana_03_03"); //Musimy dorwaæ Sharky'ego. ProwadŸ.
   
	Npc_ExchangeRoutine (GRD_7008_Tukash,"follow");
    AI_StopProcessInfos	(GRD_7008_Tukash);
}; 

//========================================
//-----------------> FindSharky
//========================================

INSTANCE DIA_Andrew_FindSharky (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_FindSharky_Condition;
   information  = DIA_Andrew_FindSharky_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Andrew_FindSharky_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Andrew_Wygrana))
	&& (Npc_KnowsInfo (hero, Org_843_Sharky_CATCHED))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Andrew_FindSharky_Info()
{
    AI_Output (self, other ,"DIA_Andrew_FindSharky_03_01"); //No nieŸle, gdyby nie ty ich zasadzka pewnie by siê uda³a.
	AI_Output (self, other ,"DIA_Andrew_FindSharky_03_02"); //Jestem ci bardzo wdziêczny. WeŸ to w nagrodê.
    AI_Output (other, self ,"DIA_Andrew_FindSharky_15_03"); //Nastêpnym razem rób interesy z kimœ ze Starego Obozu.
    AI_Output (self, other ,"DIA_Andrew_FindSharky_03_04"); //Bêdê pamiêta³, jeszcze raz dziêki.
    B_LogEntry                     (CH1_Bodyguard,"Sharky darowa³ Andrewowi wszystkie d³ugi, bo ba³ siê, ¿e zrobimy z nim to, co on chcia³ zrobiæ z nami. Wszystko wróci³o do normy, a moje zlecenie skoñczone.");
    Log_SetTopicStatus       (CH1_Bodyguard, LOG_SUCCESS);
    MIS_Bodyguard = LOG_SUCCESS;
    B_GiveXP (200);
	CreateInvItem (self,Schutzring_Waffen1);
	B_GiveInvItems (self, other, Schutzring_Waffen1, 1);
	GRD_7008_Tukash.aivar[AIV_PARTYMEMBER] = false;
    B_SetPermAttitude	(GRD_7008_Tukash,ATT_NEUTRAL);
    Npc_ExchangeRoutine (GRD_7008_Tukash,"start");
    AI_StopProcessInfos	(GRD_7008_Tukash);
	
	if (!Npc_KnowsInfo (hero, DIA_Berg_GIVE_RING)) || (!Npc_KnowsInfo (hero, DIA_Berg_WARN))
	{
	Npc_ExchangeRoutine (GRD_3934_Berg,"quest");
	};
}; 



/////////////////////////////////////////////////////
// Andrew
// Rozdzia³ 4
// Obóz Bandytów
/////////////////////////////////////////////////////

//========================================
//-----------------> HEY1
//========================================

INSTANCE DIA_Andrew_HEY1 (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_HEY1_Condition;
   information  = DIA_Andrew_HEY1_Info;
   permanent	= FALSE;
   description	= "Co ty tu robisz?!";
};

FUNC INT DIA_Andrew_HEY1_Condition()
{
	if (Kapitel >= 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_HEY1_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HEY1_15_01"); //Co ty tu robisz?!
    AI_Output (self, other ,"DIA_Andrew_HEY1_03_02"); //Od dawna chcia³em uciec z obozu przy kopalni. Ostatnie wydarzenia podgrza³y atmosferê do tego stopnia, ¿e przyspieszy³em moj¹ decyzjê.
	AI_Output (other, self ,"DIA_Andrew_HEY1_15_03"); //Quentin tak po prostu ciê tu wpuœci³?!
	AI_Output (self, other ,"DIA_Andrew_HEY1_03_04"); //W zamian otrzyma³ wiele bardzo przydatnych informacji.

};
//========================================
//-----------------> HEY2
//========================================

INSTANCE DIA_Andrew_HEY2 (C_INFO)
{
   npc          = GRD_7008_Tukash;
   nr           = 1;
   condition    = DIA_Andrew_HEY2_Condition;
   information  = DIA_Andrew_HEY2_Info;
   permanent	= FALSE;
   description	= "Wiesz, co dzieje siê w Kopalni?";
};

FUNC INT DIA_Andrew_HEY2_Condition()
{
	if (Kapitel >= 4)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Andrew_HEY2_Info()
{
    AI_Output (other, self ,"DIA_Andrew_HEY2_15_01"); //Wiesz, co dzieje siê w Kopalni?
    AI_Output (self, other ,"DIA_Andrew_HEY2_03_02"); //Wszystko zala³a podziemna rzeka. Zginê³o wielu ludzi. Ze znanych mi osób prze¿y³ tylko Kopacz Grimes i kilku Kopaczy. 
	AI_Output (self, other ,"DIA_Andrew_HEY2_03_03"); //Kilku na moich oczach wymknê³o siê z obozu i poszli w kierunku Starego Obozu. Bardzo mnie to zdziwi³o, ale myœlê, ¿e jednak go ominêli.
	AI_Output (self, other ,"DIA_Andrew_HEY2_03_04"); //A Stra¿nicy chyba zaczêli siê buntowaæ. S³ysza³em o planowanym zamachu na Arto, który sprawuje teraz opiekê nad obozem.
	AI_Output (other, self ,"DIA_Andrew_HEY2_15_05"); //Dziêki za wiadomoœci.
	AI_Output (self, other ,"DIA_Andrew_HEY2_03_06"); //Nie ma sprawy. Nie ma ju¿ ¿adnych zale¿noœci miêdzy mn¹, a tymi ludŸmi. Muszê sobie znaleŸæ nowe ubranie, bo w koñcu ktoœ mnie kropnie.
	B_GiveXP (100);
};