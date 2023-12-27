//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gamal_EXIT(C_INFO)
{
	npc             = GRD_7004_Gamal;
	nr              = 999;
	condition	= DIA_Gamal_EXIT_Condition;
	information	= DIA_Gamal_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gamal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gamal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoYou
//========================================

INSTANCE DIA_Gamal_WhoYou (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_WhoYou_Condition;
   information  = DIA_Gamal_WhoYou_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Gamal_WhoYou_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Gamal_WhoYou_Info()
{
    AI_Output (other, self ,"DIA_Gamal_WhoYou_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_02"); //Odpoczywam od obozowych ha³asów. Czego chcesz?
    AI_Output (other, self ,"DIA_Gamal_WhoYou_15_03"); //Jestem tu nowy.
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_04"); //Jak chcesz znaleŸæ jakaœ robotê, to idŸ do Starego Obozu. Tak, to ta wielka kupa syfu otoczona palisad¹, która znajduje siê za moimi plecami.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_05"); //Lorenzo to wp³ywowy goœæ, który za³atwi ci uczciw¹ pracê w Kopalni. Ja dla niego pracujê i nie mam czego ¿a³owaæ.
	AI_Output (other, self ,"DIA_Gamal_WhoYou_15_06"); //Nie wygl¹dasz mi na górnika.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_07"); //Bo nim nie jestem, oœle. Pomagam w innych rzeczach, takich jak chocia¿by eskortowanie robotników do Kopalni.
};

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Gamal_GoToMine (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 4;
   condition    = DIA_Gamal_GoToMine_Condition;
   information  = DIA_Gamal_GoToMine_Info;
   permanent	= FALSE;
   description	= "Mamy iœæ do Kopalni.";
};

FUNC INT DIA_Gamal_GoToMine_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_VLK)
	{
    return TRUE;
	};
};


FUNC VOID DIA_Gamal_GoToMine_Info()
{
    AI_Output (other, self ,"DIA_Gamal_GoToMine_15_01"); //Mamy iœæ do Kopalni.
    AI_Output (self, other ,"DIA_Gamal_GoToMine_03_02"); //Wiem, nie jestem g³uchy. No, za mn¹, ofermy! Pora wzi¹æ siê za machanie kilofem. 
	AI_Output (self, other ,"DIA_Gamal_GoToMine_03_03"); //Jak dojdziemy w jednym kawa³ku to powiem ci co i jak, bo nie wiem czy masz taki g³upi wyraz twarzy od urodzenia czy po prostu nie wiesz, co siê tu dzieje. 
	
    MIS_ToOldMine = LOG_RUNNING; 
    Log_CreateTopic          	(CH1_ToOldMine, LOG_MISSION);
    Log_SetTopicStatus      	(CH1_ToOldMine, LOG_RUNNING);
    B_LogEntry               		(CH1_ToOldMine,"Razem z Petro i trzema Kopaczami mam siê udaæ do Starej Kopalni. Tam dostanê dalsze instrukcje od Stra¿nika.");
	
	//dzielenie xp
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	self.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (self,"went");
	//wyjœcie
    AI_StopProcessInfos	(self);
	
	//kopacze
	Npc_ExchangeRoutine (VLK_501_Buddler,"tomine");
	VLK_501_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (VLK_517_Buddler,"tomine");
	VLK_517_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (VLK_565_Buddler,"tomine");
	VLK_565_Buddler.aivar[AIV_PARTYMEMBER] = TRUE;
};

//========================================
//-----------------> DOTARLISMY
//========================================

INSTANCE DIA_Gamal_DOTARLISMY (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 3;
   condition    = DIA_Gamal_DOTARLISMY_Condition;
   information  = DIA_Gamal_DOTARLISMY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gamal_DOTARLISMY_Condition()
{
    if (MIS_ToOldMine == LOG_RUNNING)
    && (Npc_GetDistToWP (self, "OW_OM_ENTRANCE01") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gamal_DOTARLISMY_Info()
{
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_01"); //Jesteœmy na miejscu! 
    AI_Output (other, self ,"DIA_Gamal_DOTARLISMY_15_02"); //Œwietnie. Co teraz mam zrobiæ?
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_03"); //IdŸ prosto do Kopalni. Mo¿esz siê zapoznaæ z tym obozem jednak nie jest ci to do niczego potrzebne. U Andrewa mo¿esz kupiæ przydatne graty. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_04"); //Stra¿nicy przy wejœciu nie bêd¹ ci robiæ k³opotów. Kiedy ju¿ bêdziesz w Kopalni idŸ do Iana i z nim siê dalej ugaduj. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_05"); //Có¿, pozostaje mi ¿yczyæ ci powodzenia. Spróbuj nie zgin¹æ przy najbli¿szej mo¿liwej okazji. 
	
    B_LogEntry                     (CH1_ToOldMine,"Petro przyprowadzi³ mnie do obozu przed Star¹ Kopalni¹. Pokrêcê siê tu chwilê, a potem schodzê do Kopalni i idê prosto do Iana.");
	MIS_ToOldMine = LOG_SUCCESS; 
    Log_SetTopicStatus      	(CH1_ToOldMine, LOG_SUCCESS);
	
    Npc_ExchangeRoutine (self,"camp");
	self.aivar[AIV_PARTYMEMBER] = false;
	self.Npctype = NPCTYPE_MAIN;
	B_SetPermAttitude	(self,	ATT_NEUTRAL);
    B_GiveXP (25);
	 AI_StopProcessInfos	(self);
		
	//kopacze
	Npc_ExchangeRoutine (VLK_501_Buddler,"camp");
	VLK_501_Buddler.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (VLK_517_Buddler,"camp");
	VLK_517_Buddler.aivar[AIV_PARTYMEMBER] = false;
	Npc_ExchangeRoutine (VLK_565_Buddler,"camp");
	VLK_565_Buddler.aivar[AIV_PARTYMEMBER] = false;
};

//========================================
//-----------------> HERO_IS_GRD
//========================================

INSTANCE DIA_Gamal_HERO_IS_GRD (C_INFO)
{
   npc          = GRD_7004_Gamal;
   nr           = 1;
   condition    = DIA_Gamal_HERO_IS_GRD_Condition;
   information  = DIA_Gamal_HERO_IS_GRD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gamal_HERO_IS_GRD_Condition()
{
if (Npc_GetTrueGuild(hero) == GIL_GRD)
{
    return TRUE;
};
};
FUNC VOID DIA_Gamal_HERO_IS_GRD_Info()
{
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_01"); //No proszê szybko awansujesz! Brawo ch³opcze!
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_02"); //Dobre jest ¿ycie Stra¿nika. Maj¹c pod sob¹ Cienie i Kopaczy mo¿esz czuæ siê wa¿ny.
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_03"); //Pamiêtaj tylko, ¿e wœród nas Stra¿ników te¿ s¹ pewne warstwy w, którym awansujesz.
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_04"); //Na razie jesteœ œwie¿akiem. Ale wkrótce jeœli tego nie spaprasz dostaniesz wa¿ne zadania.
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_05"); //I pewnego dnia mo¿esz byæ nawet równy Thorusowi.
    AI_Output (other, self ,"DIA_Gamal_HERO_IS_GRD_15_06"); //Hmmm dobrze by by³o. 
    AI_Output (other, self ,"DIA_Gamal_HERO_IS_GRD_15_07"); //A teraz czas na mnie. Mam sporo obowi¹zków. 
	AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_08"); //To zrozumia³e. Zatem bywaj. 
	AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_09"); //A i jeszcze jedno. Mo¿esz pogadaæ z drwalem Hargosem sprzed Starej Kopalni.
	AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_10"); //Ma jak¹œ robotê dla Stra¿nika i twierdzi, ¿e to wa¿ne. 
    AI_StopProcessInfos	(self);
};
