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
   description	= "Czym si� tutaj zajmujesz?";
};

FUNC INT DIA_Stanley_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Stanley_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_01"); //Czym si� tutaj zajmujesz?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_02"); //Dbam o inwentarz my�liwych.
    AI_Output (other, self ,"DIA_Stanley_HELLO1_15_03"); //Polujesz na co�?
    AI_Output (self, other ,"DIA_Stanley_HELLO1_03_04"); //Czasami. Raczej nie opuszczam obozu.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE); //dodane
	B_LogEntry		(GE_TraderOW,"My�liwy Stanley to osoba z kt�r� mog� pohandlowa� r�no�ciami. Znajd� go w ma�ym obozie my�liwych przy rzece.");
};

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
//---------------------------------------------------------------
instance  NON_Stanley_TEACH_2H (C_INFO)
{
	npc				= NON_5602_Stanley;
	condition		= NON_Stanley_TEACH_2H_Condition;
	information		= NON_Stanley_TEACH_2H_Info;
	permanent		= 0;
	description		= "Mo�esz mnie nauczy� lepiej walczy�?"; 
};
//
FUNC int  NON_Stanley_TEACH_2H_Condition()
{	
		return TRUE;
};

FUNC void  NON_Stanley_TEACH_2H_Info()
{
	AI_Output (other, self,"NON_Stanley_TEACH_2H_Info_15_01"); //Mo�esz mnie nauczy� lepiej walczy�?
	AI_Output (self, other,"NON_Stanley_TEACH_2H_Info_09_02"); //Mog� przeprowadzi� z tob� podstawowe szkolenie bojowe w zakresie broni jednor�cznej i dwur�cznej. Nikt inny ci� wi�cej nie nauczy, dop�ki nie do��czysz do kt�rego� z oboz�w. 

		Log_CreateTopic   (GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Stanley przeszkoli mnie z podstaw broni jedno i dwur�cznej.");
}; 

//---------------------------------------------------------------
// NAUKA WALKI ORʯEM 2H
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
	Info_AddChoice(DIA_Stanley_Teach,"Wr��",DIA_Stanley_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Stanley_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Stanley_START_TRAIN_1H_5);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Stanley_START_TRAIN_2H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Stanley_START_TRAIN_2H_5);
};

func void DIA_Stanley_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Stanley_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Stanley_START_TRAIN_1H_5);

};



func void DIA_Stanley_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);

	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Stanley_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Stanley_START_TRAIN_1H_5);


};

func void DIA_Stanley_START_TRAIN_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Stanley_START_TRAIN_2H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Stanley_START_TRAIN_2H_5);

};



func void DIA_Stanley_START_TRAIN_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,40);
	Info_ClearChoices(DIA_Stanley_Teach);
	Info_AddChoice(DIA_Stanley_Teach,Dialog_Back,DIA_Stanley_START_TRAIN_BACK);

	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� dwur�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_2H,1),0),DIA_Stanley_START_TRAIN_2H_1);
	Info_AddChoice(DIA_Stanley_Teach,B_BuildLearnString("Bro� dwur�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_2H,5),0),DIA_Stanley_START_TRAIN_2H_5);


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
   description	= "Alex zosta� porwany?";
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
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_01"); //Alex zosta� porwany?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_02"); //Tak. Polowa� w okolicach obozu i zosta� schwytany przez Stra�nik�w.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_03"); //To dziwne.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_04"); //W zachowaniu ludzi Gomeza ju� mnie chyba nic nie zdziwi.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_05"); //Ledwie czeka�, a� zaatakuj� Nowy Ob�z, albo Quentina.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_06"); //Prosz� ci�, uwolnij Alexa.
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_07"); //Mo�esz mi powiedzie� co� wi�cej o samym porwaniu?
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_08"); //By�em w okolicy, jednak ba�em si� interwencji. Mieli znaczn� przewag�.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_09"); //Na swojego szefa wo�ali Siekacz.
    AI_Output (self, other ,"DIA_Stanley_Porwanie_03_10"); //M�wi ci co� to imi�?
    AI_Output (other, self ,"DIA_Stanley_Porwanie_15_11"); //Kojarz� go�cia. Zobacz�, co da si� zrobi�.
    B_LogEntry                     (CH3_Kidnapping,"Alex zosta� porwany przez oddzia� Stra�nik�w pod dow�dztwem Siekacza. ");
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
   description	= "Potrzebuj� rudy na okup za Alexa.";
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
    AI_Output (other, self ,"DIA_Stanley_AlexPrisoner_15_01"); //Potrzebuj� rudy na okup za Alexa.
    AI_Output (self, other ,"DIA_Stanley_AlexPrisoner_03_02"); //Niestety nie mam ani bry�ki. �a�uj�, �e nie mog� pom�c. Porozmawiaj z pozosta�ymi.
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
   description	= "Mam dla ciebie 50 strza�. ";
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
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_01"); //Mam dla ciebie 50 strza�. 
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_02"); //Sk�d wiedzia�e�, �e ich potrzebuj�?
    AI_Output (other, self ,"DIA_Stanley_Arrows_15_03"); //Otrzyma�em zadanie od Alexa.
    AI_Output (self, other ,"DIA_Stanley_Arrows_03_04"); //Rozumiem. Dzi�ki za pomoc.
    B_GiveInvItems (other, self, ItAmArrow, 50);
    B_LogEntry                     (CH1_JobInHuntersCamp,"Stanley otrzyma� swoje 50 strza�. ");

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
   description	= "Jak wygl�da �ycie tutaj?";
};

FUNC INT DIA_Stanley_HELLO2_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Stanley_HELLO1)) {
    return TRUE; };
};

FUNC VOID DIA_Stanley_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_01"); //Jak wygl�da �ycie tutaj?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_02"); //Nie jest a� tak �le. Oczywi�cie, je�li kto� potrafi o siebie zadba�. 
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_03"); //Masz dla mnie jakie� porady?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_04"); //W Kolonii a� roi si� od zwierzyny. Niech ci� jednak to nie zwiedzie. Stada �cierwojad�w i wilk�w nie s� tylko dla nas.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_05"); //Wielu my�liwych zapomina, �e orkowie te� musz� co� je��. Prawie po�owa doliny jest pod ich kontrol�.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_06"); //Na orkowych ziemiach pe�no jest patroli i zwiadowc�w. Nie zapuszczaj si� tam bez dobrej kuszy i miecza.
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_07"); //A je�eli by�oby ci dane spotka� orkowego szamana, uciekaj czym pr�dzej.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_08"); //Dlaczego?
    AI_Output (self, other ,"DIA_Stanley_HELLO2_03_09"); //Raz widzia�em takiego orka. Zielonosk�rzy podobnie jak ludzie, potrafi� pos�ugiwa� si� magi�. Ich topory s� niebezpieczne, ale ich ogie� jest wr�cz zab�jczy.
    AI_Output (other, self ,"DIA_Stanley_HELLO2_15_10"); //B�d� mia� si� na baczno�ci.
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
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_02"); //C�, nasz ob�z znajduje si� pomi�dzy dwiema wa�nymi �cie�kami. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_03"); //Jedna prowadzi ze Starego Obozu do kopalni, a druga do Nowego Obozu. Cz�sto mo�na tam spotka� tragarzy przenosz�cych r�ne towary.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_04"); //Raz by�em �wiadkiem napa�ci Bandyt�w na taki konw�j. Co to by�o za widowisko! P�nym wieczorem z lasu wy�oni�y si� pochodnie. Po chwili rozpocz�� si� szale�czy taniec ostrzy.
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_05"); //Iskry, b�yski or�a, j�k rannych... Ca�o�� trwa�a zaledwie chwil�. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_06"); //Bandyci uciekli, gdy tylko zdobyli �upy. Nie wiem nawet, gdzie znajduje si� ich Ob�z. 
    AI_Output (self, other ,"DIA_Stanley_HELLO4_03_07"); //Pami�tam, jak nast�pnego dnia rano s�ysza�em g�o�ne bluzgi Stanleya. Nie�le si� wtedy wkurzy�, skoro by�o go s�ycha� a� tutaj.
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
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_02"); //Idziesz ze mn� na polowanie. Musimy si� pozby� goblin�w z okolicy. 
    AI_Output (other, self ,"DIA_Stanley_POLOWANIE_IMPORTANT_15_03"); //No dobra.
    AI_Output (self, other ,"DIA_Stanley_POLOWANIE_IMPORTANT_03_04"); //Zaprowadz� ci�. Powiedz, gdy b�dziesz gotowy.
    MIS_OnerousGobbos = LOG_RUNNING;

    Log_CreateTopic            (CH1_OnerousGobbos, LOG_MISSION);
    Log_SetTopicStatus       (CH1_OnerousGobbos, LOG_RUNNING);
    B_LogEntry                     (CH1_OnerousGobbos,"Gobliny mieszkaj�ce w okolicy obozu my�liwych sta�y si� niewyobra�alnie uci��liwe. Razem ze Stanleyem mamy zredukowa� ich liczb�. ");
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
   description	= "W drog�.";
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
    AI_Output (other, self ,"DIA_Stanley_LetsGo_15_01"); //W drog�.
    AI_Output (self, other ,"DIA_Stanley_LetsGo_03_02"); //Zaprowadz� ci�.
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
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_01"); //No i jeste�my. 
    AI_Output (other, self ,"DIA_Stanley_UkonczoneGobliny_15_02"); //Pozbyli�my si� troch� tego cholerstwa.
    AI_Output (self, other ,"DIA_Stanley_UkonczoneGobliny_03_03"); //Dobra robota. Ja wracam do obozu. Jak chcesz, to mo�esz tu chwil� pow�szy�. 
    B_LogEntry                     (CH1_OnerousGobbos,"Dotarli�my do jaskini goblin�w zabijaj�c cz�� po drodze. Chyba warto przeszuka� jaskini�. ");
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
   description	= "Masz przygotowa� p�aszcz z tej sk�ry.";
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
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_01"); //Masz przygotowa� p�aszcz z tej sk�ry.
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_02"); //Przysy�a ci� Mil?
    AI_Output (other, self ,"DIA_Stanley_Plaszcz_15_03"); //Tak. 
    AI_Output (self, other ,"DIA_Stanley_Plaszcz_03_04"); //No dobra, Przyjd� po niego jutro.
    B_LogEntry                     (CH1_FindWhiteSkin,"Mam si� zg�osi� po p�aszcz nast�pnego dnia. ");
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
   description	= "Przyszed�em po p�aszcz.";
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
    AI_Output (other, self ,"DIA_Stanley_Day_Plaszcz_15_01"); //Przyszed�em po p�aszcz.
    AI_Output (self, other ,"DIA_Stanley_Day_Plaszcz_03_02"); //Ju� jest sko�czony. Trzymaj.
    B_LogEntry                     (CH1_FindWhiteSkin,"Musz� wr�ci� z p�aszczem do Mila. ");

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
   description	= "Alex kaza� mi zwo�a� ciebie i Oliviera na polowanie...";
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
    AI_Output (other, self ,"DIA_Stanley_PNA_Polowanie_15_01"); //Alex kaza� mi zwo�a� ciebie i Oliviera na polowanie na aligatory.
    AI_Output (self, other ,"DIA_Stanley_PNA_Polowanie_03_02"); //To �wietnie, to du�o lepsze ni� �owienie ryb czy uganianie si� za �cierwojadami czy kretoszczurami. Zaczekam przed obozem.
	Npc_ExchangeRoutine(NON_5602_Stanley,"PNAW");
	
	B_LogEntry               (PolowanieNaAligatory,"Rozmawia�em ze Stanleyem. Z ch�ci� we�mie udzia� w polowaniu na aligatory. B�dzie czeka� przed obozem.");
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
   description	= "Chod�my zapolowa� na aligatory.";
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
    AI_Output (other, self ,"DIA_Stanley_PNA_GO_TO_HUNT_15_01"); //Chod�my zapolowa� na aligatory.
    AI_Output (self, other ,"DIA_Stanley_PNA_GO_TO_HUNT_03_02"); //W drog�.
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