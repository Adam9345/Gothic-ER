//****************************************
// DIALOGI SPRAWDZONE - GOTHIC1210
//****************************************
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()


{

    if  (Npc_HasItems (other, ItAm_Quiver) == 0)
	{
	CreateInvItem (self, ItAm_Quiver);
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Jäger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jestem myœliwym. Polujê g³ównie na œcierwojady.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "Mo¿esz mnie nauczyæ czegoœ o myœlistwie?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Cavalorn jest myœliwym. Mo¿e mnie nauczyæ skradania siê i strzelania z ³uku. Mieszka w chacie, na drodze pomiêdzy Starym a Nowym Obozem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Mo¿esz mnie nauczyæ czegoœ o myœlistwie?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To zale¿y tylko od tego, co chcia³byœ wiedzieæ.
	Info_ClearChoices(DIA_cavalorn_Lehrer);
	Info_AddChoice(DIA_cavalorn_Lehrer,DIALOG_BACK,DIA_Wolf_Bow_BACK);
	Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Cavalorn_Teach_Bow_5);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};



func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (Npc_HasItems (hero,ItMiNugget) >= 200) 
	{
	if  (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{		
	    Info_AddChoice(DIA_cavalorn_Lehrer,Dialog_Back,DIA_Cavalorn_Bow_BACK);
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chcia³bym poruszaæ siê bezszelestnie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //I s³usznie. Skradanie pozwoli ci dostaæ siê niepostrze¿enie do cudzych domów, albo po cichu zajœæ od ty³u przeciwnika.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Chodz¹c na lekko ugiêtych nogach bêdziesz móg³ uwa¿niej obserwowaæ grunt, po którym st¹pasz, no i ³atwiej bêdzie ci balansowaæ cia³em.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Oczywiœcie ktoœ obserwuj¹cy ciê z boku natychmiast nabierze podejrzeñ, wiêc skradaj siê zawsze nie bêd¹c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Zapamiêtaj sobie dobrze co ci powiedzia³em, i przede wszystkim nie daj siê z³apaæ!
	};
	};	
};

func void Dia_Cavalorn_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,1,100);
	Info_ClearChoices(DIA_cavalorn_Lehrer);
	Info_AddChoice(DIA_cavalorn_Lehrer,Dialog_Back,DIA_Cavalorn_Bow_BACK);
	
	Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Cavalorn_Teach_Bow_5);
};

func void Dia_Cavalorn_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_Bow,5,100);
	Info_ClearChoices(DIA_cavalorn_Lehrer);
	Info_AddChoice(DIA_cavalorn_Lehrer,Dialog_Back,DIA_Cavalorn_Bow_BACK);
	
	Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString("£uki +1",B_GetLearnCostTalent(other,NPC_TALENT_Bow,1),0),Dia_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_cavalorn_Lehrer,B_BuildLearnString("£uki +5",B_GetLearnCostTalent(other,NPC_TALENT_Bow,5),0),Dia_Cavalorn_Teach_Bow_5);
};
func void DIA_Cavalorn_Bow_BACK()
{
	Info_ClearChoices(DIA_cavalorn_Lehrer);
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mogê zdobyæ ³uk?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Gdzie mogê zdobyæ ³uk?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tutaj! Sprzedajê najwspanialsze ³uki w ca³ym Starym Obozie.
	Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry (GE_TraderOW,"Cavalorn sprzedaje ³uki i strza³y. Znajdê go w jego chacie, na drodze pomiêdzy Starym a Nowym Obozem.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka¿ mi swoje towary."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Poka¿ mi swoje towary.
	B_ClearTreaderAmmo(self);
	
};  

////////////////////////////////////////////////////
// TEST NA CIENIA 
///////////////////////////////////////////////////

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_STT_336_cavalorn_HELLO1 (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 1;
   condition    = DIA_STT_336_cavalorn_HELLO1_Condition;
   information  = DIA_STT_336_cavalorn_HELLO1_Info;
   permanent	= FALSE;
   description	= "Chcia³bym, abyœ podda³ mnie próbie.";
};

FUNC INT DIA_STT_336_cavalorn_HELLO1_Condition()
{
    if ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)) && (Kapitel < 4) //&& Fingers_Wherecavalorn == true
    {
    return TRUE;
    };
};


FUNC VOID DIA_STT_336_cavalorn_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_STT_336_cavalorn_HELLO1_15_01"); //Chcia³bym, abyœ podda³ mnie próbie.
    AI_Output (self, other ,"DIA_STT_336_cavalorn_HELLO1_03_02"); //A dlaczego ci na tym zale¿y?
	AI_Output (other, self ,"DIA_STT_336_cavalorn_HELLO1_15_03"); //Szukam poparcia wa¿nych Cieni. Wiem, ¿e masz sporo do powiedzenia i jesteœ dobrym nauczycielem. 
    AI_Output (self, other ,"DIA_STT_336_cavalorn_HELLO1_03_04"); //No dobrze, jeœli chcesz, to przygotujê dla ciebie test.
    AI_Output (other, self ,"DIA_STT_336_cavalorn_HELLO1_15_05"); //Mam usi¹œæ w ³awce i poczekaæ?
    AI_Output (self, other ,"DIA_STT_336_cavalorn_HELLO1_03_06"); //To nie taki test, kolego...
};

//========================================
//-----------------> TESTEMACHEN
//========================================

INSTANCE DIA_STT_336_cavalorn_TESTEMACHEN (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 2;
   condition    = DIA_STT_336_cavalorn_TESTEMACHEN_Condition;
   information  = DIA_STT_336_cavalorn_TESTEMACHEN_Info;
   permanent	= FALSE;
   description	= "Na czym polega ten test?";
};

FUNC INT DIA_STT_336_cavalorn_TESTEMACHEN_Condition()
{
    if((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK)) && (Kapitel < 4)
    && (Npc_KnowsInfo (hero, DIA_STT_336_cavalorn_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_STT_336_cavalorn_TESTEMACHEN_Info()
{
    AI_Output (other, self ,"DIA_STT_336_cavalorn_TESTEMACHEN_15_01"); //Na czym polega ten test?
    AI_Output (self, other ,"DIA_STT_336_cavalorn_TESTEMACHEN_03_02"); //Sprawa jest dosyæ prosta. Udasz siê do Aidana - to myœliwy. Nastêpnie wypytasz go o wymianê handlow¹ Nowego Obozu. 
    AI_Output (self, other ,"DIA_STT_336_cavalorn_TESTEMACHEN_03_03"); //Im wiêcej informacji wyci¹gniesz, tym lepiej ciê oceniê. 
    AI_Output (self, other ,"DIA_STT_336_cavalorn_TESTEMACHEN_03_04"); //Interesuje mnie wszystko: ry¿, skrzynie z rud¹, dostawy, ten ca³y obóz myœliwych przy Kopalni. Po prostu WSZYSTKO czego uda ci siê dowiedzieæ.
    
	B_LogEntry(CH1_JoinOC, "Cavalorn zleci³ mi test. Jeœli go wykonam, zyskam jego poparcie w Starym Obozie.");
	MIS_TestOC = LOG_RUNNING;
	Log_CreateTopic          (CH1_TestOc, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TestOc, LOG_RUNNING);
	B_LogEntry              (CH1_TestOc,"Cavalorn przygotowa³ dla mnie dosyæ ciekawy test. Mam porozmawiaæ z myœliwym Aidanem i wyci¹gn¹æ z niego jak najwiêcej informacji o wymianie handlowej Nowego Obozu.");
    Info_ClearChoices		(DIA_STT_336_cavalorn_TESTEMACHEN);
	szpiegostwoON = true;
	polowanieON = false;
};

var int zdam;

var int powiedzialem_ryz;
var int powiedzialem_skrzynie;
var int powiedzialem_krety;
var int powiedzialem_mysliwi;
var int powiedzialem_aidan;
//========================================
//-----------------> InfosTest
//========================================

INSTANCE DIA_cavalorn_InfosTest (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 1;
   condition    = DIA_cavalorn_InfosTest_Condition;
   information  = DIA_cavalorn_InfosTest_Info;
   permanent	= true;
   description	= "Mam ju¿ trochê informacji...";
};

FUNC INT DIA_cavalorn_InfosTest_Condition()
{
    if (MIS_TestOc == LOG_RUNNING)
    && (szpiegostwoON == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_cavalorn_InfosTest_Info()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_15_01"); //Mam ju¿ trochê informacji...
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_03_02"); //S³ucham.
	zdam = true;
    Info_ClearChoices		(DIA_cavalorn_InfosTest);
	if (knowsRice == true) && (powiedzialem_ryz == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Wiem co dzieje siê z ry¿em.", DIA_cavalorn_InfosTest_MassageKnowsRice);
	};
	if (knowsOre == true) && (powiedzialem_skrzynie == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "W Nowym Obozie znajduje siê oko³o 50 skrzyñ rudy.", DIA_cavalorn_InfosTest_MassageKnowsOre);
	};
	if (knowsOre2 ==true) && (powiedzialem_krety == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Rozmawia³em z Kretami.", DIA_cavalorn_InfosTest_MassageKnowsOre2);
	};
	if (knowsLeather == true) && (powiedzialem_mysliwi == false)
	{
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Wiem tak¿e o obozie myœliwych.", DIA_cavalorn_InfosTest_MassageKnowsLeather);
	};
	if (knowsAidan == true) && (powiedzialem_aidan == false)
	{
	Info_AddChoice		(DIA_cavalorn_InfosTest, "Myœliwy Aidan pomaga³ przy transporcie oœmiu skrzyñ.", DIA_cavalorn_InfosTest_MassageKnowsAidan);
	};
    Info_AddChoice		(DIA_cavalorn_InfosTest, "Na razie to tyle.", DIA_cavalorn_InfosTest_ComeBack);
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsAidan ()
{
	AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsAidan_15_01"); //Myœliwy Aidan pomaga³ przy transporcie oœmiu skrzyñ rudy do Nowego Obozu.
	AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsAidan_15_02"); //Jedna z tych skrzyñ przypad³a eskortuj¹cym.
	AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsAidan_15_03"); //Interesuj¹ce...
	powiedzialem_aidan = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsRice()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_01"); //Wiem co dzieje siê z ry¿em.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_02"); //Rozmawia³em z Ry¿owym Ksiêciem o tym. 
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_03"); //Nadwy¿ka surowca jest magazynowana b¹dŸ sprzedawana w niewielkiej iloœci.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsRice_15_04"); //G³ównie do obozu na bagnie.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsRice_03_05"); //Œwietnie siê spisa³eœ! Masz coœ jeszcze?
	powiedzialem_ryz = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsOre()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre_15_01"); //W Nowym Obozie znajduje siê oko³o 50 skrzyñ rudy.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre_15_02"); //Dowiedzia³em siê tego od Cronosa. 
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre_15_03"); //Magowie maj¹ jakieœ plany wobec rudy.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsOre_03_04"); //Dobra robota!
	powiedzialem_skrzynie = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsOre2()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_01"); //Rozmawia³em z Kretami.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_03_02"); //By³eœ w Wolnej Kopalni? Jestem pe³en podziwu.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_03"); //Dowiedzia³em siê, ¿e ostatnio wykopali 30 skrzyñ rudy. 
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_04"); //Transport do Obozu ma odbyæ siê póŸn¹ noc¹.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsOre2_15_05"); //Jednak nie wiem kiedy dok³adnie.
	powiedzialem_krety = true;
};

FUNC VOID DIA_cavalorn_InfosTest_MassageKnowsLeather()
{
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_15_01"); //Wiem tak¿e o obozie myœliwych.
    AI_Output (self, other ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_03_02"); //Jakim obozie?
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_15_03"); //Niedawno zosta³ za³o¿ony. Znajduje siê pomiêdzy Obozem, a Woln¹ Kopalni¹.
    AI_Output (other, self ,"DIA_cavalorn_InfosTest_MassageKnowsLeather_15_04"); //Znajduj¹ siê w nim g³ównie myœliwi. Poluj¹ na wilki i œcierwojady.
	powiedzialem_mysliwi = true;
};

FUNC VOID DIA_cavalorn_InfosTest_ComeBack()
{
    Info_ClearChoices	(DIA_cavalorn_InfosTest);
};


//========================================
//-----------------> SuccessTest
//========================================

INSTANCE DIA_cavalorn_SuccessTest (C_INFO)
{
   npc          = STT_336_cavalorn;
   nr           = 1;
   condition    = DIA_cavalorn_SuccessTest_Condition;
   information  = DIA_cavalorn_SuccessTest_Info;
   permanent	= true;
   description	= "Zda³em test?";
};

FUNC INT DIA_cavalorn_SuccessTest_Condition()
{
    if (zdam == true) && (MIS_TestOC != LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_cavalorn_SuccessTest_Info()
{
    AI_Output (other, self ,"DIA_cavalorn_SuccessTest_15_01"); //Zda³em test?
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_02"); //Zobaczmy...
    if (powiedzialem_ryz == true)
    {
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_03"); //Dowiedzia³eœ siê o sprzeda¿y ry¿u do Bractwa.
	ocenaTest = ocenaTest+1;
    };
	if (powiedzialem_aidan == true)
    {
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_20Aidan"); //Wspomnia³eœ o niedawnym transporcie oœmiu skrzyñ.
	ocenaTest = ocenaTest+1;
    };
    if (powiedzialem_skrzynie == true)
    {
     AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_04"); //Wiesz o 50 skrzyniach rudy.
	ocenaTest = ocenaTest+1;
    };
    if (powiedzialem_krety == true)
    {
        AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_05"); //Wiesz te¿ o ostatniej dostawie rudy.
	ocenaTest = ocenaTest+2;
    };
    if (powiedzialem_mysliwi == true)
    {
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_06"); //Dowiedzia³eœ siê równie¿ o obozie myœliwych.
	ocenaTest = ocenaTest+1;
    };
    if (ocenaTest == 5)
    {
	AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_09"); //Rewelacyjnie poradzi³eœ sobie z tym zadaniem.
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_10"); //Nale¿¹ ci siê moje gratulacje. Jestem pewien, ¿e dostaniesz siê do Cieni.
	
    B_LogEntry               (CH1_TestOC,"Zaliczy³em test. Cavalorn by³ bardzo zadowolony. Mogê liczyæ na jego poparcie.");
    Log_SetTopicStatus       (CH1_TestOC, LOG_SUCCESS);
    MIS_TestOC = LOG_SUCCESS;
	DIA_cavalorn_InfosTest.permanent = false;
    B_GiveXP (XP_TestSzpiegowski5);
	zdam = false;
	B_LogEntry(CH1_JoinOC, "Uda³o mi siê wykonaæ test od Cavalorna czym zaskarbi³em sobie jego sympatiê.");
    }
    else if (ocenaTest >= 2)
    {
	AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_07"); //Uda³o ci siê zaliczyæ test! Œwietna robota. 
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_08"); //Mo¿esz iœæ i porozmawiaæ z Diego.
	
    B_LogEntry               (CH1_TestOC,"Zaliczy³em test. Cavalorn by³ bardzo zadowolony. Mogê liczyæ na jego poparcie.");
    Log_SetTopicStatus       (CH1_TestOC, LOG_SUCCESS);
    MIS_TestOC = LOG_SUCCESS;
	DIA_cavalorn_InfosTest.permanent = false;
	zdam = false;
    B_GiveXP (XP_TestSzpiegowski2);       
	B_LogEntry(CH1_JoinOC, "Uda³o mi siê wykonaæ test od Cavalorna czym zaskarbi³em sobie jego sympatiê.");
	}
	else
	{
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_11"); //To co zrobi³eœ to zbyt ma³o.
    AI_Output (self, other ,"DIA_cavalorn_SuccessTest_03_12"); //Spróbuj jeszcze raz.
	DIA_cavalorn_SuccessTest.permanent = true;
    };

};

//////////////////////////////////////////////////
// ROZDZIA£ 4 
//////////////////////////////////////////////////

// **************************************************
// 					Sytuacja
// **************************************************

INSTANCE DIA_cavalorn_Sytuacja (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Sytuacja_Condition;
	information		= DIA_cavalorn_Sytuacja_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_cavalorn_Sytuacja_Condition()
{	
	if (kapitel >= 4)
	{
	return 1;	
	};
};

FUNC VOID DIA_cavalorn_Sytuacja_Info()
{
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_00"); //Hej, dobrze ciê widzieæ w jednym kawa³ku!
	AI_Output (other, self,"DIA_cavalorn_Sytuacja_15_01"); //Czeœæ, Cavalorn. Czy wszystko w porz¹dku?
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_02"); //Nic nie jest w porz¹dku. Coœ z³ego sta³o siê w Starym Obozie.
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_03"); //Niedawno przyby³ tu Skorpion i bardzo mêtnie opowiedzia³ mi o ostatnich wydarzeniach.
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_04"); //Najlepiej porozmawiaj od razu z nim. Ja nie mam teraz czasu na rozmowy. 
	AI_Output (other, self,"DIA_cavalorn_Sytuacja_15_05"); //Dlaczego?
	AI_Output (self, other,"DIA_cavalorn_Sytuacja_12_06"); //Gdzieœ znikn¹³ Vart. Bojê siê, ¿e wpakowa³ siê w k³opoty.	
};

//========================================
//-----------------> WhereIsVart
//========================================

INSTANCE DIA_Cavalorn_WhereIsVart (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 2;
   condition    = DIA_Cavalorn_WhereIsVart_Condition;
   information  = DIA_Cavalorn_WhereIsVart_Info;
   permanent	= FALSE;
   description	= "Postaram siê za nim rozejrzeæ.";
};

FUNC INT DIA_Cavalorn_WhereIsVart_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_cavalorn_Sytuacja))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_WhereIsVart_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_WhereIsVart_15_01"); //Postaram siê za nim rozejrzeæ.
    AI_Output (self, other ,"DIA_Cavalorn_WhereIsVart_03_02"); //Nie mam pojêcia, gdzie mo¿e byæ. W³óczy³ siê w okolicy po czym znikn¹³.
    AI_Output (self, other ,"DIA_Cavalorn_WhereIsVart_03_03"); //Nie mogê ci daæ ¿adnych wskazówek.
	
    MIS_VartSeeking = LOG_RUNNING;

    Log_CreateTopic          (CH4_VartSeeking, LOG_MISSION);
    Log_SetTopicStatus       (CH4_VartSeeking, LOG_RUNNING);
    B_LogEntry               (CH4_VartSeeking,"Cavalorn nie ma pojêcia, gdzie znajduje siê Vart. Mo¿liwe, ¿e uciek³ b¹dŸ zgubi³ siê w lesie.");
	
	
};

//========================================
//-----------------> IFoundVart
//========================================

INSTANCE DIA_Cavalorn_IFoundVart (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 1;
   condition    = DIA_Cavalorn_IFoundVart_Condition;
   information  = DIA_Cavalorn_IFoundVart_Info;
   permanent	= FALSE;
   description	= "Znalaz³em Varta.";
};

FUNC INT DIA_Cavalorn_IFoundVart_Condition()
{
    if (Npc_HasItems (other, VartSword) >=1)
    && (MIS_VartSeeking == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_IFoundVart_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_01"); //Znalaz³em Varta. Niestety nie ¿yje. Mam tu jego miecz.
    AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_02"); //Co? Jak to siê sta³o?
	
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_03"); //Nie wiem. Jego cia³o le¿a³o w pobli¿u jakiejœ starej krypty. Krêci³o siê wokó³ niego kilku ludzi podobnych do Nowicjuszy z Bractwa.
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_04"); //Byæ mo¿e chcieli z niego z³o¿yæ ofiarê na przeb³aganie Œni¹cego. 
    AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_05"); //S³ysza³em wiele rzeczy o obozie na bagnie, ale nie to, ¿e sk³adaj¹ ludzi w ofierze swemu bogu.
    AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_06"); //Nie bogu. Œni¹cy to demon. Dziêki mojej skromnej pomocy Guru z Bractwa zdo³ali siê o tym zorientowaæ.
	AI_Output (other, self ,"DIA_Cavalorn_IFoundVart_15_07"); //Czêœæ z Nowicjuszy nie mog³a siê z tym pogodziæ. Ka¿dy ma nieco inne podejœcie. Wielu opuœci³o Obóz.
	AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_08"); //Cholera, nie doœæ, ¿e mamy na g³owie Stra¿ników to jeszcze jakieœ œwiry krêc¹ siê po Kolonii.
	AI_Output (self, other ,"DIA_Cavalorn_IFoundVart_03_09"); //Chcia³bym ci podziêkowaæ za pomoc. WeŸ tê skromn¹ iloœæ rudy. Wiêcej nie mogê ci zaoferowaæ. Z wiadomych przyczyn nikt tu ostatnio nie zagl¹da.
	B_GiveInvItems (other,self, VartSword, 1);
	Npc_RemoveInvItems (self, VartSword,1);
	CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	
    B_LogEntry               (CH4_VartSeeking,"Znalaz³em cia³o Varta. Niestety nie ¿yje. Cavalorn nie mo¿e siê pogodziæ ze œmierci¹ towarzysza.");
    Log_SetTopicStatus       (CH4_VartSeeking, LOG_SUCCESS);
    MIS_VartSeeking = LOG_SUCCESS;

    B_GiveXP (300);
};

//========================================
//-----------------> LifeIsBrutal
//========================================

INSTANCE DIA_Cavalorn_LifeIsBrutal (C_INFO)
{
   npc          = STT_336_Cavalorn;
   nr           = 2;
   condition    = DIA_Cavalorn_LifeIsBrutal_Condition;
   information  = DIA_Cavalorn_LifeIsBrutal_Info;
   permanent	= FALSE;
   description	= "Nie przywrócisz mu ¿ycia.";
};

FUNC INT DIA_Cavalorn_LifeIsBrutal_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cavalorn_IFoundVart)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cavalorn_LifeIsBrutal_Info()
{
    AI_Output (other, self ,"DIA_Cavalorn_LifeIsBrutal_15_01"); //Nie przywrócisz mu ¿ycia.
    AI_Output (self, other ,"DIA_Cavalorn_LifeIsBrutal_03_02"); //Masz racjê, ale...
    AI_Output (self, other ,"DIA_Cavalorn_LifeIsBrutal_03_03"); //Co dzieje siê z tym miejscem?! Czy bogowie chc¹ nas ukaraæ za nasze wystêpki? Ju¿ sam nie wiem.
   /* MIS_VartSeeking2 = LOG_RUNNING;

    Log_CreateTopic            (CH4_VartSeeking2, LOG_MISSION);
    Log_SetTopicStatus       (CH4_VartSeeking2, LOG_RUNNING);
    B_LogEntry                     (CH4_VartSeeking2,"Cavalorn chce abym ustali³ o co chodzi z tymi Poszukiwaczami.");*/
};

//////////////////////////////////////////////
// Alex Wood
//////////////////////////////////////////////

INSTANCE DIA_cavalorn_AlexPrisoner (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_AlexPrisoner_Condition;
	information		= DIA_cavalorn_AlexPrisoner_Info;
	permanent		= 0;
	description		= "Mam tu drewno dla ciebie."; 
};

FUNC INT DIA_cavalorn_AlexPrisoner_Condition()
{	
	if (MIS_WoodForCavalorn == LOG_RUNNING)
	&& (Npc_HasItems (other, CavalornWood) >=1)
	{
	return 1;	
	};
};

FUNC VOID DIA_cavalorn_AlexPrisoner_Info()
{
	AI_Output (other, self,"DIA_cavalorn_AlexPrisoner_15_00"); //Mam tu drewno dla ciebie.
	AI_Output (self, other,"DIA_cavalorn_AlexPrisoner_12_01"); //Jonas znowu ma bóle pleców, ¿e wys³uguje siê m³odymi? Dziêki, ch³opcze. 
	
	B_GiveInvItems (hero, self, CavalornWood,1);
	B_GiveXP (25);
	
	B_LogEntry                     (CH3_WoodForCavalorn,"Cavalorn otrzyma³ swoje drewno, a ja kilka kolejnych bry³ek. ");
    Log_SetTopicStatus       (CH3_WoodForCavalorn, LOG_SUCCESS);
    MIS_WoodForCavalorn = LOG_SUCCESS;
	
	CreateInvItems (self, ItMiNugget, 80);
    B_GiveInvItems (self, other, ItMiNugget, 80);
	getmoneyfor_Jonas = true;
};

////////////////////////////////////////////////
// USUNIÊTE 
// W¥TEK CZARNEGO MAGA
////////////////////////////////////////////////

instance dia_cavalorn_pickpocket(c_info) {
    npc = stt_336_cavalorn;
    nr = 900;
    condition = dia_cavalorn_pickpocket_condition;
    information = dia_cavalorn_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cavalorn_pickpocket_condition() {
	e_beklauen(baseThfChanceSTT - 5, 30);
};

func void dia_cavalorn_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cavalorn_pickpocket);
	info_addchoice(dia_cavalorn_pickpocket, dialog_back, dia_cavalorn_pickpocket_back);
	info_addchoice(dia_cavalorn_pickpocket, dialog_pickpocket, dia_cavalorn_pickpocket_doit);
};

func void dia_cavalorn_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_cavalorn_pickpocket);
};

func void dia_cavalorn_pickpocket_back() {
    info_clearchoices(dia_cavalorn_pickpocket);
};

