

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_GRD_278_Gardist_Exit (C_INFO)
{
	npc			= GRD_278_Gardist;
	nr			= 999;
	condition	= DIA_GRD_278_Gardist_Exit_Condition;
	information	= DIA_GRD_278_Gardist_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GRD_278_Gardist_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_278_Gardist_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_GRD_278_Gardist_LeaveMe (C_INFO)
{
	npc				= GRD_278_Gardist;
	nr				= 2;
	condition		= DIA_GRD_278_Gardist_LeaveMe_Condition;
	information		= DIA_GRD_278_Gardist_LeaveMe_Info;
	permanent		= 0;
	description		= "hs@FF0000 Wzywa was Ian. Podobno ma dla was jak¹œ nagrodê.";
};

FUNC int DIA_GRD_278_Gardist_LeaveMe_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_VLK_40010_Elton_Cesar))
	&& (Npc_KnowsInfo(hero,DIA_VLK_40012_Kopacz_Straz))
{
    return TRUE;
};
};
FUNC VOID DIA_GRD_278_Gardist_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_GRD_278_Gardist_LeaveMe_15_00"); //Wzywa was Ian. Podobno ma dla was jak¹œ nagrodê.
	AI_Output (self, other,"DIA_GRD_278_Gardist_LeaveMe_01_01"); //Kpisz sobie?! Nie mieliœmy i nie mamy nic wspólnego z tym idiot¹. Ale ty zaraz bêdziesz mia³ – z mieczem w brzuchu!

	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
	Npc_SetTarget  (GRD_40016_Straznik, other);
    AI_StartState  (GRD_40016_Straznik, ZS_ATTACK, 1, "");  


};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_GRD_278_Gardist_LeaveMe1 (C_INFO)
{
	npc				= GRD_278_Gardist;
	nr				= 2;
	condition		= DIA_GRD_278_Gardist_LeaveMe1_Condition;
	information		= DIA_GRD_278_Gardist_LeaveMe1_Info;
	permanent		= 0;
	description		= "Wo³a was Dracon. Ponoæ Kopacze ukrywali wielk¹ beczkê piwa...";
};

FUNC int DIA_GRD_278_Gardist_LeaveMe1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_VLK_40010_Elton_Cesar))
	&& (Npc_KnowsInfo(hero,DIA_VLK_40012_Kopacz_Straz))
	
{
    return TRUE;
};
};
FUNC VOID DIA_GRD_278_Gardist_LeaveMe1_Info()
{
	AI_Output (other, self,"DIA_GRD_278_Gardist_LeaveMe1_15_00"); //Wo³a was Dracon. Ponoæ Kopacze ukrywali wielk¹ beczkê piwa. Mo¿na j¹ ponoæ ,,skonfiskowaæ” po swojemu.
	AI_Output (self, other,"DIA_GRD_278_Gardist_LeaveMe1_01_01"); //Dracon to równy goœæ. Poza tym nie ma to jak dobre piwo. Szef siê chyba nie obrazi jak odejdziemy na chwilkê...
	AI_GotoWP(GRD_40016_Straznik,"OM_CAVE1_81");
    AI_Output (other, self,"DIA_GRD_278_Gardist_LeaveMe1_15_02"); //Znajdziecie go nie daleko pieca...
	AI_Output (self, other,"DIA_GRD_278_Gardist_LeaveMe1_01_03"); //Tak, tak, zje¿d¿aj ju¿!
	AI_StopProcessInfos	(self);
	
	StrazCesara = TRUE;
	
    Npc_ExchangeRoutine            (GRD_40016_Straznik,"PIEC");
	Npc_ExchangeRoutine            (GRD_278_Gardist,"piwo");
};

instance dia_grd_278_pickpocket(c_info) {
    npc = grd_278_gardist;
    nr = 900;
    condition = dia_grd_278_pickpocket_condition;
    information = dia_grd_278_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_278_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_278_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_278_pickpocket);
	info_addchoice(dia_grd_278_pickpocket, dialog_back, dia_grd_278_pickpocket_back);
	info_addchoice(dia_grd_278_pickpocket, dialog_pickpocket, dia_grd_278_pickpocket_doit);
};

func void dia_grd_278_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_278_pickpocket);
};

func void dia_grd_278_pickpocket_back() {
    info_clearchoices(dia_grd_278_pickpocket);
};