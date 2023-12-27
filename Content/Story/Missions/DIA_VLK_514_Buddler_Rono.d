//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Buddler514_EXIT(C_INFO)
{
	npc             = VLK_514_Buddler;
	nr              = 999;
	condition		= DIA_Buddler514_EXIT_Condition;
	information		= DIA_Buddler514_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Buddler514_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Buddler514_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Buddler_HELLO1 (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_HELLO1_Condition;
   information  = DIA_Buddler_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Buddler_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_02"); //Jestem Rono. Kiedyœ by³em robotnikiem w jednej z vengardzkich stoczni. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_03"); //Z tamtego warsztatu wychodzi³y ogromne okrêty. Kupcy z gildii Araxos wydawali krocie na ich zakup. Ale to jednak nic w porównaniu z tymi bogactwami, jakie gildia przewozi³a na tych statkach. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_04"); //Jako prosty robotnik nie zarabia³em jednak zbyt wiele, wiêc musia³em sobie jakoœ radziæ. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_05"); //Wielu z nas wynosi³o narzêdzia ze stoczni, by je potem opchn¹æ na czarnym rynku. Trochê chyba jednak przesadziliœmy, bo w³aœciciel zacz¹³ wêszyæ. 
    AI_Output (self, other ,"DIA_Buddler_HELLO1_03_06"); //Pech chcia³, ¿e pewnego razu przy³apa³ w³aœnie mnie. Tak wyl¹dowa³em w tym zatêch³ym miejscu. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Buddler_HELLO2 (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_HELLO2_Condition;
   information  = DIA_Buddler_HELLO2_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Buddler_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Buddler_HELLO2_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Buddler_HELLO2_03_02"); //Stara bieda.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Buddler_HELLO3 (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 3;
   condition    = DIA_Buddler_HELLO3_Condition;
   information  = DIA_Buddler_HELLO3_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jak¹œ radê?";
};

FUNC INT DIA_Buddler_HELLO3_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Buddler_HELLO3_15_01"); //Masz dla mnie jak¹œ radê?
    AI_Output (self, other ,"DIA_Buddler_HELLO3_03_02"); //Jak bêdziesz mia³ k³opoty z kimœ wp³ywowym w tym obozie, zg³oœ siê do Gravo. Nie raz pomaga³ wychodziæ Kopaczom z ró¿nych opresji.
    AI_Output (self, other ,"DIA_Buddler_HELLO3_03_03"); //Oczywiœcie nie za darmo. 
};

//========================================
//-----------------> YourHut
//========================================

INSTANCE DIA_Buddler_YourHut (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 4;
   condition    = DIA_Buddler_YourHut_Condition;
   information  = DIA_Buddler_YourHut_Info;
   permanent	= FALSE;
   description	= "Nie przeszkadza ci, ¿e wszyscy przechodz¹ przez twoj¹ chatê?";
};

FUNC INT DIA_Buddler_YourHut_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_YourHut_Info()
{
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_01"); //Nie przeszkadza ci, ¿e wszyscy przechodz¹ przez twoj¹ chatê?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_02"); //He he he... Pewnie rozmawia³eœ ju¿ z Kyle'm. On siê nigdy nie zmieni...
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_03"); //Wracaj¹c do pytania, z pocz¹tku mi to przeszkadza³o, jednak przywyk³em. W mojej chacie i tak nie ma nic wartoœciowego.
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_04"); //No mo¿e prócz pewnego talerza, lecz on ma wartoœæ wy³¹cznie sentymentaln¹. 
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_05"); //Nie boisz siê, ¿e ktoœ mimo to spróbuje go ukraœæ?    
	AI_Output (self, other ,"DIA_Buddler_YourHut_03_06"); //Nie, bo nawet ja sam nie jestem w stanie siê do niego dostaæ. 
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_07"); //Jak to?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_08"); //Skrzynia zatrzasnê³a siê kilka lat temu. Jest okropnie stara i zamek zardzewia³.
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_09"); //W³aœciwie to móg³bym poprosiæ R¹czkê o pomoc w jej otwarciu, ale tak siê sk³ada, ¿e nienawidzê tego sukinsyna.
    AI_Output (other, self ,"DIA_Buddler_YourHut_15_10"); //Dlaczego?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_11"); //Pewna stara za¿y³oœæ. Nie rozmawiajmy o tym. A ty znasz siê na otwieraniu zamków? Chcesz spróbowaæ otworzyæ ten kufer?
    AI_Output (self, other ,"DIA_Buddler_YourHut_03_12"); //Droga wolna. Je¿eli ci siê uda, dam ci 25 bry³ek rudy, albo szepnê o tobie dobre s³ówko Relgharowi. 
	
	MIS_ChestAndPlate = LOG_RUNNING;

    Log_CreateTopic         	(CH1_ChestAndPlate, LOG_MISSION);
    Log_SetTopicStatus       (CH1_ChestAndPlate, LOG_RUNNING);
    B_LogEntry              		(CH1_ChestAndPlate,"Kopacz Rono ma w swojej chacie zatrzaœniêt¹ skrzyniê, w której znajduje siê sentymentalny talerz. Jeœli uda mi siê do niej w³amaæ, zyskam poparcie Cienia Relghara, albo nagrodê w postaci kilku bry³ek rudy.");
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Jeœli pomogê Kopaczowi Rono odzyskaæ sentymentalny talerz, to szepnie o mnie Cienowi Relgharowi. ");
};

//========================================
//-----------------> GivePlate
//========================================

INSTANCE DIA_Buddler_GivePlate (C_INFO)
{
   npc          = VLK_514_Buddler;
   nr           = 5;
   condition    = DIA_Buddler_GivePlate_Condition;
   information  = DIA_Buddler_GivePlate_Info;
   permanent	= FALSE;
   description	= "Mam twój talerz.";
};

FUNC INT DIA_Buddler_GivePlate_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_YourHut))
    && (Npc_HasItems (other, ItMi_RonosPlate) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_GivePlate_Info()
{
    AI_Output (other, self ,"DIA_Buddler_GivePlate_15_01"); //Mam twój talerz.
    AI_Output (self, other ,"DIA_Buddler_GivePlate_03_02"); //Niemo¿liwe. Masz talent do tej roboty!
	
	MIS_ChestAndPlate = LOG_SUCCESS;
	Log_SetTopicStatus       (CH1_ChestAndPlate, LOG_SUCCESS);
	B_LogEntry               (CH1_ChestAndPlate,"Otwarcie skrzyni faktycznie by³o trudne, jednak uda³o mi siê. Zwróci³em w³aœcicielowi jego w³asnoœæ.");
	B_GiveXP (100);
	
	B_GiveInvItems (other, self, ItMi_RonosPlate,1);
	
    if (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_03"); //Widzê, ¿e nie do³¹czy³eœ jeszcze do ¿adnego z obozów. Szepnê o tobie dobre s³ówko Relgharowi. 
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_04"); //Na wszelki wypadek. Gdybyœ chcia³ zostaæ u nas na d³u¿ej. 
		
		B_LogEntry (CH1_JoinOC,"Pomog³em Rono odzyskaæ talerz. Zapewni³ mnie, ¿e bêdê mia³ poparcie Cienia Relghara. Najlepiej jednak jak zapytam go osobiœcie.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_05"); //Nie wiem jak mam ci dziêkowaæ. Widzê, ¿e masz ju¿ swoj¹ frakcjê, wiêc na nic ci poparcie u Relghara
        AI_Output (self, other ,"DIA_Buddler_GivePlate_03_06"); //Masz wiêc 30 bry³ek rudy. Obieca³em mniej, ale naprawdê zas³u¿y³eœ. Darujê sobie jedn¹ kolejkê w karczmie wieczorem.
		
		CreateInvItems (self, itminugget, 30);
		B_GiveInvItems (self, other, itminugget,30);
    };
};

