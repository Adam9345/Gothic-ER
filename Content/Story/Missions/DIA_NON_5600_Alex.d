// *Script was make in Easy Dialog Maker (EDM)
//sprawdzone, poprawione Reflide
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Alex_EXIT(C_INFO)
{
	npc             = NON_5600_Alex;
	nr              = 999;
	condition	= DIA_Alex_EXIT_Condition;
	information	= DIA_Alex_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Alex_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alex_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Alex_HELLO1 (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_HELLO1_Condition;
   information  = DIA_Alex_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Alex_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Alex_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_02"); //Nazywam siê Alex. Dbam o to, by w obozie panowa³ spokój. 
    AI_Output (other, self ,"DIA_Alex_HELLO1_15_03"); //Jesteœ tu szefem?
    AI_Output (self, other ,"DIA_Alex_HELLO1_03_04"); //Szef to za mocne s³owo. Po prostu pilnujê tego ca³ego burdelu. 
	AI_Output (self, other ,"DIA_Alex_HELLO1_03_05"); //Choæ jak widaæ i mnie to czasem przerasta. Ostatnio zagin¹³ nasz cz³owiek... 
};

//========================================
//-----------------> Skup
//========================================

INSTANCE DIA_Alex_Skup (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Skup_Condition;
   information  = DIA_Alex_Skup_Info;
   permanent	= FALSE;
   description	= "Skupujecie trofea?";
};

FUNC INT DIA_Alex_Skup_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Alex_Skup_Info()
{
    AI_Output (other, self ,"DIA_Alex_Skup_15_01"); //Skupujecie trofea?
    AI_Output (self, other ,"DIA_Alex_Skup_03_02"); //Jasne! Je¿eli masz na sprzeda¿ skóry wilków to mo¿esz je tutaj przynieœæ.
	AI_Output (self, other ,"DIA_Alex_Skup_03_05"); //Jeœli chodzi o skóry, to p³acê 200 bry³ek za 30 sztuk.
	Log_CreateTopic 	(GE_Skup,LOG_NOTE);
	
    B_LogEntry			(GE_Skup,"Alex skupuje futra (200 bry³ek za 30 sztuk).Mo¿na go znaleŸæ w obozie myœliwych.");
    
};

//========================================
//-----------------> SellSkins
//========================================

INSTANCE DIA_Alex_SellSkins (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_SellSkins_Condition;
   information  = DIA_Alex_SellSkins_Info;
   permanent	= TRUE;
   description	= "Chcê sprzedaæ wilcze skóry.";
};

FUNC INT DIA_Alex_SellSkins_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Skup))
    && (Npc_HasItems (other, ItAt_Wolf_01) >=30)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SellSkins_Info()
{
    AI_Output (other, self ,"DIA_Alex_SellSkins_15_01"); //Chcê sprzedaæ wilcze skóry.
    AI_Output (self, other ,"DIA_Alex_SellSkins_03_02"); //Jasne. Oto twoja zap³ata.
    B_GiveInvItems (other, self, ItAt_Wolf_01, 30);
	Npc_RemoveInvItems (self, ItAt_Wolf_01, 30);
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    B_giveXP (150);
};

//========================================
//-----------------> SellMeat
//========================================

INSTANCE DIA_Alex_SellMeat (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 3;
   condition    = DIA_Alex_SellMeat_Condition;
   information  = DIA_Alex_SellMeat_Info;
   permanent	= TRUE;
   description	= "Chcê sprzedaæ miêso.";
};

FUNC INT DIA_Alex_SellMeat_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alex_Skup))
    && (Npc_HasItems (other, ItFoMuttonRaw) >=50)
    {
    return FALSE;
    };
};


FUNC VOID DIA_Alex_SellMeat_Info()
{
    AI_Output (other, self ,"DIA_Alex_SellMeat_15_01"); //Chcê sprzedaæ miêso.
    AI_Output (self, other ,"DIA_Alex_SellMeat_03_02"); //Oto obiecana zap³ata.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_GiveInvItems (other, self, ItFoMuttonRaw, 50);
	Npc_RemoveInvItems (self, ItFoMuttonRaw, 50);
    B_giveXP (75);
};

var int meat_oddane;
//========================================
//-----------------> Armor
//========================================

INSTANCE DIA_Alex_Armor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Armor_Condition;
   information  = DIA_Alex_Armor_Info;
   permanent	= FALSE;
   description	= "Sprzedasz mi jakiœ pancerz?";
};

FUNC INT DIA_Alex_Armor_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Alex_Armor_Info()
{
    AI_Output (other, self ,"DIA_Alex_Armor_15_01"); //Sprzedasz mi jakiœ pancerz?
    if (MIS_Kidnapping == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_02"); //Mam na stanie zarówno ubranie, jak i zbrojê.
        AI_Output (self, other ,"DIA_Alex_Armor_03_03"); //Wybierz sobie, które ci odpowiada.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Armor_03_04"); //Tobie? Ledwo ciê znam.
        AI_Output (other, self ,"DIA_Alex_Armor_15_05"); //A wiêc najwy¿szy czas mnie poznaæ!
        AI_Output (self, other ,"DIA_Alex_Armor_03_06"); //No dobra, spróbujmy. Sprzedam ci moje stare ubranie, jeœli popracujesz trochê na rzecz obozu.
        AI_Output (other, self ,"DIA_Alex_Armor_15_07"); //Co jest do zrobienia?
        AI_Output (self, other ,"DIA_Alex_Armor_03_08"); //Najpierw weŸ to miêso i usma¿ je porz¹dnie na patelni. Ja nie mam na to czasu. Pamiêtaj, ¿eby mi je potem odnieœæ!
        AI_Output (self, other ,"DIA_Alex_Armor_03_09"); //Gdy ju¿ to zrobisz, pogadaj z Firnem. Trzeba naprawiæ palisadê w obozie.
        AI_Output (self, other ,"DIA_Alex_Armor_03_10"); //Na koniec pomo¿esz Stanleyowi uzupe³niæ ekwipunek. Z tego co mi wiadomo, potrzebne mu jest 50 strza³. 
        MIS_JobInHuntersCamp = LOG_RUNNING;
		meat_oddane = false;
        Log_CreateTopic          (CH1_JobInHuntersCamp, LOG_MISSION);
        Log_SetTopicStatus       (CH1_JobInHuntersCamp, LOG_RUNNING);
        B_LogEntry               (CH1_JobInHuntersCamp,"Je¿eli chcê dostaæ ubranie myœliwego, bêdê musia³ na nie zapracowaæ. Mam usma¿yæ miêso i odnieœæ je do Alexa, naprawiæ palisadê razem z Firnem i przynieœæ Stanleyowi 50 strza³. ");
        CreateInvItems (self, ItFoMuttonRaw, 30);
        B_GiveInvItems (self, other, ItFoMuttonRaw, 30);
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Mutton
//========================================

INSTANCE DIA_Alex_Mutton (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_Mutton_Condition;
   information  = DIA_Alex_Mutton_Info;
   permanent	= FALSE;
   description	= "Mam 30 sztuk sma¿onego miêsa. ";
};

FUNC INT DIA_Alex_Mutton_Condition()
{
    if (meat_oddane == false)
    && (MIS_JobInHuntersCamp == LOG_RUNNING)
    && (Npc_HasItems (other, ItFoMutton) >=30)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Mutton_Info()
{
    AI_Output (other, self ,"DIA_Alex_Mutton_15_01"); //Mam 30 sztuk sma¿onego miêsa. 
    AI_Output (self, other ,"DIA_Alex_Mutton_03_02"); //Dobra robota. Uwielbiam sma¿one miêso. 
    B_LogEntry                     (CH1_JobInHuntersCamp,"Alex otrzyma³ swoje miêso. ");
	meat_oddane = true;
    B_GiveXP (25);
    B_GiveInvItems (other, self, ItFoMutton, 30);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RobotaENDE
//========================================

INSTANCE DIA_Alex_RobotaENDE (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_RobotaENDE_Condition;
   information  = DIA_Alex_RobotaENDE_Info;
   permanent	= FALSE;
   description	= "Zrobi³em co kaza³eœ.";
};

FUNC INT DIA_Alex_RobotaENDE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_palisadaSkonczone))
    && (Npc_KnowsInfo (hero, DIA_Stanley_Arrows))
    && (Npc_KnowsInfo (hero, DIA_Alex_Mutton))
    && (MIS_JobInHuntersCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_RobotaENDE_Info()
{
    AI_Output (other, self ,"DIA_Alex_RobotaENDE_15_01"); //Zrobi³em co kaza³eœ.
    AI_Output (self, other ,"DIA_Alex_RobotaENDE_03_02"); //Dobra robota! Obóz wreszcie wygl¹da jak trzeba. Teraz mogê ci sprzedaæ ubranie za 300 bry³ek rudy.
    B_LogEntry                     (CH1_JobInHuntersCamp,"Zadania zosta³y wykonane. Wreszcie mogê kupiæ nowy pancerz za niewielk¹ cenê. ");
    Log_SetTopicStatus       (CH1_JobInHuntersCamp, LOG_SUCCESS);
    MIS_JobInHuntersCamp = LOG_SUCCESS;
    B_GiveXP (200);
};


//========================================
//-----------------> GiveSArmor
//========================================

INSTANCE DIA_Alex_GiveSArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 4;
   condition    = DIA_Alex_GiveSArmor_Condition;
   information  = DIA_Alex_GiveSArmor_Info;
   permanent	= FALSE;
   description	= "Daj mi ubranie myœliwego (300 bry³ek rudy)";
};

FUNC INT DIA_Alex_GiveSArmor_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_GiveSArmor_Info()
{
    
    var int AFIP_ShowItem;
	AFIP_SetChoiceItem  (DIA_Alex_GiveSArmor,HUN_ARMOR_L);
    AI_Output (other, self ,"DIA_Alex_GiveSArmor_15_01"); //Daj mi ubranie myœliwego.
    if (Npc_HasItems (hero, ItMiNugget)>=300)
    {
        AI_Output (self, other ,"DIA_Alex_GiveSArmor_03_02"); //Jasne. Jest twoje. 
        B_GiveInvItems (other, self, ItMiNugget, 300);
		CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(hero,HUN_ARMOR_L);
	AI_EquipBestArmor	(hero); 
	DIA_Alex_GiveSArmor.permanent = false;
//HUN_ARMOR_L   
 }
    else
    {
        AI_Output (self, other ,"DIA_Alex_GiveSArmor_03_03"); //Nie ma rudy, nie ma pancerza.
        DIA_Alex_GiveSArmor.permanent = true;
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SrongArmor
//========================================

INSTANCE DIA_Alex_SrongArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 3;
   condition    = DIA_Alex_SrongArmor_Condition;
   information  = DIA_Alex_SrongArmor_Info;
   permanent	= FALSE;
   description	= "Co z ciê¿szym pancerzem?";
};

FUNC INT DIA_Alex_SrongArmor_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_SUCCESS) && (kapitel >= 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_SrongArmor_Info()
{
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_01"); //Co z ciê¿szym pancerzem?
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_02"); //Aby go dostaæ, bêdziesz musia³ rozwi¹zaæ sprawê pewnej kradzie¿y.
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_03"); //Kradzie¿y? 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_04"); //Ostatnio z obozu zginê³y cenne b³yskotki. Mój puchar i pierœcieñ Clawa. 
    AI_Output (self, other ,"DIA_Alex_SrongArmor_03_05"); //Nie podoba mi siê to. Czy¿by w obozie by³ zdrajca?
    AI_Output (other, self ,"DIA_Alex_SrongArmor_15_06"); //Postaram siê to ustaliæ.
    MIS_TheftInHuntersCamp = LOG_RUNNING;
	
    Log_CreateTopic          (CH1_TheftInHuntersCamp, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TheftInHuntersCamp, LOG_RUNNING);
    B_LogEntry               (CH1_TheftInHuntersCamp,"Ostatniej nocy z obozu myœliwych zaginê³y dwa cenne przedmioty: puchar Alexa i pierœcieñ myœliwego Clawa. Nie wiadomo kto stoi za kradzie¿¹. ");
};

//========================================
//-----------------> CenneItemy
//========================================

INSTANCE DIA_Alex_CenneItemy (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_CenneItemy_Condition;
   information  = DIA_Alex_CenneItemy_Info;
   permanent	= FALSE;
   description	= "Znalaz³em wasze b³yskotki.";
};

FUNC INT DIA_Alex_CenneItemy_Condition()
{
    if (Npc_HasItems (other, AlexCup) >=1)
   // && (Npc_HasItems (other, ClawsRing) >=1)
    && (MIS_TheftInHuntersCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_CenneItemy_Info()
{
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_01"); //Znalaz³em wasze b³yskotki.
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_02"); //Naprawdê ci siê to uda³o? Czy to by³ jeden z moich ludzi?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_03"); //Nie. Zosta³y porwane przez gobliny. Znalaz³em je w skrzyni znajduj¹cej siê w jaskini nieopodal obozu. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_04"); //Jak to mo¿liwe, ¿e te bestyjki zakrad³y siê do obozu?
    AI_Output (other, self ,"DIA_Alex_CenneItemy_15_05"); //Firn jest tylko cz³owiekiem. Mo¿liwe, ¿e przysn¹³. 
    AI_Output (self, other ,"DIA_Alex_CenneItemy_03_06"); //Hmm... No dobrze. W nagrodê sprzedam ci zbrojê myœliwego za 1300 bry³ek rudy. 
    B_LogEntry                     (CH1_TheftInHuntersCamp,"Zagadka rozwi¹zana. Przedmioty zosta³y skradzione przez gobliny z jaskini przy obozie. ");
    Log_SetTopicStatus       (CH1_TheftInHuntersCamp, LOG_SUCCESS);
    MIS_TheftInHuntersCamp = LOG_SUCCESS;
	B_GiveInvItems (hero, self, AlexCup, 1);
    B_GiveXP (250);
};

//========================================
//-----------------> GivMeHArmor
//========================================
var int zbroja_mysliwego_buy;
INSTANCE DIA_Alex_GivMeHArmor (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 2;
   condition    = DIA_Alex_GivMeHArmor_Condition;
   information  = DIA_Alex_GivMeHArmor_Info;
   permanent	= true;
   description	= "Daj mi zbrojê myœliwego (1300 bry³ek rudy)";
};

FUNC INT DIA_Alex_GivMeHArmor_Condition()
{
    if (MIS_TheftInHuntersCamp == LOG_SUCCESS) && (zbroja_mysliwego_buy == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_GivMeHArmor_Info()
{
    var int AFIP_ShowItem;
	AFIP_SetChoiceItem  (DIA_Alex_GivMeHArmor,NON_WOLF_ARMOR);
    AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_01"); //Daj mi zbrojê myœliwego.
	if (Kapitel == 1)
	{
	AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_05"); //Niestety ju¿ nam siê skoñczy³y. PrzyjdŸ póŸniej, gdy uszyjemy jeszcze kilka.
	DIA_Alex_GivMeHArmor.permanent = true;//fix er 1.4
	}
	else 
	{
    if (Npc_HasItems (hero, ItMiNugget)>=1300)
    {
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_02"); //WeŸ j¹. Nale¿y ci siê.
        AI_Output (other, self ,"DIA_Alex_GivMeHArmor_15_03"); //Za tak¹ iloœæ rudy, to mi siê wiele rzeczy nale¿y...
	B_GiveInvItems (other, self, ItMiNugget, 1300);
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	CreateInvItem		(other,NON_WOLF_ARMOR);
	AI_EquipBestArmor	(other); 
	DIA_Alex_GivMeHArmor.permanent = false;
	zbroja_mysliwego_buy = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_GivMeHArmor_03_04"); //Nie masz tyle rudy. Zbierz jeszcze trochê bry³ek. 
		DIA_Alex_GivMeHArmor.permanent = true;
    };
	};
};

//========================================
//-----------------> Skargi
//========================================

INSTANCE DIA_Alex_Skargi (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Skargi_Condition;
   information  = DIA_Alex_Skargi_Info;
   permanent	= FALSE;
   description	= "Jonas skar¿y siê, ¿e myœliwi pracuj¹ powoli.";
};

FUNC INT DIA_Alex_Skargi_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jonas_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Skargi_Info()
{
    AI_Output (other, self ,"DIA_Alex_Skargi_15_01"); //Jonas skar¿y siê, ¿e myœliwi pracuj¹ powoli.
    AI_Output (self, other ,"DIA_Alex_Skargi_03_02"); //Nic mi o tym nie wiadomo. 
    AI_Output (self, other ,"DIA_Alex_Skargi_03_03"); //Mo¿e spróbuj z nimi porozmawiaæ.
};

//========================================
//-----------------> Narzekanie
//========================================

INSTANCE DIA_Alex_Narzekanie (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Narzekanie_Condition;
   information  = DIA_Alex_Narzekanie_Info;
   permanent	= FALSE;
   description	= "Jeden z myœliwych strasznie na ciebie narzeka.";
};

FUNC INT DIA_Alex_Narzekanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO1))
    && (MIS_Nieroby == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Narzekanie_Info()
{
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_01"); //Jeden z myœliwych strasznie na ciebie narzeka.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_02"); //Hê?
    AI_Output (other, self ,"DIA_Alex_Narzekanie_15_03"); //Za¿¹da³ z³ota za pracê przy drewnie. Ponadto powiedzia³, ¿e powinniœmy szukaæ kopalni z³ota, a nie zajmowaæ siê zwierzyn¹.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_04"); //Nie d¹¿ê za bogactwem. Powiedz mi ile tutaj jest warte z³oto? Co nam po tym, ¿e zgromadzimy kufry ze z³otem skoro nawet go nie wykorzystamy.
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_05"); //Zdechniemy broni¹c kilku œwiecide³ek przed pazernymi Stra¿nikami. Czy to ma sens?
    AI_Output (self, other ,"DIA_Alex_Narzekanie_03_06"); //Nie lepiej wykorzystaæ to co daje nam natura? Owoc pracy trzech bogów. 
    if (Npc_KnowsInfo (hero, DIA_Hunter_HELLO3))
    {
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_07"); //Masz racjê. Nauczy³em ju¿ tego nieroba szacunku.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_08"); //Pobi³eœ go? le post¹pi³eœ.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_09"); //Dlaczego? Nale¿a³o mu siê.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_10"); //Zachowujecie siê jak dzieci w piaskownicy. Nikt go tu nie trzyma. Je¿eli nie chce pracowaæ na rzecz obozu, to niech st¹d zje¿d¿a. Mog³eœ kazaæ mu po prostu odejœæ.
    }
    else
    {
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_11"); //Nie bêdê ciê zanudza³. IdŸ do tego cz³owieka i powiedz mu, ¿e nie ma ju¿ czego szukaæ w obozie.
        AI_Output (self, other ,"DIA_Alex_Narzekanie_03_12"); //Niech odejdzie. Nie potrzebujemy tu takich jak on.
        AI_Output (other, self ,"DIA_Alex_Narzekanie_15_13"); //Tak zrobiê.

        B_LogEntry                     (CH1_Nieroby,"Mam kazaæ odejœæ myœliwemu. Alexa bardzo zdenerwowa³a jego postawa.");
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NewQuest
//========================================

INSTANCE DIA_Alex_NewQuest (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 9;
   condition    = DIA_Alex_NewQuest_Condition;
   information  = DIA_Alex_NewQuest_Info;
   permanent	= FALSE;
   description	= "Zagin¹³ jeden z waszych ludzi?";
};

FUNC INT DIA_Alex_NewQuest_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Alex_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_NewQuest_Info()
{
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_01"); //Zagin¹³ jeden z waszych ludzi?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_02"); //Ta... Nazywa³ siê Josep. Nie by³ jakimœ m³odzikiem. Doœwiadczony facet maj¹cy ju¿ wiele wiosen za sob¹. Dziwi mnie jego znikniêcie.
    AI_Output (other, self ,"DIA_Alex_NewQuest_15_03"); //Wys³a³eœ kogoœ na jego poszukiwania?
    AI_Output (self, other ,"DIA_Alex_NewQuest_03_04"); //Oczywiœcie, ¿e tak! Zazwyczaj polowa³ w okolicach Nowego Obozu. Czterech zwiadowców dok³adnie przeszuka³o tamte tereny. Bezskutecznie.
	AI_Output (self, other ,"DIA_Alex_NewQuest_03_05"); //Jeœli chcesz, mo¿esz próbowaæ, ale w¹tpiê, ¿e on jeszcze wróci. 

    MIS_MissedJosep = LOG_RUNNING;

    Log_CreateTopic          (CH1_MissedJosep, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MissedJosep, LOG_RUNNING);
    B_LogEntry               (CH1_MissedJosep,"Z obozu znikn¹³ jeden z myœliwych. Od Alexa dowiedzia³em siê, ¿e nazywa³ siê Josep i polowa³ w okolicach Nowego Obozu. Poszukiwania nie przynios³y skutku.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> JosepPowrot
//========================================

INSTANCE DIA_Alex_JosepPowrot (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_JosepPowrot_Condition;
   information  = DIA_Alex_JosepPowrot_Info;
   permanent	= FALSE;
   description	= "Przed chwil¹ przyprowadzi³em Josepa do obozu.";
};

FUNC INT DIA_Alex_JosepPowrot_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Josep_Camp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_JosepPowrot_Info()
{
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_01"); //Przed chwil¹ przyprowadzi³em Josepa do obozu.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_02"); //Gdzie go znalaz³eœ? Nie ukrywam, ¿e to œwietna wiadomoœæ.
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_03"); //Zosta³ pojmany przez ludzi Lewusa i zmuszony do pracy na polach ry¿owych.
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_04"); //Jak to pojmany?
    AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_05"); //Mo¿na rzec, ¿e zaszed³ Lewusowi za skórê, a póŸniej Laresowi, a póŸniej...
    AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_06"); //Dziwiê siê, ¿e w ogóle wyszed³ z tego ca³o. Chyba masz w tym niema³y udzia³?
	AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_07"); //Owszem. By³bym wdziêczny, gdybyœ...
	AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_08"); //Rozumiem. 200 bry³ek rudy to chyba uczciwa cena za ocalenie jednego z moich ludzi?
	AI_Output (other, self ,"DIA_Alex_JosepPowrot_15_09"); //Zadowolê siê i tym. Dziêki.
	AI_Output (self, other ,"DIA_Alex_JosepPowrot_03_10"); //To ja dziêkujê.
	
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
	
    B_LogEntry               (CH1_MissedJosep,"Josep wróci³ do obozu. Alex by³ bardzo zadowolony z moich dokonañ.");
    Log_SetTopicStatus       (CH1_MissedJosep, LOG_SUCCESS);
    MIS_MissedJosep = LOG_SUCCESS;

    B_GiveXP (350);
	EquipItem (NON_5614_Josep, ItMw_1H_Sword_02);
};

//========================================
//-----------------> NovizeShrat
//========================================

INSTANCE DIA_Alex_NovizeShrat (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_NovizeShrat_Condition;
   information  = DIA_Alex_NovizeShrat_Info;
   permanent	= FALSE;
   description	= "Nowicjusz Shrat szuka sobie nowego miejsca.";
};

FUNC INT DIA_Alex_NovizeShrat_Condition()
{
    if (MIS_UCieczkaShrata == LOG_RUNNING)
    && (ShratHaveWork == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_NovizeShrat_Info()
{
    AI_Output (other, self ,"DIA_Alex_NovizeShrat_15_01"); //Nowicjusz Shrat szuka sobie nowego miejsca.
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_02"); //Je¿eli chcesz, mo¿esz go przyprowadziæ do obozu.
    AI_Output (self, other ,"DIA_Alex_NovizeShrat_03_03"); //Przyda nam siê ka¿dy cz³owiek.
    B_LogEntry                     (CH1_UCieczkaShrata,"Alex przyjmie Shrata do obozu myœliwych. Muszê przekazaæ Nowicjuszowi dobre wieœci.");
ShratHaveWork = true;
    B_GiveXP (300);
};

//========================================
//-----------------> Ratunek
//========================================

INSTANCE DIA_Alex_Ratunek (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_Ratunek_Condition;
   information  = DIA_Alex_Ratunek_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_Ratunek_Condition()
{
    if (Npc_GetDistToNpc(self, other) < 700)
    && (MIS_Kidnapping == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_Ratunek_Info()
{
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_01"); //Wreszcie ktoœ przyszed³ mnie uwolniæ.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_02"); //Bo przybywasz z ratunkiem? Tak?
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_03"); //To twój szczêœliwy dzieñ.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_04"); //Ratowanie i pieczeñ ze œcierwojada w zestawie.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_05"); //Ha! Zjad³bym pieczeñ.

    AI_Output (other, self ,"DIA_Alex_Ratunek_15_07"); //Ja te¿. Znudzi³o mi siê bieganie po Obozie.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_08"); //Wola³bym wspinaæ siê po wie¿y do jakiejœ urodnej niewiasty.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_09"); //A musisz zapieprzaæ ¿eby uwolniæ jakiegoœ dziada z celi. He he.
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_10"); //Piwko? I zaraz siê zbieramy.
    AI_Output (other, self ,"DIA_Alex_Ratunek_15_11"); //Jasne.
    CreateInvItems (self, ItFoBeer, 2);
    B_GiveInvItems (self, other, ItFoBeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_UseItem (hero, ItFoBeer);
    AI_Output (self, other ,"DIA_Alex_Ratunek_03_12"); //ChodŸmy. 
	AI_Output (self, other ,"DIA_Alex_Ratunek_03_13"); //A, by³bym zapomnia³. Nale¿y ci siê coœ za pomoc. WeŸ tê miksturê. Pomo¿e ci podczas ³owów. 
    AI_StopProcessInfos	(self);
    B_LogEntry               (CH3_Kidnapping,"Myœliwy Alex zosta³ uwolniony. Mo¿emy wracaæ do obozu. Wszystko dobrze siê skoñczy³o, a ja dosta³em cenn¹ miksturê - wyci¹g zwinnoœci.");
    Log_SetTopicStatus       (CH3_Kidnapping, LOG_SUCCESS);
    MIS_Kidnapping = LOG_SUCCESS;
	Npc_ExchangeRoutine (self, "start");
	
	
    B_GiveXP (750);
	
	CreateInvItems (self, ItFo_Potion_Dex_02, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Dex_02, 1);
};

///////////////////////////////////////////////////
// 	Where Is Kalom
//////////////////////////////////////////////////

INSTANCE DIA_Alex_WhereIsKalom (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_WhereIsKalom_Condition;
   information  = DIA_Alex_WhereIsKalom_Info;
   permanent	= FALSE;
   description	= "Szukam grupy sekciarzy.";
};

FUNC INT DIA_Alex_WhereIsKalom_Condition()
{
	if (MIS_SearchKalom == LOG_RUNNING)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Alex_WhereIsKalom_Info()
{
    AI_Output (other, self ,"DIA_Alex_WhereIsKalom_15_01"); //Szukam grupy sekciarzy.
    AI_Output (self, other ,"DIA_Alex_WhereIsKalom_03_02"); //Nie ma ich tu.
    AI_Output (other, self ,"DIA_Alex_WhereIsKalom_15_03"); //To wiem. Mo¿e któryœ z twoich ludzi coœ widzia³? 
    AI_Output (self, other ,"DIA_Alex_WhereIsKalom_03_04"); //Moi ludzie przesiaduj¹ w obozie od czasu kiedy w kolonii zrobi³o siê doœæ nerwowo. Jedynie stary Tom poluje nad rzek¹. 
	AI_Output (self, other ,"DIA_Alex_WhereIsKalom_03_05"); //Mo¿esz z nim pogadaæ. Nie bêdê dopytywa³ co to za sekciarze i czemu ich szukasz, ale mam tylko nadziejê, ¿e s¹ nieszkodliwi. 
	
	B_LogEntry              (CH3_SearchKalom,"Ludzie Alexa od jakiegoœ czasu siedz¹ w obozie. Jedynie stary Tom wychodzi na polowania. Znajdê go nad rzek¹.");
};


//========================================
//-----------------> QUEST_TROLL
//========================================

INSTANCE DIA_Alex_QUEST_TROLL (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_QUEST_TROLL_Condition;
   information  = DIA_Alex_QUEST_TROLL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_QUEST_TROLL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_CHAPTER_5)) && (MIS_Kidnapping == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_QUEST_TROLL_Info()
{
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_01"); //O, dobrze ciê widzieæ!
    AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_02"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_03"); //Zbieraj siê. Mamy robotê. W okolicach mostu do Nowego Obozu pojawi³ siê wielki troll. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_04"); //Bestia zabi³a ju¿ trzech Najemników. Jest szalona i agresywna. 
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_05"); //Pomo¿esz mi siê jej pozbyæ. To zlecenie od Magów Wody. NieŸle na tym zarobimy!
    if (Npc_KnowsInfo (hero, Info_Milten_LSNOW))
    {
        AI_Output (other, self ,"DIA_Alex_QUEST_TROLL_15_06"); //Nie mam najlepszych kontaktów z Magami Wody. 
        AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_07"); //Spokojnie. Ja siê wszystkim zajmê. 
    };
    AI_Output (self, other ,"DIA_Alex_QUEST_TROLL_03_08"); //A teraz chodŸ za mn¹!
	self.aivar[AIV_PARTYMEMBER] =	TRUE;
    Npc_ExchangeRoutine (self, "troll");
	B_LogEntry                     (CH5_BigTroll,"Mam udaæ siê z Alexem na polowanie na wielkiego trolla, któremu spodoba³y siê okolice Nowego Obozu.");
    Wld_InsertNpc				(AlexTroll,"OW_PATH_152K");	
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> POKONANY_TROLL
//========================================

INSTANCE DIA_Alex_POKONANY_TROLL (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_POKONANY_TROLL_Condition;
   information  = DIA_Alex_POKONANY_TROLL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_POKONANY_TROLL_Condition()
{
    if (Npc_GetDistToWP (self, "OW_PATH_152K") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_POKONANY_TROLL_Info()
{
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_01"); //Cholera, pierwszy raz widzia³em tak rozwœcieczonego trolla.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_02"); //No, twardy by³ sukinsyn. 
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_03"); //Dobrze, ¿e jakoœ to prze¿yliœmy. Magowie obiecali mi 1000 bry³ek rudy, je¿eli uda mi siê go zabiæ.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_04"); //Dam ci teraz 500 bry³ek z mojej kieszeni, a po wyp³atê udam siê sam do Magów.
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_05"); //Umowa stoi.
    AI_Output (self, other ,"DIA_Alex_POKONANY_TROLL_03_06"); //Œwietnie. WeŸ jeszcze te dwie silne mikstury uzdrawiaj¹ce. 
    AI_Output (other, self ,"DIA_Alex_POKONANY_TROLL_15_07"); //Dziêki. Trzymaj siê przyjacielu. 
    B_LogEntry                     (CH5_BigTroll,"Uda³o nam siê pokonaæ wielkiego trolla. To by³a naprawdê ciê¿ka walka.");
    Log_SetTopicStatus       (CH5_BigTroll, LOG_SUCCESS);
    MIS_BigTroll = LOG_SUCCESS;

    B_GiveXP (250);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    CreateInvItems (self, ItFo_Potion_Health_03, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_03, 2);
};

//------------------------------------------------------------------------------------1.6.1----------------------------------------------------------------

//========================================
//-----------------> QUEST_TROLL
//========================================

INSTANCE DIA_Alex_QUEST_Ghaston_Dead (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_QUEST_Ghaston_Dead_Condition;
   information  = DIA_Alex_QUEST_Ghaston_Dead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_QUEST_Ghaston_Dead_Condition()
{
    if (MilKissMyAss == TRUE)
	&& (Npc_IsDead (NON_40034_Arnold))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_QUEST_Ghaston_Dead_Info()
{
    AI_Output (self, other ,"DIA_Alex_QUEST_Ghaston_Dead_03_01"); //Mill wszystko mi powiedzia³. Zabi³eœ Arnolda.
    AI_Output (other, self ,"DIA_Alex_QUEST_Ghaston_Dead_15_02"); //Nie prawda.
    AI_Output (self, other ,"DIA_Alex_QUEST_Ghaston_Dead_03_03"); //Nie k³am. Zg³adzi³eœ jednego z nas. 
    AI_Output (self, other ,"DIA_Alex_QUEST_Ghaston_Dead_03_04"); //Braæ go ch³opcy
           
	B_SetPermAttitude	(NON_5600_Alex,	ATT_HOSTILE);
	B_SetPermAttitude	(NON_5612_Mil,	ATT_HOSTILE);    
	B_SetPermAttitude	(NON_5602_Stanley,	ATT_HOSTILE); 
    B_SetPermAttitude	(NON_5603_Claw,	ATT_HOSTILE);
	B_SetPermAttitude	(NON_5614_Josep,	ATT_HOSTILE);    
	B_SetPermAttitude	(NON_5675_Magnus,	ATT_HOSTILE); 	
	B_SetPermAttitude	(NON_2703_MYSLIWY,	ATT_HOSTILE);    


    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Polowanie na Aligatory
//========================================

INSTANCE DIA_Alex_PNA_Interes (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_PNA_Interes_Condition;
   information  = DIA_Alex_PNA_Interes_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_PNA_Interes_Condition()
{
    if (Kapitel == 2)
	&& (Knows_GetHide == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_PNA_Interes_Info()
{
    AI_Output (self, other ,"DIA_Alex_PNA_Interes_03_01"); //Mam dla ciebie pewien interes do ubicia. Ale powiedz mi czy wkoñcu nauczy³eœ siê skórowaæ gady?
    AI_Output (other, self ,"DIA_Alex_PNA_Interes_15_02"); //Tak idzie mi z tym ca³kiem nieŸle? O co chodzi?
    AI_Output (self, other ,"DIA_Alex_PNA_Interes_03_03"); //Co prawda nie jesteœ jednym z nas myœliwych ale widaæ, ¿e jesteœ sprawnym wojownikiem.
    AI_Output (self, other ,"DIA_Alex_PNA_Interes_03_04"); //Pojawi³a siê okazja na du¿e polowanie i ogromny zarobek. Dostaliœmy pewn¹ propozycjê od Magnatów.
    AI_Output (other, self ,"DIA_Alex_PNA_Interes_15_05"); //Jak¹?
    AI_Output (self, other ,"DIA_Alex_PNA_Interes_03_06"); //Mamy zdobyæ 5 skór aligatorów, z których potem zostan¹ wykonane ekskluzywne przedmioty.
    AI_Output (self, other ,"DIA_Alex_PNA_Interes_03_07"); //Interesuje ciê coœ takiego?


};

//========================================
//-----------------> HIDEF
//========================================

INSTANCE DIA_Alex_HIDEF (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_HIDEF_Condition;
   information  = DIA_Alex_HIDEF_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_HIDEF_Condition()
{
    if (Kapitel == 2)
	&& (Knows_GetHide == FALSE)
{
    return TRUE;
};
};
FUNC VOID DIA_Alex_HIDEF_Info()
{
    AI_Output (self, other ,"DIA_Alex_HIDEF_03_01"); //PodejdŸ no do mnie m³ody!
    AI_Output (other, self ,"DIA_Alex_HIDEF_15_02"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Alex_HIDEF_03_03"); //Jak tam, umiesz mo¿e skórowaæ gady?
    AI_Output (other, self ,"DIA_Alex_HIDEF_15_04"); //Nie.
    AI_Output (self, other ,"DIA_Alex_HIDEF_03_05"); //Hmm. Szkoda. Gdybyœ szybko siê tego nauczy³ to mo¿e zd¹¿y³byœ siê za³apaæ na przyzwoity urobek.
    AI_Output (self, other ,"DIA_Alex_HIDEF_03_06"); //Jeœli interesuje cie pewny zarobek i nauczysz siê skórowania gadów to wiesz gdzie mnie szukaæ.
};


//========================================
//-----------------> Polowanie na Aligatory
//========================================

INSTANCE DIA_Alex_PNA_Wchodze (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_PNA_Wchodze_Condition;
   information  = DIA_Alex_PNA_Wchodze_Info;
   permanent	= FALSE;
   Description  = "Wchodzê w to.";
};

FUNC INT DIA_Alex_PNA_Wchodze_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Alex_PNA_Interes))
	&& !(Npc_KnowsInfo(hero,DIA_Firn_PorwanieInicjacja))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_PNA_Wchodze_Info()
{
    AI_Output (other, self ,"DIA_Alex_PNA_Wchodze_15_01"); //Wchodzê w to.
    AI_Output (self, other ,"DIA_Alex_PNA_Wchodze_03_02"); //Œwietnie. Zbierz Oliviera i Stanleya a potem wróæ do mnie i wspólnie pójdziemy na polowanie.
    AI_Output (other, self ,"DIA_Alex_PNA_Wchodze_15_03"); //W porz¹dku.
	MIS_PNA = LOG_RUNNING;
    Log_CreateTopic		(PolowanieNaAligatory,	LOG_MISSION);
	Log_SetTopicStatus	(PolowanieNaAligatory,	LOG_RUNNING);
    B_LogEntry               (PolowanieNaAligatory,"Alex zaproponowa³ mi dochodowy interes. Chodzi o to by zapolowaæ na aligatory i pozyskaæ z nich skóry, za które Magnaci ze Starego Obozu zap³ac¹ krocie. Mam zebraæ Stanleya i Oliviera a potem wróciæ do Alexa. Celem jest 5 skór aligatorów.");
};



func void PNA_SPAWN()
{ 

    Wld_InsertNpc				(AlligatorPNA1,"FP_ROAM_O_ALLIGATOR_PNA1");  
	Wld_InsertNpc				(AlligatorPNA2,"FP_ROAM_O_ALLIGATOR_PNA2"); 
	Wld_InsertNpc				(AlligatorPNA3,"FP_ROAM_O_ALLIGATOR_PNA3"); 
	Wld_InsertNpc				(AlligatorPNA4,"FP_ROAM_O_ALLIGATOR_PNA4"); 
	Wld_InsertNpc				(AlligatorPNA5,"FP_ROAM_O_ALLIGATOR_PNA5"); 
	Wld_InsertNpc				(AlligatorPNA6,"FP_ROAM_O_ALLIGATOR_PNA6");
    Wld_InsertNpc				(Alligator,"WP_PNA1");
    Npc_ExchangeRoutine(NON_5600_Alex,"FollowPNA");
    NON_5600_Alex.aivar[AIV_PARTYMEMBER] = TRUE;

};




//========================================
//-----------------> Polowanie na Aligatory
//========================================

INSTANCE DIA_Alex_PNA_Droga (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_PNA_Droga_Condition;
   information  = DIA_Alex_PNA_Droga_Info;
   permanent	= FALSE;
   Description    = "Zebra³em ju¿ potrzebnych ludzi.";
};

FUNC INT DIA_Alex_PNA_Droga_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Olivier_PNA_Udzial)) //(Npc_GetDistToWP (self, "OW_PATH_152K") < 500)
	&& (Npc_KnowsInfo(hero,DIA_Stanley_PNA_Polowanie))
//	&& (Npc_KnowsInfo(hero,DIA_Olivier_PNA_Udzial))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_PNA_Droga_Info()
{
    AI_Output (other, self ,"DIA_Alex_PNA_Droga_15_01"); //Zebra³em ju¿ potrzebnych ludzi.
    AI_Output (self, other ,"DIA_Alex_PNA_Droga_03_02"); //Wspaniale zatem mo¿emy wyruszaæ.
    AI_Output (other, self ,"DIA_Alex_PNA_Droga_15_03"); //Gdzie s¹ te aligatory?
    AI_Output (self, other ,"DIA_Alex_PNA_Droga_03_04"); //Widziano je przy rzece prowadz¹cej do lasu w pobli¿u chaty starego Toma.
    AI_Output (other, self ,"DIA_Alex_PNA_Droga_15_05"); //Ruszamy?
    AI_Output (self, other ,"DIA_Alex_PNA_Droga_03_06"); //Tak chodŸ za mn¹.
    B_LogEntry               (PolowanieNaAligatory,"Zebra³em ludzi jak chcia³ Alex. Ten powiedzia³, ¿e aligatory s¹ przy rzece nieopodal chaty starego myœliwego Toma. Ruszamy na polowanie!");
  
     PNA_SPAWN();

};
func void HuntersPNA_Back()
{

       B_ExchangeRoutine (NON_5613_Olivier,"Start");
	   B_StartOtherRoutine(NON_5600_Alex,"Start");
	   B_ExchangeRoutine (NON_5602_Stanley,"Start");

   NON_5600_Alex.aivar[AIV_PARTYMEMBER] = FALSE;
   NON_5602_Stanley.aivar[AIV_PARTYMEMBER] = FALSE;
   NON_5613_Olivier.aivar[AIV_PARTYMEMBER] = FALSE;	   
};
//========================================
//-----------------> Polowanie na Aligatory
//========================================

INSTANCE DIA_Alex_PNA_Fisk (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_PNA_Fisk_Condition;
   information  = DIA_Alex_PNA_Fisk_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_PNA_Fisk_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Alex_PNA_Droga))
	&& (Npc_IsDead (AlligatorPNA1))
	&& (Npc_IsDead (AlligatorPNA2))
	&& (Npc_IsDead (AlligatorPNA3))
	&& (Npc_IsDead (AlligatorPNA4))
	&& (Npc_IsDead (AlligatorPNA5))
	&& (Npc_IsDead (AlligatorPNA6))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Alex_PNA_Fisk_Info()
{
   
    AI_Output (self, other ,"DIA_Alex_PNA_Fisk_03_01"); //Wspaniale aligatory s¹ martwe. Teraz je oskóruj a potem zabierz do starego obozu.
    AI_Output (other, self ,"DIA_Alex_PNA_Fisk_15_02"); //Do kogo?
    AI_Output (self, other ,"DIA_Alex_PNA_Fisk_03_03"); //Do handlarza Fiska. To on ma wykonaæ  cenne przedmioty z tych skór.
    AI_Output (other, self ,"DIA_Alex_PNA_Fisk_15_04"); //Zabiorê skóry, za³atwiê co trzeba i spotkamy siê w waszym obozie.
    AI_Output (self, other ,"DIA_Alex_PNA_Fisk_03_05"); //Zatem niech tak bêdzie.
    AI_Output (self, other ,"DIA_Alex_PNA_Fisk_03_06"); //Do zobaczenia.
	 HuntersPNA_Back();
	B_LogEntry               (PolowanieNaAligatory,"Ubiliœmy wystarczaj¹co aligatorów. Teraz muszê je oskórowaæ a potem zanieœæ tak zdobyte skóry do handlarza Fiska. On ma wykonaæ z nich drogie przedmioty dla Magnatów.");
    AI_StopProcessInfos	(self);


};

//========================================
//-----------------> PNA_ALEX_GETNUGG
//========================================

INSTANCE DIA_Alex_PNA_ALEX_GETNUGG (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 6;
   condition    = DIA_Alex_PNA_ALEX_GETNUGG_Condition;
   information  = DIA_Alex_PNA_ALEX_GETNUGG_Info;
   permanent	= FALSE;
   description	= "Zrobi³em co trzeba i mam rudê obiecan¹ za nasze zlecenie.";
};

FUNC INT DIA_Alex_PNA_ALEX_GETNUGG_Condition()
{
 if (Npc_KnowsInfo(hero,DIA_Bartholo_PNA_Nagroda))
{
    return TRUE;
};
};
FUNC VOID DIA_Alex_PNA_ALEX_GETNUGG_Info()
{
    AI_Output (other, self ,"DIA_Alex_PNA_ALEX_GETNUGG_15_01"); //Zrobi³em co trzeba i mam rudê obiecan¹ za nasze zlecenie.
    AI_Output (self, other ,"DIA_Alex_PNA_ALEX_GETNUGG_03_02"); //Œwietnie, poka¿ no ile tam masz.
	
    Info_ClearChoices   (DIA_Alex_PNA_ALEX_GETNUGG);
    Info_AddChoice		(DIA_Alex_PNA_ALEX_GETNUGG, "Oto ruda (Daj 500 Bry³ek)", DIA_Alex_PNA_NUGG_500);
	Info_AddChoice		(DIA_Alex_PNA_ALEX_GETNUGG, "Oto ruda (Daj 400 Bry³ek)", DIA_Alex_PNA_NUGG_400);
	Info_AddChoice		(DIA_Alex_PNA_ALEX_GETNUGG, "Oto ruda (Daj 300 Bry³ek)", DIA_Alex_PNA_NUGG_300);
};

FUNC VOID DIA_Alex_PNA_NUGG_500()
{



    AI_Output (other, self ,"DIA_Alex_PNA_NUGG_500_15_01"); //Oto ona.
	B_GiveInvItems (other,self, itminugget, 500);
    AI_Output (self, other ,"DIA_Alex_PNA_NUGG_500_03_02"); //Jeœli myœlisz ¿e daj¹c nam wiêcej rudy uda ci siê podlizaæ to jesteœ w b³êdzie.
    AI_Output (self, other ,"DIA_Alex_PNA_NUGG_500_03_03"); //Wolê uczciwych ludzi ni¿ takich wypierdków którzy myœl¹ ¿e ruda zawsze za³atwi sprawê.
	AI_Output (self, other ,"DIA_Alex_PNA_NUGG_500_03_04"); //Ale skoro tak, to wypijemy na twój koszt. Mo¿esz poma¿yæ o swojej dzia³ce.
    MIS_PNA = LOG_SUCCESS;
	B_LogEntry               (PolowanieNaAligatory,"Da³em Alexowi rudê, nieco wiêcej ni¿ da³ mi Magnat Bartholo. Myœliwy nie odda³ mi mojej dzia³ki, nie by³ zbyt zachwycony tym ¿e próbowa³em go oszukaæ, no có¿...");
	B_GiveXP(300);
	Log_SetTopicStatus	(PolowanieNaAligatory,	LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};


FUNC VOID DIA_Alex_PNA_NUGG_400()
{



    AI_Output (other, self ,"DIA_Alex_PNA_NUGG_400_15_01"); //Oto ona.
	B_GiveInvItems (other,self, itminugget, 400);
    AI_Output (self, other ,"DIA_Alex_PNA_NUGG_400_03_02"); //Dziêki. Jesteœ nie tylko œwietnym wojownikiem ale jesteœ tak¿e uczciwy. Nie zwia³eœ z nasz¹ rud¹.
    AI_Output (self, other ,"DIA_Alex_PNA_NUGG_400_03_03"); //Jak bêdê mia³ do ciebie sprawê to ktoœ z moich ludzi siê z tob¹ skontaktuje. Acha o to twoja dzia³ka.
    AI_Output (other, self ,"DIA_Alex_PNA_NUGG_400_15_04"); //W porz¹dku, przynajmniej na razie nie ruszam siê nigdzie poza barierê.
	MIS_PNA = LOG_SUCCESS;
	B_LogEntry               (PolowanieNaAligatory,"Da³em Alexowi rudê, któr¹ da³ mi Magnat Bartholo. Myœliwy odda³ mi moj¹ dzia³kê i widaæ by³o po nim du¿e zadowolenie. Alex liczy, ¿e w przysz³oœci uda siê jeszcze wiele zarobiæ na interesach z Magnatami.");
	B_GiveXP (450);
	Log_SetTopicStatus	(PolowanieNaAligatory,	LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};


FUNC VOID DIA_Alex_PNA_NUGG_300()
{



    AI_Output (other, self ,"DIA_Alex_PNA_NUGG_300_15_01"); //Oto ona.
	B_GiveInvItems (other,self, itminugget, 300);
    AI_Output (self, other ,"DIA_Alex_PNA_NUGG_300_03_02"); //Chyba sobie ¿artujesz ch³optasiu, nie tak siê umawialiœmy!
    AI_Output (other, self ,"DIA_Alex_PNA_NUGG_300_15_03"); //To wszystko co da³ mi Bartholo... Coœ nie tak? 
    AI_Output (self, other ,"DIA_Alex_PNA_NUGG_300_03_04"); //Oh rozumiem... Nie, wszystko gra... Ale zaraz, coœ po tobie ³azi nie ruszaj siê przez chwilê...
	MIS_PNA = LOG_SUCCESS;
	B_LogEntry               (PolowanieNaAligatory,"Da³em Alexowi rudê, Mniej ni¿ siê umawialiœmy. Myœliwy by³ wœciek³y i nie skonczy³o siê to zbyt przyjemnie...");
	B_GiveXP(150);
	Log_SetTopicStatus	(PolowanieNaAligatory,	LOG_FAILED);
    AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

};


func void Hunters_attack_rivier()
{
	Wld_SendTrigger("ZM_NAMIOT");
	
	Wld_InsertNpc				(Grd_40122_Gardist,"WP_ZM_ATTACK_01");
	Wld_InsertNpc				(Grd_40123_Gardist,"WP_ZM_ATTACK_02");
	Wld_InsertNpc				(Grd_40124_Gardist,"WP_ZM_ATTACK_03");
	Wld_InsertNpc				(Grd_40125_Gardist,"WP_ZM_ATTACK_04");
	Wld_InsertNpc				(Stt_40126_Schatten,"WP_ZM_ATTACK_05");
	Wld_InsertNpc				(Grd_40127_Dowodca,"WP_ZM_ATTACK_06");
	Wld_InsertNpc				(Stt_40128_Schatten,"WP_ZM_ATTACK_07");
	
	Npc_ExchangeRoutine(NON_5611_Jonas,"Start");
	NON_5611_Jonas.aivar[AIV_PARTYMEMBER] = FALSE;
    B_LogEntry               (ZagrozeniMysliwi,"Myœliwi dali radê odbiæ pierwszy atak stra¿ników Gomeza. Alex poleci³ nam uderzyæ na g³ówne si³y stacjonuj¹ce pod drugiej strony rzeki pod lasem. Szykuje siê ciê¿ka walka!");
};

//========================================
//-----------------> ZM_GATT
//========================================

INSTANCE DIA_Alex_ZM_GATT (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_ZM_GATT_Condition;
   information  = DIA_Alex_ZM_GATT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_ZM_GATT_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_SLD_40129_Pascal_ZM_GoToHunters))
    && (Npc_IsDead (Grd_40116_Gardist))
    && (Npc_IsDead (Grd_40117_Gardist))
    && (Npc_IsDead (Grd_40118_Gardist))
    && (Npc_IsDead (Grd_40119_Gardist))
    && (Npc_IsDead (Grd_40120_Gardist))
    && (Npc_IsDead (Grd_40121_Gardist))
{
    return TRUE;
};
};
FUNC VOID DIA_Alex_ZM_GATT_Info()
{
    AI_Output (self, other ,"DIA_Alex_ZM_GATT_03_01"); //A wiêc przybyliœcie. Jesteœmy wam wdziêczni.
    AI_Output (other, self ,"DIA_Alex_ZM_GATT_15_02"); //Tak. Domyœlam siê, ¿e to nie by³y g³ówne si³y Stra¿y?
    AI_Output (self, other ,"DIA_Alex_ZM_GATT_03_03"); //Na ca³e szczêœcie nie. Z nimi jakoœ sobie poradziliœmy ale g³ówne si³y znajduj¹ siê na drugim brzegu rzeki. Pod lasem.
    AI_Output (self, other ,"DIA_Alex_ZM_GATT_03_04"); //WeŸ Najemników i rozprawcie sie z nimi.
    AI_Output (other, self ,"DIA_Alex_ZM_GATT_15_05"); //A co z wami?
    AI_Output (self, other ,"DIA_Alex_ZM_GATT_03_06"); //My musimy posprz¹taæ ten ba³agan, no ju¿, nie zwlekajcie. Czas ucieka.
	 Hunters_attack_rivier();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZM_GARDISTS_DEAD
//========================================

INSTANCE DIA_Alex_ZM_GARDISTS_DEAD (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_ZM_GARDISTS_DEAD_Condition;
   information  = DIA_Alex_ZM_GARDISTS_DEAD_Info;
   permanent	= FALSE;
   description	= "Sprawa ze stra¿nikami za³atwiona.";
};

FUNC INT DIA_Alex_ZM_GARDISTS_DEAD_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_40129_Pascal_ZM_WONGRDS))
	 && (Npc_IsDead (GRD_40127_Dowodca))
{
    return TRUE;
};
};
FUNC VOID DIA_Alex_ZM_GARDISTS_DEAD_Info()
{
    AI_Output (other, self ,"DIA_Alex_ZM_GARDISTS_DEAD_15_01"); //Sprawa ze stra¿nikami za³atwiona.
    AI_Output (self, other ,"DIA_Alex_ZM_GARDISTS_DEAD_03_02"); //Widzia³em z oddali. To by³a piêkna walka. Dziêki za pomoc.
    AI_Output (other, self ,"DIA_Alex_ZM_GARDISTS_DEAD_15_03"); //No w³aœnie...
    AI_Output (self, other ,"DIA_Alex_ZM_GARDISTS_DEAD_03_04"); //Aaa... Rozumiem. Chodzi o jak¹œ nagrodê.
    AI_Output (self, other ,"DIA_Alex_ZM_GARDISTS_DEAD_03_05"); //Oczywiœcie. WeŸ tê trofea, ju¿ je zapakowa³em i podziel siê z reszt¹.
    AI_Output (other, self ,"DIA_Alex_ZM_GARDISTS_DEAD_15_06"); //Dziêki.
	B_GiveInvItems (self,other, ItMi_Throphy_ZM, 1);
	B_GiveInvItems (self,other, ItMi_Throphy_PartyMembers, 3);
	B_LogEntry               (ZagrozeniMysliwi,"Alex by³ wielce uradowany z rezultatu naszej misji i wyp³aci³ nam nale¿n¹ sumê za okazan¹ jemu i jego ludziom pomoc.");
};

//========================================
//-----------------> PNA_SO_END
//========================================

INSTANCE DIA_Alex_PNA_SO_END (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_PNA_SO_END_Condition;
   information  = DIA_Alex_PNA_SO_END_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_PNA_SO_END_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Alex_PNA_ALEX_GETNUGG))
{
    return TRUE;
};
};
FUNC VOID DIA_Alex_PNA_SO_END_Info()
{
    AI_Output (self, other ,"DIA_Alex_PNA_SO_END_03_01"); //A i muszê ci coœ powiedzieæ ch³opcze.
    AI_Output (other, self ,"DIA_Alex_PNA_SO_END_15_02"); //Co takiego?
    AI_Output (self, other ,"DIA_Alex_PNA_SO_END_03_03"); //Nie chce ju¿ robiæ interesów z Magnatami. Przemyœla³em wszystko.
    AI_Output (other, self ,"DIA_Alex_PNA_SO_END_15_04"); //Dlaczego?
    AI_Output (self, other ,"DIA_Alex_PNA_SO_END_03_05"); //To pod³e I wyrachowane dranie. Maj¹ krew na rêkach I tylko pomna¿aj¹ swój maj¹tek wyzyskuj¹c s³abszych.
    AI_Output (other, self ,"DIA_Alex_PNA_SO_END_15_06"); //Ale przecie¿ oni najlepiej p³ac¹.
    AI_Output (self, other ,"DIA_Alex_PNA_SO_END_03_07"); //Nie ruda jest najwa¿niejsza na tym œwiecie wbrew pozorom.
    AI_Output (self, other ,"DIA_Alex_PNA_SO_END_03_08"); //A wartoœci takie jak honor I pomoc s³abszym.
    AI_Output (other, self ,"DIA_Alex_PNA_SO_END_15_10"); //Mo¿e masz racjê.
   
};

//========================================
//-----------------> BLACK_PUFPUF
//========================================

INSTANCE DIA_Alex_BLACK_PUFPUF (C_INFO)
{
   npc          = NON_5600_Alex;
   nr           = 1;
   condition    = DIA_Alex_BLACK_PUFPUF_Condition;
   information  = DIA_Alex_BLACK_PUFPUF_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Alex_BLACK_PUFPUF_Condition()
{
   if (Kapitel == 5)
{
    return TRUE;
};
};
FUNC VOID DIA_Alex_BLACK_PUFPUF_Info()
{
    AI_Output (self, other ,"DIA_Alex_BLACK_PUFPUF_03_01"); //Czarne chmury zbieraj¹ siê nad koloni¹. To czas wielkich zmian.
    AI_Output (other, self ,"DIA_Alex_BLACK_PUFPUF_15_02"); //Musimy jakoœ je przetrwaæ.
    AI_Output (self, other ,"DIA_Alex_BLACK_PUFPUF_03_03"); //Tylko jednoœæ mo¿e ocaliæ mnie I moich ludzi. Myœliwi bêd¹ solidarni z obozami przeciwnymi Gomezowi.
    AI_Output (self, other ,"DIA_Alex_BLACK_PUFPUF_03_04"); //Ale równie¿ bêd¹ staraæ siê trzymaæ mo¿liwe na uboczu. Póki to wszystko siê nie skoñczy.
    AI_Output (other, self ,"DIA_Alex_BLACK_PUFPUF_15_05"); //Jesteœcie za s³abi by aktywnie walczyæ ze Starym Obozem.
    AI_Output (self, other ,"DIA_Alex_BLACK_PUFPUF_03_06"); //S³yszysz ten szelest?
    AI_Output (other, self ,"DIA_Alex_BLACK_PUFPUF_15_07"); //Nie rozumiem?
    AI_Output (self, other ,"DIA_Alex_BLACK_PUFPUF_03_08"); //To Gomez k³apie zêbami ze z³oœci. Chcia³bym by ten dokucznik w koñcu trafi³ w nale¿ne miejsce dla siebie... Do Beliara!
    AI_Output (other, self ,"DIA_Alex_BLACK_PUFPUF_15_09"); //Wielu widzia³oby tam Gomeza. Chyba nawet wszyscy, rzecz jasna poza nim samym...
};

instance dia_alex_pickpocket(c_info) {
    npc = non_5600_alex;
    nr = 900;
    condition = dia_alex_pickpocket_condition;
    information = dia_alex_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_alex_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 45);
};

func void dia_alex_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_alex_pickpocket);
	info_addchoice(dia_alex_pickpocket, dialog_back, dia_alex_pickpocket_back);
	info_addchoice(dia_alex_pickpocket, dialog_pickpocket, dia_alex_pickpocket_doit);
};

func void dia_alex_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_alex_pickpocket);
};

func void dia_alex_pickpocket_back() {
    info_clearchoices(dia_alex_pickpocket);
};