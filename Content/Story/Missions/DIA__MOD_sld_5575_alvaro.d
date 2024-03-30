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
   description	= "Wszystko w porz¹dku? ";
};

FUNC INT DIA_alvaro_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_alvaro_Hello_Info()
{
    AI_Output (other, self ,"DIA_alvaro_Hello_15_01"); //Wszystko w porz¹dku? 
    AI_Output (self, other ,"DIA_alvaro_Hello_03_02"); //A ty coœ za jeden?
    AI_Output (other, self ,"DIA_alvaro_Hello_15_03"); //Trafi³em tu niedawno. 
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
    AI_Output (self, other ,"DIA_alvaro_HowAreyou_03_02"); //Nie chce mi siê z tob¹ gadaæ. 
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
   description	= "Kim jesteœ?";
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
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_02"); //To ty kmiotku nie wiesz kim jestem?
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_03"); //S³ucham?
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_04"); //Co to wodorosty Ci uszy zatka³y? Pytam jakim cudem nie wiesz, ¿e rozmawiasz z potê¿nym Alvaro!
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_05"); //Wygl¹dasz na zwyk³ego Najemnika.
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_06"); //Coœ ty gamoniu powiedzia³. Jeszcze jedna taka odzywka I rozwalê Ci ³eb.
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_07"); //I w ogóle coœ ty za jeden?
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_08"); //Ja jestem...
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_09"); //A w sumie gówno mnie to obchodzi. Jesteœ kolejnym zdechlakiem. Ciê¿arna samica kretoszczura pokona³aby Ciê ma³ym muœniêciem.
    AI_Output (other, self ,"DIA_alvaro_HELLO1_15_10"); //Jesteœ tego pewny?
    AI_Output (self, other ,"DIA_alvaro_HELLO1_03_11"); //Irytujesz mnie,zejdŸ mi z oczu! Bo Ci przy³o¿ê!

    Info_ClearChoices	(DIA_alvaro_HELLO1);
    Info_AddChoice		(DIA_alvaro_HELLO1, "Dobrze pójdê sobie.", DIA_alvaro_HELLO1_OK);
	Info_AddChoice		(DIA_alvaro_HELLO1, "hs@FF0000 To ty tu jesteœ mistrzem irytowania zarozumialcu.", DIA_alvaro_IDIOT_NO);
};

FUNC VOID DIA_alvaro_HELLO1_OK()
{
    AI_Output (other, self ,"DIA_alvaro_HELLO_OK_15_01"); //Dobrze pójdê sobie.
    AI_Output (self, other ,"DIA_alvaro_HELLO_OK_03_02"); //Wreszcie dotar³o do tej pustej ³epetyny. A w sumie szkoda bo ju¿ chcia³em spuœciæ ci têgi ³omot!
	AlvaroD = TRUE;
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_alvaro_IDIOT_NO()
{
    AI_Output (other, self ,"DIA_alvaro_IDIOT_NO_15_01"); //To ty tu jesteœ mistrzem irytowania zarozumialcu.
    AI_Output (self, other ,"DIA_alvaro_IDIOT_NO_03_02"); //Hahaha czy¿by takiemu chuchrakowi wyszta³ci³y siê jaja?
    AI_Output (other, self ,"DIA_alvaro_IDIOT_NO_15_03"); //¯a³uje tylko, ¿e tobie nie wykszta³ci³o siê mózgowie.
    AI_Output (self, other ,"DIA_alvaro_IDIOT_NO_03_04"); //Có¿, chyba do reszty straci³eœ instynkt samozachowawczy. Teraz dostaniesz to czego chcesz!
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
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_02"); //To niemo¿liwe! Nie jesteœ wart funta k³aków miêczaku...Ale pokona³eœ mnie.
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_03"); //Jesteœ jakimœ cudakiem albo przeklêtym mutantem!
    AI_Output (other, self ,"DIA_alvaro_PO_LYPIE_TOBIE_15_04"); //Nie. Potrafiê walczyæ I myœleæ. Tobie mocno œrednio I z jednym I z drugim.
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_05"); //Ty sukinsynu. To by³ przypadek, rozumiesz!
    AI_Output (other, self ,"DIA_alvaro_PO_LYPIE_TOBIE_15_06"); //No to sprawdŸmy!
    AI_DrawWeapon (other);
    AI_Output (self, other ,"DIA_alvaro_PO_LYPIE_TOBIE_03_07"); //Dobrze, wygra³eœ. A teraz odejdŸ ³askawie z przed mojego oblicza.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_alvaro_PO_LYPIE_TOBIE_15_08"); //W sumie racja tylko tracê tutaj cenny czas. Pora na mnie.
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

 B_LogEntry                     (CH1_Bodyguard,"Alvaro rz¹da³ by oddaæ mu nasz¹ rude, jego niedoczekanie. Musimy go usun¹æ z drogi i oszczêdzimy Gravera ma nam wszystko wyœpiewaæ.");
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
    AI_Output (self, other ,"DIA_alvaro_ANDREW_03_01"); //Staæ ³ajzy! Teraz wyskakujcie z rudy bo inaczej zrobie z wami porz¹dek!
    AI_Output (other, self ,"DIA_alvaro_ANDREW_15_02"); //Po moim trupie.
    AI_Output (self, other ,"DIA_alvaro_ANDREW_03_03"); //Mówisz, masz! Braæ ich!
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