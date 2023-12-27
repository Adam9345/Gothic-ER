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
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Z�apali go nasi Stra�nicy. Od tej pory pracuje dla nas.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Przecie� nie jest nawet skuty �a�cuchami. Czemu po prostu nie ucieknie?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Raz spr�bowa�. Stra�nicy tak go urz�dzili, �e nie m�g� si� ruszy� przez par� tygodni. Od tej pory nigdy wi�cej si� nie buntowa�.
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
   description	= "Mam dla ciebie dostaw� wytrych�w.";
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
    AI_Output (other, self ,"DIA_Garp_DOSTAWA_15_01"); //Mam dla ciebie dostaw� wytrych�w.
    AI_Output (self, other ,"DIA_Garp_DOSTAWA_03_02"); //Nie tak g�o�no, bo Stra�nicy nas us�ysz�!
	AI_Output (self, other ,"DIA_Garp_DOSTAWA_03_03"); //Dzi�ki. 
	
    B_LogEntry               (CH1_SmallDelivery,"Dostarczenie tych wytrych�w nie by�o zbyt trudne. Przynajmniej otrzyma�em kilka bry�ek rudy.");
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
   description	= "Czy�by�cie co� knuli?";
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
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_01"); //Czy�by�cie co� knuli?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_02"); //Nie tak g�o�no. Tak, mamy pewien plan.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_03"); //O co dok�adniej chodzi?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_04"); //Chcemy w�ama� si� do magazynu i odzyska� zarekwirowane przez Stra�nik�w przedmioty.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_05"); //Nale�� do was?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_06"); //Wi�kszo�� tak. To b�dzie nasz pierwszy krok do buntu.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_07"); //Buntu? Czy to nie jest zbyt ryzykowne? Jakie macie szanse?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_08"); //Ty si� ju� o to nie martw. Dobra organizacja to podstawa.
    AI_Output (other, self ,"DIA_Garp_AKSZYN_15_10"); //Do rzeczy... Jak mog� wam pom�c?
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_11"); //W�r�d Kopaczy tylko Aleph potrafi otwiera� zamki. 
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_12"); //Ostatnio chcia� si� podj�� tego ryzyka.
    AI_Output (self, other ,"DIA_Garp_AKSZYN_03_13"); //Pogadaj z nim i dowiedz si�, czy dalej jest po naszej stronie.
    MIS_ActionOM = LOG_RUNNING;

    Log_CreateTopic           (CH1_ActionOM, LOG_MISSION);
    Log_SetTopicStatus        (CH1_ActionOM, LOG_RUNNING);
    B_LogEntry              		 (CH1_ActionOM,"Garp opowiedzia� mi o planie dotycz�cym odzyskania zarekwirowanych rzeczy Kopaczy z magazynu na dnie Kopalni. Mam pogada� z Alpehem i dowiedzie� si�, czy nadal jest sk�onny zaj�� si� skrzyniami w magazynie.");
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
   description	= "Rozmawia�em z Alephem.";
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
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_01"); //Rozmawia�em z Alephem.
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_02"); //Tak? I kiedy zaczynamy?
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_03"); //Nigdy.
    AI_Output (other, self ,"DIA_Garp_GADANINA_15_04"); //Powiedzia�, �e nie ma zamiaru bra� w tym udzia�u. Wasz plan jest wi�c z g�ry skazany na pora�k�. 
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_05"); //Co ten sukinsyn sobie my�li?! Wycofa� si� w ostatniej chwili!
    AI_Output (self, other ,"DIA_Garp_GADANINA_03_06"); //A co je�eli skuma� si� ze Stra�nikami?! Musimy uwa�a�. Ju� zbyt du�o os�b o tym wie.
    B_LogEntry                     (CH1_ActionOM,"Przekaza�em odpowied� Alepha Garpowi. Nie by� zadowolony z takiego obrotu sprawy. Gdybym umia� otwiera� zamki, m�g�bym zaproponowa� Garpowi pomoc.");
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
   description	= "Mo�e ja bym si� w�ama�?";
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
    AI_Output (other, self ,"DIA_Garp_WLAM_15_01"); //Mo�e ja bym si� w�ama�?
    AI_Output (other, self ,"DIA_Garp_WLAM_15_02"); //Potrafi� otwiera� zamki.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_03"); //Naprawd�? Zrobisz to?
    AI_Output (other, self ,"DIA_Garp_WLAM_15_04"); //Chyba mog� liczy� na wasz� pomoc?
    AI_Output (self, other ,"DIA_Garp_WLAM_03_05"); //Oczywi�cie. Glen da ci wytrychy, a ja odci�gn� Stra�nika.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_06"); //Grimes dopilnuje, aby Ianowi nie przysz�o do g�owy zrobi� sobie obch�d po dnie kopalni.
    AI_Output (self, other ,"DIA_Garp_WLAM_03_07"); //Id� do Glena po wytrychy. Powiedz te� Grimesowi, �eby si� przygotowa�.
    B_LogEntry                     (CH1_ActionOM,"Zaproponowa�em, �e to ja otworz� skrzynie w magazynie. Glen da mi kilka wytrych�w, a Grimes dopilnuje, by nikt nam nie przerwa�. Mam i�� i powiedzie� im, co maja robi�.");
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
   description	= "Rozmawia�em z Kopaczami.";
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
    AI_Output (other, self ,"DIA_Garp_KOPACZE_15_01"); //Rozmawia�em z Kopaczami.
    AI_Output (other, self ,"DIA_Garp_KOPACZE_15_02"); //Mam wszystko przygotowane. Mo�emy dzia�a�.
    AI_Output (self, other ,"DIA_Garp_KOPACZE_03_03"); //Daj znak, gdy b�dziesz gotowy, a ja odci�gn� Stra�nika.
    AI_Output (self, other ,"DIA_Garp_KOPACZE_03_04"); //Tylko pami�taj o skradaniu.
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
    AI_Output (self, other ,"DIA_Garp_AKCJA1_03_02"); //Dobra. Poczekaj, a� zagadam Stra�nika.
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
   description	= "(kiwnij porozumiewawczo g�ow�)";
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
	B_LogEntry        (CH1_ActionOM,"Uda�o mi si� z�ama� zamki. Teraz musz� odda� Kopaczom przedmioty nale��ce do nich, a reszt� rzeczy b�d� m�g� zachowa�.");
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
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_02"); //Dzi�kuj� ci. Naprawd� dzi�kuj�!
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_03"); //B�dziesz s�awny w ca�ej Kopalni. Oczywi�cie tylko w�r�d Kopaczy...
    //AI_Output (other, self ,"DIA_Garp_SAKWA_15_04"); //Chc� wreszcie zanie�� te 500 bry�ek Ianowi i si� st�d wydosta�.
    //AI_Output (self, other ,"DIA_Garp_SAKWA_03_05"); //Mam nadziej�, �e teraz ci wystarczy.
    AI_Output (self, other ,"DIA_Garp_SAKWA_03_06"); //Powodzenia, bracie.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
    B_LogEntry               (CH1_ActionOM,"Zdoby�em dosy� sporo rudy. Otrzyma�em tak�e wynagrodzenie. Z pewno�ci� jeszcze co� dostan� od innych Kopaczy.");
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
   description	= "Musisz mi pom�c nag�o�ni� spraw� nielegalnych walk.";
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
    AI_Output (other, self ,"DIA_Garp_Sprawa_15_01"); //Musisz mi pom�c nag�o�ni� spraw� nielegalnych walk.
	AI_Output (self, other ,"DIA_Garp_Sprawa_03_02"); //Niby w jaki spos�b?
    AI_Output (other, self ,"DIA_Garp_Sprawa_15_03"); //P�jdziesz do Iana i powiesz mu o wszystkim co mia�o miejsce.
    AI_Output (self, other ,"DIA_Garp_Sprawa_03_04"); //Nie ma mowy, chcesz �ci�gn�� na mnie gniew po�owy Stra�nik�w z tej kopalni?!
	AI_Output (other, self ,"DIA_Garp_Sprawa_15_05"); //Jak sprawa dojdzie do Iana to ju� nic nie b�dzie ci grozi�.
    AI_Output (self, other ,"DIA_Garp_Sprawa_03_06"); //Akurat. Nie ma mowy.
	AI_Output (other, self ,"DIA_Garp_Sprawa_15_07"); //Mo�e ruda za�atwi spraw�.
	AI_Output (self, other ,"DIA_Garp_Sprawa_03_08"); //Nie przekupisz mnie. Co z tego, �e dostan� rud�, je�li nied�ugo p�niej trafi� do piachu?
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
   description	= "Dobra. Albo mi pomo�esz albo...";
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
    AI_Output (other, self ,"DIA_Garp_Pomoc_15_01"); //Dobra. Albo mi pomo�esz albo sam wy�l� ci� na tamten �wiat. Rozumiesz to?!
	AI_Output (self, other ,"DIA_Garp_Pomoc_03_02"); //Ahhh... I c� ja mam robi�... Tak �le i tak niedobrze.
    AI_Output (other, self ,"DIA_Garp_Pomoc_15_03"); //Jedyne twoje wyj�cie teraz to mi pom�c.
    AI_Output (self, other ,"DIA_Garp_Pomoc_03_04"); //Daj mi 200 bry�ek rudy. Potem Ian ma mi przydzieli� ochron� na wypadek gdyby kt�ry� z tych przekl�tych stra�nik�w chcia� si� odegra�.
	AI_Output (other, self ,"DIA_Garp_Pomoc_15_05"); //Przemy�l� to.
	AI_Output (self, other ,"DIA_Garp_Pomoc_03_06"); //Zap�a� mi a przystan� na twoj� ofert�... cho� nie ch�tnie ty ma�y szanta�ysto!
	
		B_LogEntry               (ObitePyski,"Garp nie chcia� wsp�pracowa�. Jednak ostatecznie b�dzie �wiadkiem w zamian za 200 bry�ek rudy.");

	
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
   description	= "Masz tu 200 bry�ek. ";
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
    AI_Output (other, self ,"DIA_Garp_Ian_15_01"); //Masz tu 200 bry�ek. 
	AI_Output (self, other ,"DIA_Garp_Ian_03_02"); //Dobrze. W takim razie widzimy si� u Iana.
    AI_Output (other, self ,"DIA_Garp_Ian_15_03"); //W porz�dku.
    B_GiveInvItems (other,self, ItMiNugget, 200);
		B_LogEntry               (ObitePyski,"Wyp�aci�em Garpowi rud� i b�dzie on robi� za �wiadka w sprawie lewych walk. Nadszed� czas by wszystko ujrza�o �wiat�o dzienne i by nadszed� s�dny dzie� dla Cesara.");

	
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
   description	= "Przysy�a mnie Pascal. Masz mu odda� zaleg�� rud�!";
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
    AI_Output (other, self ,"DIA_Garp_PP_ORE_15_01"); //Przysy�a mnie Pascal. Masz mu odda� zaleg�� rud�!
    AI_Output (self, other ,"DIA_Garp_PP_ORE_03_02"); //Niech lepiej zajmi� si� Pextonem. On o ile wiem by� zad�u�ony na wy�sz� kwot� ni� ja.
    AI_Output (other, self ,"DIA_Garp_PP_ORE_15_03"); //Ju� si� nim zaj��. Mam na sobie jego pancerz... Zdj�ty z trupa.
    AI_Output (self, other ,"DIA_Garp_PP_ORE_03_04"); //Nie! Nie podziel� jego losu!
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
   description	= "Teraz oddasz rud� Pascala.";
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
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_01"); //Teraz oddasz rud� Pascala.
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_02"); //Ale ja nic nie mam!
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_03"); //Znaczy mam... Danny ma...
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_04"); //Cholera jaki znowu Danny?
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_05"); //Da�em mu t� sakiewk� pod zastaw. Nim go sp�aci�em Danny znikn��. Ale nie opuszcza� kopalnii. To dziwne...
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_06"); //To znaczy, �e jest gdzie� w pobli�u.
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_07"); //Je�li go znajdziesz to odbierz od niego t� rud�. I daj mi �wi�ty spok�j!
    AI_Output (self, other ,"DIA_Garp_PP_Give_Me_Ore_03_08"); //We� ten medalion I daj w ramach zastawu Danny�emu...
	B_GiveInvItems (self,other, ItMi_PP_GarpAmulette, 1);
    AI_Output (other, self ,"DIA_Garp_PP_Give_Me_Ore_15_09"); //Niech b�dzie.
	B_LogEntry               (PrawoPascala,"Garp twierdzi, �e nie ma ju� rudy Pascala. Ma j� Danny , kt�ry zawieruszy� si� gdzie� w kopalni. Musz� ustali� gdzie dok�adnie.");
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