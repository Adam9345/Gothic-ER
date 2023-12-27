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
// 						Cie� w boku
// ************************************************************

INSTANCE Info_Grabarz_Hello(C_INFO)
{
	npc			= ORG_40045_Grabarz;
	nr			= 1;
	condition	= Info_Grabarz_Hello_Condition;
	information	= Info_Grabarz_Hello_Info;
	permanent	= 0;
	description = "Znajd� sobie lepsze miejsce. Tu w Kotle tylko przeszkadzasz...";
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
	AI_Output (other, self,"Info_Grabarz_Hello_15_00"); //Znajd� sobie lepsze miejsce. Tu w Kotle tylko przeszkadzasz, id� lepiej do Karczmy. To odpowiednie miejsce dla ciebie.
	AI_Output (self, other,"Info_Grabarz_Hello_09_01"); //Tu jest dobrze. Te g�upie Krety oddaj� mi swoje marne pensje w zamian za spok�j, kt�rego i tak nie maj�! Hahah...
	AI_Output (other, self,"Info_Grabarz_Hello_15_02"); //Wyno� si� st�d!
	AI_Output (self, other,"Info_Grabarz_Hello_09_03"); //No prosz�! Mamy ch�tnego na utrat� paru z�b�w! Przys�a� ci� pewnie ten nad�ty Okyl.
	AI_Output (other, self,"Info_Grabarz_Hello_15_04"); //Nie tylko on. Swiney tez kaza� ci si� st�d wynosi�.
	AI_Output (self, other,"Info_Grabarz_Hello_09_05"); //Niemo�liwe.
	AI_Output (other, self,"Info_Grabarz_Hello_15_06"); //C�, pewnie w�a�nie pali pewien dokument w ognisku...
    AI_Output (self, other,"Info_Grabarz_Hello_09_07"); //Nie! To pewnie twoja sprawka. Teraz tego po�a�ujesz.
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other); 
	AI_StartState (self, ZS_Attack, 1, "");
	
};

// ************************************************************
// 						Cie� w boku
// ************************************************************

INSTANCE Info_Grabarz_Schuerfer(C_INFO)
{
	npc			= ORG_40045_Grabarz;
	nr			= 1;
	condition	= Info_Grabarz_Schuerfer_Condition;
	information	= Info_Grabarz_Schuerfer_Info;
	permanent	= false;
	description = "I �ebym ci� tu wi�cej nie widzia�.";
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
	AI_Output (other, self,"Info_Grabarz_Schuerfer_15_00"); //I �ebym ci� tu wi�cej nie widzia�.
	AI_Output (self, other,"Info_Grabarz_Schuerfer_09_01"); //My�lisz pewnie, �e wygra�e�. Ale to jeszcze nie koniec frajerze...
	B_LogEntry               (Cienwboku,"Grabarz dosta� po g�bie i wyniesie si� z Kot�a. Teraz pom�wi� ze Swineyem i Okylem, nast�pnie odbior� nagrod�.");
	Npc_ExchangeRoutine (self,"BRAMA");
	Npc_ExchangeRoutine (ORG_851_Butch,"BRAMA");
	GrabarzWygnany = true;
	
	
	
};

//========================================
//-----------------> Cie� w boku
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
    AI_Output (self, other ,"DIA_Grabarz_PAPIER_03_00"); //Czas zemsty nadszed�! Bierzmy tego sukinsyna i zako�czmy jego marny �ywot!
	ORG_40045_Grabarz.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	
     AI_StopProcessInfos	(self);
	 Npc_SetTarget (ORG_851_Butch, other);
     AI_StartState (ORG_851_Butch, ZS_ATTACK, 1, "");
     Npc_SetTarget (self, other);
     AI_StartState (self, ZS_ATTACK, 1, "");
	
	
	
};


//========================================
//-----------------> Cie� w boku
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
    AI_Output (other,self,"DIA_Grabarz_WALKA_15_00"); //Nie wiem dlaczego ci� oszcz�dzi�em. Ale nie wa�ne. 
	AI_Output (other,self,"DIA_Grabarz_WALKA_15_01"); //Nie psuj mi d�u�ej oczu swoim parszywym widokiem bo doko�cz� dzie�a!
    AI_Output (self,other,"DIA_Grabarz_WALKA_03_02"); //Aaaaaa... Moje ko�ci... Dobrze ju� dobrze... P�jd� sobie.
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
   description	= "Kim jeste�?";
};

FUNC INT DIA_Grabarz_HI_GRABCIO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Grabarz_HI_GRABCIO_Info()
{
    AI_Output (other, self ,"DIA_Grabarz_HI_GRABCIO_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Grabarz_HI_GRABCIO_03_02"); //Nie mam zamiaru ci m�wi� kim jestem. Nie b�d� strzepi� j�zyka do jakiego� przyb��dy.
    AI_Output (other, self ,"DIA_Grabarz_HI_GRABCIO_15_03"); //Widz�, �e szybko oceniasz ludzi.
    AI_Output (self, other ,"DIA_Grabarz_HI_GRABCIO_03_04"); //My�l� I dzia�am jak mi si� �ywnie podoba.
    AI_Output (self, other ,"DIA_Grabarz_HI_GRABCIO_03_05"); //A ty zejd� mi z oczu bo b�d� mia� rozrywk� kopi�c ci dup�.

    Info_ClearChoices		(DIA_Grabarz_HI_GRABCIO);
    Info_AddChoice		(DIA_Grabarz_HI_GRABCIO, "P�jd� sobie...", DIA_Grabarz_LEFT);
    Info_AddChoice		(DIA_Grabarz_HI_GRABCIO, "Chyba czas da� ci lekcj� pokory.", DIA_Grabarz_LESSON);
};

FUNC VOID DIA_Grabarz_LEFT()
{
    AI_Output (other, self ,"DIA_Grabarz_LEFT_15_01"); //P�jd� sobie...
    AI_Output (self, other ,"DIA_Grabarz_LEFT_03_02"); //Jedyna s�uszna dla ciebie decyzja ch�opczyku. A ju� chcia�em ci przywali�...
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Grabarz_LESSON()
{
    AI_Output (other, self ,"DIA_Grabarz_LESSON_15_01"); //Chyba czas da� ci lekcj� pokory.
    AI_Output (self, other ,"DIA_Grabarz_LESSON_03_02"); //Ooo czas na odrobin� gimnastyki. Zastanawiam si� czy solidne cie pobi� czy od razu zako�czy� tw�j �mieszny �ywot.
    AI_Output (self, other ,"DIA_Grabarz_LESSON_03_03"); //Wtedy tw�j �eb rzuci�bym �cierwojadom a odci�t� ku�k� kretoszczurom. Albo mo�e odwrotnie...
    AI_Output (other, self ,"DIA_Grabarz_LESSON_15_04"); //Do�� tych przemy�le� �woku. Pora na nauk� manier!
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
   description	= "No I co wielki Grabarz pad� na glebe.";
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
    AI_Output (other, self ,"DIA_Grabarz_FI_WON_15_01"); //No I co wielki Grabarz pad� na glebe.
    AI_Output (self, other ,"DIA_Grabarz_FI_WON_03_02"); //�ud szcz�cia. Nic wi�cej amatorze.
    AI_Output (other, self ,"DIA_Grabarz_FI_WON_15_03"); //Nast�pnym razem radz� nie os�dz�� �wie�o napotkanych ludzi zbyt pochopnie.
    AI_Output (self, other ,"DIA_Grabarz_FI_WON_03_04"); //Zejd� mi z oczu ch�optasiu.... Bo wezw� kumpli!
    AI_Output (other, self ,"DIA_Grabarz_FI_WON_15_05"); //�egnam. Pozdr�w ich ode mnie.
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







