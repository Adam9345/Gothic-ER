//poprawione i sprawdzone - Reflide

instance DIA_ORG_833_Buster (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster_Condition;
	information		= DIA_ORG_833_Buster_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_ORG_833_Buster_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster_02_01"); //Wiesz co, poruszasz si� tak jako� sztywno. M�g�bym ci pom�c.
};


// ************************ EXIT **************************

INSTANCE DIA_ORG_833_Buster_Exit (C_INFO)
{
	npc			= ORG_833_Buster;
	nr			= 999;
	condition	= DIA_ORG_833_Buster_Exit_Condition;
	information	= DIA_ORG_833_Buster_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_833_Buster_Exit_Info()
{
	
	AI_StopProcessInfos	( self );
};


// *********** Talent lernen *******************
INSTANCE DIA_ORG_833_Buster3 (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster3_Condition;
	information		= DIA_ORG_833_Buster3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jak mo�esz mi pom�c?"; 
};

FUNC INT DIA_ORG_833_Buster3_Condition()
{	
	if (Npc_GetTalentSkill(other, NPC_TALENT_ACROBAT) != 1) && Npc_KnowsInfo(hero,DIA_ORG_833_Buster)
	{
	return TRUE; 
	};
};

func VOID DIA_ORG_833_Buster3_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_01"); //Mog� ci pokaza�, jak nale�y balansowa� cia�em. Naucz� ci� AKROBATYKI.

	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	Info_AddChoice		( DIA_ORG_833_Buster3, DIALOG_BACK													, DIA_ORG_833_Buster_Back );
	Info_AddChoice		( DIA_ORG_833_Buster3, B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,500)	, DIA_ORG_833_Buster_Train1 );
	var int wpis_akrobatyka;
	
	if (wpis_akrobatyka == false)
	{
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Szkodnik imieniem Buster mo�e mnie nauczy� akrobatyki.");
	wpis_akrobatyka = true;
	};
};


// ************* Talent lernen **********************
FUNC void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	
	if  (B_teachthieftalent(self,other,NPC_TALENT_ACROBAT))
	{
	DIA_ORG_833_Buster3.permanent = 0;
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_02"); //Po kilku lekcjach nauczysz si� skaka� na wi�ksze odleg�o�ci.
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //Poka�� ci w jaki spos�b mo�na z�agodzi� efekt upadku z du�ej wysoko�ci. Tylko nie my�l sobie, �e b�dziesz m�g� skaka� b�g wie sk�d!
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_04"); //Akrobatyka przyda ci si� r�wnie� w trakcie walki. Poka�� ci jak bardzo szybko zmniejszy� lub zwi�kszy� odleg�o�� dziel�c� ci� od przeciwnika. Powodzenia! 
	};		
	B_GiveInvItems (hero, self, itminugget, 500);
	Npc_RemoveInvItems (self, itminugget, 500);
	}
	else
	{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_NO_ORE"); //Musisz mi zap�aci�. Inaczej niczego ci� nie naucz�!
	};
};  


// **************** Back ************************
FUNC VOID DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
};


//========================================
//-----------------> dexterity
//========================================

INSTANCE DIA_Buster_dexterity (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 1;
   condition    = DIA_Buster_dexterity_Condition;
   information  = DIA_Buster_dexterity_Info;
   permanent	= FALSE;
   description	= "Widz�, �e jeste� bardzo zr�czny. Jak si� nazywasz?";
};

FUNC INT DIA_Buster_dexterity_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_ORG_833_Buster))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_dexterity_Info()
{
    AI_Output (other, self ,"DIA_Buster_dexterity_15_01"); //Widz�, �e jeste� bardzo zr�czny. Jak si� nazywasz?
    AI_Output (self, other ,"DIA_Buster_dexterity_03_02"); //Jestem Buster, Szkodnik.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_03"); //Moja zr�czno�� jest efektem wieloletniej pracy jako szpieg kr�la. 
    AI_Output (self, other ,"DIA_Buster_dexterity_03_04"); //Nie by�a to �atwa praca. Prze�y�em wiele przyg�d. Raz nawet by�em w niewoli, ale na szcz�cie uda�o mi si� wydosta�...
    AI_Output (self, other ,"DIA_Buster_dexterity_03_05"); //To by�o lata temu w pewnym mie�cie na pustyni Varant.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_07"); //P�niej ca�a ta sprawa polityczna bardzo si� zagmatwa�a, kr�l odsun�� mnie od siebie i tak trafi�em tutaj. 
};

//========================================
//-----------------> WaterMages
//========================================

INSTANCE DIA_Buster_WaterMages (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_WaterMages_Condition;
   information  = DIA_Buster_WaterMages_Info;
   permanent	= FALSE;
   description	= "Jak si� dogadujesz z Magami Wody?";
};

FUNC INT DIA_Buster_WaterMages_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_ORG_833_Buster))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_WaterMages_Info()
{
    AI_Output (other, self ,"DIA_Buster_WaterMages_15_01"); //Jak si� dogadujesz z Magami Wody?
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_02"); //A powiem ci, �e nawet nie�le. Lee darzy mnie szacunkiem. Obaj zostali�my zdradzeni przez kr�la...
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_03"); //Dzi�ki temu czasem bior� udzia� w specjalnych zadaniach dla Najemnik�w. S� o wiele ciekawsze ni� zanoszenie list�w do Starego Obozu.
};

//========================================
//-----------------> Ku�nia Stone'a
//========================================

INSTANCE DIA_Buster_Klucz_Stone (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_Klucz_Stone_Condition;
   information  = DIA_Buster_Klucz_Stone_Info;
   permanent	= FALSE;
   description	= "S�ysza�em, �e masz klucz do ku�ni Stone�a";
};

FUNC INT DIA_Buster_Klucz_Stone_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_Kuznia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_Klucz_Stone_Info()
{
    AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_01"); //S�ysza�em, �e masz klucz do ku�ni Stone�a
    AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_02"); //A co?
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_03"); //Chcia�bym go zdoby�.
    AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_04"); //To kosztuje.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_05"); //Eh, ile bry�ek?
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_06"); //A kto powiedzia�, �e chodzi o rud�. Masz rozwi�za� par� moich spraw.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_07"); //Niby jakich?
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_08"); //Po pierwsze. Zleci�em pewnemu Szkodnikowi by zebra� dla mnie ro�liny potrzebne do napoju zwi�kszaj�cego zr�czno��.
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_09"); //Ale w drodze powrotnej zosta� pobity i okradziony przez Jacko i jego bimbrownik�w.
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_10"); //Wida� my�leli, �e mo�e i z tych ro�lin da si� zrobi� co� po czym zakr�ci si� w czubie.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_11"); //Mam spr�bowa� odzyska� t� ro�liny?
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_12"); //Te barany pewnie jeszcze ich nie wykorzysta�y. Na pewno maj� to ukryte przy sobie.
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_13"); //Obij im g�by i zdob�d� ro�liny a nast�pnie mi przynie�. Potem pogadamy.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_14"); //W porz�dku.
	
	    B_LogEntry                     (KuzniaStone,"Buster twierdzi, �e rzeczywi�cie ma klucz lecz chce bym wykona� dla niego jakie� zlecenie. Rzekomo wys�a� on jakiego� Szkodnika by zerwa� dla niego ro�liny potrzebne do napoju uzdrawiaj�cego. Lecz w drodze powrotnej zosta� pobity i okradziony przez bimbrownik�w Jacko, to ci kt�rzy zajmuj� jaskinie nieopodal rybackiej chaty przed obozem. Musz� z�o�y� im wizyt�.");

	
	
	
	AI_StopProcessInfos	( self );
	
};
//========================================
//-----------------> BUS_WAIT_KS
//========================================

INSTANCE DIA_Buster_BUS_WAIT_KS (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 1;
   condition    = DIA_Buster_BUS_WAIT_KS_Condition;
   information  = DIA_Buster_BUS_WAIT_KS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Buster_BUS_WAIT_KS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Buster_Plants))
{
    return TRUE;
};
};
FUNC VOID DIA_Buster_BUS_WAIT_KS_Info()
{
    Ai_GotoNpc(Org_833_Buster,hero);
    AI_Output (self, other ,"DIA_Buster_BUS_WAIT_KS_03_01"); //A jeszcze jedno.
    AI_Output (other, self ,"DIA_Buster_BUS_WAIT_KS_15_02"); //Tak?
    AI_Output (self, other ,"DIA_Buster_BUS_WAIT_KS_03_03"); //M�j znajomy Najemnik Florian co� od ciebie chcia�. Siedzi w karczmie na jeziorze.
    AI_Output (self, other ,"DIA_Buster_BUS_WAIT_KS_03_04"); //Pogadaj z nim przed wyruszeniem do Starego Obozu.
    AI_Output (other, self ,"DIA_Buster_BUS_WAIT_KS_15_05"); //Niech b�dzie.
	B_LogEntry                     (KuzniaStone,"Buster powiedzia� �e najemnik Florian kt�ry przesiaduje w karczmie ma do mnie jak�� spraw�... Mam z nim porozmawia� nim wyrusz� do Starego obozu.");
};



//========================================
//-----------------> Ro�liny
//========================================

INSTANCE DIA_Buster_Plants (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_Plants_Condition;
   information  = DIA_Buster_Plants_Info;
   permanent	= FALSE;
   description	= "Mam skradzione ro�liny. ";
};

FUNC INT DIA_Buster_Plants_Condition()
{
    if (Npc_KnowsInfo (hero, ORG_862_Jacko_Rosliny))
	&& (Npc_HasItems (other, ItMi_Buster_Pack) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_Plants_Info()
{
    AI_Output (other, self ,"DIA_Buster_Plants_15_01"); //Mam skradzione ro�liny. 
    AI_Output (self, other ,"DIA_Buster_Plants_03_02"); //Dawaj.
	AI_Output (other, self ,"DIA_Buster_Plants_15_03"); //Prosz�.
	B_GiveInvItems (other, self, ItMi_Buster_Pack, 1);
	Npc_RemoveInvItems (self, ItMi_Buster_Pack, 1);
    AI_Output (self, other ,"DIA_Buster_Plants_03_04"); //Czyli t� spraw� mamy za�atwion�. Mo�emy przej�� do konkret�w.
	AI_Output (self, other ,"DIA_Buster_Plants_03_05"); //W Starym obozie nie chc� mnie widzie� przez wzgl�d, �e dokona�em tam wielu kradzie�y st�d nie mog� tak po prostu w�ama� si� do ku�ni Stone�a,
	AI_Output (self, other ,"DIA_Buster_Plants_03_06"); //Dla tego ty to zrobisz. Dam ci klucz. Potrzebny mi jest stamt�d pewien cenny miecz nale��cy niegdy� do Lee.
	AI_Output (self, other ,"DIA_Buster_Plants_03_07"); //Ma warto�� sentymentaln�. Je�li mu go dam zwi�ksz� swoje szanse na do��czenie do Najemnik�w w przysz�o�ci.
	AI_Output (other, self ,"DIA_Buster_Plants_15_08"); //Dobra, chyba zrozumia�em. Daj mi klucz.
	AI_Output (self, other ,"DIA_Buster_Plants_03_09"); //Oto on. Tylko nie wa� si� mnie wykiwa� bo ci� znajd�.
	AI_Output (other, self ,"DIA_Buster_Plants_15_10"); //Nie mam takiego zamiaru. 
	B_GiveInvItems (self,other, ItKe_Stone_Kuznia, 1);
	
	B_LogEntry                     (KuzniaStone,"Przekaza�em ro�liny Busterowi. Ten w zamian da� mi klucz do ku�ni Stone�a. Ale postawi� warunek. Musz� zdoby� stary miecz Lee, kt�ry jest tam pono� ukryty. Buster chce go p�niej przekaza� szefowi Najemnik�w by wkupi� si� w jego �aski. M�g�bym zamiast odda� klucz Stone�owi. Co zrobi�?");
	
	AI_StopProcessInfos	( self );
	
};

//========================================
//-----------------> Ro�liny
//========================================

INSTANCE DIA_Buster_Miecz (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_Miecz_Condition;
   information  = DIA_Buster_Miecz_Info;
   permanent	= FALSE;
   description	= "Mam miecz Lee.";
};

FUNC INT DIA_Buster_Miecz_Condition()
{
    if (Npc_KnowsInfo (hero, ORG_862_Jacko_Rosliny))
	&& (Npc_HasItems (other, ItMw_2h_Sword_Lee) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_Miecz_Info()
{
    AI_Output (other, self ,"DIA_Buster_Miecz_15_01"); //Mam miecz Lee.
    AI_Output (self, other ,"DIA_Buster_Miecz_03_02"); //Kapitalnie.
	AI_Output (other, self ,"DIA_Buster_Miecz_15_03"); // Masz.
	B_GiveInvItems (other, self, ItMw_2h_Sword_Lee, 1);
	Npc_RemoveInvItems (self, ItMw_2h_Sword_Lee, 1);
    AI_Output (self, other ,"DIA_Buster_Miecz_03_04"); //Cholera! Kawa� ci�kiego �elastwa. Zdolny go�� z ciebie musz� powiedzie�. Gdyby� mia� kij w ty�ku nie da�by� rady obrobi� Stone�a ani wcze�niej pobi� Jacko i jego popapra�c�w.
	AI_Output (self, other ,"DIA_Buster_Miecz_03_05"); //Masz moje uznanie.
	AI_Output (other, self ,"DIA_Buster_Miecz_15_06"); //Dzi�ki.
	AI_Output (self, other ,"DIA_Buster_Miecz_03_07"); //Jak b�d� mia� dla ciebie jak�� rob�tk� to dam ci zna�.
	AI_Output (other, self ,"DIA_Buster_Miecz_15_08"); //W porz�dku. Na razie.
	    B_GiveXP (150);

	   B_LogEntry                     (KuzniaStone,"Wr�czy�em cenny miecz Busterowi. Teraz mo�e on zaimponowa� Lee a ja zgarn��em nale�n� sumk� w postaci �upu z ku�ni Stone�a.");
	
	AI_StopProcessInfos	( self );
	
};

//========================================
//-----------------> Ro�liny
//========================================

INSTANCE DIA_Buster_Zaczepka (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_Zaczepka_Condition;
   information  = DIA_Buster_Zaczepka_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Buster_Zaczepka_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stone_Klucz))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buster_Zaczepka_Info()
{
    AI_Output (self, other ,"DIA_Buster_Zaczepka_03_01"); //Gdzie m�j miecz?
    AI_Output (other, self ,"DIA_Buster_Zaczepka_15_02"); //Po pierwsze to miecz Lee. A po drugie nie mam go.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_03"); //Co to nie podo�a�e�?
    AI_Output (other, self ,"DIA_Buster_Zaczepka_15_04"); //Mo�e.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_05"); //Oddaj mi klucz.
	AI_Output (other, self ,"DIA_Buster_Zaczepka_15_06"); //Zgubi�em go.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_07"); //Ty baranie...
	AI_Output (other, self ,"DIA_Buster_Zaczepka_15_08"); //C�, czasem nie wiem co gdzie k�ad�.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_09"); //Za to ja bym po�o�y� miecz na twoim martwym truchle! Zejd� mi z oczu!	
	
	    B_GiveXP (50);

	AI_StopProcessInfos	( self );
	
};

instance dia_buster_pickpocket(c_info) {
    npc = org_833_buster;
    nr = 900;
    condition = dia_buster_pickpocket_condition;
    information = dia_buster_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_buster_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_buster_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_buster_pickpocket);
	info_addchoice(dia_buster_pickpocket, dialog_back, dia_buster_pickpocket_back);
	info_addchoice(dia_buster_pickpocket, dialog_pickpocket, dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back() {
    info_clearchoices(dia_buster_pickpocket);
};