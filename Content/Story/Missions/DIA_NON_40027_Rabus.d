//poprawione i sprawdzone -  

// ********************************
// 				EXIT
// ********************************

instance DIA_Rabus_EXIT (C_INFO)
{
	npc			= NON_40027_Rabus;
	nr			= 999;
	condition	= DIA_Rabus_EXIT_Condition;
	information	= DIA_Rabus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Rabus_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Rabus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Rabus_First (C_INFO)
{
	npc			= NON_40027_Rabus;
	nr			= 1;
	condition	= DIA_Rabus_First_Condition;
	information	= DIA_Rabus_First_Info;
	permanent	= 0;
	description = "O jest i nasz wspania�y z�odziej";
};                       

FUNC int DIA_Rabus_First_Condition()
{
	 if (Npc_KnowsInfo (hero, DIA_BaalCadar_Krysztaly))  
	{
		return 1;
	};
};

FUNC VOID  DIA_Rabus_First_Info()
{
	AI_Output (other, self,"DIA_Rabus_First_15_00"); //O jest i nasz wspania�y z�odziej!
	AI_Output (self, other,"DIA_Rabus_First_04_01"); //Eeeee... Nie wiem o czym m�wisz Baalu.
	AI_Output (other, self,"DIA_Rabus_First_15_02"); //O kryszta�ach, kt�re masz przy sobie.
	AI_Output (self, other,"DIA_Rabus_First_04_03"); //Ja nic nie wiem...
	AI_Output (other, self,"DIA_Rabus_First_15_04"); //Za to ja wiem. Teraz do��czysz do swoich towarzyszy, kt�rzy w�chaj� ju� kwiatki od do�u!
	AI_Output (self, other,"DIA_Rabus_First_04_05"); //Nie b�agam! Prosz� lito�ci! Oddam te kryszta�y!
	
	
	
	Info_ClearChoices	(DIA_Rabus_First);
	Info_AddChoice		(DIA_Rabus_First, "hs@FF0000 Po�a�ujesz tego co zrobi�e�. Gi�!", DIA_Rabus_First_Add1);
    Info_AddChoice		(DIA_Rabus_First, "Jeste� zwyk�ym robakiem. Nie warto brudzi� sobie tob� r�k.", DIA_Rabus_First_Add2);
	
};
FUNC VOID DIA_Rabus_First_Add1()
{
    AI_Output (other, self ,"DIA_Rabus_First_Add1_15_01"); //Po�a�ujesz tego co zrobi�e�. Gi�!
    AI_Output (self, other ,"DIA_Rabus_First_Add1_03_02"); //Na pewno? B�d� walczy�!
   	AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");  
    B_LogEntry                     (LepkieReceNowicjuszy,"Odnalaz�em ostatniego Nowicjusza i pos�a�em go do Beliara. Teraz mam ju� wszystkie kryszta�y.");	
	
};

FUNC VOID DIA_Rabus_First_Add2()
{
    AI_Output (other, self ,"DIA_Rabus_First_Add2_15_01"); //Jeste� zwyk�ym robakiem. Nie warto brudzi� sobie tob� r�k. Zje�d�aj!
    AI_Output (self, other ,"DIA_Rabus_First_Add2_03_02"); //Dzi�kuje. Ju� mnie nie ma. Wynosz� si� st�d.
	AI_StandUp(NON_40027_Rabus);
    B_GiveInvItems	(self,hero, ItMi_Cadar_Crystal1, 3);
	Npc_ExchangeRoutine (NON_40027_Rabus,"SIT");
    B_LogEntry                     (LepkieReceNowicjuszy,"Odszuka�em ostatniego Nowicjusza. Odebra�em mu kryszta�y cho� darowa�em mu �ycie. Natychmiast uciek� najdalej gdzie si� da.");
	AI_StopProcessInfos	(self);
	
};

instance dia_non_40027_pickpocket(c_info) {
    npc = non_40027_rabus;
    nr = 900;
    condition = dia_non_40027_pickpocket_condition;
    information = dia_non_40027_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_40027_pickpocket_condition() {
	e_beklauen(baseThfChanceNOV, 30);
};

func void dia_non_40027_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_40027_pickpocket);
	info_addchoice(dia_non_40027_pickpocket, dialog_back, dia_non_40027_pickpocket_back);
	info_addchoice(dia_non_40027_pickpocket, dialog_pickpocket, dia_non_40027_pickpocket_doit);
};

func void dia_non_40027_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_non_40027_pickpocket);
};

func void dia_non_40027_pickpocket_back() {
    info_clearchoices(dia_non_40027_pickpocket);
};