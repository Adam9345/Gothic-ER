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
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_01"); //Dziêki za pomoc. Jeszcze trochê i by³oby po mnie. Siedzê tu ju¿ od kilku dni bez wody i jedzenia. 
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_02"); //Dlaczego po prostu nie zejdziesz na dó³?
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_03"); //Nie widzia³eœ tych pe³zaczy?! Prze¿y³em tylko dlatego, ¿e wszed³em na ten stary podest. Na szczêœcie teraz ju¿ jestem bezpieczny. 
	AI_Output (self, other,"DIA_Vlk_5070_THANKS_02_04"); //Uratowa³eœ mi ¿ycie.
	AI_Output (other, self,"DIA_Vlk_5070_THANKS_15_05"); //(z lekk¹ drwin¹, pewnoœci¹ siebie) Nie ma za co.
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
	description		= "Twój przyjaciel pyta³ o ciebie.";
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
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_00"); //Twój przyjaciel pyta³ o ciebie.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_01"); //Jaki przyjaciel?
	AI_Output (other, self,"DIA_Vlk_5070_Quest_15_02"); //Ten, który siedzi przed Starym Obozem i czeka na rudê...
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_03"); //No tak, obieca³em mu rudê, ale teraz wszystko straci³em. Jakiœ Stra¿nik têdy przechodzi³ i zabra³ moj¹ sakiewkê. Nawet nie pomóg³ mi siê st¹d wydostaæ.
	AI_Output (self, other,"DIA_Vlk_5070_Quest_02_04"); //Wyœmia³ mnie tylko i odszed³. Powiedz mojemu kumplowi, ¿e nieprêdko wrócê. Muszê kopaæ od nowa.

    B_LogEntry               (CH1_BuddlerDanny,"W Kopalni spotka³em Danny'ego. Niestety nieprêdko wróci, poniewa¿ straci³ ca³¹ rudê jak¹ wydoby³.");
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
   description	= "Mam do Ciebie pewn¹ sprawê. Ponoæ...";
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
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_01"); //Mam do Ciebie pewn¹ sprawê. Ponoæ masz przy sobie sakiewkê, która niedawno by³a w posiadaniu Garpa.
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_02"); //Mam. Jest na niej napis ,,Pascal”.
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_03"); //Chcia³bym j¹ od ciebie kupiæ.
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_04"); //Stary, uratowa³eœ mnie. Wiêc oddam ci j¹ w podziêce za pó³ darmo.
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_05"); //WeŸ ten medalion.
    B_GiveInvItems (other,self, ItMi_PP_GarpAmulette,1);
    B_GiveInvItems (self,other, ItMi_PP_PascalOre,1);
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_06"); //A ty trzymaj sakiewkê
    AI_Output (other, self ,"DIA_Danny_PP_Sacke_15_07"); //No I za³atwione.
    AI_Output (self, other ,"DIA_Danny_PP_Sacke_03_08"); //Równy z ciebie facet. Do zobaczenia...
	B_LogEntry               (PrawoPascala,"Danny by³ w potrzasku lecz uda³o mi siê go uratowaæ. Uzyska³em te¿ od niego rudê Pascala pora do niego wróciæ.");
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