// *Script was make in Easy Dialog Maker (EDM)
//poprawne Reflide

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Stanley_EXIT(C_INFO)
{
	npc             = NON_5602_Stanley;
	nr              = 999;
	condition	    = DIA_Stanley_EXIT_Condition;
	information	    = DIA_Stanley_EXIT_Info;
	permanent	    = TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Stanley_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Stanley_EXIT_Info()
{

	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Stanley_HELLO1 (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_HELLO1_Condition;
   information  = DIA_Stanley_HELLO1_Info;
   permanent	= FALSE;
   description	= "Czym siê tutaj zajmujesz?";
};

FUNC INT DIA_Stanley_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stanley_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_01"); //Czym siê tutaj zajmujesz?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_02"); //Dbam o inwentarz myœliwych.
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_03"); //Polujesz na coœ?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_04"); //Czasami. Raczej nie opuszczam obozu.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TraderOW,"Myœliwy Stanley to osoba z któr¹ mogê pohandlowaæ ró¿noœciami. Znajdê go w ma³ym obozie myœliwych przy rzece.");
};

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  NON_Stanley_TEACH_2H (C_INFO)
{
	npc				= NON_5602_Stanley;
	condition		= NON_Stanley_TEACH_2H_Condition;
	information		= NON_Stanley_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo¿esz mnie nauczyæ lepiej walczyæ?"; 
};
//
FUNC int  NON_Stanley_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  NON_Stanley_TEACH_2H_Info()
{
	AI_Output (other, self,"NON_Stanley_TEACH_2H_Info_15_01"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"NON_Stanley_TEACH_2H_Info_09_02"); //Mogê przeprowadziæ z tob¹ podstawowe szkolenie bojowe w zakresie broni jednorêcznej i dwurêcznej. Nikt inny ciê wiêcej nie nauczy, dopóki nie do³¹czysz do któregoœ z obozów. 

		Log_CreateTopic   (GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Stanley przeszkoli mnie z podstaw broni jedno i dwurêcznej.");
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORÊ¯EM 2H
//---------------------------------------------------------------
instance  DIA_Stanley_Teach (C_INFO)
{
	npc				= NON_5602_Stanley;
	condition		= DIA_Stanley_Teach_2H_Condition;
	information		= DIA_Stanley_Teach_2H_Info;
	permanent		= 667;
	description		= "Zacznijmy trening."; 
};
//
FUNC int  DIA_Stanley_Teach_2H_Condition()
{	
	if (Npc_KnowsInfo (hero, NON_Stanley_TEACH_2H))
	{
	return TRUE;
	};
};

FUNC void  DIA_Stanley_Teach_2H_Info()
{
	AI_Output (other, self,"DIA_Stanley_Teach_2H_Info_15_01"); //Zacznijmy trening.
	AI_Output (self, other,"DIA_Stanley_Teach_2H_Info_09_02"); //No dobra.

	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,"Wróæ",DIA_Stanley_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Stanley_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Stanley_START_TRAIN_1H_5);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Stanley_START_TRAIN_2H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Stanley_START_TRAIN_2H_5);
};

func void DIA_Stanley_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Stanley_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Stanley_START_TRAIN_1H_5);

};



func void DIA_Stanley_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);

	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Stanley_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Stanley_START_TRAIN_1H_5);


};

func void DIA_Stanley_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Stanley_START_TRAIN_2H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Stanley_START_TRAIN_2H_5);

};



func void DIA_Stanley_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);

	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ dwurêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Stanley_START_TRAIN_2H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Broñ dwurêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Stanley_START_TRAIN_2H_5);


};

func void DIA_Stanley_START_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Stanley_Teach);
};


//========================================
//-----------------> Porwanie
//========================================

INSTANCE DIA_Stanley_Porwanie (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 2;
   condition    = DIA_Stanley_Porwanie_Condition;
   information  = DIA_Stanley_Porwanie_Info;
   permanent	= FALSE;
   description	= "Alex zosta³ porwany?";
};

FUNC INT DIA_Stanley_Porwanie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_PorwanieInicjacja))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Porwanie_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_01"); //Alex zosta³ porwany?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_02"); //Tak. Polowa³ w okolicach obozu i zosta³ schwytany przez Stra¿ników.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_03"); //To dziwne.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_04"); //W zachowaniu ludzi Gomeza ju¿ mnie chyba nic nie zdziwi.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_05"); //Ledwie czekaæ, a¿ zaatakuj¹ Nowy Obóz, albo Quentina.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_06"); //Proszê ciê, uwolnij Alexa.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_07"); //Mo¿esz mi powiedzieæ coœ wiêcej o samym porwaniu?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_08"); //By³em w okolicy, jednak ba³em siê interwencji. Mieli znaczn¹ przewagê.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_09"); //Na swojego szefa wo³ali Siekacz.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_10"); //Mówi ci coœ to imiê?
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_11"); //Kojarzê goœcia. Zobaczê, co da siê zrobiæ.
    B_LogEntry                     (CH3_Kidnapping,"Alex zosta³ porwany przez oddzia³ Stra¿ników pod dowództwem Siekacza. ");
};

//////////////////////////////////////////////////
// Alex Help
//////////////////////////////////////////////////

INSTANCE DIA_Stanley_AlexPrisoner (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 2;
   condition    = DIA_Stanley_AlexPrisoner_Condition;
   information  = DIA_Stanley_AlexPrisoner_Info;
   permanent	= FALSE;
   description	= "Potrzebujê rudy na okup za Alexa.";
};

FUNC INT DIA_Stanley_AlexPrisoner_Condition()
{
    if (MIS_Kidnapping == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Raven_ZniewolonyAlex))
    && (!Npc_KnowsInfo (hero, DIA_Raven_ZaplataZaWolnosc))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_AlexPrisoner_Info()
{
    AI_Output (other, self ,"DIA_Stanley_AlexPrisoner_15_01"); //Potrzebujê rudy na okup za Alexa.
    AI_Output (self, other ,"DIA_Stanley_AlexPrisoner_03_02"); //Niestety nie mam ani bry³ki. ¯a³ujê, ¿e nie mogê pomóc. Porozmawiaj z pozosta³ymi.
};

//========================================
//-----------------> Arrows
//========================================

INSTANCE DIA_Stanley_Arrows (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_Arrows_Condition;
   information  = DIA_Stanley_Arrows_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie 50 strza³. ";
};

FUNC INT DIA_Stanley_Arrows_Condition()
{
    if (MIS_JobInHuntersCamp == LOG_RUNNING)
    && (Npc_HasItems (other, ItAmArrow) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Arrows_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_01"); //Mam dla ciebie 50 strza³. 
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_02"); //Sk¹d wiedzia³eœ, ¿e ich potrzebujê?
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_03"); //Otrzyma³em zadanie od Alexa.
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_04"); //Rozumiem. Dziêki za pomoc.
    B_GiveInvItems (other, self, ItAmArrow, 50);
    B_LogEntry                     (CH1_JobInHuntersCamp,"Stanley otrzyma³ swoje 50 strza³. ");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Stanley_HELLO2 (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 500;
   condition    = DIA_Stanley_HELLO2_Condition;
   information  = DIA_Stanley_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak wygl¹da ¿ycie tutaj?";
};

FUNC INT DIA_Stanley_HELLO2_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_01"); //Jak wygl¹da ¿ycie tutaj?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_02"); //Nie jest a¿ tak Ÿle. Oczywiœcie, jeœli ktoœ potrafi o siebie zadbaæ. 
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_03"); //Masz dla mnie jakieœ porady?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_04"); //W Kolonii a¿ roi siê od zwierzyny. Niech ciê jednak to nie zwiedzie. Stada œcierwojadów i wilków nie s¹ tylko dla nas.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_05"); //Wielu myœliwych zapomina, ¿e orkowie te¿ musz¹ coœ jeœæ. Prawie po³owa doliny jest pod ich kontrol¹.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_06"); //Na orkowych ziemiach pe³no jest patroli i zwiadowców. Nie zapuszczaj siê tam bez dobrej kuszy i miecza.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_07"); //A je¿eli by³oby ci dane spotkaæ orkowego szamana, uciekaj czym prêdzej.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_09"); //Raz widzia³em takiego orka. Zielonoskórzy podobnie jak ludzie, potrafi¹ pos³ugiwaæ siê magi¹. Ich topory s¹ niebezpieczne, ale ich ogieñ jest wrêcz zabójczy.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_10"); //Bêdê mia³ siê na bacznoœci.
};

//========================================
//-----------------> TRADE
//========================================

INSTANCE DIA_Stanley_TRADE (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 600;
   condition    = DIA_Stanley_TRADE_Condition;
   information  = DIA_Stanley_TRADE_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Pohandlujmy. ";
};

FUNC INT DIA_Stanley_TRADE_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_TRADE_Info()
{
/*	if (Npc_HasItems (self, ItMw_2H_Sword_03) >=1)
	{
	Npc_RemoveInvItems (self, ItMw_2H_Sword_03, 1);
	};
	if (Npc_HasItems (self, ItRw_Bow_Long_08) >=1)
	{
	Npc_RemoveInvItems (self, ItRw_Bow_Long_08, 1);
	};*/
    AI_Output (other, self ,"DIA_Stanley_TRADE_15_01"); //Pohandlujmy. 
    AI_Output (self, other ,"DIA_Stanley_TRADE_03_02"); //Jasne.
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Stanley_HELLO4 (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 499;
   condition    = DIA_Stanley_HELLO4_Condition;
   information  = DIA_Stanley_HELLO4_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o okolicy.";
};

FUNC INT DIA_Stanley_HELLO4_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO4_15_01"); //Opowiedz mi o okolicy.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_02"); //Có¿, nasz obóz znajduje siê pomiêdzy dwiema wa¿nymi œcie¿kami. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_03"); //Jedna prowadzi ze Starego Obozu do kopalni, a druga do Nowego Obozu. Czêsto mo¿na tam spotkaæ tragarzy przenosz¹cych ró¿ne towary.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_04"); //Raz by³em œwiadkiem napaœci Bandytów na taki konwój. Co to by³o za widowisko! PóŸnym wieczorem z lasu wy³oni³y siê pochodnie. Po chwili rozpocz¹³ siê szaleñczy taniec ostrzy.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_05"); //Iskry, b³yski orê¿a, jêk rannych... Ca³oœæ trwa³a zaledwie chwilê. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_06"); //Bandyci uciekli, gdy tylko zdobyli ³upy. Nie wiem nawet, gdzie znajduje siê ich Obóz. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_07"); //Pamiêtam, jak nastêpnego dnia rano s³ysza³em g³oœne bluzgi Stanleya. NieŸle siê wtedy wkurzy³, skoro by³o go s³ychaæ a¿ tutaj.
};


//========================================
//-----------------> POLOWANIE_IMPORTANT
//========================================

INSTANCE DIA_Stanley_POLOWANIE_IMPORTANT (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_POLOWANIE_IMPORTANT_Condition;
   information  = DIA_Stanley_POLOWANIE_IMPORTANT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stanley_POLOWANIE_IMPORTANT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_StaryZaruchal))
    && (MIS_TheftInHuntersCamp == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_POLOWANIE_IMPORTANT_Info()
{
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_01"); //Hej, ty!
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_02"); //Idziesz ze mn¹ na polowanie. Musimy siê pozbyæ goblinów z okolicy. 
    AI_Output (other, self ,"DIA_Stanley_POLOWANIE_IMPORTANT_15_03"); //No dobra.
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_04"); //Zaprowadzê ciê. Powiedz, gdy bêdziesz gotowy.
    MIS_OnerousGobbos = LOG_RUNNING;

    Log_CreateTopic            (CH1_OnerousGobbos, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OnerousGobbos, LOG_RUNNING);
    B_LogEntry                     (CH1_OnerousGobbos,"Gobliny mieszkaj¹ce w okolicy obozu myœliwych sta³y siê niewyobra¿alnie uci¹¿liwe. Razem ze Stanleyem mamy zredukowaæ ich liczbê. ");
};

//========================================
//-----------------> LetsGo
//========================================

INSTANCE DIA_Stanley_LetsGo (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 2;
   condition    = DIA_Stanley_LetsGo_Condition;
   information  = DIA_Stanley_LetsGo_Info;
   permanent	= FALSE;
   description	= "W drogê.";
};

FUNC INT DIA_Stanley_LetsGo_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stanley_POLOWANIE_IMPORTANT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_LetsGo_Info()
{
    AI_Output (other, self ,"DIA_Stanley_LetsGo_15_01"); //W drogê.
    AI_Output (self, other ,"DIA_Stanley_LetsGo_03_02"); //Zaprowadzê ciê.
	var C_NPC Stanley	; Stanley 	= Hlp_GetNpc (NON_5602_Stanley	);
    Npc_ExchangeRoutine (Stanley, "gobliny");
	Stanley.flags 	= 2;
	Stanley.aivar[AIV_PARTYMEMBER] = TRUE;
	Stanley.Npctype = NPCTYPE_FRIEND;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> UkonczoneGobliny
//========================================

INSTANCE DIA_Stanley_UkonczoneGobliny (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 3;
   condition    = DIA_Stanley_UkonczoneGobliny_Condition;
   information  = DIA_Stanley_UkonczoneGobliny_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Stanley_UkonczoneGobliny_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stanley_LetsGo))
    && (Npc_GetDistToWP (self, "SPAWN_OW_BLACKGOBBO_A1") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_UkonczoneGobliny_Info()
{
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_01"); //No i jesteœmy. 
    AI_Output (other, self ,"DIA_Stanley_UkonczoneGobliny_15_02"); //Pozbyliœmy siê trochê tego cholerstwa.
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_03"); //Dobra robota. Ja wracam do obozu. Jak chcesz, to mo¿esz tu chwilê powêszyæ. 
    B_LogEntry                     (CH1_OnerousGobbos,"Dotarliœmy do jaskini goblinów zabijaj¹c czêœæ po drodze. Chyba warto przeszukaæ jaskiniê. ");
    Log_SetTopicStatus       (CH1_OnerousGobbos, LOG_SUCCESS);
    MIS_OnerousGobbos = LOG_SUCCESS;
	var C_NPC Stanley	; Stanley 	= Hlp_GetNpc (NON_5602_Stanley	);
	Stanley.Npctype = NPCTYPE_MAIN;
	Stanley.flags 	= 0;
	Stanley.aivar[AIV_PARTYMEMBER] = false;
    B_GiveXP (250);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (Stanley, "START");
};

//========================================
//-----------------> Plaszcz
//========================================

INSTANCE DIA_Stanley_Plaszcz (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_Plaszcz_Condition;
   information  = DIA_Stanley_Plaszcz_Info;
   permanent	= FALSE;
   description	= "Masz przygotowaæ p³aszcz z tej skóry.";
};

FUNC INT DIA_Stanley_Plaszcz_Condition()
{
    if (Npc_HasItems (other, ItAt_WolfWhite_01) >=1) && (Npc_KnowsInfo (hero, DIA_Mil_Skin))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Plaszcz_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_01"); //Masz przygotowaæ p³aszcz z tej skóry.
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_02"); //Przysy³a ciê Mil?
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_03"); //Tak. 
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_04"); //No dobra, PrzyjdŸ po niego jutro.
    B_LogEntry                     (CH1_FindWhiteSkin,"Mam siê zg³osiæ po p³aszcz nastêpnego dnia. ");
	dzien_plaszcz =	wld_getday();
	B_giveinvitems (hero,self,ItAt_WolfWhite_01,1);
    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Day_Plaszcz
//========================================

INSTANCE DIA_Stanley_Day_Plaszcz (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 2;
   condition    = DIA_Stanley_Day_Plaszcz_Condition;
   information  = DIA_Stanley_Day_Plaszcz_Info;
   permanent	= FALSE;
   description	= "Przyszed³em po p³aszcz.";
};

FUNC INT DIA_Stanley_Day_Plaszcz_Condition()
{
    if (dzien_plaszcz != wld_getday())
    && (Npc_KnowsInfo (hero, DIA_Stanley_Plaszcz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Stanley_Day_Plaszcz_Info()
{
    AI_Output (other, self ,"DIA_Stanley_Day_Plaszcz_15_01"); //Przyszed³em po p³aszcz.
    AI_Output (self, other ,"DIA_Stanley_Day_Plaszcz_03_02"); //Ju¿ jest skoñczony. Trzymaj.
    B_LogEntry                     (CH1_FindWhiteSkin,"Muszê wróciæ z p³aszczem do Mila. ");

    B_GiveXP (100);
    CreateInvItems (self, ItMi_PancerzMil, 1);
    B_GiveInvItems (self, other, ItMi_PancerzMil, 1);
    AI_StopProcessInfos	(self);


};


//-----------------------------------------------------------------1.6.1----------------------------------------------------------------------------------------

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Stanley_PNA_Polowanie (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_PNA_Polowanie_Condition;
   information  = DIA_Stanley_PNA_Polowanie_Info;
   permanent	= FALSE;
   description	= "Alex kaza³ mi zwo³aæ ciebie i Oliviera na polowanie...";
};

FUNC INT DIA_Stanley_PNA_Polowanie_Condition()
{
 if (Npc_KnowsInfo(hero,DIA_Alex_PNA_Wchodze))
{
    return TRUE;
};
};
FUNC VOID DIA_Stanley_PNA_Polowanie_Info()
{
    AI_Output (other, self ,"DIA_Stanley_PNA_Polowanie_15_01"); //Alex kaza³ mi zwo³aæ ciebie i Oliviera na polowanie na aligatory.
    AI_Output (self, other ,"DIA_Stanley_PNA_Polowanie_03_02"); //To œwietnie, to du¿o lepsze ni¿ ³owienie ryb czy uganianie siê za œcierwojadami czy kretoszczurami. Zaczekam przed obozem.
	Npc_ExchangeRoutine(NON_5602_Stanley,"PNAW");
	
	B_LogEntry               (PolowanieNaAligatory,"Rozmawia³em ze Stanleyem. Z chêci¹ weŸmie udzia³ w polowaniu na aligatory. Bêdzie czeka³ przed obozem.");
    //Npc_ExchangeRoutine(NON_5602_Stanley,"FollowPNA0");
};


//========================================
//-----------------> PNA_GO_TO_HUNT
//========================================

INSTANCE DIA_Stanley_PNA_GO_TO_HUNT (C_INFO)
{
   npc          = NON_5602_Stanley;
   nr           = 1;
   condition    = DIA_Stanley_PNA_GO_TO_HUNT_Condition;
   information  = DIA_Stanley_PNA_GO_TO_HUNT_Info;
   permanent	= FALSE;
   description	= "ChodŸmy zapolowaæ na aligatory.";
};

FUNC INT DIA_Stanley_PNA_GO_TO_HUNT_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Olivier_PNA_Udzial))
&& (Npc_GetDistToWP(NON_5602_Stanley,"WP_PNA_STANLEY_WAIT")<300)
{
    return TRUE;
};
};
FUNC VOID DIA_Stanley_PNA_GO_TO_HUNT_Info()
{
    AI_Output (other, self ,"DIA_Stanley_PNA_GO_TO_HUNT_15_01"); //ChodŸmy zapolowaæ na aligatory.
    AI_Output (self, other ,"DIA_Stanley_PNA_GO_TO_HUNT_03_02"); //W drogê.
	NON_5602_Stanley.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(NON_5602_Stanley,"PNAG");
    AI_StopProcessInfos	(self);
};

instance dia_stanley_pickpocket(c_info) {
    npc = non_5602_stanley;
    nr = 900;
    condition = dia_stanley_pickpocket_condition;
    information = dia_stanley_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_stanley_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_stanley_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_stanley_pickpocket);
	info_addchoice(dia_stanley_pickpocket, dialog_back, dia_stanley_pickpocket_back);
	info_addchoice(dia_stanley_pickpocket, dialog_pickpocket, dia_stanley_pickpocket_doit);
};

func void dia_stanley_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_stanley_pickpocket);
};

func void dia_stanley_pickpocket_back() {
    info_clearchoices(dia_stanley_pickpocket);
};