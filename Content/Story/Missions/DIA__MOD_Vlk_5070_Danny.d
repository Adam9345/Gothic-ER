// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_5070_Exit (C_INFO)
{
	npc			= Vlk_5070_Danny;
	nr			= 999;
	condition	= DIA_Vlk_5070_Exit_Condition;
	information	= DIA_Vlk_5070_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_5070_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_5070_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				THANKS
// **************************************************

INSTANCE DIA_Vlk_5070_THANKS (C_INFO)
{
	npc				= Vlk_5070_Danny;
	nr				= 1;
	condition		= DIA_Vlk_5070_THANKS_Condition;
	information		= DIA_Vlk_5070_THANKS_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Vlk_5070_THANKS_Condition()
{	
	if (C_BodyStateContains(hero,BS_STAND)) {
    	return 1;
	};
};

FUNC VOID DIA_Vlk_5070_THANKS_Info()
{
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_01"); //Dzi�ki za pomoc. Jeszcze troch� i by�oby po mnie. Siedz� tu ju� od kilku dni bez wody i jedzenia. 
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_02"); //Dlaczego po prostu nie zejdziesz na d�?
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_03"); //Nie widzia�e� tych pe�zaczy?! Prze�y�em tylko dlatego, �e wszed�em na ten stary podest. Na szcz�cie teraz ju� jestem bezpieczny. 
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_04"); //Uratowa�e� mi �ycie.
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_05"); //(z lekk� drwin�, pewno�ci� siebie) Nie ma za co.
	Npc_ExchangeRoutine (self,"find");
	//AI_StopProcessInfos	(self);
};

// **************************************************
// 				I met your friend
// **************************************************

INSTANCE DIA_Vlk_5070_Quest (C_INFO)
{
	npc				= Vlk_5070_Danny;
	nr				= 1;
	condition		= DIA_Vlk_5070_Quest_Condition;
	information		= DIA_Vlk_5070_Quest_Info;
	permanent		= 0;
	description		= "Tw�j przyjaciel pyta� o ciebie.";
};

FUNC INT DIA_Vlk_5070_Quest_Condition()
{	
	if MIS_BuddlerDanny == LOG_RUNNING
	{
	return 1;
	};
};

FUNC VOID DIA_Vlk_5070_Quest_Info()
{
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_00"); //Tw�j przyjaciel pyta� o ciebie.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_01"); //Jaki przyjaciel?
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_02"); //Ten, kt�ry siedzi przed Starym Obozem i czeka na rud�...
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_03"); //No tak, obieca�em mu rud�, ale teraz wszystko straci�em. Jaki� Stra�nik t�dy przechodzi� i zabra� moj� sakiewk�. Nawet nie pom�g� mi si� st�d wydosta�.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_04"); //Wy�mia� mnie tylko i odszed�. Powiedz mojemu kumplowi, �e niepr�dko wr�c�. Musz� kopa� od nowa.

    B_LogEntry               (CH1_BuddlerDanny,"W Kopalni spotka�em Danny'ego. Niestety niepr�dko wr�ci, poniewa� straci� ca�� rud� jak� wydoby�.");
};
//========================================
//-----------------> Prawo Pascala 
//========================================

INSTANCE DIA_Danny_PP_Sacke (C_INFO)
{
   npc          = Vlk_5070_Danny;
   nr           = 1;
   condition    = DIA_Danny_PP_Sacke_Condition;
   information  = DIA_Danny_PP_Sacke_Info;
   permanent	= FALSE;
   description	= "Mam do Ciebie pewn� spraw�. Pono�...";
};

FUNC INT DIA_Danny_PP_Sacke_Condition()
{
    if (Npc_KnowsInfo(hero,DIA_Garp_PP_Give_Me_Ore))
{
    return TRUE;
};
};
FUNC VOID DIA_Danny_PP_Sacke_Info()
{
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_01"); //Mam do Ciebie pewn� spraw�. Pono� masz przy sobie sakiewk�, kt�ra niedawno by�a w posiadaniu Garpa.
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_02"); //Mam. Jest na niej napis ,,Pascal�.
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_03"); //Chcia�bym j� od ciebie kupi�.
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_04"); //Stary, uratowa�e� mnie. Wi�c oddam ci j� w podzi�ce za p� darmo.
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_05"); //We� ten medalion.
    B_GiveInvItems (other,self, ItMi_PP_GarpAmulette,1);
    B_GiveInvItems (self,other, ItMi_PP_PascalOre,1);
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_06"); //A ty trzymaj sakiewk�
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_07"); //No I za�atwione.
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_08"); //R�wny z ciebie facet. Do zobaczenia...
	B_LogEntry               (PrawoPascala,"Danny by� w potrzasku lecz uda�o mi si� go uratowa�. Uzyska�em te� od niego rud� Pascala pora do niego wr�ci�.");
    AI_StopProcessInfos	(self);
};

instance dia_danny_pickpocket(c_info) {
    npc = vlk_5070_danny;
    nr = 900;
    condition = dia_danny_pickpocket_condition;
    information = dia_danny_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_danny_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_danny_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_danny_pickpocket);
	info_addchoice(dia_danny_pickpocket, dialog_back, dia_danny_pickpocket_back);
	info_addchoice(dia_danny_pickpocket, dialog_pickpocket, dia_danny_pickpocket_doit);
};

func void dia_danny_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_danny_pickpocket);
};

func void dia_danny_pickpocket_back() {
    info_clearchoices(dia_danny_pickpocket);
};