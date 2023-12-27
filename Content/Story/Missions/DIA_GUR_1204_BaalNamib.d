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
// 					NICHT ansprechbar (Ungl�ubiger) 
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
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Wszystko w porz�dku, kolego?"			,DIA_BaalNamib_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Niech �ni�cy b�dzie z tob�!"	,DIA_BaalNamib_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Cze��! Jestem tu nowy!"		,DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //Cze��! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Hi_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //Niech �ni�cy b�dzie z tob�!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Sleeper_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //Wszystko w porz�dku, kolego?
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
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_01"); //Zosta�e� wybrany przez �ni�cego. Czy twoim �yczeniem naprawd� jest do��czy� do nas?

	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"Nic nie m�w"										,DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"Tak, chc� pod��a� drog� �ni�cego!"	,DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output (other, self,"DIA_BaalNamib_FirstTalk_Mute_15_00"); //(Wzdycha)
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //Co takiego?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output 			(other, self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Tak, chc� pod��a� drog� �ni�cego!
	AI_Output 			(self, other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //Id� do Cor Kaloma. Powiedz mu, �e przysy�am ci� do niego, bo widz�, i� twoja wiara jest szczera!
	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);

	B_LogEntry			(CH1_JoinPsi,	"Zaaran�owane przez Lestera przedstawienie zdzia�a�o cuda. Baal Namib przem�wi� do mnie i da� si� przekona�, �e jestem prawdziwym wyznawc� kultu �ni�cego. Teraz mam si� uda� do laboratorium alchemicznego Cor Kaloma!");
	B_GiveXP			(XP_ImpressBaalNamib);
};

//-----------------------------------------------------
// BESSERE R�STUNG NOVIZEN
//-----------------------------------------------------
instance  GUR_1204_BaalNamib_ARMOR (C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	condition		= GUR_1204_BaalNamib_ARMOR_Condition;
	information		= GUR_1204_BaalNamib_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia�bym otrzyma� lepsz� zbroj�."; 
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
	AI_Output (hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//Chcia�bym otrzyma� lepsz� zbroj�. (1200 - Bry�ek Rudy)
	

	if (Npc_HasItems (hero, ItMinugget) >= 1200 )
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//Ta zbroja chroni� b�dzie twoje cia�o, tak jak �ni�cy chroni twoj� dusz�!
		CreateInvItem (self,NOV_ARMOR_H);
		B_GiveInvItems (self, hero, NOV_ARMOR_H, 1);
		B_GiveInvItems (hero, self, ItMinugget,VALUE_NOV_ARMOR_H);
	}
	else
	{

			AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Wr��, gdy uzbierasz troch� wi�cej rudy.
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
	description = "Czy s� jakie� zadania, kt�rych m�g�bym si� podj��?";
};

FUNC INT Info_BaalNamib_BROTHERHOOD_Condition()
{
//	return (kapitel == 2) ;
};

FUNC VOID Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_15_01"); //Czy s� jakie� zadania, kt�rych m�g�bym si� podj��?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Nasz mistrz, m�dry Y'Berion, kaza� sobie przys�a� Nowicjusza. Jako �e jeste� teraz jednym z nas, mo�esz i�� do niego i zaoferowa� swoje us�ugi.
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"W porz�dku. Zajrz� do niego natychmiast."		,Info_BaalNamib_BROTHERHOOD_OK);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Gdzie znajd� Y'Beriona?"							,Info_BaalNamib_BROTHERHOOD_YBWO);  
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Wiesz mo�e jakie zadanie ma dla mnie Y'Berion?"	,Info_BaalNamib_BROTHERHOOD_YBWAS);
	var C_NPC Kalom;
	Kalom = Hlp_GetNpc (GUR_1201_CORKALOM); 
	Npc_ExchangeRoutine (Kalom,"kapitel2");
	AI_ContinueRoutine (Kalom);
};
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Gdzie znajd� Y'Beriona?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Jego siedziba znajduje si� pod �wi�tynnym wzg�rzem.

};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Wiesz mo�e jakie zadanie ma dla mnie Y'Berion?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Aby dosz�o do wielkiego przyzwania, musimy najpierw zdoby� pewien magiczny artefakt.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion poszukuje �mia�ka, kt�ry zechce si� podj�� tego zadania.
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //To nie wydaje si� zbyt trudne.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Gdyby by�o �atwe, ju� dawno mieliby�my ten artefakt w naszym Obozie. Porozmawiaj z Y'Berionem. On ci wszystko wyja�ni.
};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_OK()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //W porz�dku. Zajrz� do niego natychmiast.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Niech �ni�cy b�dzie z tob�!
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
   description	= "Jako Mag Ognia chcia�bym dowiedzie� si� czego� o magii �ni�cego.";
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
    AI_Output (other, self ,"DIA_BaalNamib_RUNE_SLEEP_15_01"); //Jako Mag Ognia chcia�bym dowiedzie� si� czego� o magii �ni�cego.
    AI_Output (self, other ,"DIA_BaalNamib_RUNE_SLEEP_03_02"); //Ach, tak. Rozmawia�em ju� z Lesterem na tw�j temat. Twierdzi �e mo�na ci zaufa�. Mistrz Y'Berion wyra�a si� tak�e bardzo pochlebnie o tobie.
    AI_Output (self, other ,"DIA_BaalNamib_RUNE_SLEEP_03_03"); //Mimo, �e nie nale�ysz do naszego Bractwa, podziel� si� z tob� nasz� magi�. We� t� run� snu. Z jej pomoc� lepiej zrozumiesz �cie�k�, kt�r� wskaza� nam �ni�cy.
    AI_Output (other, self ,"DIA_BaalNamib_RUNE_SLEEP_15_04"); //Dzi�kuj�, mistrzu. Niech �ni�cy b�dzie z tob�.
    B_LogEntry                     (CH2_New_God,"Uda�o mi si� dosta� run� snu od Baal Namiba.");

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
         
		 
    B_LogEntry                     (ZlodziejskaWspolpraca,"Cholera. Straci�em szanse na obronienie si� przed gniewem wyznawc�w �ni�cego. Je�li pojawi� si� w obozie Sekty to czeka mnie niechybna �mier�.");	   		   		   
		   
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
   description	= "Odnalaz�em Brago. Przyzna� si� do wszystkiego...";
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
    AI_Output (other, self ,"DIA_BaalNamib_BRAGO_15_01"); //Odnalaz�em Brago. Przyzna� si� do wszystkiego, mia� tak�e przedmioty skradzione Ghorimowi i Joru.
    AI_Output (self, other ,"DIA_BaalNamib_BRAGO_03_02"); //Dobrze, zatem oddaj im je i wr�� do mnie.
   B_LogEntry                     (ZlodziejskaWspolpraca,"Baal Namib kaza� mi odda� skradzione rzeczy Ghorimowi i Joru. Chyba jest szansa, �e to wszystko dobrze si� sko�czy.");

  
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
   description	= "Rozmawia�em z Ghorimem i Joru.";
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
    AI_Output (other, self ,"DIA_BaalNamib_GIT_15_01"); //Rozmawia�em z Ghorimem i Joru.
    AI_Output (self, other ,"DIA_BaalNamib_GIT_03_02"); //Naprawi�e� swoje b��dy. A na dodatek zrobi�e� co� wi�cej.
	AI_Output (other, self ,"DIA_BaalNamib_GIT_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_BaalNamib_GIT_03_04"); //Zdemaskowa�e� Brago. Odk�d pojawi� si� w naszym Bractwie, wielu jego mieszka�c�w pad�o ofiar� tego z�oczy�cy.
	AI_Output (self, other ,"DIA_BaalNamib_GIT_03_05"); //Dopiero ty z�o�y�e� wszystko w ca�o�� i sprawi�e�, �e ju� tu nie wr�ci. Zas�u�y�e� na nagrod�. Oto ona. 
	B_GiveInvItems (self,other, itminugget, 100);
	B_GiveInvItems (self,other, ItFo_Potion_Mana_03, 3);
	B_GiveInvItems (self,other, ItFo_Potion_Master_01, 1);
	AI_Output (other, self ,"DIA_BaalNamib_GIT_15_06"); //Dzi�kuj�.
	AI_Output (self, other ,"DIA_BaalNamib_GIT_03_07"); //Niech �ni�cy zawsze b�dzie z tob�.
	
	
     B_LogEntry                     (ZlodziejskaWspolpraca,"Odda�em skradzione rzeczy Joru oraz Ghorimowi. Baal Namib jest ze mnie zadowolony. Nie do��, �e wybaczono mi pope�niony b��d to Baal wyp�aci� mi nawet nagrod� za zdemaskowanie Brago, kt�ry od d�u�szego czasu dzia�a� na szkod� mieszka�c�w obozu. Wszystko dobre co si� dobrze ko�czy.");
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
  description	= "Witaj Baalu! To nie ja zabi�em Mosula.";
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
    AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_01"); //Witaj Baalu! Zasz�a pomy�ka...
    AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_02"); //Jak �miesz tak �ga�. Dowody s� mia�d��ce, zaraz pojmie ci� Stra� �wi�tynna!
    AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_03"); //Za wszystkim stoi Brago. On wci�gn�� mnie w to wszystko. Zrobi�em par� g�upich rzeczy ale nikogo nie zabi�em.
    AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_04"); //Mog� to wszystko wyja�ni�. Musz� tylko z�apa� Brago, tyle, �e nie ma go ju� w obozie. 
	AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_05"); //Nie. Zostaniesz tutaj. Czeka ci� s�d i kara.
	AI_Output (other, self ,"DIA_BaalNamib_LESTER_ROZ_15_06"); //Por�czy za mnie Lester. Twierdzi, �e jestem niewinny. Pozw�l Baalu, �e spr�buje znale�� dowody, kt�re oczyszcz� mnie z zarzut�w!
	AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_07"); //A wi�c r�czy za ciebie Lester... Dobrze, dam ci troch� czasu na znalezienie tych dowod�w. Inaczej Stra�nicy �wi�tynni otrzymaj� rozkaz by ci� zg�adzi�.
	AI_Output (self, other ,"DIA_BaalNamib_LESTER_ROZ_03_08"); //I nie pr�buj ucieka�.	Gniew �ni�cego i jego wyznawc�w dopadnie ci� wsz�dzie.


    B_LogEntry                     (ZlodziejskaWspolpraca,"Rozmawia�em z Baalem Namibem. Jest przekonany o mojej winie jednak Lester wstawi si� za mn� dzi�ki czemu b�d� m�g� spr�bowa� ocali� swoje dobre imi� na ile to mo�liwe i unikn�� kary. Musz� pogada� z Gor Na Drakiem, wyruszaj�c z obozu by� mo�e widzia� tego zdrajc� Brago.");
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
   description	= "Agresywne bagienne golemy zosta�y wybite. Ja i Gor Na Pol zrobili�my swoje.";
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
    AI_Output (other, self ,"DIA_BaalNamib_BG_15_01"); //Agresywne bagienne golemy zosta�y wybite. Ja i Gor Na Pol zrobili�my swoje.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_02"); //Rozmawia�em z Gor Na Polem. By� zachwycony.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_03"); //Obaj przys�u�yli�cie si� naszemu Bractwu I zadbali�cie o jego bezpiecze�stwo.
    AI_Output (other, self ,"DIA_BaalNamib_BG_15_04"); //Zrobi�em to co by�o trzeba zrobi�.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_05"); //Czeka was nagroda. Najpierw wynagrodz� Ciebie.
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_06"); //Walcz dalej za nasz� spraw�. Dobrze Ci idzie wojowniku. 
    AI_Output (self, other ,"DIA_BaalNamib_BG_03_07"); //Niech �ni�cy ci� prowadzi...
	B_LogEntry               (BagienneGolemy,"Baal Namib by� ze mnie zadowolony I wychwala� moje zdolno�ci. Wszak ja I Gor Na Pol zrobili�my co� wa�nego dla ca�ego obozu. Otrzyma�em od Guru nale�n� mi nagrod�. Pora zaj�� si� czym� innym. ");
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

 