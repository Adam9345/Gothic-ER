//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_281_Exit (C_INFO)
{
	npc			= GRD_281_Gardist;
	nr			= 999;
	condition	= DIA_Grd_281_Exit_Condition;
	information	= DIA_Grd_281_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_281_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_281_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Grd_281_GuardGate (C_INFO)
{
	npc				= GRD_281_Gardist;
	nr				= 1;
	condition		= DIA_Grd_281_GuardGate_Condition;
	information		= DIA_Grd_281_GuardGate_Info;
	permanent		= 1;
	description		= "Co s³ychaæ?"; 
};

FUNC INT DIA_Grd_281_GuardGate_Condition()
{	
	if (!C_NpcBelongsToNewcamp (other))
	{	
		return 1;
	};
};
FUNC VOID DIA_Grd_281_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Grd_281_GuardGate_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Grd_281_GuardGate_07_01"); //Wszystko w porz¹dku. Jak okiem siêgn¹æ - ¿adnego bandyty z Nowego Obozu!
	AI_StopProcessInfos	( self );
};

instance dia_grd_281_pickpocket(c_info) {
    npc = grd_281_gardist;
    nr = 900;
    condition = dia_grd_281_pickpocket_condition;
    information = dia_grd_281_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_grd_281_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_grd_281_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_grd_281_pickpocket);
	info_addchoice(dia_grd_281_pickpocket, dialog_back, dia_grd_281_pickpocket_back);
	info_addchoice(dia_grd_281_pickpocket, dialog_pickpocket, dia_grd_281_pickpocket_doit);
};

func void dia_grd_281_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_grd_281_pickpocket);
};

func void dia_grd_281_pickpocket_back() {
    info_clearchoices(dia_grd_281_pickpocket);
};