//poprawione i sprawdzone - Reflide

// **************************************************
//						 EXIT 
// **************************************************

instance Info_PrzywodcaS_Exit (C_INFO)
{
	npc				= NON_40006_Przywodca;
	nr				= 999;
	condition		= Info_PrzywodcaS_Exit_Condition;
	information		= Info_PrzywodcaS_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_PrzywodcaS_Exit_Condition()
{
	return 1;
};

func VOID Info_PrzywodcaS_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Przywodca_WhatS(C_INFO)
{
	npc				= NON_40006_Przywodca;
	nr				= 1;
	condition		= Info_Przywodca_WhatS_Condition;
	information		= Info_Przywodca_WhatS_Info;
	permanent		= 0;
    important = TRUE;
};                       

FUNC INT Info_Przywodca_WhatS_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Graham_JadroCorristo))
	{
		return 1;
	};
};
func VOID Info_Przywodca_WhatS_Info()
{

	AI_Output (self, other,"Info_Przywodca_WhatS_05_00"); //O mamy towarzystwo. S¹dz¹c po kiecce to Mag.
	AI_Output (self, other,"Info_Przywodca_WhatS_05_01"); //Przeczuwam, ¿e zaraz siê rozerwiemy...
	AI_Output (other,self, "Info_Przywodca_WhatS_15_02"); //Przyby³em po kryszta³ ognia.
    AI_Output (self, other,"Info_Przywodca_WhatS_05_03"); //Tak siê sk³ada, ¿e my byliœmy pierwsi. Nasi kumple ju¿ robi¹ to co trzeba. Zabierzemy kamieñ i sprzedamy za piêkn¹ sumkê.	
	AI_Output (other,self, "Info_Przywodca_WhatS_15_04"); //Okradliœcie kartografa i chcecie przej¹æ coœ co nale¿y siê Magom z krêgu ognia.
	AI_Output (self, other,"Info_Przywodca_WhatS_05_05"); //Mo¿e i okradliœmy. Nie pierwszy raz kogoœ skroiliœmy i zabiliœmy, ale chyba ¿adnego maga...
	AI_Output (self, other,"Info_Przywodca_WhatS_05_06"); //Zawsze jest ten pierwszy raz. Hahaha!
	AI_Output (self, other,"Info_Przywodca_WhatS_05_07"); //Braæ go!
	AI_Output (other,self, "Info_Przywodca_WhatS_15_08"); //Nie tak szybko! Zaraz trochê podgrzejemy atmosferê!
	 Wld_SendTrigger("GATE_JO");
	 Wld_InsertNpc				(NON_40131_Rabus,"WP_ADD_30");
	 Wld_InsertNpc				(NON_40132_Rabus,"WP_ADD_31");
	 Wld_InsertNpc				(NON_40133_Rabus,"WP_ADD_32");
	AI_StopProcessInfos	(self);
	
	B_LogEntry                     (JadroOgnia ,"Na miejscu spotka³em bandziorów, którzy wykradli wczeœniej mapê. Muszê siê ich natychmiast pozbyæ i zdobyæ kamieñ.");
	  
	  
	B_SetPermAttitude	(NON_40007_Rabus,	ATT_HOSTILE);
	B_SetPermAttitude	(NON_40008_Rabus,	ATT_HOSTILE);
	B_SetPermAttitude	(NON_40006_Przywodca,ATT_HOSTILE);
	
	
	
};

instance dia_przywodcas_pickpocket(c_info) {
    npc = non_40006_przywodca;
    nr = 900;
    condition = dia_przywodcas_pickpocket_condition;
    information = dia_przywodcas_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_przywodcas_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_przywodcas_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_przywodcas_pickpocket);
	info_addchoice(dia_przywodcas_pickpocket, dialog_back, dia_przywodcas_pickpocket_back);
	info_addchoice(dia_przywodcas_pickpocket, dialog_pickpocket, dia_przywodcas_pickpocket_doit);
};

func void dia_przywodcas_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_przywodcas_pickpocket);
};

func void dia_przywodcas_pickpocket_back() {
    info_clearchoices(dia_przywodcas_pickpocket);
};



