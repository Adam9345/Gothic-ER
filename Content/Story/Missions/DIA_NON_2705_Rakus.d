//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Rakus_EXIT(C_INFO)
{
	npc             = NON_2705_Rakus;
	nr              = 999;
	condition	= DIA_Rakus_EXIT_Condition;
	information	= DIA_Rakus_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Rakus_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rakus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Rakus_WhoYou (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_WhoYou_Condition;
   information  = DIA_Rakus_WhoYou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Rakus_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Rakus_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Rakus_WhoYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Rakus_WhoYou_03_02"); //Jestem Rakus, ³owca orków.
    AI_Output (self, other ,"DIA_Rakus_WhoYou_03_03"); //Nale¿ê do najbardziej zaufanych towarzyszy Wilsona.
};


//========================================
//-----------------> IWannaArmor
//========================================

INSTANCE DIA_Rakus_IWannaArmor (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_IWannaArmor_Condition;
   information  = DIA_Rakus_IWannaArmor_Info;
   permanent	= FALSE;
   description	= "Nosicie ciekawe zbroje.";
};

FUNC INT DIA_Rakus_IWannaArmor_Condition()
{
    return TRUE; 
};


FUNC VOID DIA_Rakus_IWannaArmor_Info()
{
    AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_01"); //Nosicie ciekawe zbroje.
    AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_02"); //Tak, to pancerze wykonane z szczególn¹ dba³oœci¹ o szczegó³y. Zapewniaj¹ ochronê przed uderzeniami ciê¿kich broni.
    AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_03"); //Mój pancerz nie raz ocali³ mi ¿ycie. Dlatego tak o niego dbam...
	AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_04"); //Czy macie jeszcze jakieœ sztuki na sprzeda¿?
	AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_05"); //Mam jeden egzemplarz, jednak trzymam go na ciê¿kie czasy. Zreszt¹, w¹tpiê, aby by³o ciê staæ.
	AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_06"); //Za³ó¿my, ¿e nasta³y ciê¿kie czasy. Ile byœ za niego chcia³?
	AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_07"); //Jakieœ 3200 bry³ek rudy... Tak, to by³aby zdecydowanie uczciwa cena.
	
	PrintS_Ext("Warunek: Rozdzia³ 4", COL_White);
	
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"£owca orków Rakus ma przy sobie dodatkowy egzemplarz solidnego pancerza. Móg³by mi go sprzedaæ, jednak zrobi to tylko, gdy stwierdzi, ¿e sytuacja w Górniczej Dolinie jest naprawdê niebezpieczna. Cena takiego pancerza wynosi u niego 3200 bry³ek rudy. (Parametry zbroi: ochrona przed broni¹ bia³¹: 54, ochrona przed strza³ami: 15, ochrona przed ogniem: 30, ochrona przed magi¹: 25)");
};

var int rakus_sell_armor;
//========================================
//-----------------> BuyOrchunterArmor
//========================================

INSTANCE DIA_Rakus_BuyOrchunterArmor (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_BuyOrchunterArmor_Condition;
   information  = DIA_Rakus_BuyOrchunterArmor_Info;
   permanent	= TRUE;
   description	= "Chcê kupiæ pancerz ³owcy orków.";
};

FUNC INT DIA_Rakus_BuyOrchunterArmor_Condition()
{
	if (kapitel >= 4) && (Npc_KnowsInfo (hero, DIA_Rakus_IWannaArmor)) && (rakus_sell_armor == false)
	{
    return TRUE; 
	};
};

FUNC VOID DIA_Rakus_BuyOrchunterArmor_Info()
{
    AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_01"); //Czasy s¹ ju¿ chyba wystarczaj¹co ciê¿kie. Nie s¹dzisz?
    AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_02"); //Masz racjê. Ci¹g³e zagro¿enie ze strony Gomeza, napiêta sytuacja pomiêdzy obozami... Ju¿ nawet orkowie zrobili siê bardo niespokojni. 
	AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_03"); //Chcê kupiæ ten pancerz.
	AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_04"); //Cena siê nie zmieni³a: 3200 bry³ek rudy. Nie mogê nic spuœciæ. 
    if (Npc_HasItems (hero, ItMiNugget)>=3200)
    {
        AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_05"); //Oto twoja zap³ata. Daj mi to, za co zap³aci³em. 
        AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_06"); //Niech ci s³u¿y.
        B_GiveInvItems (other, self, ItMiNugget, 3200);
		
		CreateInvItem		(hero, NON_ORCHUNTERARMOR_01);
	
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);

		DIA_Rakus_BuyOrchunterArmor.permanent = false;
		rakus_sell_armor = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_07"); //Nie ma rudy, nie ma pancerza.
		DIA_Rakus_BuyOrchunterArmor.permanent = true; 
    };
};

//========================================
//-----------------> WeNeedHelp
//========================================

INSTANCE DIA_Rakus_WeNeedHelp (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_WeNeedHelp_Condition;
   information  = DIA_Rakus_WeNeedHelp_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Rakus_WeNeedHelp_Condition()
{
	if (kapitel >= 5)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Rakus_WeNeedHelp_Info()
{
    AI_Output (self, other ,"DIA_Rakus_WeNeedHelp_03_01"); //Nie szukasz mo¿e pracy? Przyda³aby nam siê pomoc.
};

//========================================
//-----------------> QUEST1_RAKUS
//========================================

INSTANCE DIA_Rakus_QUEST1_RAKUS (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_QUEST1_RAKUS_Condition;
   information  = DIA_Rakus_QUEST1_RAKUS_Info;
   permanent	= FALSE;
   description	= "W czym rzecz?";
};

FUNC INT DIA_Rakus_QUEST1_RAKUS_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rakus_WeNeedHelp))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Rakus_QUEST1_RAKUS_Info()
{
    AI_Output (other, self ,"DIA_Rakus_QUEST1_RAKUS_15_01"); //W czym rzecz?
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_02"); //To sprawa dla kogoœ z zewn¹trz.
    AI_Output (other, self ,"DIA_Rakus_QUEST1_RAKUS_15_03"); //O co konkretnie chodzi?
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_04"); //Musisz odebraæ dostawê ¿ywnoœci od Wilka. To Najemnik mieszkaj¹cy w Nowym Obozie.
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_05"); //Masz tu 400 bry³ek rudy jako zap³atê dla Wilka. Myœlê, ¿e mo¿na siê z nim potargowaæ.
    MIS_FoodForHunters = LOG_RUNNING;

    Log_CreateTopic            (CH5_FoodForHunters, LOG_MISSION);
    Log_SetTopicStatus       (CH5_FoodForHunters, LOG_RUNNING);
    B_LogEntry                     (CH5_FoodForHunters,"Rakus zleci³ mi przyniesienie dostawy ¿ywnoœci od Wilka. Mogê siê z nim potargowaæ. ");

    CreateInvItems (self, ItMiNugget, 400);
    B_GiveInvItems (self, other, ItMiNugget, 400);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Rakus_DOSTAWA_Q1 (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_DOSTAWA_Q1_Condition;
   information  = DIA_Rakus_DOSTAWA_Q1_Info;
   permanent	= FALSE;
   description	= "Mam wasz¹ ¿ywnoœæ.";
};

FUNC INT DIA_Rakus_DOSTAWA_Q1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Wolf_DOSTAWA_LOWCOW))
    && (Npc_HasItems (other, foodlowcow) >=1)
    && (MIS_FoodForHunters == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rakus_DOSTAWA_Q1_Info()
{
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_01"); //Mam wasz¹ ¿ywnoœæ.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_02"); //No nareszcie.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_03"); //Wielkie dziêki. To z pewnoœci¹ pomo¿e nam przetrwaæ kolejne dni.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_04"); //Koñczy nam siê ruda, a zbli¿a siê zima. Bêdzie ciê¿ko z dostawami. 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_05"); //Chyba trzeba znaleŸæ jakieœ ³owne miejsce pe³ne zwierzyny.
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_06"); //Przecie¿ polujecie na orków. 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_07"); //Niby tak, ale oni nie s¹ zbyt smaczni.
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_08"); //Chcesz powiedzieæ, ¿e próbowa³eœ? 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_09"); //Ech...
	AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_10"); //Mog³em nie pytaæ...
    B_LogEntry                     (CH5_FoodForHunters,"Rakus otrzyma³ dostawê. Zadanie wykonane. ");
    Log_SetTopicStatus       (CH5_FoodForHunters, LOG_SUCCESS);
    MIS_FoodForHunters = LOG_SUCCESS;
	B_GiveInvItems (other, self, foodlowcow, 1);
    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//-----------------------------------------------------------------------------------------1.6.1------------------------------------------------------------------------

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Rakus_Przegrupowania_Orkow (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_Przegrupowania_Orkow_Condition;
   information  = DIA_Rakus_Przegrupowania_Orkow_Info;
   permanent	= FALSE;
   description	= "Jesteœ potrzebny do walki z Orkami.";
};

FUNC INT DIA_Rakus_Przegrupowania_Orkow_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Wilson_Przegrupowania_Prin))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rakus_Przegrupowania_Orkow_Info()
{
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_Orkow_15_01"); //Jesteœ potrzebny do walki z Orkami.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_02"); //To moje powo³anie!
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_Orkow_15_03"); //Zatem ucieszy ciê fakt, ¿e nale¿y zakoñczyæ ¿ywot paru Orków.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_04"); //Jestem gotowy. Ale najpierw powiedz coœ wiêcej.
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_Orkow_15_05"); //Chodzi o trzech orkowych hersztów, którzy szykuj¹ siê wraz ze swymi oddzia³ami do zbrojnego wypadu na ziemiê ludzi.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_06"); //W takim razie trzeba jak najszybciej wys³aæ tych Orków do Beliara!.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_07"); //Daj znaæ jak wszystko siê zacznie. Spotkasz mnie przed bram¹ obozu.
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_Orkow_15_08"); //Dobra.
    Npc_ExchangeRoutine(NON_2705_Rakus,"POWait");
   
};
//OCH_BRAMA

Func void Grupy_Orkow_PO ()
{
     Wld_SendTrigger("ORC_TENT_PO3");
    //Grupa 1
    Wld_InsertNpc		(OrcGeneral_Move_01,"FP_GUARD_ORC_PRZ_05");
	Wld_InsertNpc		(OrcElite_Rest,"FP_GUARD_ORC_PRZ_04");
	Wld_InsertNpc		(OrcWarrior1,"FP_GUARD_ORC_PRZ_03");
	Wld_InsertNpc		(OrcWarrior1,"FP_GUARD_ORC_PRZ_02");
    Wld_InsertNpc		(OrcWarrior1,"FP_GUARD_ORC_PRZ_01");
	
	
	//Grupa 2
	Wld_InsertNpc		(OrcGeneral_Move_02,"FP_GUARD_ORC_PRZ_08");
	Wld_InsertNpc		(OrcElite_Rest,"FP_GUARD_ORC_PRZ_06");
	Wld_InsertNpc		(OrcElite_Rest,"FP_GUARD_ORC_PRZ_07");
	Wld_InsertNpc		(OrcWarrior1,"FP_GUARD_ORC_PRZ_09");
	Wld_InsertNpc		(OrcWarrior1,"FP_GUARD_ORC_PRZ_10");
   //Grupa 3
    Wld_InsertNpc		(OrcGeneral_Move_03,"WP_ORC_PRZ_17");
    Wld_InsertNpc		(OrcElite_Rest,"WP_ORC_PRZ_16");
	Wld_InsertNpc		(OrcElite_Rest,"WP_ORC_PRZ_15");
	Wld_InsertNpc		(OrcElite_Rest,"WP_ORC_PRZ_14");
	Wld_InsertNpc		(OrcWarrior1,"WP_ORC_PRZ_13");
	Wld_InsertNpc		(OrcWarrior1,"WP_ORC_PRZ_12");
    Wld_InsertNpc		(OrcElite_Rest,"WP_ORC_PRZ_11");
   
};

//========================================
//-----------------> DOSTAWA_Q1
//========================================

INSTANCE DIA_Rakus_Atak_Orkow (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 1;
   condition    = DIA_Rakus_Atak_Orkow_Condition;
   information  = DIA_Rakus_Atak_Orkow_Info;
   permanent	= FALSE;
   description	= "I co, gotowi?";
};

FUNC INT DIA_Rakus_Atak_Orkow_Condition()
{
   if (Npc_KnowsInfo(hero,DIA_Rakus_Przegrupowania_Orkow)) 
   && (Npc_KnowsInfo(hero,DIA_Osko_Przegrupowania_Orkow))
   && (Npc_GetDistToWP(hero,"LOCATION_02_02")<300)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rakus_Atak_Orkow_Info()
{
    AI_Output (other, self ,"DIA_Rakus_Atak_Orkow_15_01"); //I co, gotowi?
    AI_Output (self, other ,"DIA_Rakus_Atak_Orkow_03_02"); //Jeszcze pytasz?! Ruszajmy!
	NON_2705_Rakus.aivar[AIV_PARTYMEMBER] = TRUE;
	NON_2706_osko.aivar[AIV_PARTYMEMBER]  = TRUE;
    Npc_ExchangeRoutine(NON_2705_Rakus,"POFollow");
    Npc_ExchangeRoutine(NON_2706_osko, "POFollow");
    Grupy_Orkow_PO();
	B_LogEntry               (PrzegrupowaniaOrkow,"Zebra³em Osko i Rakusa teraz pora zaj¹æ siê trzema orkowymi hersztami.");
};






//========================================
//-----------------> Przegrupowania Orków
//========================================

INSTANCE DIA_Rakus_Przegrupowania_GR2 (C_INFO)
{
   npc          = NON_2705_Rakus;
   nr           = 4;
   condition    = DIA_Rakus_Przegrupowania_GR2_Condition;
   information  = DIA_Rakus_Przegrupowania_GR2_Info;
   permanent	= false;
   important    = TRUE;
};

FUNC INT DIA_Rakus_Przegrupowania_GR2_Condition()
{
	if (Npc_IsDead (OrcGeneral_Move_02))  && (Npc_KnowsInfo(hero,DIA_Rakus_Atak_Orkow))
{ 
    return TRUE;
};
};
FUNC VOID DIA_Rakus_Przegrupowania_GR2_Info()
{
    AI_GotoNpc			(self,	hero);
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_GR2_03_01"); //Praca £owcy Orków mo¿e nie jest zbyt skomplikowana za to nie mo¿na narzekaæ na brak skutecznoœci hehe!
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_GR2_15_02"); //Jeszcze tylko jeden...
    B_LogEntry               (PrzegrupowaniaOrkow,"Drugi pu³kownik Orków gryzie piach.");
};

instance dia_rakus_pickpocket(c_info) {
    npc = non_2705_rakus;
    nr = 900;
    condition = dia_rakus_pickpocket_condition;
    information = dia_rakus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rakus_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_rakus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rakus_pickpocket);
	info_addchoice(dia_rakus_pickpocket, dialog_back, dia_rakus_pickpocket_back);
	info_addchoice(dia_rakus_pickpocket, dialog_pickpocket, dia_rakus_pickpocket_doit);
};

func void dia_rakus_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_rakus_pickpocket);
};

func void dia_rakus_pickpocket_back() {
    info_clearchoices(dia_rakus_pickpocket);
};