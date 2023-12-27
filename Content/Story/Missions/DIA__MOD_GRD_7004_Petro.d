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
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_02"); //Odpoczywam od obozowych ha�as�w. Czego chcesz?
    AI_Output (other, self ,"DIA_Gamal_WhoYou_15_03"); //Jestem tu nowy.
    AI_Output (self, other ,"DIA_Gamal_WhoYou_03_04"); //Jak chcesz znale�� jaka� robot�, to id� do Starego Obozu. Tak, to ta wielka kupa syfu otoczona palisad�, kt�ra znajduje si� za moimi plecami.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_05"); //Lorenzo to wp�ywowy go��, kt�ry za�atwi ci uczciw� prac� w Kopalni. Ja dla niego pracuj� i nie mam czego �a�owa�.
	AI_Output (other, self ,"DIA_Gamal_WhoYou_15_06"); //Nie wygl�dasz mi na g�rnika.
	AI_Output (self, other ,"DIA_Gamal_WhoYou_03_07"); //Bo nim nie jestem, o�le. Pomagam w innych rzeczach, takich jak chocia�by eskortowanie robotnik�w do Kopalni.
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
   description	= "Mamy i�� do Kopalni.";
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
    AI_Output (other, self ,"DIA_Gamal_GoToMine_15_01"); //Mamy i�� do Kopalni.
    AI_Output (self, other ,"DIA_Gamal_GoToMine_03_02"); //Wiem, nie jestem g�uchy. No, za mn�, ofermy! Pora wzi�� si� za machanie kilofem. 
	AI_Output (self, other ,"DIA_Gamal_GoToMine_03_03"); //Jak dojdziemy w jednym kawa�ku to powiem ci co i jak, bo nie wiem czy masz taki g�upi wyraz twarzy od urodzenia czy po prostu nie wiesz, co si� tu dzieje. 
	
    MIS_ToOldMine = LOG_RUNNING; 
    Log_CreateTopic          	(CH1_ToOldMine, LOG_MISSION);
    Log_SetTopicStatus      	(CH1_ToOldMine, LOG_RUNNING);
    B_LogEntry               		(CH1_ToOldMine,"Razem z Petro i trzema Kopaczami mam si� uda� do Starej Kopalni. Tam dostan� dalsze instrukcje od Stra�nika.");
	
	//dzielenie xp
    self.aivar[AIV_PARTYMEMBER] = TRUE;
	//przyjazne nastawienie
	self.Npctype = NPCTYPE_FRIEND;
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
	//rutyna
    Npc_ExchangeRoutine (self,"went");
	//wyj�cie
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
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_01"); //Jeste�my na miejscu! 
    AI_Output (other, self ,"DIA_Gamal_DOTARLISMY_15_02"); //�wietnie. Co teraz mam zrobi�?
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_03"); //Id� prosto do Kopalni. Mo�esz si� zapozna� z tym obozem jednak nie jest ci to do niczego potrzebne. U Andrewa mo�esz kupi� przydatne graty. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_04"); //Stra�nicy przy wej�ciu nie b�d� ci robi� k�opot�w. Kiedy ju� b�dziesz w Kopalni id� do Iana i z nim si� dalej ugaduj. 
    AI_Output (self, other ,"DIA_Gamal_DOTARLISMY_03_05"); //C�, pozostaje mi �yczy� ci powodzenia. Spr�buj nie zgin�� przy najbli�szej mo�liwej okazji. 
	
    B_LogEntry                     (CH1_ToOldMine,"Petro przyprowadzi� mnie do obozu przed Star� Kopalni�. Pokr�c� si� tu chwil�, a potem schodz� do Kopalni i id� prosto do Iana.");
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
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_01"); //No prosz� szybko awansujesz! Brawo ch�opcze!
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_02"); //Dobre jest �ycie Stra�nika. Maj�c pod sob� Cienie i Kopaczy mo�esz czu� si� wa�ny.
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_03"); //Pami�taj tylko, �e w�r�d nas Stra�nik�w te� s� pewne warstwy w, kt�rym awansujesz.
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_04"); //Na razie jeste� �wie�akiem. Ale wkr�tce je�li tego nie spaprasz dostaniesz wa�ne zadania.
    AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_05"); //I pewnego dnia mo�esz by� nawet r�wny Thorusowi.
    AI_Output (other, self ,"DIA_Gamal_HERO_IS_GRD_15_06"); //Hmmm dobrze by by�o. 
    AI_Output (other, self ,"DIA_Gamal_HERO_IS_GRD_15_07"); //A teraz czas na mnie. Mam sporo obowi�zk�w. 
	AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_08"); //To zrozumia�e. Zatem bywaj. 
	AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_09"); //A i jeszcze jedno. Mo�esz pogada� z drwalem Hargosem sprzed Starej Kopalni.
	AI_Output (self, other ,"DIA_Gamal_HERO_IS_GRD_03_10"); //Ma jak�� robot� dla Stra�nika i twierdzi, �e to wa�ne. 
    AI_StopProcessInfos	(self);
};
