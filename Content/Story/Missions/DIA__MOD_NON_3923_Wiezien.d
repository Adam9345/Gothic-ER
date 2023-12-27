//***poprawny***

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Marius_EXIT(C_INFO)
{
	npc             = NON_3923_Wiezien;
	nr              = 999;
	condition	= DIA_Marius_EXIT_Condition;
	information	= DIA_Marius_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Marius_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Marius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Marius_HELLO1 (C_INFO)
{
   npc          = NON_3923_Wiezien;
   nr           = 1;
   condition    = DIA_Marius_HELLO1_Condition;
   information  = DIA_Marius_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Marius_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Marius_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_01"); //Ach, tylko nie ty! Zostaw mnie w spokoju, jestem niewinny! To wszystko wina Bloodwyna!
	if (Npc_GetTrueGuild(other) != GIL_GRD)
	{
    AI_Output (other, self ,"DIA_Marius_HELLO1_15_02"); //O czym ty mówisz? Nie jestem Stra¿nikiem Gomeza.
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_03"); //Ach, faktycznie nie wygl¹dasz jak Bullit. S³uchaj, musisz mi pomóc siê st¹d wydostaæ, ten sukinsyn mnie torturuje!
	AI_Output (self, other ,"DIA_Marius_HELLO1_03_04"); //Bloodwyn to jego przyjaciel, a ta gnida znêca³a siê nade mn¹ tylko dlatego, ¿e nie mia³em z czego zap³aciæ mu za ochronê.
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_05"); //Musisz mi pomóc! D³u¿ej tego nie zniosê!
    AI_Output (other, self ,"DIA_Marius_HELLO1_15_06"); //A co ja mogê teraz zrobiæ? Przebraæ siê za s³u¿ebnicê Adanosa i ciê wyzwoliæ? Nie jestem nikim wa¿nym w Starym Obozie.
    AI_Output (self, other ,"DIA_Marius_HELLO1_03_07"); //Niech ciê Beliar poch³onie, psie! Ciebie i tych przeklêtych Stra¿ników.
	};
};

//========================================
//-----------------> GomezDie
//========================================

INSTANCE DIA_Wiezien_GomezDie (C_INFO)
{
   npc          = NON_3923_Wiezien;
   nr           = 1;
   condition    = DIA_Wiezien_GomezDie_Condition;
   information  = DIA_Wiezien_GomezDie_Info;
   permanent	= FALSE;
   description	= "Gomez nie ¿yje. Jesteœ wolny. ";
};

FUNC INT DIA_Wiezien_GomezDie_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_IsDead(whodie0)) && (Npc_KnowsInfo (hero, DIA_Marius_HELLO1))  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Wiezien_GomezDie_Info()
{
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_01"); //Gomez nie ¿yje. Jesteœ wolny. 
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_02"); //Co? Jak to mo¿liwe?
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_03"); //Kto tego dokona³?
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_04"); //Zreszt¹, nieistotne. Ten sukinsyn gryzie ziemiê? Nie mogê w to uwierzyæ! 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_05"); //Kruk wraz ze spor¹ czêœci¹ zaufanych ludzi opuœci³ Stary Obozu. Jest ju¿ tu w miarê bezpiecznie. 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_06"); //Wielu Stra¿ników zginê³o w Wolnej Kopalni, pozosta³a czêœæ z nich zosta³a zabita przez Bandytów. 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_07"); //Tutaj zosta³y ju¿ same niedobitki. 
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_08"); //Niesamowite. Poczekam jeszcze trochê i wyjdê na górê. Myœlisz, ¿e uda mi siê tam znaleŸæ jak¹œ broñ i ubranie?
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_09"); //Nie mogê uciec z pustymi rêkoma. 
    AI_Output (other, self ,"DIA_Wiezien_GomezDie_15_10"); //Na górze le¿y pe³no trupów Stra¿ników. Wielu skazañców opuœci³o swoje chaty. Myœlê, ¿e bêdziesz w stanie coœ znaleŸæ.
    AI_Output (self, other ,"DIA_Wiezien_GomezDie_03_11"); //Doskonale. Dziêki. Mo¿e siê jeszcze zobaczymy! 
    AI_StopProcessInfos	(self);
};



