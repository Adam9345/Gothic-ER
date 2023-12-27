//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hector_EXIT(C_INFO)
{
	npc             = GRD_3935_Hector;
	nr              = 999;
	condition		= DIA_Hector_EXIT_Condition;
	information		= DIA_Hector_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hector_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hector_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Hector_HELLO1 (C_INFO)
{
   npc          = GRD_3935_Hector;
   nr           = 1;
   condition    = DIA_Hector_HELLO1_Condition;
   information  = DIA_Hector_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Hector_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hector_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hector_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Hector_HELLO1_03_02"); //Nazywam siê Skelden. Jestem dowódc¹ ¯elaznej Garoty. 
	AI_Output (other, self ,"DIA_Hector_HELLO1_15_03"); //Chcia³bym siê dowiedzieæ wiêcej o Starym Obozie. Móg³bym z tob¹ porozmawiaæ?
	AI_Output (self, other ,"DIA_Hector_HELLO1_03_04"); //W sumie to móg³byœ. Czemu nie? Pytaj o co chcesz.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Hector_HELLO2 (C_INFO)
{
   npc          = GRD_3935_Hector;
   nr           = 2;
   condition    = DIA_Hector_HELLO2_Condition;
   information  = DIA_Hector_HELLO2_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi coœ wiêcej o tej ¯elaznej Garocie.";
};

FUNC INT DIA_Hector_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hector_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hector_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Hector_HELLO2_15_01"); //Opowiedz mi coœ wiêcej o tej ¯elaznej Garocie.
    AI_Output (self, other ,"DIA_Hector_HELLO2_03_02"); //¯elazna Garota to formacja sk³adaj¹ca siê z najwierniejszych i najlepiej wyszkolonych Stra¿ników w ca³ym Starym Obozie.
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_03"); //Naszym zadaniem jest dbanie o bezpieczeñstwo Magnatów i porz¹dek w g³ównej sali. Tylko najlepsi mog¹ nale¿eæ do grupy. 
	AI_Output (other, self ,"DIA_Hector_HELLO2_15_04"); //Sk¹d ta charakterystyczna nazwa?
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_05"); //Wi¹¿e siê z tym ciekawa historia. Nazwa pochodzi od przezwiska Felgora - pierwszego przywódcy Garotników.
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_06"); //Wo³ano na niego ¯elazna Garota, bo podczas buntu zabi³ wysokiego oficera armii królewskiej przy u¿yciu kajdan. 
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_07"); //Po prostu zarzuci³ mu je na szyjê i bezwzglêdnie go udusi³. Gomez zawsze lubi³ Felgora wiêc, gdy organizowa³ stra¿ przyboczn¹, postawi³ go na jej czele. 
	AI_Output (other, self ,"DIA_Hector_HELLO2_15_08"); //Gdzie jest teraz Felgor?
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_09"); //W innym, lepszym œwiecie. Poprzedzaj¹c kolejne pytanie powiem, ¿e zgin¹³ podczas wykonywania misji. 
	AI_Output (other, self ,"DIA_Hector_HELLO2_15_10"); //Jakiej misji?
	AI_Output (self, other ,"DIA_Hector_HELLO2_03_11"); //Doœæ ju¿ tych pytañ. Spadaj st¹d! Muszê wracaæ do pracy. 
};

//========================================
//-----------------> JOB
//========================================

INSTANCE DIA_Hector_JOB (C_INFO)
{
   npc          = GRD_3935_Hector;
   nr           = 2;
   condition    = DIA_Hector_JOB_Condition;
   information  = DIA_Hector_JOB_Info;
   permanent	= FALSE;
   description	= "Czym siê tutaj zajmujesz?";
};

FUNC INT DIA_Hector_JOB_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hector_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hector_JOB_Info()
{
    AI_Output (other, self ,"DIA_Hector_JOB_15_01"); //Czym siê tutaj zajmujesz?
    AI_Output (self, other ,"DIA_Hector_JOB_03_02"); //Do moich obowi¹zków nale¿y taktyczne planowanie ataków oraz obrony przed bandytami Quentina i tymi z Nowego Obozu.
	if (Npc_GetTrueGuild(hero) != GIL_BAU) || (Npc_GetTrueGuild(hero) != GIL_ORG) || (Npc_GetTrueGuild(hero) != GIL_SLD) ||(Npc_GetTrueGuild(hero) != GIL_KDW) || (Npc_GetTrueGuild(hero) != GIL_SFB)  {
	AI_Output (other, self ,"DIA_Hector_JOB_15_03"); //S¹ bardzo uci¹¿liwi?
	AI_Output (self, other ,"DIA_Hector_JOB_03_04"); //Czasem daj¹ siê mocno we znaki morduj¹c znienacka ludzi i rabuj¹c skrzynie z rud¹. Ale kiedyœ przyjdzie temu kres...
	};
};
