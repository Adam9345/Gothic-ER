// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Grabarz_EXIT(C_INFO)
{
	npc			= ORG_40045_Grabarz ;
	nr			= 999;
	condition	= Info_Grabarz_EXIT_Condition;
	information	= Info_Grabarz_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Grabarz_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Grabarz_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Cieñ w boku
// ************************************************************

INSTANCE Info_Grabarz_Hello(C_INFO)
{
	npc			= ORG_40045_Grabarz;
	nr			= 1;
	condition	= Info_Grabarz_Hello_Condition;
	information	= Info_Grabarz_Hello_Info;
	permanent	= 0;
	description = "ZnajdŸ sobie lepsze miejsce. Tu w Kotle tylko przeszkadzasz...";
};                       

FUNC INT Info_Grabarz_Hello_Condition()

{
if (Npc_KnowsInfo(hero,DIA_SWINEY_PAPIER))
{
	return 1;
};
};
FUNC VOID Info_Grabarz_Hello_Info()
{	
	AI_Output (other, self,"Info_Grabarz_Hello_15_00"); //ZnajdŸ sobie lepsze miejsce. Tu w Kotle tylko przeszkadzasz, idŸ lepiej do Karczmy. To odpowiednie miejsce dla ciebie.
	AI_Output (self, other,"Info_Grabarz_Hello_09_01"); //Tu jest dobrze. Te g³upie Krety oddaj¹ mi swoje marne pensje w zamian za spokój, którego i tak nie maj¹! Hahah...
	AI_Output (other, self,"Info_Grabarz_Hello_15_02"); //Wynoœ siê st¹d!
	AI_Output (self, other,"Info_Grabarz_Hello_09_03"); //No proszê! Mamy chêtnego na utratê paru zêbów! Przys³a³ ciê pewnie ten nadêty Okyl.
	AI_Output (other, self,"Info_Grabarz_Hello_15_04"); //Nie tylko on. Swiney tez kaza³ ci siê st¹d wynosiæ.
	AI_Output (self, other,"Info_Grabarz_Hello_09_05"); //Niemo¿liwe.
	AI_Output (other, self,"Info_Grabarz_Hello_15_06"); //Có¿, pewnie w³aœnie pali pewien dokument w ognisku...
    AI_Output (self, other,"Info_Grabarz_Hello_09_07"); //Nie! To pewnie twoja sprawka. Teraz tego po¿a³ujesz.
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other); 
	AI_StartState (self, ZS_Attack, 1, "");
	
};

// ************************************************************
// 						Cieñ w boku
// ************************************************************

INSTANCE Info_Grabarz_Schuerfer(C_INFO)
{
	npc			= ORG_40045_Grabarz;
	nr			= 1;
	condition	= Info_Grabarz_Schuerfer_Condition;
	information	= Info_Grabarz_Schuerfer_Info;
	permanent	= false;
	description = "I ¿ebym ciê tu wiêcej nie widzia³.";
};                       

FUNC INT Info_Grabarz_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Grabarz_Hello))
	
	{
		return 1;
	};
};

FUNC VOID Info_Grabarz_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Grabarz_Schuerfer_15_00"); //I ¿ebym ciê tu wiêcej nie widzia³.
	AI_Output (self, other,"Info_Grabarz_Schuerfer_09_01"); //Myœlisz pewnie, ¿e wygra³eœ. Ale to jeszcze nie koniec frajerze...
	B_LogEntry               (Cienwboku,"Grabarz dosta³ po gêbie i wyniesie siê z Kot³a. Teraz pomówiê ze Swineyem i Okylem, nastêpnie odbiorê nagrodê.");
	Npc_ExchangeRoutine (self,"BRAMA");
	Npc_ExchangeRoutine (ORG_851_Butch,"BRAMA");
	GrabarzWygnany = true;
	
	
	
};

//========================================
//-----------------> Cieñ w boku
//========================================

INSTANCE DIA_Grabarz_PAPIER (C_INFO)
{
   npc          = ORG_40045_Grabarz;
   nr           = 1;
   condition    = DIA_Grabarz_PAPIER_Condition;
   information  = DIA_Grabarz_PAPIER_Info;
   permanent	= FALSE;
 important = 1;
};

FUNC INT DIA_Grabarz_PAPIER_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_OKYL_PAPIER))
    && (Npc_GetDistToWP(hero,"WP_GRABARZ_BRAMA")<450)
	&& (MIS_Grabcio == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grabarz_PAPIER_Info()
{
    AI_Output (self, other ,"DIA_Grabarz_PAPIER_03_00"); //Czas zemsty nadszed³! Bierzmy tego sukinsyna i zakoñczmy jego marny ¿ywot!
	ORG_40045_Grabarz.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	
     AI_StopProcessInfos	(self);
	 Npc_SetTarget (ORG_851_Butch, other);
     AI_StartState (ORG_851_Butch, ZS_ATTACK, 1, "");
     Npc_SetTarget (self, other);
     AI_StartState (self, ZS_ATTACK, 1, "");
	
	
	
};


//========================================
//-----------------> Cieñ w boku
//========================================

INSTANCE DIA_Grabarz_WALKA (C_INFO)
{
   npc          = ORG_40045_Grabarz;
   nr           = 1;
   condition    = DIA_Grabarz_WALKA_Condition;
   information  = DIA_Grabarz_WALKA_Info;
   permanent	= FALSE;
   important    = 1;
};

FUNC INT DIA_Grabarz_WALKA_Condition()
{
    if(ORG_40045_Grabarz.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& (Npc_KnowsInfo(hero,DIA_Grabarz_PAPIER))
  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Grabarz_WALKA_Info()
{
    AI_Output (other,self,"DIA_Grabarz_WALKA_15_00"); //Nie wiem dlaczego ciê oszczêdzi³em. Ale nie wa¿ne. 
	AI_Output (other,self,"DIA_Grabarz_WALKA_15_01"); //Nie psuj mi d³u¿ej oczu swoim parszywym widokiem bo dokoñczê dzie³a!
    AI_Output (self,other,"DIA_Grabarz_WALKA_03_02"); //Aaaaaa... Moje koœci... Dobrze ju¿ dobrze... Pójdê sobie.
    Npc_ExchangeRoutine (self,"camp");
	Npc_ExchangeRoutine (ORG_851_Butch,"start");
	ORG_851_Butch.attribute[ATR_HITPOINTS] = 220;
};
var int grabarz_fight;
//========================================
//-----------------> HI_GRABCIO
//========================================

INSTANCE DIA_Grabarz_HI_GRABCIO (C_INFO)
{
   npc          = ORG_40045_Grabarz;
   nr           = 1;
   condition    = DIA_Grabarz_HI_GRABCIO_Condition;
   information  = DIA_Grabarz_HI_GRABCIO_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Grabarz_HI_GRABCIO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Grabarz_HI_GRABCIO_Info()
{
    AI_Output (other, self ,"DIA_Grabarz_HI_GRABCIO_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Grabarz_HI_GRABCIO_03_02"); //Nie mam zamiaru ci mówiæ kim jestem. Nie bêdê strzepi³ jêzyka do jakiegoœ przyb³êdy.
    AI_Output (other, self ,"DIA_Grabarz_HI_GRABCIO_15_03"); //Widzê, ¿e szybko oceniasz ludzi.
    AI_Output (self, other ,"DIA_Grabarz_HI_GRABCIO_03_04"); //Myœlê I dzia³am jak mi siê ¿ywnie podoba.
    AI_Output (self, other ,"DIA_Grabarz_HI_GRABCIO_03_05"); //A ty zejdŸ mi z oczu bo bêdê mia³ rozrywkê kopi¹c ci dupê.

    Info_ClearChoices		(DIA_Grabarz_HI_GRABCIO);
    Info_AddChoice		(DIA_Grabarz_HI_GRABCIO, "Pójdê sobie...", DIA_Grabarz_LEFT);
    Info_AddChoice		(DIA_Grabarz_HI_GRABCIO, "Chyba czas daæ ci lekcjê pokory.", DIA_Grabarz_LESSON);
};

FUNC VOID DIA_Grabarz_LEFT()
{
    AI_Output (other, self ,"DIA_Grabarz_LEFT_15_01"); //Pójdê sobie...
    AI_Output (self, other ,"DIA_Grabarz_LEFT_03_02"); //Jedyna s³uszna dla ciebie decyzja ch³opczyku. A ju¿ chcia³em ci przywaliæ...
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Grabarz_LESSON()
{
    AI_Output (other, self ,"DIA_Grabarz_LESSON_15_01"); //Chyba czas daæ ci lekcjê pokory.
    AI_Output (self, other ,"DIA_Grabarz_LESSON_03_02"); //Ooo czas na odrobinê gimnastyki. Zastanawiam siê czy solidne cie pobiæ czy od razu zakoñczyæ twój œmieszny ¿ywot.
    AI_Output (self, other ,"DIA_Grabarz_LESSON_03_03"); //Wtedy twój ³eb rzuci³bym œcierwojadom a odciêt¹ kuœkê kretoszczurom. Albo mo¿e odwrotnie...
    AI_Output (other, self ,"DIA_Grabarz_LESSON_15_04"); //Doœæ tych przemyœleñ æwoku. Pora na naukê manier!
	grabarz_fight = TRUE;
    AI_DrawWeapon (other);
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};


//========================================
//-----------------> FI_WON
//========================================

INSTANCE DIA_Grabarz_FI_WON (C_INFO)
{
   npc          = ORG_40045_Grabarz;
   nr           = 4;
   condition    = DIA_Grabarz_FI_WON_Condition;
   information  = DIA_Grabarz_FI_WON_Info;
   permanent	= FALSE;
   description	= "No I co wielki Grabarz pad³ na glebe.";
};

FUNC INT DIA_Grabarz_FI_WON_Condition()
{
  if(ORG_40045_Grabarz.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
  && (grabarz_fight == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Grabarz_FI_WON_Info()
{
    AI_Output (other, self ,"DIA_Grabarz_FI_WON_15_01"); //No I co wielki Grabarz pad³ na glebe.
    AI_Output (self, other ,"DIA_Grabarz_FI_WON_03_02"); //£ud szczêœcia. Nic wiêcej amatorze.
    AI_Output (other, self ,"DIA_Grabarz_FI_WON_15_03"); //Nastêpnym razem radzê nie os¹dz¹æ œwie¿o napotkanych ludzi zbyt pochopnie.
    AI_Output (self, other ,"DIA_Grabarz_FI_WON_03_04"); //ZejdŸ mi z oczu ch³optasiu.... Bo wezwê kumpli!
    AI_Output (other, self ,"DIA_Grabarz_FI_WON_15_05"); //¯egnam. Pozdrów ich ode mnie.
	B_GiveXP(100);
	ORG_40045_Grabarz.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
    AI_StopProcessInfos	(self);
};

instance dia_grabarz_pickpocket(c_info) {
    npc = org_40045_grabarz;
    nr = 900;
    condition = dia_grabarz_pickpocket_condition;
    information = dia_grabarz_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grabarz_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_grabarz_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grabarz_pickpocket);
	info_addchoice(dia_grabarz_pickpocket, dialog_back, dia_grabarz_pickpocket_back);
	info_addchoice(dia_grabarz_pickpocket, dialog_pickpocket, dia_grabarz_pickpocket_doit);
};

func void dia_grabarz_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grabarz_pickpocket);
};

func void dia_grabarz_pickpocket_back() {
    info_clearchoices(dia_grabarz_pickpocket);
};







