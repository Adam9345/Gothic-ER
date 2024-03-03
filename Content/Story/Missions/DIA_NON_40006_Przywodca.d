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

	AI_Output (self, other,"Info_Przywodca_WhatS_05_00"); //O mamy towarzystwo. S�dz�c po kiecce to Mag.
	AI_Output (self, other,"Info_Przywodca_WhatS_05_01"); //Przeczuwam, �e zaraz si� rozerwiemy...
	AI_Output (other,self, "Info_Przywodca_WhatS_15_02"); //Przyby�em po kryszta� ognia.
    AI_Output (self, other,"Info_Przywodca_WhatS_05_03"); //Tak si� sk�ada, �e my byli�my pierwsi. Nasi kumple ju� robi� to co trzeba. Zabierzemy kamie� i sprzedamy za pi�kn� sumk�.	
	AI_Output (other,self, "Info_Przywodca_WhatS_15_04"); //Okradli�cie kartografa i chcecie przej�� co� co nale�y si� Magom z kr�gu ognia.
	AI_Output (self, other,"Info_Przywodca_WhatS_05_05"); //Mo�e i okradli�my. Nie pierwszy raz kogo� skroili�my i zabili�my, ale chyba �adnego maga...
	AI_Output (self, other,"Info_Przywodca_WhatS_05_06"); //Zawsze jest ten pierwszy raz. Hahaha!
	AI_Output (self, other,"Info_Przywodca_WhatS_05_07"); //Bra� go!
	AI_Output (other,self, "Info_Przywodca_WhatS_15_08"); //Nie tak szybko! Zaraz troch� podgrzejemy atmosfer�!
	 Wld_SendTrigger("GATE_JO");
	 Wld_InsertNpc				(NON_40131_Rabus,"WP_ADD_30");
	 Wld_InsertNpc				(NON_40132_Rabus,"WP_ADD_31");
	 Wld_InsertNpc				(NON_40133_Rabus,"WP_ADD_32");
	AI_StopProcessInfos	(self);
	
	B_LogEntry                     (JadroOgnia ,"Na miejscu spotka�em bandzior�w, kt�rzy wykradli wcze�niej map�. Musz� si� ich natychmiast pozby� i zdoby� kamie�.");
	  
	  
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



