//poprawione i sprawdzone -  

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE DIA_BaalNamib_EXIT(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 999;
	condition		= DIA_BaalNamib_EXIT_Condition;
	information		= DIA_BaalNamib_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalNamib_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger) 
// ************************************************************
// ************************************************************

INSTANCE DIA_BaalNamib_NoTalk(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 1;
	condition		= DIA_BaalNamib_NoTalk_Condition;
	information		= DIA_BaalNamib_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalNamib_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalNamib_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalNamib_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalNamib_NoTalk);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,DIALOG_ENDE					,DIA_BaalNamib_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Wszystko w porz¹dku, kolego?"			,DIA_BaalNamib_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Niech Œni¹cy bêdzie z tob¹!"	,DIA_BaalNamib_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Czeœæ! Jestem tu nowy!"		,DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Hi_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //Niech Œni¹cy bêdzie z tob¹!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Sleeper_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //Wszystko w porz¹dku, kolego?
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Imp_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					BN spricht dich an
// ************************************************************

INSTANCE DIA_BaalNamib_FirstTalk(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 1;
	condition		= DIA_BaalNamib_FirstTalk_Condition;
	information		= DIA_BaalNamib_FirstTalk_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT DIA_BaalNamib_FirstTalk_Condition()
{
	if (BaalNamib_Ansprechbar==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalNamib_FirstTalk_Info()
{	
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_00"); //(Wzdycha)
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_01"); //Zosta³eœ wybrany przez Œni¹cego. Czy twoim ¿yczeniem naprawdê jest do³¹czyæ do nas?

	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"Nic nie mów"										,DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"Tak, chcê pod¹¿aæ drog¹ Œni¹cego!"	,DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output (other, self,"DIA_BaalNamib_FirstTalk_Mute_15_00"); //(Wzdycha)
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //Co takiego?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output 			(other, self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Tak, chcê pod¹¿aæ drog¹ Œni¹cego!
	AI_Output 			(self, other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //IdŸ do Cor Kaloma. Powiedz mu, ¿e przysy³am ciê do niego, bo widzê, i¿ twoja wiara jest szczera!
	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);

	B_LogEntry			(CH1_JoinPsi,	"Zaaran¿owane przez Lestera przedstawienie zdzia³a³o cuda. Baal Namib przemówi³ do mnie i da³ siê przekonaæ, ¿e jestem prawdziwym wyznawc¹ kultu Œni¹cego. Teraz mam siê udaæ do laboratorium alchemicznego Cor Kaloma!");
	B_GiveXP			(XP_ImpressBaalNamib);
};

//-----------------------------------------------------
// BESSERE RÜSTUNG NOVIZEN
//-----------------------------------------------------
instance  GUR_1204_BaalNamib_ARMOR (C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	condition		= GUR_1204_BaalNamib_ARMOR_Condition;
	information		= GUR_1204_BaalNamib_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia³bym otrzymaæ lepsz¹ zbrojê."; 
};

FUNC int  GUR_1204_BaalNamib_ARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NOV)
	&& (!Npc_HasItems (hero,NOV_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  GUR_1204_BaalNamib_ARMOR_Info()
{
	AI_Output (hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//Chcia³bym otrzymaæ lepsz¹ zbrojê. (1200 - Bry³ek Rudy)
	

	if (Npc_HasItems (hero, ItMinugget) >= 1200 )
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//Ta zbroja chroniæ bêdzie twoje cia³o, tak jak Œni¹cy chroni twoj¹ duszê!
		CreateInvItem (self,NOV_ARMOR_H);
		B_GiveInvItems (self, hero, NOV_ARMOR_H, 1);
		B_GiveInvItems (hero, self, ItMinugget,VALUE_NOV_ARMOR_H);
	}
	else
	{

			AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Wróæ, gdy uzbierasz trochê wiêcej rudy.
	};
};  

////////////////////////////////////////
////////////////////////////////////////
/////////		Kap 2			////////
////////////////////////////////////////
////////////////////////////////////////

// **************************************************************************
//					BAAL NAMIB SCHICKT DEN SPIELER ZU YBERION 
// **************************************************************************
INSTANCE Info_BaalNamib_BROTHERHOOD (C_INFO)
{
	npc			= GUR_1204_BaalNamib;
	condition	= Info_BaalNamib_BROTHERHOOD_Condition;
	information	= Info_BaalNamib_BROTHERHOOD_Info;
	important	= 0;
	permanent	= 0;
	description = "Czy s¹ jakieœ zadania, których móg³bym siê podj¹æ?";
};

FUNC INT Info_BaalNamib_BROTHERHOOD_Condition()
{
//	return (kapitel == 2) ;
};

FUNC VOID Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_15_01"); //Czy s¹ jakieœ zadania, których móg³bym siê podj¹æ?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Nasz mistrz, m¹dry Y'Berion, kaza³ sobie przys³aæ Nowicjusza. Jako ¿e jesteœ teraz jednym z nas, mo¿esz iœæ do niego i zaoferowaæ swoje us³ugi.
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"W porz¹dku. Zajrzê do niego natychmiast."		,Info_BaalNamib_BROTHERHOOD_OK);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Gdzie znajdê Y'Beriona?"							,Info_BaalNamib_BROTHERHOOD_YBWO);  
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Wiesz mo¿e jakie zadanie ma dla mnie Y'Berion?"	,Info_BaalNamib_BROTHERHOOD_YBWAS);
	var C_NPC Kalom;
	Kalom = Hlp_GetNpc (GUR_1201_CORKALOM); 
	Npc_ExchangeRoutine (Kalom,"kapitel2");
	AI_ContinueRoutine (Kalom);
};
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Gdzie znajdê Y'Beriona?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Jego siedziba znajduje siê pod œwi¹tynnym wzgórzem.

};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Wiesz mo¿e jakie zadanie ma dla mnie Y'Berion?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Aby dosz³o do wielkiego przyzwania, musimy najpierw zdobyæ pewien magiczny artefakt.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion poszukuje œmia³ka, który zechce siê podj¹æ tego zadania.
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //To nie wydaje siê zbyt trudne.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Gdyby by³o ³atwe, ju¿ dawno mielibyœmy ten artefakt w naszym Obozie. Porozmawiaj z Y'Berionem. On ci wszystko wyjaœni.
};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_OK()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //W porz¹dku. Zajrzê do niego natychmiast.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Niech Œni¹cy bêdzie z tob¹!
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
};	


//========================================
//-----------------> RUNE_SLEEP
//========================================

INSTANCE DIA_BaalNamib_RUNE_SLEEP (C_INFO)
{
   npc          = GUR_1204_BaalNamib;
   nr           = 1;
   condition    = DIA_BaalNamib_RUNE_SLEEP_Condition;
   information  = DIA_BaalNamib_RUNE_SLEEP_Info;
   permanent	= FALSE;
   description	= "Jako Mag Ognia chcia³bym dowiedzieæ siê czegoœ o magii Œni¹cego.";
};

FUNC INT DIA_BaalNamib_RUNE_SLEEP_Condition()
{
    if (MIS_NEW_GOD == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalNamib_RUNE_SLEEP_Info()
{
    AI_Output (other, self ,"DIA_BaalNamib_RUNE_SLEEP_15_01"); //Jako Mag Ognia chcia³bym dowiedzieæ siê czegoœ o magii Œni¹cego.
    AI_Output (self, other ,"DIA_BaalNamib_RUNE_SLEEP_03_02"); //Ach, tak. Rozmawia³em ju¿ z Lesterem na twój temat. Twierdzi ¿e mo¿na ci zaufaæ. Mistrz Y'Berion wyra¿a siê tak¿e bardzo pochlebnie o tobie.
    AI_Output (self, other ,"DIA_BaalNamib_RUNE_SLEEP_03_03"); //Mimo, ¿e nie nale¿ysz do naszego Bractwa, podzielê siê z tob¹ nasz¹ magi¹. WeŸ tê runê snu. Z jej pomoc¹ lepiej zrozumiesz œcie¿kê, któr¹ wskaza³ nam Œni¹cy.
    AI_Output (other, self ,"DIA_BaalNamib_RUNE_SLEEP_15_04"); //Dziêkujê, mistrzu. Niech Œni¹cy bêdzie z tob¹.
    B_LogEntry                     (CH2_New_God,"Uda³o mi siê dostaæ runê snu od Baal Namiba.");

    B_GiveXP (200);
    CreateInvItems (self, ItArRuneSleep, 1);
    B_GiveInvItems (self, other, ItArRuneSleep, 1);
    AI_StopProcessInfos	(self);
};


func void TempleHostile()
{ 

    if  TempleHostile_Day<=(Wld_GetDay()-2)
	//&& (!Npc_KnowsInfo(hero,DIA_BaalNamib_BRAGO))
   {
         
		 
    B_LogEntry                     (ZlodziejskaWspolpraca,"Cholera. Straci³em szanse na obronienie siê przed gniewem wyznawców Œni¹cego. Jeœli pojawiê siê w obozie Sekty to czeka mnie niechybna œmieræ.");	   		   		   
		   
    B_SetPermAttitude	(Tpl_1440_Templer,	ATT_HOSTILE);
    B_SetPermAttitude	(Tpl_1441_Templer,	ATT_HOSTILE);
	B_SetPermAttitude	(Tpl_1442_Templer,	ATT_HOSTILE);
    B_SetPermAttitude	(Tpl_1443_Templer,	ATT_HOSTILE);
	B_SetPermAttitude	(Tpl_1444_Templer,	ATT_HOSTILE);
	B_SetPermAttitude	(Tpl_1445_Templer,	ATT_HOSTILE);
	
	
   };
  
};



//========================================
//-----------------> RUNE_SLEEP
//========================================

INSTANCE DIA_BaalNamib_BRAGO (C_INFO)
{
   npc          = GUR_1204_BaalNamib;
   nr           = 1;
   condition    = DIA_BaalNamib_BRAGO_Condition;
   information  = DIA_BaalNamib_BRAGO_Info;
   permanent	= FALSE;
   description	= "Odnalaz³em Brago. Przyzna³ siê do wszystkiego...";
};

FUNC INT DIA_BaalNamib_BRAGO_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Brago_WALKA))
	&& (Npc_HasItems(other,Amulett_Joru) >= 1) 
	&& (Npc_HasItems(other,ItMi_Stuff_Idol_Mosul) >= 1) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalNamib_BRAGO_Info()
{
    AI_Output (other, self ,"DIA_BaalNamib_BRAGO_15_01"); //Odnalaz³em Brago. Przyzna³ siê do wszystkiego, mia³ tak¿e przedmioty skradzione Ghorimowi i Joru.
    AI_Output (self, other ,"DIA_BaalNamib_BRAGO_03_02"); //Dobrze, zatem oddaj im je i wróæ do mnie.
   B_LogEntry                     (ZlodziejskaWspolpraca,"Baal Namib kaza³ mi oddaæ skradzione rzeczy Ghorimowi i Joru. Chyba jest szansa, ¿e to wszystko dobrze siê skoñczy.");

  
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> RUNE_SLEEP
//========================================

INSTANCE DIA_BaalNamib_GIT (C_INFO)
{
   npc          = GUR_1204_BaalNamib;
   nr           = 1;
   condition    = DIA_BaalNamib_GIT_Condition;
   information  = DIA_BaalNamib_GIT_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Ghorimem i Joru.";
};

FUNC INT DIA_BaalNamib_GIT_Condition()
{
    if (Npc_KnowsInfo(hero, DIA_Ghorim_Posazek))
	&& (Npc_KnowsInfo(hero, DIA_Joru_MEDALION))
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalNamib_GIT_Info()
{
    AI_Output (other, self ,"DIA_BaalNamib_GIT_15_01"); //Rozmawia³em z Ghorimem i Joru.
    AI_Output (self, other ,"DIA_BaalNamib_GIT_03_02"); //Naprawi³eœ swoje b³êdy. A na dodatek zrobi³eœ coœ wiêcej.
	AI_Output (other, self ,"DIA_BaalNamib_GIT_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_BaalNamib_GIT_03_04"); //Zdemaskowa³eœ Brago. Odk¹d pojawi³ siê w naszym Bractwie, wielu jego mieszkañców pad³o ofiar¹ tego z³oczyñcy.
	AI_Output (self, other ,"DIA_BaalNamib_GIT_03_05"); //Dopiero ty z³o¿y³eœ wszystko w ca³oœæ i sprawi³eœ, ¿e ju¿ tu nie wróci. Zas³u¿y³eœ na nagrodê. Oto ona. 
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItFo_Potion_Mana_03, 3);
	B_GiveInvItems (self,other, ItFo_Potion_Master_01, 1);
	AI_Output (other, self ,"DIA_BaalNamib_GIT_15_06"); //Dziêkujê.
	AI_Output (self, other ,"DIA_BaalNamib_GIT_03_07"); //Niech Œni¹cy zawsze bêdzie z tob¹.
	
	
     B_LogEntry                     (ZlodziejskaWspolpraca,"Odda³em skradzione rzeczy Joru oraz Ghorimowi. Baal Namib jest ze mnie zadowolony. Nie doœæ, ¿e wybaczono mi pope³niony b³¹d to Baal wyp³aci³ mi nawet nagrodê za zdemaskowanie Brago, który od d³u¿szego czasu dzia³a³ na szkodê mieszkañców obozu. Wszystko dobre co siê dobrze koñczy.");
     Log_SetTopicStatus             (ZlodziejskaWspolpraca, LOG_SUCCESS);
     B_GiveXP (550);
     AI_StopProcessInfos	(self);
};



//========================================
//-----------------> RUNE_SLEEP
//========================================

INSTANCE DIA_BaalNamib_LESTER_ROZ (C_INFO)
{
   npc          = GUR_1204_BaalNamib;
   nr           = 9;
   condition    = DIA_BaalNamib_LESTER_ROZ_Condition;
   information  = DIA_BaalNamib_LESTER_ROZ_Info;
   permanent	= FALSE;
  description	= "Witaj Baalu! To nie ja zabi³em Mosula.";
};

FUNC INT DIA_BaalNamib_LESTER_ROZ_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Brago_Medalion))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_BaalNamib_LESTER_ROZ_Info()
{
    AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_01"); //Witaj Baalu! Zasz³a pomy³ka...
    AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_02"); //Jak œmiesz tak ³gaæ. Dowody s¹ mia¿d¿¹ce, zaraz pojmie ciê Stra¿ Œwi¹tynna!
    AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_03"); //Za wszystkim stoi Brago. On wci¹gn¹³ mnie w to wszystko. Zrobi³em parê g³upich rzeczy ale nikogo nie zabi³em.
    AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_04"); //Mogê to wszystko wyjaœniæ. Muszê tylko z³apaæ Brago, tyle, ¿e nie ma go ju¿ w obozie. 
	AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_05"); //Nie. Zostaniesz tutaj. Czeka ciê s¹d i kara.
	AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_06"); //Porêczy za mnie Lester. Twierdzi, ¿e jestem niewinny. Pozwól Baalu, ¿e spróbuje znaleŸæ dowody, które oczyszcz¹ mnie z zarzutów!
	AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_07"); //A wiêc rêczy za ciebie Lester... Dobrze, dam ci trochê czasu na znalezienie tych dowodów. Inaczej Stra¿nicy Œwi¹tynni otrzymaj¹ rozkaz by ciê zg³adziæ.
	AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_08"); //I nie próbuj uciekaæ.	Gniew Œni¹cego i jego wyznawców dopadnie ciê wszêdzie.


    B_LogEntry                     (ZlodziejskaWspolpraca,"Rozmawia³em z Baalem Namibem. Jest przekonany o mojej winie jednak Lester wstawi siê za mn¹ dziêki czemu bêdê móg³ spróbowaæ ocaliæ swoje dobre imiê na ile to mo¿liwe i unikn¹æ kary. Muszê pogadaæ z Gor Na Drakiem, wyruszaj¹c z obozu byæ mo¿e widzia³ tego zdrajcê Brago.");
    TempleHostile();
};


//========================================
//-----------------> BG
//========================================

INSTANCE DIA_BaalNamib_BG (C_INFO)
{
   npc          = GUR_1204_BaalNamib;
   nr           = 1;
   condition    = DIA_BaalNamib_BG_Condition;
   information  = DIA_BaalNamib_BG_Info;
   permanent	= FALSE;
   description	= "Agresywne bagienne golemy zosta³y wybite. Ja i Gor Na Pol zrobiliœmy swoje.";
};

FUNC INT DIA_BaalNamib_BG_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaPol_BG_END))
{
    return TRUE;
};
};
FUNC VOID DIA_BaalNamib_BG_Info()
{
    AI_Output (other, self ,"DIA_BaalNamib_BG_15_01"); //Agresywne bagienne golemy zosta³y wybite. Ja i Gor Na Pol zrobiliœmy swoje.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_02"); //Rozmawia³em z Gor Na Polem. By³ zachwycony.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_03"); //Obaj przys³u¿yliœcie siê naszemu Bractwu I zadbaliœcie o jego bezpieczeñstwo.
    AI_Output (other, self ,"DIA_BaalNamib_BG_15_04"); //Zrobi³em to co by³o trzeba zrobiæ.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_05"); //Czeka was nagroda. Najpierw wynagrodzê Ciebie.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_06"); //Walcz dalej za nasz¹ sprawê. Dobrze Ci idzie wojowniku. 
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_07"); //Niech œni¹cy ciê prowadzi...
	B_LogEntry               (BagienneGolemy,"Baal Namib by³ ze mnie zadowolony I wychwala³ moje zdolnoœci. Wszak ja I Gor Na Pol zrobiliœmy coœ wa¿nego dla ca³ego obozu. Otrzyma³em od Guru nale¿n¹ mi nagrodê. Pora zaj¹æ siê czymœ innym. ");
	B_GiveXP(500);
	Log_SetTopicStatus             (BagienneGolemy, LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};

instance dia_baalnamib_pickpocket(c_info) {
    npc = gur_1204_baalnamib;
    nr = 900;
    condition = dia_baalnamib_pickpocket_condition;
    information = dia_baalnamib_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_baalnamib_pickpocket_condition() {
	e_beklauen(baseThfChanceGUR, 35);
};

func void dia_baalnamib_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_baalnamib_pickpocket);
	info_addchoice(dia_baalnamib_pickpocket, dialog_back, dia_baalnamib_pickpocket_back);
	info_addchoice(dia_baalnamib_pickpocket, dialog_pickpocket, dia_baalnamib_pickpocket_doit);
};

func void dia_baalnamib_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_baalnamib_pickpocket);
};

func void dia_baalnamib_pickpocket_back() {
    info_clearchoices(dia_baalnamib_pickpocket);
};

 