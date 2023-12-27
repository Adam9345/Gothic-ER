// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Powodzenia!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Nawzajem, ch�opcze. Nawzajem.
	
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Od dawna tu jeste�?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Od dawna tu jeste�?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Od ca�ych 10 lat. Uwierz mi, du�o ju� tu widzia�em.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Stawi�em czo�a wielu niebezpiecze�stwom, ale jako� uda�o mi si� z nich wybrn��.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Pami�tam jak pracowali�my jeszcze w pierwszej kopalni, tej, kt�ra teraz stoi pusta. Pewnego dnia nie wytrzyma�y podpory...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ale to stare dzieje...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zapewne s�ysza�e� te� o wielu planach ucieczki."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Zapewne s�ysza�e� te� o wielu planach ucieczki.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Pos�uchaj, ch�opcze. Wiem, �e chcia�by� si� st�d wydosta�, ale zapomnij o tym.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //St�d nie ma ucieczki! Widzia�em twarze tych, kt�rzy pr�bowali sforsowa� Barier�.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Nie pope�niaj tego samego b��du. Bariera powstrzyma ka�dego.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nie chc� sp�dzi� nast�pnych 10 lat mojego �ycia wydobywaj�c rud�!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Wcale nie musisz. Mo�e zostaniesz wielk� szych�, kto wie?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Mo�esz pi�� si� do g�ry, ale niewa�ne jak wysokie stanowisko uda ci si� osi�gn�� - Bariera wreszcie ci� zatrzyma.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Oho! Nowa twarz! Pracowa�e� kiedy� jako g�rnik, ch�opcze?
};  

instance  VLK_586_Grimes_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_LEARN_Condition;
	information		= VLK_586_Grimes_LEARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kogo�, kto nauczy mnie G�rnictwa."; 
};

FUNC int  VLK_586_Grimes_LEARN_Condition()
{	
		if (Npc_KnowsInfo(hero,VLK_586_Grimes_KNOW))
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_LEARN_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_01"); //Szukam kogo�, kto nauczy mnie kopa� rud�.
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_02"); //Ach, to ciebie Ian ostatnio przyj�� do pracy. Nauka b�dzie ci� kosztowa� kilka bry�ek rudy.
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_03"); //Nic nie mam. Ian wszystko mi zabra�. Powiedzia�, �e mam wykopa� 500 bry�ek rudy.
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_04"); //Jeste� w ci�kiej sytuacji, rozumiem. Tym razem zrobi� wi�c wyj�tek. 
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo�e mnie nauczy� jak wydobywa� rud�. Za nauk� nie musz� nic p�aci�, poniewa� jestem Kopaczem.");
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_06"); //Nauka tego fachu nie jest taka trudna, jednak b�dzie ci� to kosztowa� 100 bry�ek rudy.
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo�e mnie nauczy� g�rnictwa. Za nauk� musz� zap�aci� 100 bry�ek rudy.");
	};
};

instance  VLK_586_Grimes_START_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_START_LEARN_Condition;
	information		= VLK_586_Grimes_START_LEARN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie g�rnictwa. (100 bry�ek rudy)"; 
};

FUNC int  VLK_586_Grimes_START_LEARN_Condition()
{	
		if (Npc_KnowsInfo(hero,VLK_586_Grimes_LEARN))
		&& (Npc_HasItems (other, ItMiNugget) >=100)
		&& (HERO_HACKCHANCE <= 90)
		{
		return 1;
		};
};

FUNC void  VLK_586_Grimes_START_LEARN_Info()
{
    AI_Output (other, self, "VLK_586_Grimes_START_LEARN_15_00"); //Naucz mnie g�rnictwa!
	
	if (Npc_HasItems (other, ItMiNugget) >=100)
	{
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_01"); //No dobra. Trzeba uderza� spokojnie i jednostajnie. Nie spiesz si� � ale uwa�aj, �eby nie zasn�� przy pracy.
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_02"); //Nie wal ci�gle w jedno miejsce � spr�buj wyci�� �adny samorodek.
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_03"); //Post�puj zgodnie z moimi wskaz�wkami, a zostaniesz prawdziwym mistrzem w�r�d kopaczy.
			B_GiveInvItems (other,self, itminugget, 100);
		//HERO_HACKCHANCE = HERO_HACKCHANCE + 10;
		b_upgrade_hero_hackchance(10);
		//Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_04"); //Najpierw chc� zobaczy� moj� cz��.
	};
};

//========================================
//-----------------> AKSZYN22
//========================================

INSTANCE DIA_Grimes_AKSZYN22 (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_AKSZYN22_Condition;
   information  = DIA_Grimes_AKSZYN22_Info;
   permanent	= FALSE;
   description	= "Przygotuj si�.";
};

FUNC INT DIA_Grimes_AKSZYN22_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_WLAM))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_AKSZYN22_Info()
{
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_01"); //Przygotuj si�.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_02"); //Ju� zaczynacie? Gdzie Aleph?
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_03"); //Zrezygnowa�. Ja otworz� zamki. 
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_04"); //Ty tymczasem zatrzymaj tu Iana i jego Stra�nik�w.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_05"); //Spokojnie. B�d� mia� wszystko na oku.
    B_LogEntry     (CH1_ActionOM,"Rozmawia�em z Grimesem o jego zadaniu. Wie, co ma robi�. Nie musz� si� martwi�, �e Ian nagle wpadnie na pomys� zej�cia na dno Kopalni.");
};

//========================================
//-----------------> KILOF
//========================================

INSTANCE DIA_Grimes_KILOF (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 55;
   condition    = DIA_Grimes_KILOF_Condition;
   information  = DIA_Grimes_KILOF_Info;
   permanent	= FALSE;
   description	= "Ten kilof chyba nale�y do ciebie.";
};

FUNC INT DIA_Grimes_KILOF_Condition()
{
    if (Npc_HasItems (other, ItMwPickaxeGrimes) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_KILOF_Info()
{
    AI_Output (other, self ,"DIA_Grimes_KILOF_15_01"); //Ten kilof chyba nale�y do ciebie.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_02"); //Uda�o ci si� go znale��? Wracaj� wspomnienia...
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_03"); //Jestem ci bardzo wdzi�czny, �e mi go przynios�e�.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_04"); //We� to jako zap�at�.
	B_GiveInvItems (other, self, ItMwPickaxeGrimes, 1);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
};


//========================================
//-----------------> KAPITEL4_DIALOG
//========================================

INSTANCE DIA_Grimes_KAPITEL4_DIALOG (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_KAPITEL4_DIALOG_Condition;
   information  = DIA_Grimes_KAPITEL4_DIALOG_Info;
   permanent	= FALSE;
   description	= "Witaj!";
};

FUNC INT DIA_Grimes_KAPITEL4_DIALOG_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_KAPITEL4_DIALOG_Info()
{
    AI_Output (other, self ,"DIA_Grimes_KAPITEL4_DIALOG_15_01"); //Witaj!
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_02"); //Mi�o ci� zn�w widzie�, ch�opcze. Ciesz� si�, �e wci�� �yjesz. Ostatnio �mier� wisi w powietrzu nad ka�dym mieszka�cem Kolonii. 
    AI_Output (other, self ,"DIA_Grimes_KAPITEL4_DIALOG_15_03"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_04"); //A no to, �e zaczyna si� wojna. Magowie Ognia i ludzie pracuj�cy w Starej Kopalni byli jej pierwszymi ofiarami.
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_05"); //Wkr�tce i inne obozy padn� ofiar� szale�czych zap�d�w Gomeza. Nowy Ob�z oberwie jako pierwszy.
};

//========================================
//-----------------> GOMEZ_PLAN
//========================================

INSTANCE DIA_Grimes_GOMEZ_PLAN (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 2;
   condition    = DIA_Grimes_GOMEZ_PLAN_Condition;
   information  = DIA_Grimes_GOMEZ_PLAN_Info;
   permanent	= FALSE;
   description	= "Co wiesz o planach Gomeza?";
};

FUNC INT DIA_Grimes_GOMEZ_PLAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_GOMEZ_PLAN_Info()
{
    AI_Output (other, self ,"DIA_Grimes_GOMEZ_PLAN_15_01"); //Co wiesz o planach Gomeza?
    AI_Output (self, other ,"DIA_Grimes_GOMEZ_PLAN_03_02"); //Nic, jestem tylko Kopaczem. Gdyby nie uratowa�o mnie kilku Stra�nik�w z obozu przed kopalni�, podzieli�bym los innych. Chwa�a Innosowi, �e w chwili upadku kopalni by�em blisko wyj�cia.
};

//========================================
//-----------------> WAR
//========================================

INSTANCE DIA_Grimes_WAR (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 3;
   condition    = DIA_Grimes_WAR_Condition;
   information  = DIA_Grimes_WAR_Info;
   permanent	= FALSE;
   description	= "Sk�d wiesz, �e wybuchnie wojna?";
};

FUNC INT DIA_Grimes_WAR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_WAR_Info()
{
    AI_Output (other, self ,"DIA_Grimes_WAR_15_01"); //Sk�d wiesz, �e wybuchnie wojna?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_02"); //Rozejrzyj si� tylko, ch�opcze. Gomez zosta� pozbawiony �r�d�a dochod�w, przez co jego autorytet w Vengardzie mo�e run�� w ka�dej chwili. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_03"); //Dlatego wys�a� cz�� swoich wojsk, aby uderzyli na Nowy Ob�z. Wiem, �e Lee i jego Najemnicy nie puszcz� mu tego p�azem.
    AI_Output (self, other ,"DIA_Grimes_WAR_03_04"); //Bractwo �ni�cego wesprze Nowy Ob�z, jako �e Gomez nakaza� zabi� wys�annik�w Bractwa rezyduj�cych w Obozie. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_05"); //S�ysza�em, �e Cor Angar niesamowicie si� w�ciek� i gdy tylko zaczn� si� walki, wy�le w ramach zemsty swoich �wi�tynnych Stra�nik�w. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_06"); //Zbiry z g�r tak�e nie s� w dobrym po�o�eniu. Zapewne teraz, gdy zosta�y wys�ane patrole Stra�nik�w ich Ob�z zostanie wykryty. S�ysza�em te� o planach odno�nie Opuszczonej Kopalni.
    AI_Output (other, self ,"DIA_Grimes_WAR_15_07"); //Sk�d ty to wszystko wiesz?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_08"); //Jestem dobrym obserwatorem i mam wielu przyjaci� w Kolonii. St�d dysponuje wieloma informacjami.
};

//========================================
//-----------------> HISTORY
//========================================

INSTANCE DIA_Grimes_HISTORY (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 4;
   condition    = DIA_Grimes_HISTORY_Condition;
   information  = DIA_Grimes_HISTORY_Info;
   permanent	= FALSE;
   description	= "Prze�y�e� a� dwa upadki kopalni. Musisz by� nie�le wstrz��ni�ty.";
};

FUNC INT DIA_Grimes_HISTORY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_HISTORY_Info()
{
    AI_Output (other, self ,"DIA_Grimes_HISTORY_15_01"); //Prze�y�e� a� dwa upadki kopalni. Musisz by� nie�le wstrz��ni�ty.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_02"); //Dzi�kuje za trosk�, m�j ch�opcze, jednak ze mn� wszystko w porz�dku. By�em na to przygotowany.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_03"); //Oczywi�cie sytuacja nie by�a tak dramatyczna po upadku Opuszczonej Kopalni, jak teraz, ale wierz�, �e z pomoc� bog�w damy rad�. 
};

//========================================
//-----------------> SMALLTALK
//========================================

INSTANCE DIA_Grimes_SMALLTALK (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 5;
   condition    = DIA_Grimes_SMALLTALK_Condition;
   information  = DIA_Grimes_SMALLTALK_Info;
   permanent	= TRUE;
   description	= "Co zamierzasz dalej robi�?";
};

FUNC INT DIA_Grimes_SMALLTALK_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_SMALLTALK_Info()
{
    AI_Output (other, self ,"DIA_Grimes_SMALLTALK_15_01"); //Co zamierzasz dalej robi�?
    AI_Output (self, other ,"DIA_Grimes_SMALLTALK_03_02"); //Zostan� w jaskini i przeczekam ca�e to zamieszanie. Potem chyba zg�osz� si� na ochotnika do pracy w kt�rej� kopalni.
};


//--------------------------------------------------------------------1.6.1-----------------------------------------------------------------------\


//========================================
//-----------------> Miecz Gor Boby
//========================================

INSTANCE DIA_Grimes_BOBA_SWORD (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 3;
   condition    = DIA_Grimes_BOBA_SWORD_Condition;
   information  = DIA_Grimes_BOBA_SWORD_Info;
   permanent	= FALSE;
   description	= "S�ysza�e� co� o minerale zwanym srebrnym gromem.";
};

FUNC INT DIA_Grimes_BOBA_SWORD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Viper_BOBA_SWORD))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_BOBA_SWORD_Info()
{
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_15_01"); //S�ysza�e� co� o minerale zwanym srebrnym gromem.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_02"); //Tak. To bardzo rzadki surowiec. Podobny do srebra ale jednak nieco inny, mi�dzy innymi jest bardziej wytrzymalszy.
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_15_03"); //S�ysza�em, �e ostatnio wydobyto jego niewielk� ilo�� w starej kopalni.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_04"); //To prawda. By�em przy tym ale przyzna�, �e by�o go bardzo niewiele. Tak ma�o, �e na d�u�sz� met� si� nim nie zainteresowano.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_05"); //Tego surowca by�o raptem kilkadziesi�t bry�ek. Uda�o mi si� zdoby� dwadzie�cia z nich.
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_15_06"); //O to ju� co�! Ile chcesz za ten minera�?
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_07"); //Za wszystkie bry�ki? Jak dla ciebie 100 sztuk rudy. Komu� innemu sprzeda�bym dro�ej ale tobie dobrze z oczu patrzy.
    B_LogEntry               (MieczGorBoby,"Rozmawia�em z Grimesem. Ma on 20 bry�ek srebrnego gromu. Chc� 100 bry�ek rudy w zamian.");
};


//========================================
//-----------------> Miecz Gor Boby
//========================================

INSTANCE DIA_Grimes_BOBA_SWORD_NUGGET (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 3;
   condition    = DIA_Grimes_BOBA_SWORD_NUGGET_Condition;
   information  = DIA_Grimes_BOBA_SWORD_NUGGET_Info;
   permanent	= FALSE;
   description	= "We� t� rud�.";
};

FUNC INT DIA_Grimes_BOBA_SWORD_NUGGET_Condition()
{
    if (Npc_KnowsInfo (hero,DIA_Grimes_BOBA_SWORD)) && (Npc_HasItems (other, itminugget) >=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_BOBA_SWORD_NUGGET_Info()
{
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_NUGGET_15_01"); //We� t� rud�.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_02"); //Dzi�kuje a oto bry�ki srebrnego gromu.	
	CreateInvItem  (self, ItMi_SilverNugget);
	B_GiveInvItems (self,other, ItMi_SilverNugget, 20);
	B_GiveInvItems (other,self, itminugget, 100);
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_NUGGET_15_03"); //No to po�ow� bry�ek ju� mam. Nie wiesz kto jeszcze m�g�by mie� ten minera�?
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_04"); //Niestety nie. Ale wiem, �e nie ma go wiele wi�cej ni� to co masz. 
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_05"); //Musisz pom�wi� z kim� cwanym, z kim� co lubi du�o wiedzie� o tym co dzieje si� wok�. By� mo�e Snipes co� wie...
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_NUGGET_15_06"); //Poszukam go. Dzi�ki za ten minera�. Do zobaczenia.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_07"); //Powodzenia ch�opcze.
    B_LogEntry               (MieczGorBoby,"Kupi�em od Grimesa 20 bry�ek ,,srebrnego gromu�. Teraz musz� pom�wi� z kim� wyj�tkowo sprytnym, kto bardzo dobrze wie co dzieje si� wok�. Grimes wspomnia� co� o Snipesie...");
};
//========================================
//-----------------> HI_GRIMI
//========================================

INSTANCE DIA_Grimes_HI_GRIMI (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 1;
   condition    = DIA_Grimes_HI_GRIMI_Condition;
   information  = DIA_Grimes_HI_GRIMI_Info;
   permanent	= FALSE;
   description	= "Wydajesz si� wiele wiedzie� o �yciu.";
};

FUNC INT DIA_Grimes_HI_GRIMI_Condition()
{
 if (Npc_KnowsInfo (hero,VLK_586_Grimes_KNOW))
{
    return TRUE;
};
};
FUNC VOID DIA_Grimes_HI_GRIMI_Info()
{
    AI_Output (other, self ,"DIA_Grimes_HI_GRIMI_15_01"); //Wydajesz si� wiele wiedzie� o �yciu.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_02"); //Z niejednego pieca chleb jad�em ch�opcze. Je�li mog� to tak nazwa�. Trudni�em si� wieloma zaj�ciami.
    AI_Output (other, self ,"DIA_Grimes_HI_GRIMI_15_03"); //Mianowicie?
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_04"); //By�em drwalem, poszukiwaczem z�ota, kr�tko hutnikiem, wyrabia�em �uki I strza�y ale g��wnym moim zaj�ciem by�a praca w kopalanich.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_05"); //Zwiedzi�em kawa� Myrthany pracuj�c przy wydobyciu rudy czy z�ota.
    AI_Output (other, self ,"DIA_Grimes_HI_GRIMI_15_06"); //Kt�re z twoich zaj�� by�o najbardziej dochodowe?
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_07"); //W teorii poszukiwanie z�ota. Ale w praktyce to mog� powiedzie�, �e to co robi� teraz.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_08"); //Z�oto jest jak ptak wydaje si�, �e s�yszysz jego �piew i musi by� gdzie� w pobli�u.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_09"); //Dlatego wol� prac� przy wydobyciu rudy. Praca jest ci�ka I kosztuje mnie coraz wi�cej energii lecz musz� powiedzie�, �e daje jak�� satysfakcj�.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_10"); //O ile ch�opcze nie my�lisz nad tym, �e na twojej pracy bogac� si� tak naprawd� tylko Gomez I jego zgraja.
};


/*
//========================================
//-----------------> Dziwna Przypad�o��
//========================================

INSTANCE DIA_Grimes_Richard_Is_Dead (C_INFO)
{
   npc          = VLK_586_Grimes;
   nr           = 3;
   condition    = DIA_Grimes_Richard_Is_Dead_Condition;
   information  = DIA_Grimes_Richard_Is_Dead_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Grimes_Richard_Is_Dead_Condition()
{
    if (Npc_IsDead (VLK_40053_Richard))
	&& (Richard_DP_Yes == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grimes_Richard_Is_Dead_Info()
{
    AI_Output (self, other ,"DIA_Grimes_Richard_Is_Dead_03_01"); //S�ysza�e� ju� smutn� nowin� ch�opcz�?
    AI_Output (other, self ,"DIA_Grimes_Richard_Is_Dead_15_02"); //Jak�?
    AI_Output (self, other ,"DIA_Grimes_Richard_Is_Dead_03_03"); //Richard nie �yje. Zatrucie okaza�o si� by� �miertelne.
    AI_Output (other, self ,"DIA_Grimes_Richard_Is_Dead_15_04"); //C�... M�g� by� bardziej ostro�ny.
    AI_Output (self, other ,"DIA_Grimes_Richard_Is_Dead_03_05"); //Racja, ostro�no�� w tych czasach to podstawa ch�opcze.
    AI_Output (other, self ,"DIA_Grimes_Richard_Is_Dead_15_06"); //Dok�adnie.
   
    B_LogEntry               (DziwnaPrzypadlosc,"Grimes przekaza� mi straszn� nowin�. Richard nie �yje. Nie zd��y�em mu pom�c. Toksyna okaza�a si� zbyt pot�na dla jego organizmu. Ehh... gdybym tylko by� szybszy!");
};

*/











