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
   description	= "Ty pewnie te¿ siê do mnie nie odezwiesz?";
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
    AI_Output (other, self ,"DIA_BaalLukor_world_HELLO1_15_01"); //Ty pewnie te¿ siê do mnie nie odezwiesz?
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_02"); //A odezwê!
    AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_03"); //Jesteœmy z dala od innych Guru, wiêc nie bêd¹ mieæ do mnie wyrzutów. Ze mn¹ mo¿esz rozmawiaæ jak z ka¿dym.
	AI_Output (self, other ,"DIA_BaalLukor_world_HELLO1_03_04"); //Powiem wiêcej. Chocia¿ nie, myœlê, ¿e na obecn¹ chwilê nie bêdziesz mi nawet w stanie pomóc.
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
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_02"); //Kilka tygodni temu wys³a³em Gor Na Lina do Nowego Obozu. Mia³ szpiegowaæ ludzi Laresa.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_03"); //Podejrzewam, ¿e jego siepacze podkradaj¹ naszym wys³annikom ziele.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST2_03_04"); //Od d³u¿szego czasu nie mam od niego ¿adnych wieœci. Mo¿esz go poszukaæ?
    MIS_MissedSpy = LOG_RUNNING;

    Log_CreateTopic            (CH2_MissedSpy, LOG_MISSION);
    Log_SetTopicStatus       (CH2_MissedSpy, LOG_RUNNING);
    B_LogEntry                     (CH2_MissedSpy,"Baal Lukor wys³a³ do Nowego Obozu Stra¿nika Œwi¹tynnego imieniem Gor Na Lin. Stra¿nik mia³ szpiegowaæ ludzi Laresa, jednak od d³u¿szego czasu nie ma od niego ¿adnych wieœci.");
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
   description	= "Gor Na Lin nie ¿yje.";
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
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_01"); //Gor Na Lin nie ¿yje.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_02"); //Nie uda³o mi siê go ocaliæ. Zabi³y go Szkodniki.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_03"); //Da³ siê rozpracowaæ? Co siê sta³o?
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_04"); //Chcia³ wnikn¹æ do ich grupy. Jednak Szkodniki szybko siê zorientowali, ¿e jest szpiegiem.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_05"); //Czêstowali go mocnym alkoholem, w koñcu siê uzale¿ni³. Spotka³em go kompletnie pijanego w karczmie. 
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_06"); //Szkodniki nie chcia³y go wypuœciæ. Musia³em kombinowaæ, ale coœ nie wysz³o.
    AI_Output (other, self ,"DIA_BaalLukor_world_LIN_DED_15_07"); //Niejaki Bruce zabi³ Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_08"); //Dobrze, ¿e tobie siê poszczêœci³o.
    AI_Output (self, other ,"DIA_BaalLukor_world_LIN_DED_03_09"); //To smutna wiadomoœæ, jednak dziêkujê za twoje starania. Masz tu skromn¹ zap³atê.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	Log_SetTopicStatus       (CH2_MissedSpy, LOG_FAILED);
    MIS_MissedSpy = LOG_FAILED;
    B_LogEntry                     (CH2_MissedSpy,"Powiedzia³em Baal Lukorowi, ¿e Gor Na Lin nie ¿yje i nie uda³o mi siê go uratowaæ.");
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
   description	= "Przyprowadzi³em Gor Na Lina.";
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
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_01"); //Przyprowadzi³em Gor Na Lina.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_02"); //Zauwa¿y³em. Dobra robota, jednak chcia³bym wiedzieæ, co siê z nim dzia³o. Gdzie go znalaz³eœ? By³ w Nowym Obozie?
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_03"); //Tak. Za bardzo spoufali³ siê ze Szkodnikami. Popad³ w pijañstwo. Ledwo uda³o mi siê go z tego wyci¹gn¹æ.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_04"); //Jego umys³... hmm... odniós³ powa¿ne... szkody.
    AI_Output (other, self ,"DIA_BaalLukor_world_QUEST_END_15_05"); //Da³ mi ju¿ to do zrozumienia.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_06"); //Có¿... Bêdê musia³ nad nim trochê popracowaæ.
    AI_Output (self, other ,"DIA_BaalLukor_world_QUEST_END_03_07"); //A wracaj¹c do ciebie... To nie by³o ³atwe zadanie. WeŸ te rudê i wywary jako nagrodê.
	Log_SetTopicStatus       (CH2_MissedSpy, LOG_SUCCESS);
    MIS_MissedSpy = LOG_SUCCESS;
    B_LogEntry                     (CH2_MissedSpy,"Baal Lukor by³ bardzo zadowolony z powrotu Gor Na Lina, jednak zaskoczy³o go jego zachowanie. Na szczêœcie to nie jest mój problem.");

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
