//poprawione i sprawdzone -  

// ********************************
// 				EXIT
// ********************************

instance DIA_Sld_702_EXIT (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_702_EXIT_Condition;
	information	= DIA_Sld_702_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Sld_702_First (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_First_Condition;
	information	= DIA_Sld_702_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Sld_702_First_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Sld_702_First_Info()
{
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //Wiesz dok¹d leziesz?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //Nie, dok¹d?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //To droga do siedziby naszego przywódcy - Lee.
};

// ********************************
// 				PERM
// ********************************

instance DIA_Sld_702_PERM (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_PERM_Condition;
	information	= DIA_Sld_702_PERM_Info;
	permanent	= 1;
	description = "Co muszê zrobiæ, ¿ebyœ pozwoli³ mi zobaczyæ siê z Lee?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //Co muszê zrobiæ, ¿ebyœ pozwoli³ mi zobaczyæ siê z Lee?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //Nic!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //Tu nie Stary Obóz, a Lee to nie Gomez!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //On nie musi chowaæ siê za plecami ca³ej armii siepaczy. Sam potrafi o siebie zadbaæ.
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //My jesteœmy tu tylko na wypadek, gdyby nas potrzebowa³.
};

instance dia_sld_702_pickpocket(c_info) {
    npc = sld_702_soeldner;
    nr = 900;
    condition = dia_sld_702_pickpocket_condition;
    information = dia_sld_702_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_sld_702_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 30);
};

func void dia_sld_702_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_sld_702_pickpocket);
	info_addchoice(dia_sld_702_pickpocket, dialog_back, dia_sld_702_pickpocket_back);
	info_addchoice(dia_sld_702_pickpocket, dialog_pickpocket, dia_sld_702_pickpocket_doit);
};

func void dia_sld_702_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_sld_702_pickpocket);
};

func void dia_sld_702_pickpocket_back() {
    info_clearchoices(dia_sld_702_pickpocket);
};