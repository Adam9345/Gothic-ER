//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_alvaro_EXIT(C_INFO)
{
	npc             = sld_5575_alvaro;
	nr              = 999;
	condition	= DIA_alvaro_EXIT_Condition;
	information	= DIA_alvaro_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_alvaro_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_alvaro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_alvaro_Hello (C_INFO)
{
   npc          = sld_5575_alvaro ;
   nr           = 1;
   condition    = DIA_alvaro_Hello_Condition;
   information  = DIA_alvaro_Hello_Info;
   permanent	= FALSE;
   description	= "Wszystko w porz�dku? ";
};

FUNC INT DIA_alvaro_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_alvaro_Hello_Info()
{
    AI_Output (other, self ,"DIA_alvaro_Hello_15_01"); //Wszystko w porz�dku? 
    AI_Output (self, other ,"DIA_alvaro_Hello_03_02"); //A ty co� za jeden?
    AI_Output (other, self ,"DIA_alvaro_Hello_15_03"); //Trafi�em tu niedawno. 
    AI_Output (self, other ,"DIA_alvaro_Hello_03_04"); //No to mnie nie wkurzaj. Nie mam nic do palenia i jestem cholernie nerwowy. 
   // AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HowAreyou
//========================================

INSTANCE DIA_alvaro_HowAreyou (C_INFO)
{
   npc          = sld_5575_alvaro ;
   nr           = 2;
   condition    = DIA_alvaro_HowAreyou_Condition;
   information  = DIA_alvaro_HowAreyou_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_alvaro_HowAreyou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_alvaro_HowAreyou_Info()
{
    AI_Output (other, self ,"DIA_alvaro_HowAreyou_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_alvaro_HowAreyou_03_02"); //Nie chce mi si� z tob� gada�. 
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_alvaro_HELLO1 (C_INFO)
{
   npc          = sld_5575_alvaro;
   nr           = 1;
   condition    = DIA_alvaro_HELLO1_Condition;
   information  = DIA_alvaro_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_alvaro_HELLO1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_alvaro_Hello))
{
    return TRUE;
};
};
FUNC VOID DIA_alvaro_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_02"); //To ty kmiotku nie wiesz kim jestem?
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_03"); //S�ucham?
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_04"); //Co to wodorosty Ci uszy zatka�y? Pytam jakim cudem nie wiesz, �e rozmawiasz z pot�nym Alvaro!
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_05"); //Wygl�dasz na zwyk�ego Najemnika.
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_06"); //Co� ty gamoniu powiedzia�. Jeszcze jedna taka odzywka I rozwal� Ci �eb.
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_07"); //I w og�le co� ty za jeden?
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_08"); //Ja jestem...
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_09"); //A w sumie g�wno mnie to obchodzi. Jeste� kolejnym zdechlakiem. Ci�arna samica kretoszczura pokona�aby Ci� ma�ym mu�ni�ciem.
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_10"); //Jeste� tego pewny?
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_11"); //Irytujesz mnie,zejd� mi z oczu! Bo Ci przy�o��!

    Info_ClearChoices	(DIA_alvaro_HELLO1);
    Info_AddChoice		(DIA_alvaro_HELLO1, "Dobrze p�jd� sobie.", DIA_alvaro_HELLO1_OK);
	Info_AddChoice		(DIA_alvaro_HELLO1, "hs@FF0000 To ty tu jeste� mistrzem irytowania zarozumialcu.", DIA_alvaro_IDIOT_NO);
};

FUNC VOID DIA_alvaro_HELLO1_OK()
{
    AI_Output (other, self ,"DIA_alvaro_HELLO_OK_15_01"); //Dobrze p�jd� sobie.
    AI_Output (self, other ,"DIA_alvaro_HELLO_OK_03_02"); //Wreszcie dotar�o do tej pustej �epetyny. A w sumie szkoda bo ju� chcia�em spu�ci� ci t�gi �omot!
	AlvaroD = TRUE;
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_alvaro_IDIOT_NO()
{
    AI_Output (other, self ,"DIA_alvaro_IDIOT_NO_15_01"); //To ty tu jeste� mistrzem irytowania zarozumialcu.
    AI_Output (self, other ,"DIA_alvaro_IDIOT_NO_03_02"); //Hahaha czy�by takiemu chuchrakowi wyszta�ci�y si� jaja?
    AI_Output (other, self ,"DIA_alvaro_IDIOT_NO_15_03"); //�a�uje tylko, �e tobie nie wykszta�ci�o si� m�zgowie.
    AI_Output (self, other ,"DIA_alvaro_IDIOT_NO_03_04"); //C�, chyba do reszty straci�e� instynkt samozachowawczy. Teraz dostaniesz to czego chcesz!
	sld_5575_alvaro.guild = GIL_ORG;
	B_ChangeGuild    (sld_5575_alvaro,GIL_ORG); 
	
	AlvaroD = TRUE;
    AI_StopProcessInfos	(self);
  //  Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

//========================================
//-----------------> PO_LYPIE_TOBIE
//========================================

INSTANCE DIA_alvaro_PO_LYPIE_TOBIE (C_INFO)
{
   npc          = sld_5575_alvaro;
   nr           = 4;
   condition    = DIA_alvaro_PO_LYPIE_TOBIE_Condition;
   information  = DIA_alvaro_PO_LYPIE_TOBIE_Info;
   permanent	= FALSE;
   description	= "No I co panie niepokonany Alvaro?";
};

FUNC INT DIA_alvaro_PO_LYPIE_TOBIE_Condition()
{
    var C_NPC Alvaro; 	Alvaro = Hlp_GetNpc(sld_5575_alvaro);		
	
	if (AlvaroD == TRUE)
	&& (sld_5575_alvaro.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	
{
    return TRUE;
};
};
FUNC VOID DIA_alvaro_PO_LYPIE_TOBIE_Info()
{
    AI_Output (other, self ,"DIA_alvaro_PO_LYPIE_TOBIE_15_01"); //No I co panie niepokonany Alvaro?
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_02"); //To niemo�liwe! Nie jeste� wart funta k�ak�w mi�czaku...Ale pokona�e� mnie.
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_03"); //Jeste� jakim� cudakiem albo przekl�tym mutantem!
    AI_Output (other, self ,"DIA_alvaro_PO_LYPIE_TOBIE_15_04"); //Nie. Potrafi� walczy� I my�le�. Tobie mocno �rednio I z jednym I z drugim.
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_05"); //Ty sukinsynu. To by� przypadek, rozumiesz!
    AI_Output (other, self ,"DIA_alvaro_PO_LYPIE_TOBIE_15_06"); //No to sprawd�my!
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_07"); //Dobrze, wygra�e�. A teraz odejd� �askawie z przed mojego oblicza.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_alvaro_PO_LYPIE_TOBIE_15_08"); //W sumie racja tylko trac� tutaj cenny czas. Pora na mnie.
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_09"); //Spadaj wariacie.
	sld_5575_alvaro.guild = GIL_SLD;
	B_GiveXp(150);
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> ANDREW
//========================================
func void AlvaroAttackAndrew()
{


    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, GRD_7008_Tukash);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	Npc_SetPermAttitude (ORG_810_Organisator, ATT_HOSTILE);
    Npc_SetTarget (ORG_810_Organisator, GRD_7008_Tukash);
    AI_StartState (ORG_810_Organisator, ZS_ATTACK, 1, "");
	
	Npc_SetTarget (ORG_807_Organisator, GRD_7008_Tukash);
    AI_StartState (ORG_807_Organisator, ZS_ATTACK, 1, "");

 B_LogEntry                     (CH1_Bodyguard,"Alvaro rz�da� by odda� mu nasz� rude, jego niedoczekanie. Musimy go usun�� z drogi i oszcz�dzimy Gravera ma nam wszystko wy�piewa�.");
};
INSTANCE DIA_alvaro_ANDREW (C_INFO)
{
   npc          = sld_5575_alvaro;
   nr           = 1;
   condition    = DIA_alvaro_ANDREW_Condition;
   information  = DIA_alvaro_ANDREW_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_alvaro_ANDREW_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Andrew_HELLO7))
{
    return TRUE;
};
};
FUNC VOID DIA_alvaro_ANDREW_Info()
{
    AI_Output (self, other ,"DIA_alvaro_ANDREW_03_01"); //Sta� �ajzy! Teraz wyskakujcie z rudy bo inaczej zrobie z wami porz�dek!
    AI_Output (other, self ,"DIA_alvaro_ANDREW_15_02"); //Po moim trupie.
    AI_Output (self, other ,"DIA_alvaro_ANDREW_03_03"); //M�wisz, masz! Bra� ich!
    AI_StopProcessInfos	(self);
    AlvaroAttackAndrew();
    
};

instance dia_alvaro_pickpocket(c_info) {
    npc = sld_5575_alvaro;
    nr = 900;
    condition = dia_alvaro_pickpocket_condition;
    information = dia_alvaro_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_alvaro_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 35);
};

func void dia_alvaro_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_alvaro_pickpocket);
	info_addchoice(dia_alvaro_pickpocket, dialog_back, dia_alvaro_pickpocket_back);
	info_addchoice(dia_alvaro_pickpocket, dialog_pickpocket, dia_alvaro_pickpocket_doit);
};

func void dia_alvaro_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_alvaro_pickpocket);
};

func void dia_alvaro_pickpocket_back() {
    info_clearchoices(dia_alvaro_pickpocket);
};