//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_BaalLukor_world_EXIT(C_INFO)
{
	npc             = GUR_1213_BaalLukor_world;
	nr              = 999;
	condition	= DIA_BaalLukor_world_EXIT_Condition;
	information	= DIA_BaalLukor_world_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_BaalLukor_world_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BaalLukor_world_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_BaalLukor_world_HELLO1 (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_HELLO1_Condition;
   information  = DIA_BaalLukor_world_HELLO1_Info;
   permanent	= FALSE;
   description	= "Ty pewnie te� si� do mnie nie odezwiesz?";
};

FUNC INT DIA_BaalLukor_world_HELLO1_Condition()
{
    if (kapitel == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO1_15_01"); //Ty pewnie te� si� do mnie nie odezwiesz?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_02"); //A odezw�!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_03"); //Jeste�my z dala od innych Guru, wi�c nie b�d� mie� do mnie wyrzut�w. Ze mn� mo�esz rozmawia� jak z ka�dym.
	AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_04"); //Powiem wi�cej. Chocia� nie, my�l�, �e na obecn� chwil� nie b�dziesz mi nawet w stanie pom�c.
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> ZADANIE
//========================================

INSTANCE DIA_BaalLukor_world_ZADANIE (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_ZADANIE_Condition;
   information  = DIA_BaalLukor_world_ZADANIE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_BaalLukor_world_ZADANIE_Condition()
{
    if (kapitel == 2) && (Npc_GetTrueGuild(other) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_ZADANIE_Info()
{
    AI_Output (self, other ,"DIA_BaalLukor_world_ZADANIE_03_01"); //Zaczekaj! Mam dla ciebie zadanie!
};

//========================================
//-----------------> QUEST2
//========================================

INSTANCE DIA_BaalLukor_world_QUEST2 (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 2;
   condition    = DIA_BaalLukor_world_QUEST2_Condition;
   information  = DIA_BaalLukor_world_QUEST2_Info;
   permanent	= FALSE;
   description	= "Jakie zadanie?";
};

FUNC INT DIA_BaalLukor_world_QUEST2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_ZADANIE))
    && (kapitel == 2)
	&& (Npc_GetTrueGuild(other) == GIL_TPL)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_QUEST2_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST2_15_01"); //Jakie zadanie?
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_02"); //Kilka tygodni temu wys�a�em Gor Na Lina do Nowego Obozu. Mia� szpiegowa� ludzi Laresa.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_03"); //Podejrzewam, �e jego siepacze podkradaj� naszym wys�annikom ziele.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_04"); //Od d�u�szego czasu nie mam od niego �adnych wie�ci. Mo�esz go poszuka�?
    MIS_MissedSpy = LOG_RUNNING;

    Log_CreateTopic            (CH2_MissedSpy, LOG_MISSION);
    Log_SetTopicStatus       (CH2_MissedSpy, LOG_RUNNING);
    B_LogEntry                     (CH2_MissedSpy,"Baal Lukor wys�a� do Nowego Obozu Stra�nika �wi�tynnego imieniem Gor Na Lin. Stra�nik mia� szpiegowa� ludzi Laresa, jednak od d�u�szego czasu nie ma od niego �adnych wie�ci.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> LIN_DED
//========================================

INSTANCE DIA_BaalLukor_world_LIN_DED (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_LIN_DED_Condition;
   information  = DIA_BaalLukor_world_LIN_DED_Info;
   permanent	= FALSE;
   description	= "Gor Na Lin nie �yje.";
};

FUNC INT DIA_BaalLukor_world_LIN_DED_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalLukor_world_QUEST2)) && (Npc_IsDead(TPL_3928_GorNaLin)) && (MIS_MissedSpy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_LIN_DED_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_01"); //Gor Na Lin nie �yje.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_02"); //Nie uda�o mi si� go ocali�. Zabi�y go Szkodniki.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_03"); //Da� si� rozpracowa�? Co si� sta�o?
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_04"); //Chcia� wnikn�� do ich grupy. Jednak Szkodniki szybko si� zorientowali, �e jest szpiegiem.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_05"); //Cz�stowali go mocnym alkoholem, w ko�cu si� uzale�ni�. Spotka�em go kompletnie pijanego w karczmie. 
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_06"); //Szkodniki nie chcia�y go wypu�ci�. Musia�em kombinowa�, ale co� nie wysz�o.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_07"); //Niejaki Bruce zabi� Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_08"); //Dobrze, �e tobie si� poszcz�ci�o.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_09"); //To smutna wiadomo��, jednak dzi�kuj� za twoje starania. Masz tu skromn� zap�at�.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	Log_SetTopicStatus       (CH2_MissedSpy, LOG_FAILED);
    MIS_MissedSpy = LOG_FAILED;
    B_LogEntry                     (CH2_MissedSpy,"Powiedzia�em Baal Lukorowi, �e Gor Na Lin nie �yje i nie uda�o mi si� go uratowa�.");
};

//========================================
//-----------------> QUEST_END
//========================================

INSTANCE DIA_BaalLukor_world_QUEST_END (C_INFO)
{
   npc          = GUR_1213_BaalLukor_world;
   nr           = 1;
   condition    = DIA_BaalLukor_world_QUEST_END_Condition;
   information  = DIA_BaalLukor_world_QUEST_END_Info;
   permanent	= FALSE;
   description	= "Przyprowadzi�em Gor Na Lina.";
};

FUNC INT DIA_BaalLukor_world_QUEST_END_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_HELLO2_POWROT_DONE))
	&& (MIS_MissedSpy == LOG_RUNNING) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalLukor_world_QUEST_END_Info()
{
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_01"); //Przyprowadzi�em Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_02"); //Zauwa�y�em. Dobra robota, jednak chcia�bym wiedzie�, co si� z nim dzia�o. Gdzie go znalaz�e�? By� w Nowym Obozie?
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_03"); //Tak. Za bardzo spoufali� si� ze Szkodnikami. Popad� w pija�stwo. Ledwo uda�o mi si� go z tego wyci�gn��.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_04"); //Jego umys�... hmm... odni�s� powa�ne... szkody.
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_05"); //Da� mi ju� to do zrozumienia.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_06"); //C�... B�d� musia� nad nim troch� popracowa�.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_07"); //A wracaj�c do ciebie... To nie by�o �atwe zadanie. We� te rud� i wywary jako nagrod�.
	Log_SetTopicStatus       (CH2_MissedSpy, LOG_SUCCESS);
    MIS_MissedSpy = LOG_SUCCESS;
    B_LogEntry                     (CH2_MissedSpy,"Baal Lukor by� bardzo zadowolony z powrotu Gor Na Lina, jednak zaskoczy�o go jego zachowanie. Na szcz�cie to nie jest m�j problem.");

    B_GiveXP (400);
    CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
    CreateInvItems (self, ItFo_Potion_Health_01, 2);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 2);
	
	CreateInvItems (self, ItFo_Potion_Haste_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Haste_01, 1);
	
	var c_npc gorlin;
	gorlin = Hlp_GetNpc(TPL_3928_GorNaLin);
	Mdl_SetVisualBody (gorlin,"hum_body_naked0",1, 2,"Hum_Head_Psionic",13, 2,TPL_ARMOR_L);
	EquipItem (gorlin, ItMw_2H_Sword_Light_01);
	
};
