//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  Vlk_587_Garp_Exit (C_INFO)
{
	npc			=  Vlk_587_Garp;
	nr = 999;
	condition	=  Vlk_587_Garp_Exit_Condition;
	information	=  Vlk_587_Garp_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

FUNC VOID  Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Vlk_587_Garp_ORK (C_INFO)
{
	npc				= Vlk_587_Garp;
	condition		= Vlk_587_Garp_ORK_Condition;
	information		= Vlk_587_Garp_ORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co tu robi ten ork?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //Co tu robi ten ork?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Z³apali go nasi Stra¿nicy. Od tej pory pracuje dla nas.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Przecie¿ nie jest nawet skuty ³añcuchami. Czemu po prostu nie ucieknie?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Raz spróbowa³. Stra¿nicy tak go urz¹dzili, ¿e nie móg³ siê ruszyæ przez parê tygodni. Od tej pory nigdy wiêcej siê nie buntowa³.
};  

//========================================
//-----------------> DOSTAWA
//========================================

INSTANCE DIA_Garp_DOSTAWA (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 1;
   condition    = DIA_Garp_DOSTAWA_Condition;
   information  = DIA_Garp_DOSTAWA_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie dostawê wytrychów.";
};

FUNC INT DIA_Garp_DOSTAWA_Condition()
{
    if MIS_SmallDelivery == LOG_RUNNING
    && (Npc_HasItems (other, ItKeLockpick) >=20)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_DOSTAWA_Info()
{
    AI_Output (other, self ,"DIA_Garp_DOSTAWA_15_01"); //Mam dla ciebie dostawê wytrychów.
    AI_Output (self, other ,"DIA_Garp_DOSTAWA_03_02"); //Nie tak g³oœno, bo Stra¿nicy nas us³ysz¹!
	AI_Output (self, other ,"DIA_Garp_DOSTAWA_03_03"); //Dziêki. 
	
    B_LogEntry               (CH1_SmallDelivery,"Dostarczenie tych wytrychów nie by³o zbyt trudne. Przynajmniej otrzyma³em kilka bry³ek rudy.");
    Log_SetTopicStatus       (CH1_SmallDelivery, LOG_SUCCESS);
    MIS_SmallDelivery = LOG_SUCCESS;

    B_GiveXP (25);
    CreateInvItems (self, ItMiNugget, 10);
    B_GiveInvItems (self, other, ItMiNugget, 10);

};

//========================================
//-----------------> AKSZYN
//========================================

INSTANCE DIA_Garp_AKSZYN (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 2;
   condition    = DIA_Garp_AKSZYN_Condition;
   information  = DIA_Garp_AKSZYN_Info;
   permanent	= FALSE;
   description	= "Czy¿byœcie coœ knuli?";
};

FUNC INT DIA_Garp_AKSZYN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_DOSTAWA)) //|| (Npc_KnowsInfo (hero, DIA_Garp_AkcjaRun))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_AKSZYN_Info()
{
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_01"); //Czy¿byœcie coœ knuli?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_02"); //Nie tak g³oœno. Tak, mamy pewien plan.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_03"); //O co dok³adniej chodzi?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_04"); //Chcemy w³amaæ siê do magazynu i odzyskaæ zarekwirowane przez Stra¿ników przedmioty.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_05"); //Nale¿¹ do was?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_06"); //Wiêkszoœæ tak. To bêdzie nasz pierwszy krok do buntu.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_07"); //Buntu? Czy to nie jest zbyt ryzykowne? Jakie macie szanse?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_08"); //Ty siê ju¿ o to nie martw. Dobra organizacja to podstawa.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_10"); //Do rzeczy... Jak mogê wam pomóc?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_11"); //Wœród Kopaczy tylko Aleph potrafi otwieraæ zamki. 
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_12"); //Ostatnio chcia³ siê podj¹æ tego ryzyka.
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_13"); //Pogadaj z nim i dowiedz siê, czy dalej jest po naszej stronie.
    MIS_ActionOM = LOG_RUNNING;

    Log_CreateTopic           (CH1_ActionOM, LOG_MISSION);
    Log_SetTopicStatus        (CH1_ActionOM, LOG_RUNNING);
    B_LogEntry              		 (CH1_ActionOM,"Garp opowiedzia³ mi o planie dotycz¹cym odzyskania zarekwirowanych rzeczy Kopaczy z magazynu na dnie Kopalni. Mam pogadaæ z Alpehem i dowiedzieæ siê, czy nadal jest sk³onny zaj¹æ siê skrzyniami w magazynie.");
};

//========================================
//-----------------> GADANINA
//========================================

INSTANCE DIA_Garp_GADANINA (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 134;
   condition    = DIA_Garp_GADANINA_Condition;
   information  = DIA_Garp_GADANINA_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Alephem.";
};

FUNC INT DIA_Garp_GADANINA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aleph_MAGZYN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_GADANINA_Info()
{
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_01"); //Rozmawia³em z Alephem.
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_02"); //Tak? I kiedy zaczynamy?
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_03"); //Nigdy.
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_04"); //Powiedzia³, ¿e nie ma zamiaru braæ w tym udzia³u. Wasz plan jest wiêc z góry skazany na pora¿kê. 
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_05"); //Co ten sukinsyn sobie myœli?! Wycofa³ siê w ostatniej chwili!
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_06"); //A co je¿eli skuma³ siê ze Stra¿nikami?! Musimy uwa¿aæ. Ju¿ zbyt du¿o osób o tym wie.
    B_LogEntry                     (CH1_ActionOM,"Przekaza³em odpowiedŸ Alepha Garpowi. Nie by³ zadowolony z takiego obrotu sprawy. Gdybym umia³ otwieraæ zamki, móg³bym zaproponowaæ Garpowi pomoc.");
};

//========================================
//-----------------> WLAM
//========================================

INSTANCE DIA_Garp_WLAM (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 135;
   condition    = DIA_Garp_WLAM_Condition;
   information  = DIA_Garp_WLAM_Info;
   permanent	= FALSE;
   description	= "Mo¿e ja bym siê w³ama³?";
};

FUNC INT DIA_Garp_WLAM_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_GADANINA)) && (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) > 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_WLAM_Info()
{
    AI_Output (other, self ,"DIA_Garp_WLAM_15_01"); //Mo¿e ja bym siê w³ama³?
    AI_Output (other, self ,"DIA_Garp_WLAM_15_02"); //Potrafiê otwieraæ zamki.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_03"); //Naprawdê? Zrobisz to?
    AI_Output (other, self ,"DIA_Garp_WLAM_15_04"); //Chyba mogê liczyæ na wasz¹ pomoc?
    AI_Output (self, other ,"DIA_Garp_WLAM_03_05"); //Oczywiœcie. Glen da ci wytrychy, a ja odci¹gnê Stra¿nika.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_06"); //Grimes dopilnuje, aby Ianowi nie przysz³o do g³owy zrobiæ sobie obchód po dnie kopalni.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_07"); //IdŸ do Glena po wytrychy. Powiedz te¿ Grimesowi, ¿eby siê przygotowa³.
    B_LogEntry                     (CH1_ActionOM,"Zaproponowa³em, ¿e to ja otworzê skrzynie w magazynie. Glen da mi kilka wytrychów, a Grimes dopilnuje, by nikt nam nie przerwa³. Mam iœæ i powiedzieæ im, co maja robiæ.");
};

//========================================
//-----------------> KOPACZE
//========================================

INSTANCE DIA_Garp_KOPACZE (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 136;
   condition    = DIA_Garp_KOPACZE_Condition;
   information  = DIA_Garp_KOPACZE_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Kopaczami.";
};

FUNC INT DIA_Garp_KOPACZE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glen_ROBOTKA))
    && (Npc_KnowsInfo (hero, DIA_Grimes_AKSZYN22))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_KOPACZE_Info()
{
    AI_Output (other, self ,"DIA_Garp_KOPACZE_15_01"); //Rozmawia³em z Kopaczami.
    AI_Output (other, self ,"DIA_Garp_KOPACZE_15_02"); //Mam wszystko przygotowane. Mo¿emy dzia³aæ.
    AI_Output (self, other ,"DIA_Garp_KOPACZE_03_03"); //Daj znak, gdy bêdziesz gotowy, a ja odci¹gnê Stra¿nika.
    AI_Output (self, other ,"DIA_Garp_KOPACZE_03_04"); //Tylko pamiêtaj o skradaniu.
};

//========================================
//-----------------> AKCJA1
//========================================

INSTANCE DIA_Garp_AKCJA1 (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 1;
   condition    = DIA_Garp_AKCJA1_Condition;
   information  = DIA_Garp_AKCJA1_Info;
   permanent	= FALSE;
   description	= "Zaczynajmy.";
};

FUNC INT DIA_Garp_AKCJA1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_KOPACZE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_AKCJA1_Info()
{
    AI_Output (other, self ,"DIA_Garp_AKCJA1_15_01"); //Zaczynajmy.
    AI_Output (self, other ,"DIA_Garp_AKCJA1_03_02"); //Dobra. Poczekaj, a¿ zagadam Stra¿nika.
    Npc_ExchangeRoutine (GRD_2035_Dracon,"wlam");
    Npc_ExchangeRoutine (Vlk_587_Garp,"wlam");
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> UKONCZONO
//========================================

INSTANCE DIA_Garp_UKONCZONO (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 8;
   condition    = DIA_Garp_UKONCZONO_Condition;
   information  = DIA_Garp_UKONCZONO_Info;
   permanent	= FALSE;
   description	= "(kiwnij porozumiewawczo g³ow¹)";
};

FUNC INT DIA_Garp_UKONCZONO_Condition()
{
    if (Npc_HasItems (other, ItMi_Worek_Garp) >=1)
    && (MIS_ActionOM == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_UKONCZONO_Info()
{
    AI_Output (other, self ,"DIA_Garp_UKONCZONO_15_01"); //Ekhem...
    AI_Output (self, other ,"DIA_Garp_UKONCZONO_15_02"); //Mmmm...
    Npc_ExchangeRoutine (self,"START");
	B_ExchangeRoutine (GRD_2035_Dracon, "start");  
	B_LogEntry        (CH1_ActionOM,"Uda³o mi siê z³amaæ zamki. Teraz muszê oddaæ Kopaczom przedmioty nale¿¹ce do nich, a resztê rzeczy bêdê móg³ zachowaæ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SAKWA
//========================================

INSTANCE DIA_Garp_SAKWA (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 9;
   condition    = DIA_Garp_SAKWA_Condition;
   information  = DIA_Garp_SAKWA_Info;
   permanent	= FALSE;
   description	= "Oto twoja sakiewka.";
};

FUNC INT DIA_Garp_SAKWA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_UKONCZONO))
    && (Npc_HasItems (other, ItMi_Worek_Garp) >=1)
    && (MIS_ActionOM == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_SAKWA_Info()
{
    AI_Output (other, self ,"DIA_Garp_SAKWA_15_01"); //Oto twoja sakiewka.
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_02"); //Dziêkujê ci. Naprawdê dziêkujê!
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_03"); //Bêdziesz s³awny w ca³ej Kopalni. Oczywiœcie tylko wœród Kopaczy...
    //AI_Output (other, self ,"DIA_Garp_SAKWA_15_04"); //Chcê wreszcie zanieœæ te 500 bry³ek Ianowi i siê st¹d wydostaæ.
    //AI_Output (self, other ,"DIA_Garp_SAKWA_03_05"); //Mam nadziejê, ¿e teraz ci wystarczy.
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_06"); //Powodzenia, bracie.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry               (CH1_ActionOM,"Zdoby³em dosyæ sporo rudy. Otrzyma³em tak¿e wynagrodzenie. Z pewnoœci¹ jeszcze coœ dostanê od innych Kopaczy.");
    Log_SetTopicStatus       (CH1_ActionOM, LOG_SUCCESS);
    MIS_ActionOM = LOG_SUCCESS;
	B_GiveInvItems (other, self, ItMi_Worek_Garp, 1);

    B_GiveXP (XP_OldMineAction);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Obite Pyski
//========================================

INSTANCE DIA_Garp_Sprawa (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 136;
   condition    = DIA_Garp_Sprawa_Condition;
   information  = DIA_Garp_Sprawa_Info;
   permanent	= FALSE;
   description	= "Musisz mi pomóc nag³oœniæ sprawê nielegalnych walk.";
};

FUNC INT DIA_Garp_Sprawa_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Asghan_ObitePyski))
   
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_Sprawa_Info()
{
    AI_Output (other, self ,"DIA_Garp_Sprawa_15_01"); //Musisz mi pomóc nag³oœniæ sprawê nielegalnych walk.
	AI_Output (self, other ,"DIA_Garp_Sprawa_03_02"); //Niby w jaki sposób?
    AI_Output (other, self ,"DIA_Garp_Sprawa_15_03"); //Pójdziesz do Iana i powiesz mu o wszystkim co mia³o miejsce.
    AI_Output (self, other ,"DIA_Garp_Sprawa_03_04"); //Nie ma mowy, chcesz œci¹gn¹æ na mnie gniew po³owy Stra¿ników z tej kopalni?!
	AI_Output (other, self ,"DIA_Garp_Sprawa_15_05"); //Jak sprawa dojdzie do Iana to ju¿ nic nie bêdzie ci groziæ.
    AI_Output (self, other ,"DIA_Garp_Sprawa_03_06"); //Akurat. Nie ma mowy.
	AI_Output (other, self ,"DIA_Garp_Sprawa_15_07"); //Mo¿e ruda za³atwi sprawê.
	AI_Output (self, other ,"DIA_Garp_Sprawa_03_08"); //Nie przekupisz mnie. Co z tego, ¿e dostanê rudê, jeœli nied³ugo póŸniej trafiê do piachu?
	AI_Output (self, other ,"DIA_Garp_Sprawa_03_09"); //Zostaw mnie w spokoju.
	
};

//========================================
//-----------------> Obite Pyski
//========================================

INSTANCE DIA_Garp_Pomoc (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 136;
   condition    = DIA_Garp_Pomoc_Condition;
   information  = DIA_Garp_Pomoc_Info;
   permanent	= FALSE;
   description	= "Dobra. Albo mi pomo¿esz albo...";
};

FUNC INT DIA_Garp_Pomoc_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_Sprawa))
    
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_Pomoc_Info()
{
    AI_Output (other, self ,"DIA_Garp_Pomoc_15_01"); //Dobra. Albo mi pomo¿esz albo sam wyœlê ciê na tamten œwiat. Rozumiesz to?!
	AI_Output (self, other ,"DIA_Garp_Pomoc_03_02"); //Ahhh... I có¿ ja mam robiæ... Tak Ÿle i tak niedobrze.
    AI_Output (other, self ,"DIA_Garp_Pomoc_15_03"); //Jedyne twoje wyjœcie teraz to mi pomóc.
    AI_Output (self, other ,"DIA_Garp_Pomoc_03_04"); //Daj mi 200 bry³ek rudy. Potem Ian ma mi przydzieliæ ochronê na wypadek gdyby któryœ z tych przeklêtych stra¿ników chcia³ siê odegraæ.
	AI_Output (other, self ,"DIA_Garp_Pomoc_15_05"); //Przemyœlê to.
	AI_Output (self, other ,"DIA_Garp_Pomoc_03_06"); //Zap³aæ mi a przystanê na twoj¹ ofertê... choæ nie chêtnie ty ma³y szanta¿ysto!
	
		B_LogEntry               (ObitePyski,"Garp nie chcia³ wspó³pracowaæ. Jednak ostatecznie bêdzie œwiadkiem w zamian za 200 bry³ek rudy.");

	
};

//========================================
//-----------------> Obite Pyski
//========================================

INSTANCE DIA_Garp_Ian (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 136;
   condition    = DIA_Garp_Ian_Condition;
   information  = DIA_Garp_Ian_Info;
   permanent	= FALSE;
   description	= "Masz tu 200 bry³ek. ";
};

FUNC INT DIA_Garp_Ian_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_Pomoc))
    && (Npc_HasItems (other, ItMinugget) >=200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Garp_Ian_Info()
{
    AI_Output (other, self ,"DIA_Garp_Ian_15_01"); //Masz tu 200 bry³ek. 
	AI_Output (self, other ,"DIA_Garp_Ian_03_02"); //Dobrze. W takim razie widzimy siê u Iana.
    AI_Output (other, self ,"DIA_Garp_Ian_15_03"); //W porz¹dku.
    B_GiveInvItems (other,self, ItMiNugget, 200);
		B_LogEntry               (ObitePyski,"Wyp³aci³em Garpowi rudê i bêdzie on robi³ za œwiadka w sprawie lewych walk. Nadszed³ czas by wszystko ujrza³o œwiat³o dzienne i by nadszed³ s¹dny dzieñ dla Cesara.");

	
	Npc_ExchangeRoutine            (Vlk_587_Garp,"Ian");
};


//========================================
//-----------------> PP_ORE
//========================================

INSTANCE DIA_Garp_PP_ORE (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 1;
   condition    = DIA_Garp_PP_ORE_Condition;
   information  = DIA_Garp_PP_ORE_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Pascal. Masz mu oddaæ zaleg³¹ rudê!";
};

FUNC INT DIA_Garp_PP_ORE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Artegor_PP_WHAT))
{
    return TRUE;
};
};
FUNC VOID DIA_Garp_PP_ORE_Info()
{
    AI_Output (other, self ,"DIA_Garp_PP_ORE_15_01"); //Przysy³a mnie Pascal. Masz mu oddaæ zaleg³¹ rudê!
    AI_Output (self, other ,"DIA_Garp_PP_ORE_03_02"); //Niech lepiej zajmiê siê Pextonem. On o ile wiem by³ zad³u¿ony na wy¿sz¹ kwotê ni¿ ja.
    AI_Output (other, self ,"DIA_Garp_PP_ORE_15_03"); //Ju¿ siê nim zaj¹³. Mam na sobie jego pancerz... Zdjêty z trupa.
    AI_Output (self, other ,"DIA_Garp_PP_ORE_03_04"); //Nie! Nie podzielê jego losu!
	Vlk_587_Garp.Guild=GIL_ORG;
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
  
};

//========================================
//-----------------> PP_Give_Me_Ore
//========================================

INSTANCE DIA_Garp_PP_Give_Me_Ore (C_INFO)
{
   npc          = Vlk_587_Garp;
   nr           = 2;
   condition    = DIA_Garp_PP_Give_Me_Ore_Condition;
   information  = DIA_Garp_PP_Give_Me_Ore_Info;
   permanent	= FALSE;
   description	= "Teraz oddasz rudê Pascala.";
};

FUNC INT DIA_Garp_PP_Give_Me_Ore_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Garp_PP_ORE))
{
    return TRUE;
};
};
FUNC VOID DIA_Garp_PP_Give_Me_Ore_Info()
{
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_01"); //Teraz oddasz rudê Pascala.
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_02"); //Ale ja nic nie mam!
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_03"); //Znaczy mam... Danny ma...
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_04"); //Cholera jaki znowu Danny?
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_05"); //Da³em mu t¹ sakiewkê pod zastaw. Nim go sp³aci³em Danny znikn¹³. Ale nie opuszcza³ kopalnii. To dziwne...
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_06"); //To znaczy, ¿e jest gdzieœ w pobli¿u.
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_07"); //Jeœli go znajdziesz to odbierz od niego tê rudê. I daj mi œwiêty spokój!
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_08"); //WeŸ ten medalion I daj w ramach zastawu Danny’emu...
	B_GiveInvItems (self,other, ItMi_PP_GarpAmulette, 1);
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_09"); //Niech bêdzie.
	B_LogEntry               (PrawoPascala,"Garp twierdzi, ¿e nie ma ju¿ rudy Pascala. Ma j¹ Danny , który zawieruszy³ siê gdzieœ w kopalni. Muszê ustaliæ gdzie dok³adnie.");
    AI_StopProcessInfos	(self);
};

instance dia_garp_pickpocket(c_info) {
    npc = vlk_587_garp;
    nr = 900;
    condition = dia_garp_pickpocket_condition;
    information = dia_garp_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_garp_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_garp_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_garp_pickpocket);
	info_addchoice(dia_garp_pickpocket, dialog_back, dia_garp_pickpocket_back);
	info_addchoice(dia_garp_pickpocket, dialog_pickpocket, dia_garp_pickpocket_doit);
};

func void dia_garp_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_garp_pickpocket);
};

func void dia_garp_pickpocket_back() {
    info_clearchoices(dia_garp_pickpocket);
};