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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Rakus_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Rakus_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Rakus_WhoYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Rakus_WhoYou_03_02"); //Jestem Rakus, �owca ork�w.
    AI_Output (self, other ,"DIA_Rakus_WhoYou_03_03"); //Nale�� do najbardziej zaufanych towarzyszy Wilsona.
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
    AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_02"); //Tak, to pancerze wykonane z szczeg�ln� dba�o�ci� o szczeg�y. Zapewniaj� ochron� przed uderzeniami ci�kich broni.
    AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_03"); //M�j pancerz nie raz ocali� mi �ycie. Dlatego tak o niego dbam...
	AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_04"); //Czy macie jeszcze jakie� sztuki na sprzeda�?
	AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_05"); //Mam jeden egzemplarz, jednak trzymam go na ci�kie czasy. Zreszt�, w�tpi�, aby by�o ci� sta�.
	AI_Output (other, self ,"DIA_Rakus_IWannaArmor_15_06"); //Za��my, �e nasta�y ci�kie czasy. Ile by� za niego chcia�?
	AI_Output (self, other ,"DIA_Rakus_IWannaArmor_03_07"); //Jakie� 3200 bry�ek rudy... Tak, to by�aby zdecydowanie uczciwa cena.
	
	PrintS_Ext("Warunek: Rozdzia� 4", COL_White);
	
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"�owca ork�w Rakus ma przy sobie dodatkowy egzemplarz solidnego pancerza. M�g�by mi go sprzeda�, jednak zrobi to tylko, gdy stwierdzi, �e sytuacja w G�rniczej Dolinie jest naprawd� niebezpieczna. Cena takiego pancerza wynosi u niego 3200 bry�ek rudy. (Parametry zbroi: ochrona przed broni� bia��: 54, ochrona przed strza�ami: 15, ochrona przed ogniem: 30, ochrona przed magi�: 25)");
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
   description	= "Chc� kupi� pancerz �owcy ork�w.";
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
    AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_01"); //Czasy s� ju� chyba wystarczaj�co ci�kie. Nie s�dzisz?
    AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_02"); //Masz racj�. Ci�g�e zagro�enie ze strony Gomeza, napi�ta sytuacja pomi�dzy obozami... Ju� nawet orkowie zrobili si� bardo niespokojni. 
	AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_03"); //Chc� kupi� ten pancerz.
	AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_04"); //Cena si� nie zmieni�a: 3200 bry�ek rudy. Nie mog� nic spu�ci�. 
    if (Npc_HasItems (hero, ItMiNugget)>=3200)
    {
        AI_Output (other, self ,"DIA_Rakus_BuyOrchunterArmor_15_05"); //Oto twoja zap�ata. Daj mi to, za co zap�aci�em. 
        AI_Output (self, other ,"DIA_Rakus_BuyOrchunterArmor_03_06"); //Niech ci s�u�y.
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
    AI_Output (self, other ,"DIA_Rakus_WeNeedHelp_03_01"); //Nie szukasz mo�e pracy? Przyda�aby nam si� pomoc.
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
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_02"); //To sprawa dla kogo� z zewn�trz.
    AI_Output (other, self ,"DIA_Rakus_QUEST1_RAKUS_15_03"); //O co konkretnie chodzi?
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_04"); //Musisz odebra� dostaw� �ywno�ci od Wilka. To Najemnik mieszkaj�cy w Nowym Obozie.
    AI_Output (self, other ,"DIA_Rakus_QUEST1_RAKUS_03_05"); //Masz tu 400 bry�ek rudy jako zap�at� dla Wilka. My�l�, �e mo�na si� z nim potargowa�.
    MIS_FoodForHunters = LOG_RUNNING;

    Log_CreateTopic            (CH5_FoodForHunters, LOG_MISSION);
    Log_SetTopicStatus       (CH5_FoodForHunters, LOG_RUNNING);
    B_LogEntry                     (CH5_FoodForHunters,"Rakus zleci� mi przyniesienie dostawy �ywno�ci od Wilka. Mog� si� z nim potargowa�. ");

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
   description	= "Mam wasz� �ywno��.";
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
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_01"); //Mam wasz� �ywno��.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_02"); //No nareszcie.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_03"); //Wielkie dzi�ki. To z pewno�ci� pomo�e nam przetrwa� kolejne dni.
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_04"); //Ko�czy nam si� ruda, a zbli�a si� zima. B�dzie ci�ko z dostawami. 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_05"); //Chyba trzeba znale�� jakie� �owne miejsce pe�ne zwierzyny.
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_06"); //Przecie� polujecie na ork�w. 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_07"); //Niby tak, ale oni nie s� zbyt smaczni.
    AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_08"); //Chcesz powiedzie�, �e pr�bowa�e�? 
    AI_Output (self, other ,"DIA_Rakus_DOSTAWA_Q1_03_09"); //Ech...
	AI_Output (other, self ,"DIA_Rakus_DOSTAWA_Q1_15_10"); //Mog�em nie pyta�...
    B_LogEntry                     (CH5_FoodForHunters,"Rakus otrzyma� dostaw�. Zadanie wykonane. ");
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
   description	= "Jeste� potrzebny do walki z Orkami.";
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
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_Orkow_15_01"); //Jeste� potrzebny do walki z Orkami.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_02"); //To moje powo�anie!
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_Orkow_15_03"); //Zatem ucieszy ci� fakt, �e nale�y zako�czy� �ywot paru Ork�w.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_04"); //Jestem gotowy. Ale najpierw powiedz co� wi�cej.
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_Orkow_15_05"); //Chodzi o trzech orkowych herszt�w, kt�rzy szykuj� si� wraz ze swymi oddzia�ami do zbrojnego wypadu na ziemi� ludzi.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_06"); //W takim razie trzeba jak najszybciej wys�a� tych Ork�w do Beliara!.
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_Orkow_03_07"); //Daj zna� jak wszystko si� zacznie. Spotkasz mnie przed bram� obozu.
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
	B_LogEntry               (PrzegrupowaniaOrkow,"Zebra�em Osko i Rakusa teraz pora zaj�� si� trzema orkowymi hersztami.");
};






//========================================
//-----------------> Przegrupowania Ork�w
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
    AI_Output (self, other ,"DIA_Rakus_Przegrupowania_GR2_03_01"); //Praca �owcy Ork�w mo�e nie jest zbyt skomplikowana za to nie mo�na narzeka� na brak skuteczno�ci hehe!
    AI_Output (other, self ,"DIA_Rakus_Przegrupowania_GR2_15_02"); //Jeszcze tylko jeden...
    B_LogEntry               (PrzegrupowaniaOrkow,"Drugi pu�kownik Ork�w gryzie piach.");
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