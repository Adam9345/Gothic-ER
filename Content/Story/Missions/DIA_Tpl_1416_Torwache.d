//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tpl_1416_Torwache_Exit (C_INFO)
{
	npc			= Tpl_1416_Templer;
	nr			= 999;
	condition	= DIA_Tpl_1416_Torwache_Exit_Condition;
	information	= DIA_Tpl_1416_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tpl_1416_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tpl_1416_Torwache_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Wie ist das Leben hier
// **************************************************

INSTANCE DIA_Tpl_1416_Torwache_Life (C_INFO)
{
	npc				= Tpl_1416_Templer;
	nr				= 1;
	condition		= DIA_Tpl_1416_Torwache_Life_Condition;
	information		= DIA_Tpl_1416_Torwache_Life_Info;
	permanent		= 1;
	description		= "Jak wygl¹da ¿ycie stra¿ników Bractwa?";
};

FUNC INT DIA_Tpl_1416_Torwache_Life_Condition()
{	
	return 1;
};

FUNC VOID DIA_Tpl_1416_Torwache_Life_Info()
{
	AI_Output (other, self,"DIA_Tpl_1416_Torwache_Life_15_00"); //Jak wygl¹da ¿ycie stra¿ników Bractwa?
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_01"); //Otrzyma³em niezwykle wa¿ne zadanie. Jaœnie Oœwiecony i jego uczniowie z³o¿yli swe ¿ycie w moich rêkach.
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_02");	//Niech cieñ zapomnienia pokryje moje dawne ¿ycie. Teraz jestem GOR NA - Œwiêty Stra¿nik Œni¹cego!
};

instance dia_tpl_1416_pickpocket(c_info) {
    npc = tpl_1416_templer;
    nr = 900;
    condition = dia_tpl_1416_pickpocket_condition;
    information = dia_tpl_1416_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_tpl_1416_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_tpl_1416_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_tpl_1416_pickpocket);
	info_addchoice(dia_tpl_1416_pickpocket, dialog_back, dia_tpl_1416_pickpocket_back);
	info_addchoice(dia_tpl_1416_pickpocket, dialog_pickpocket, dia_tpl_1416_pickpocket_doit);
};

func void dia_tpl_1416_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_tpl_1416_pickpocket);
};

func void dia_tpl_1416_pickpocket_back() {
    info_clearchoices(dia_tpl_1416_pickpocket);
};