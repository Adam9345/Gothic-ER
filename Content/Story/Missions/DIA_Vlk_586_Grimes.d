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
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Nawzajem, ch³opcze. Nawzajem.
	
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
	description		= "Od dawna tu jesteœ?"; 
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
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Od dawna tu jesteœ?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Od ca³ych 10 lat. Uwierz mi, du¿o ju¿ tu widzia³em.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Stawi³em czo³a wielu niebezpieczeñstwom, ale jakoœ uda³o mi siê z nich wybrn¹æ.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Pamiêtam jak pracowaliœmy jeszcze w pierwszej kopalni, tej, która teraz stoi pusta. Pewnego dnia nie wytrzyma³y podpory...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ale to stare dzieje...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zapewne s³ysza³eœ te¿ o wielu planach ucieczki."; 
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
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Zapewne s³ysza³eœ te¿ o wielu planach ucieczki.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Pos³uchaj, ch³opcze. Wiem, ¿e chcia³byœ siê st¹d wydostaæ, ale zapomnij o tym.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //St¹d nie ma ucieczki! Widzia³em twarze tych, którzy próbowali sforsowaæ Barierê.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Nie pope³niaj tego samego b³êdu. Bariera powstrzyma ka¿dego.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nie chcê spêdziæ nastêpnych 10 lat mojego ¿ycia wydobywaj¹c rudê!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Wcale nie musisz. Mo¿e zostaniesz wielk¹ szych¹, kto wie?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Mo¿esz pi¹æ siê do góry, ale niewa¿ne jak wysokie stanowisko uda ci siê osi¹gn¹æ - Bariera wreszcie ciê zatrzyma.
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
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Oho! Nowa twarz! Pracowa³eœ kiedyœ jako górnik, ch³opcze?
};  

instance  VLK_586_Grimes_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_LEARN_Condition;
	information		= VLK_586_Grimes_LEARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kogoœ, kto nauczy mnie Górnictwa."; 
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
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_01"); //Szukam kogoœ, kto nauczy mnie kopaæ rudê.
	if (Npc_GetTrueGuild(other) == GIL_VLK)
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_02"); //Ach, to ciebie Ian ostatnio przyj¹³ do pracy. Nauka bêdzie ciê kosztowaæ kilka bry³ek rudy.
	AI_Output (other, self,"VLK_586_Grimes_LEARN_Info_15_03"); //Nic nie mam. Ian wszystko mi zabra³. Powiedzia³, ¿e mam wykopaæ 500 bry³ek rudy.
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_04"); //Jesteœ w ciê¿kiej sytuacji, rozumiem. Tym razem zrobiê wiêc wyj¹tek. 
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo¿e mnie nauczyæ jak wydobywaæ rudê. Za naukê nie muszê nic p³aciæ, poniewa¿ jestem Kopaczem.");
	}
	else
	{
	AI_Output (self, other,"VLK_586_Grimes_LEARN_Info_04_06"); //Nauka tego fachu nie jest taka trudna, jednak bêdzie ciê to kosztowaæ 100 bry³ek rudy.
	
		Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
		B_LogEntry			(GE_TeacherOM,"Grimes mo¿e mnie nauczyæ górnictwa. Za naukê muszê zap³aciæ 100 bry³ek rudy.");
	};
};

instance  VLK_586_Grimes_START_LEARN (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_START_LEARN_Condition;
	information		= VLK_586_Grimes_START_LEARN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie górnictwa. (100 bry³ek rudy)"; 
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
    AI_Output (other, self, "VLK_586_Grimes_START_LEARN_15_00"); //Naucz mnie górnictwa!
	
	if (Npc_HasItems (other, ItMiNugget) >=100)
	{
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_01"); //No dobra. Trzeba uderzaæ spokojnie i jednostajnie. Nie spiesz siê – ale uwa¿aj, ¿eby nie zasn¹æ przy pracy.
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_02"); //Nie wal ci¹gle w jedno miejsce – spróbuj wyci¹æ ³adny samorodek.
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_03"); //Postêpuj zgodnie z moimi wskazówkami, a zostaniesz prawdziwym mistrzem wœród kopaczy.
			B_GiveInvItems (other,self, itminugget, 100);
		//HERO_HACKCHANCE = HERO_HACKCHANCE + 10;
		b_upgrade_hero_hackchance(10);
		//Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "VLK_586_Grimes_START_LEARN_01_04"); //Najpierw chcê zobaczyæ moj¹ czêœæ.
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
   description	= "Przygotuj siê.";
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
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_01"); //Przygotuj siê.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_02"); //Ju¿ zaczynacie? Gdzie Aleph?
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_03"); //Zrezygnowa³. Ja otworzê zamki. 
    AI_Output (other, self ,"DIA_Grimes_AKSZYN22_15_04"); //Ty tymczasem zatrzymaj tu Iana i jego Stra¿ników.
    AI_Output (self, other ,"DIA_Grimes_AKSZYN22_03_05"); //Spokojnie. Bêdê mia³ wszystko na oku.
    B_LogEntry     (CH1_ActionOM,"Rozmawia³em z Grimesem o jego zadaniu. Wie, co ma robiæ. Nie muszê siê martwiæ, ¿e Ian nagle wpadnie na pomys³ zejœcia na dno Kopalni.");
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
   description	= "Ten kilof chyba nale¿y do ciebie.";
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
    AI_Output (other, self ,"DIA_Grimes_KILOF_15_01"); //Ten kilof chyba nale¿y do ciebie.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_02"); //Uda³o ci siê go znaleŸæ? Wracaj¹ wspomnienia...
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_03"); //Jestem ci bardzo wdziêczny, ¿e mi go przynios³eœ.
    AI_Output (self, other ,"DIA_Grimes_KILOF_03_04"); //WeŸ to jako zap³atê.
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
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_02"); //Mi³o ciê znów widzieæ, ch³opcze. Cieszê siê, ¿e wci¹¿ ¿yjesz. Ostatnio œmieræ wisi w powietrzu nad ka¿dym mieszkañcem Kolonii. 
    AI_Output (other, self ,"DIA_Grimes_KAPITEL4_DIALOG_15_03"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_04"); //A no to, ¿e zaczyna siê wojna. Magowie Ognia i ludzie pracuj¹cy w Starej Kopalni byli jej pierwszymi ofiarami.
    AI_Output (self, other ,"DIA_Grimes_KAPITEL4_DIALOG_03_05"); //Wkrótce i inne obozy padn¹ ofiar¹ szaleñczych zapêdów Gomeza. Nowy Obóz oberwie jako pierwszy.
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
    AI_Output (self, other ,"DIA_Grimes_GOMEZ_PLAN_03_02"); //Nic, jestem tylko Kopaczem. Gdyby nie uratowa³o mnie kilku Stra¿ników z obozu przed kopalni¹, podzieli³bym los innych. Chwa³a Innosowi, ¿e w chwili upadku kopalni by³em blisko wyjœcia.
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
   description	= "Sk¹d wiesz, ¿e wybuchnie wojna?";
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
    AI_Output (other, self ,"DIA_Grimes_WAR_15_01"); //Sk¹d wiesz, ¿e wybuchnie wojna?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_02"); //Rozejrzyj siê tylko, ch³opcze. Gomez zosta³ pozbawiony Ÿród³a dochodów, przez co jego autorytet w Vengardzie mo¿e run¹æ w ka¿dej chwili. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_03"); //Dlatego wys³a³ czêœæ swoich wojsk, aby uderzyli na Nowy Obóz. Wiem, ¿e Lee i jego Najemnicy nie puszcz¹ mu tego p³azem.
    AI_Output (self, other ,"DIA_Grimes_WAR_03_04"); //Bractwo Œni¹cego wesprze Nowy Obóz, jako ¿e Gomez nakaza³ zabiæ wys³anników Bractwa rezyduj¹cych w Obozie. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_05"); //S³ysza³em, ¿e Cor Angar niesamowicie siê wœciek³ i gdy tylko zaczn¹ siê walki, wyœle w ramach zemsty swoich Œwi¹tynnych Stra¿ników. 
    AI_Output (self, other ,"DIA_Grimes_WAR_03_06"); //Zbiry z gór tak¿e nie s¹ w dobrym po³o¿eniu. Zapewne teraz, gdy zosta³y wys³ane patrole Stra¿ników ich Obóz zostanie wykryty. S³ysza³em te¿ o planach odnoœnie Opuszczonej Kopalni.
    AI_Output (other, self ,"DIA_Grimes_WAR_15_07"); //Sk¹d ty to wszystko wiesz?
    AI_Output (self, other ,"DIA_Grimes_WAR_03_08"); //Jestem dobrym obserwatorem i mam wielu przyjació³ w Kolonii. St¹d dysponuje wieloma informacjami.
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
   description	= "Prze¿y³eœ a¿ dwa upadki kopalni. Musisz byæ nieŸle wstrz¹œniêty.";
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
    AI_Output (other, self ,"DIA_Grimes_HISTORY_15_01"); //Prze¿y³eœ a¿ dwa upadki kopalni. Musisz byæ nieŸle wstrz¹œniêty.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_02"); //Dziêkuje za troskê, mój ch³opcze, jednak ze mn¹ wszystko w porz¹dku. By³em na to przygotowany.
    AI_Output (self, other ,"DIA_Grimes_HISTORY_03_03"); //Oczywiœcie sytuacja nie by³a tak dramatyczna po upadku Opuszczonej Kopalni, jak teraz, ale wierzê, ¿e z pomoc¹ bogów damy radê. 
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
   description	= "Co zamierzasz dalej robiæ?";
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
    AI_Output (other, self ,"DIA_Grimes_SMALLTALK_15_01"); //Co zamierzasz dalej robiæ?
    AI_Output (self, other ,"DIA_Grimes_SMALLTALK_03_02"); //Zostanê w jaskini i przeczekam ca³e to zamieszanie. Potem chyba zg³oszê siê na ochotnika do pracy w którejœ kopalni.
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
   description	= "S³ysza³eœ coœ o minerale zwanym srebrnym gromem.";
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
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_15_01"); //S³ysza³eœ coœ o minerale zwanym srebrnym gromem.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_02"); //Tak. To bardzo rzadki surowiec. Podobny do srebra ale jednak nieco inny, miêdzy innymi jest bardziej wytrzymalszy.
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_15_03"); //S³ysza³em, ¿e ostatnio wydobyto jego niewielk¹ iloœæ w starej kopalni.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_04"); //To prawda. By³em przy tym ale przyznaæ, ¿e by³o go bardzo niewiele. Tak ma³o, ¿e na d³u¿sz¹ metê siê nim nie zainteresowano.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_05"); //Tego surowca by³o raptem kilkadziesi¹t bry³ek. Uda³o mi siê zdobyæ dwadzieœcia z nich.
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_15_06"); //O to ju¿ coœ! Ile chcesz za ten minera³?
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_03_07"); //Za wszystkie bry³ki? Jak dla ciebie 100 sztuk rudy. Komuœ innemu sprzeda³bym dro¿ej ale tobie dobrze z oczu patrzy.
    B_LogEntry               (MieczGorBoby,"Rozmawia³em z Grimesem. Ma on 20 bry³ek srebrnego gromu. Chcê 100 bry³ek rudy w zamian.");
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
   description	= "WeŸ tê rudê.";
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
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_NUGGET_15_01"); //WeŸ tê rudê.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_02"); //Dziêkuje a oto bry³ki srebrnego gromu.	
	CreateInvItem  (self, ItMi_SilverNugget);
	B_GiveInvItems (self,other, ItMi_SilverNugget, 20);
	B_GiveInvItems (other,self, itminugget, 100);
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_NUGGET_15_03"); //No to po³owê bry³ek ju¿ mam. Nie wiesz kto jeszcze móg³by mieæ ten minera³?
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_04"); //Niestety nie. Ale wiem, ¿e nie ma go wiele wiêcej ni¿ to co masz. 
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_05"); //Musisz pomówiæ z kimœ cwanym, z kimœ co lubi du¿o wiedzieæ o tym co dzieje siê wokó³. Byæ mo¿e Snipes coœ wie...
    AI_Output (other, self ,"DIA_Grimes_BOBA_SWORD_NUGGET_15_06"); //Poszukam go. Dziêki za ten minera³. Do zobaczenia.
    AI_Output (self, other ,"DIA_Grimes_BOBA_SWORD_NUGGET_03_07"); //Powodzenia ch³opcze.
    B_LogEntry               (MieczGorBoby,"Kupi³em od Grimesa 20 bry³ek ,,srebrnego gromu”. Teraz muszê pomówiæ z kimœ wyj¹tkowo sprytnym, kto bardzo dobrze wie co dzieje siê wokó³. Grimes wspomnia³ coœ o Snipesie...");
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
   description	= "Wydajesz siê wiele wiedzieæ o ¿yciu.";
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
    AI_Output (other, self ,"DIA_Grimes_HI_GRIMI_15_01"); //Wydajesz siê wiele wiedzieæ o ¿yciu.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_02"); //Z niejednego pieca chleb jad³em ch³opcze. Jeœli mogê to tak nazwaæ. Trudni³em siê wieloma zajêciami.
    AI_Output (other, self ,"DIA_Grimes_HI_GRIMI_15_03"); //Mianowicie?
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_04"); //By³em drwalem, poszukiwaczem z³ota, krótko hutnikiem, wyrabia³em ³uki I strza³y ale g³ównym moim zajêciem by³a praca w kopalanich.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_05"); //Zwiedzi³em kawa³ Myrthany pracuj¹c przy wydobyciu rudy czy z³ota.
    AI_Output (other, self ,"DIA_Grimes_HI_GRIMI_15_06"); //Które z twoich zajêæ by³o najbardziej dochodowe?
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_07"); //W teorii poszukiwanie z³ota. Ale w praktyce to mogê powiedzieæ, ¿e to co robiê teraz.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_08"); //Z³oto jest jak ptak wydaje siê, ¿e s³yszysz jego œpiew i musi byæ gdzieœ w pobli¿u.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_09"); //Dlatego wolê pracê przy wydobyciu rudy. Praca jest ciê¿ka I kosztuje mnie coraz wiêcej energii lecz muszê powiedzieæ, ¿e daje jak¹œ satysfakcjê.
    AI_Output (self, other ,"DIA_Grimes_HI_GRIMI_03_10"); //O ile ch³opcze nie myœlisz nad tym, ¿e na twojej pracy bogac¹ siê tak naprawdê tylko Gomez I jego zgraja.
};


/*
//========================================
//-----------------> Dziwna Przypad³oœæ
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
    AI_Output (self, other ,"DIA_Grimes_Richard_Is_Dead_03_01"); //S³ysza³eœ ju¿ smutn¹ nowinê ch³opczê?
    AI_Output (other, self ,"DIA_Grimes_Richard_Is_Dead_15_02"); //Jak¹?
    AI_Output (self, other ,"DIA_Grimes_Richard_Is_Dead_03_03"); //Richard nie ¿yje. Zatrucie okaza³o siê byæ œmiertelne.
    AI_Output (other, self ,"DIA_Grimes_Richard_Is_Dead_15_04"); //Có¿... Móg³ byæ bardziej ostro¿ny.
    AI_Output (self, other ,"DIA_Grimes_Richard_Is_Dead_03_05"); //Racja, ostro¿noœæ w tych czasach to podstawa ch³opcze.
    AI_Output (other, self ,"DIA_Grimes_Richard_Is_Dead_15_06"); //Dok³adnie.
   
    B_LogEntry               (DziwnaPrzypadlosc,"Grimes przekaza³ mi straszn¹ nowinê. Richard nie ¿yje. Nie zd¹¿y³em mu pomóc. Toksyna okaza³a siê zbyt potê¿na dla jego organizmu. Ehh... gdybym tylko by³ szybszy!");
};

*/











