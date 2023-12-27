
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Buddler505_EXIT(C_INFO)
{
	npc             = VLK_505_Buddler;
	nr              = 999;
	condition		= DIA_Buddler505_EXIT_Condition;
	information		= DIA_Buddler505_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Buddler505_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Buddler505_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FABLER1
//========================================

INSTANCE DIA_Buddler_FABLER1 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_FABLER1_Condition;
   information  = DIA_Buddler_FABLER1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Buddler_FABLER1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_FABLER1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_02"); //Nazywam siê Fabler. Zanim trafi³em do Kolonii by³em robotnikiem w porcie w Vengardzie.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_03"); //To co w dzieñ siê zarobi³o, to wieczorem w karczmie siê przepuszcza³o. Trzeba by³o jakoœ odpocz¹æ po ciê¿kim dniu pracy.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_04"); //Czasami gra³o siê te¿ w koœci i wiadomo, niektórzy próbowali oszukiwaæ. Wtedy w karczmie robi³o siê weso³o.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_05"); //Tak by³o i tym razem. M³ody widaæ nie umia³ przegrywaæ. Wywi¹za³a siê drobna awantura. Ja dosta³em po mordzie i on dosta³. Tylko, ¿e on dosta³ mocniej.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_06"); //Poza tym on okaza³ siê synem oficera stra¿y miejskiej, a ja by³em… robotnikiem najemnym.
    AI_Output (self, other ,"DIA_Buddler_FABLER1_03_07"); //Teraz jestem tu gdzie jestem.
};

//========================================
//-----------------> FABLER2
//========================================

INSTANCE DIA_Buddler_FABLER2 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_FABLER2_Condition;
   information  = DIA_Buddler_FABLER2_Info;
   permanent	= FALSE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Buddler_FABLER2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_FABLER1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_FABLER2_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER2_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Buddler_FABLER2_03_02"); //Jak bêdziesz chcia³ kupiæ dobre spodnie, idŸ do Œwistaka. 
    AI_Output (other, self ,"DIA_Buddler_FABLER2_15_03"); //Zap³aci³ ci byœ nagania³ mu klientów.
    AI_Output (self, other ,"DIA_Buddler_FABLER2_03_04"); //Z czegoœ tu trzeba ¿yæ.
};

//========================================
//-----------------> FABLER3
//========================================

INSTANCE DIA_Buddler_FABLER3 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 3;
   condition    = DIA_Buddler_FABLER3_Condition;
   information  = DIA_Buddler_FABLER3_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o tym miejscu?";
};

FUNC INT DIA_Buddler_FABLER3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_FABLER1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_FABLER3_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER3_15_01"); //Co mo¿esz mi powiedzieæ o tym miejscu?
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_02"); //Znasz Grahama? To nasz obozowy kartograf. Tylko on w tej zatêch³ej Kolonii Karnej zna siê na sporz¹dzaniu map. Dziêki temu czasami dostaje jakieœ zlecenia od Magnatów.
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_03"); //Dwa lata temu zosta³ tu zrzucony skazaniec, który równie¿ mówi³, ¿e zna siê na robieniu map.
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_04"); //Widaæ Graham przestraszy³ siê o swoj¹ posadkê, bo tydzieñ póŸniej znaleziono tego œwie¿aka z kilofem w brzuchu.
    AI_Output (self, other ,"DIA_Buddler_FABLER3_03_05"); //W ka¿dym razie, lepiej nie chwaliæ siê zbytnio swoimi umiejêtnoœciami.
};

//========================================
//-----------------> FABLER4
//========================================

INSTANCE DIA_Buddler_FABLER4 (C_INFO)
{
   npc          = VLK_505_Buddler;
   nr           = 4;
   condition    = DIA_Buddler_FABLER4_Condition;
   information  = DIA_Buddler_FABLER4_Info;
   permanent	= FALSE;
   description	= "Kto tu rz¹dzi?";
};

FUNC INT DIA_Buddler_FABLER4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_FABLER1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_FABLER4_Info()
{
    AI_Output (other, self ,"DIA_Buddler_FABLER4_15_01"); //Kto tu rz¹dzi?
    AI_Output (self, other ,"DIA_Buddler_FABLER4_03_02"); //Rz¹dz¹ Magnaci, ale dla prostych Kopaczy i tak najwa¿niejsze jest to by u³o¿yæ siê jakoœ ze Stra¿nikami.
    AI_Output (self, other ,"DIA_Buddler_FABLER4_03_03"); //W Starym Obozie lepiej siê nie pojawiaæ, je¿eli nie ma siê kilku bry³ek rudy, by op³aciæ "ochronê". Stra¿nicy s¹ bardzo mœciwi i nie lubi¹ jak ktoœ im psuje interes, wiêc jak nie zap³acisz to masz przechlapane.
};

