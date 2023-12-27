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
	AI_Output (self, other,"DIA_ORG_833_Buster_02_01"); //Wiesz co, poruszasz siê tak jakoœ sztywno. Móg³bym ci pomóc.
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
	description		= "Jak mo¿esz mi pomóc?"; 
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
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_01"); //Mogê ci pokazaæ, jak nale¿y balansowaæ cia³em. Nauczê ciê AKROBATYKI.

	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	Info_AddChoice		( DIA_ORG_833_Buster3, DIALOG_BACK													, DIA_ORG_833_Buster_Back );
	Info_AddChoice		( DIA_ORG_833_Buster3, B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,500)	, DIA_ORG_833_Buster_Train1 );
	var int wpis_akrobatyka;
	
	if (wpis_akrobatyka == false)
	{
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Szkodnik imieniem Buster mo¿e mnie nauczyæ akrobatyki.");
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
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_02"); //Po kilku lekcjach nauczysz siê skakaæ na wiêksze odleg³oœci.
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //Poka¿ê ci w jaki sposób mo¿na z³agodziæ efekt upadku z du¿ej wysokoœci. Tylko nie myœl sobie, ¿e bêdziesz móg³ skakaæ bóg wie sk¹d!
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_04"); //Akrobatyka przyda ci siê równie¿ w trakcie walki. Poka¿ê ci jak bardzo szybko zmniejszyæ lub zwiêkszyæ odleg³oœæ dziel¹c¹ ciê od przeciwnika. Powodzenia! 
	};		
	B_GiveInvItems (hero, self, itminugget, 500);
	Npc_RemoveInvItems (self, itminugget, 500);
	}
	else
	{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_NO_ORE"); //Musisz mi zap³aciæ. Inaczej niczego ciê nie nauczê!
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
   description	= "Widzê, ¿e jesteœ bardzo zrêczny. Jak siê nazywasz?";
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
    AI_Output (other, self ,"DIA_Buster_dexterity_15_01"); //Widzê, ¿e jesteœ bardzo zrêczny. Jak siê nazywasz?
    AI_Output (self, other ,"DIA_Buster_dexterity_03_02"); //Jestem Buster, Szkodnik.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_03"); //Moja zrêcznoœæ jest efektem wieloletniej pracy jako szpieg króla. 
    AI_Output (self, other ,"DIA_Buster_dexterity_03_04"); //Nie by³a to ³atwa praca. Prze¿y³em wiele przygód. Raz nawet by³em w niewoli, ale na szczêœcie uda³o mi siê wydostaæ...
    AI_Output (self, other ,"DIA_Buster_dexterity_03_05"); //To by³o lata temu w pewnym mieœcie na pustyni Varant.
    AI_Output (self, other ,"DIA_Buster_dexterity_03_07"); //PóŸniej ca³a ta sprawa polityczna bardzo siê zagmatwa³a, król odsun¹³ mnie od siebie i tak trafi³em tutaj. 
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
   description	= "Jak siê dogadujesz z Magami Wody?";
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
    AI_Output (other, self ,"DIA_Buster_WaterMages_15_01"); //Jak siê dogadujesz z Magami Wody?
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_02"); //A powiem ci, ¿e nawet nieŸle. Lee darzy mnie szacunkiem. Obaj zostaliœmy zdradzeni przez króla...
    AI_Output (self, other ,"DIA_Buster_WaterMages_03_03"); //Dziêki temu czasem biorê udzia³ w specjalnych zadaniach dla Najemników. S¹ o wiele ciekawsze ni¿ zanoszenie listów do Starego Obozu.
};

//========================================
//-----------------> KuŸnia Stone'a
//========================================

INSTANCE DIA_Buster_Klucz_Stone (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_Klucz_Stone_Condition;
   information  = DIA_Buster_Klucz_Stone_Info;
   permanent	= FALSE;
   description	= "S³ysza³em, ¿e masz klucz do kuŸni Stone’a";
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
    AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_01"); //S³ysza³em, ¿e masz klucz do kuŸni Stone’a
    AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_02"); //A co?
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_03"); //Chcia³bym go zdobyæ.
    AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_04"); //To kosztuje.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_05"); //Eh, ile bry³ek?
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_06"); //A kto powiedzia³, ¿e chodzi o rudê. Masz rozwi¹zaæ parê moich spraw.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_07"); //Niby jakich?
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_08"); //Po pierwsze. Zleci³em pewnemu Szkodnikowi by zebra³ dla mnie roœliny potrzebne do napoju zwiêkszaj¹cego zrêcznoœæ.
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_09"); //Ale w drodze powrotnej zosta³ pobity i okradziony przez Jacko i jego bimbrowników.
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_10"); //Widaæ myœleli, ¿e mo¿e i z tych roœlin da siê zrobiæ coœ po czym zakrêci siê w czubie.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_11"); //Mam spróbowaæ odzyskaæ tê roœliny?
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_12"); //Te barany pewnie jeszcze ich nie wykorzysta³y. Na pewno maj¹ to ukryte przy sobie.
	AI_Output (self, other ,"DIA_Buster_Klucz_Stone_03_13"); //Obij im gêby i zdob¹dŸ roœliny a nastêpnie mi przynieœ. Potem pogadamy.
	AI_Output (other, self ,"DIA_Buster_Klucz_Stone_15_14"); //W porz¹dku.
	
	    B_LogEntry                     (KuzniaStone,"Buster twierdzi, ¿e rzeczywiœcie ma klucz lecz chce bym wykona³ dla niego jakieœ zlecenie. Rzekomo wys³a³ on jakiegoœ Szkodnika by zerwa³ dla niego roœliny potrzebne do napoju uzdrawiaj¹cego. Lecz w drodze powrotnej zosta³ pobity i okradziony przez bimbrowników Jacko, to ci którzy zajmuj¹ jaskinie nieopodal rybackiej chaty przed obozem. Muszê z³o¿yæ im wizytê.");

	
	
	
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
    AI_Output (self, other ,"DIA_Buster_BUS_WAIT_KS_03_03"); //Mój znajomy Najemnik Florian coœ od ciebie chcia³. Siedzi w karczmie na jeziorze.
    AI_Output (self, other ,"DIA_Buster_BUS_WAIT_KS_03_04"); //Pogadaj z nim przed wyruszeniem do Starego Obozu.
    AI_Output (other, self ,"DIA_Buster_BUS_WAIT_KS_15_05"); //Niech bêdzie.
	B_LogEntry                     (KuzniaStone,"Buster powiedzia³ ¿e najemnik Florian który przesiaduje w karczmie ma do mnie jak¹œ sprawê... Mam z nim porozmawiaæ nim wyruszê do Starego obozu.");
};



//========================================
//-----------------> Roœliny
//========================================

INSTANCE DIA_Buster_Plants (C_INFO)
{
   npc          = ORG_833_Buster;
   nr           = 2;
   condition    = DIA_Buster_Plants_Condition;
   information  = DIA_Buster_Plants_Info;
   permanent	= FALSE;
   description	= "Mam skradzione roœliny. ";
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
    AI_Output (other, self ,"DIA_Buster_Plants_15_01"); //Mam skradzione roœliny. 
    AI_Output (self, other ,"DIA_Buster_Plants_03_02"); //Dawaj.
	AI_Output (other, self ,"DIA_Buster_Plants_15_03"); //Proszê.
	B_GiveInvItems (other, self, ItMi_Buster_Pack, 1);
	Npc_RemoveInvItems (self, ItMi_Buster_Pack, 1);
    AI_Output (self, other ,"DIA_Buster_Plants_03_04"); //Czyli tê sprawê mamy za³atwion¹. Mo¿emy przejœæ do konkretów.
	AI_Output (self, other ,"DIA_Buster_Plants_03_05"); //W Starym obozie nie chc¹ mnie widzieæ przez wzgl¹d, ¿e dokona³em tam wielu kradzie¿y st¹d nie mogê tak po prostu w³amaæ siê do kuŸni Stone’a,
	AI_Output (self, other ,"DIA_Buster_Plants_03_06"); //Dla tego ty to zrobisz. Dam ci klucz. Potrzebny mi jest stamt¹d pewien cenny miecz nale¿¹cy niegdyœ do Lee.
	AI_Output (self, other ,"DIA_Buster_Plants_03_07"); //Ma wartoœæ sentymentaln¹. Jeœli mu go dam zwiêkszê swoje szanse na do³¹czenie do Najemników w przysz³oœci.
	AI_Output (other, self ,"DIA_Buster_Plants_15_08"); //Dobra, chyba zrozumia³em. Daj mi klucz.
	AI_Output (self, other ,"DIA_Buster_Plants_03_09"); //Oto on. Tylko nie wa¿ siê mnie wykiwaæ bo ciê znajdê.
	AI_Output (other, self ,"DIA_Buster_Plants_15_10"); //Nie mam takiego zamiaru. 
	B_GiveInvItems (self,other, ItKe_Stone_Kuznia, 1);
	
	B_LogEntry                     (KuzniaStone,"Przekaza³em roœliny Busterowi. Ten w zamian da³ mi klucz do kuŸni Stone’a. Ale postawi³ warunek. Muszê zdobyæ stary miecz Lee, który jest tam ponoæ ukryty. Buster chce go póŸniej przekazaæ szefowi Najemników by wkupiæ siê w jego ³aski. Móg³bym zamiast oddaæ klucz Stone’owi. Co zrobiæ?");
	
	AI_StopProcessInfos	( self );
	
};

//========================================
//-----------------> Roœliny
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
    AI_Output (self, other ,"DIA_Buster_Miecz_03_04"); //Cholera! Kawa³ ciê¿kiego ¿elastwa. Zdolny goœæ z ciebie muszê powiedzieæ. Gdybyœ mia³ kij w ty³ku nie da³byœ rady obrobiæ Stone’a ani wczeœniej pobiæ Jacko i jego popaprañców.
	AI_Output (self, other ,"DIA_Buster_Miecz_03_05"); //Masz moje uznanie.
	AI_Output (other, self ,"DIA_Buster_Miecz_15_06"); //Dziêki.
	AI_Output (self, other ,"DIA_Buster_Miecz_03_07"); //Jak bêdê mia³ dla ciebie jak¹œ robótkê to dam ci znaæ.
	AI_Output (other, self ,"DIA_Buster_Miecz_15_08"); //W porz¹dku. Na razie.
	    B_GiveXP (150);

	   B_LogEntry                     (KuzniaStone,"Wrêczy³em cenny miecz Busterowi. Teraz mo¿e on zaimponowaæ Lee a ja zgarn¹³em nale¿n¹ sumkê w postaci ³upu z kuŸni Stone’a.");
	
	AI_StopProcessInfos	( self );
	
};

//========================================
//-----------------> Roœliny
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
    AI_Output (self, other ,"DIA_Buster_Zaczepka_03_01"); //Gdzie mój miecz?
    AI_Output (other, self ,"DIA_Buster_Zaczepka_15_02"); //Po pierwsze to miecz Lee. A po drugie nie mam go.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_03"); //Co to nie podo³a³eœ?
    AI_Output (other, self ,"DIA_Buster_Zaczepka_15_04"); //Mo¿e.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_05"); //Oddaj mi klucz.
	AI_Output (other, self ,"DIA_Buster_Zaczepka_15_06"); //Zgubi³em go.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_07"); //Ty baranie...
	AI_Output (other, self ,"DIA_Buster_Zaczepka_15_08"); //Có¿, czasem nie wiem co gdzie k³adê.
	AI_Output (self, other ,"DIA_Buster_Zaczepka_03_09"); //Za to ja bym po³o¿y³ miecz na twoim martwym truchle! ZejdŸ mi z oczu!	
	
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