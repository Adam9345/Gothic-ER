// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_OrganisatorPupil_EXIT(C_INFO)
{
	npc             = Org_831_Organisator;
	nr              = 999;
	condition	= DIA_OrganisatorPupil_EXIT_Condition;
	information	= DIA_OrganisatorPupil_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_OrganisatorPupil_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OrganisatorPupil_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_OrganisatorPupil_HELLO1 (C_INFO)
{
   npc          = Org_831_Organisator;
   nr           = 1;
   condition    = DIA_OrganisatorPupil_HELLO1_Condition;
   information  = DIA_OrganisatorPupil_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_OrganisatorPupil_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_OrganisatorPupil_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_OrganisatorPupil_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_02"); //Ach, daj mi spok�j. Pilnuj� bramy.
    AI_Output (other, self ,"DIA_OrganisatorPupil_HELLO1_15_03"); //Co mo�esz mi powiedzie� o Obozie?
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_04"); //Jeste� bardzo nachalny... Powiniene� wiedzie�, komu nale�y ufa�. W Nowym Obozie ka�dy musi radzi� sobie sam.
    AI_Output (other, self ,"DIA_OrganisatorPupil_HELLO1_15_05"); //Na przyk�ad, komu powinienem zaufa�?
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_06"); //Mojemu kumplowi Lewusowi - id� do niego na pola ry�owe. Z pewno�ci� znajdzie dla ciebie jak�� prac�.
    AI_Output (other, self ,"DIA_OrganisatorPupil_HELLO1_15_07"); //Dzi�ki za rad�.
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_08"); //He he. Jeszcze mi podzi�kujesz, mo�esz by� tego pewien. 
};

instance dia_org_831_pickpocket(c_info) {
    npc = org_831_organisator;
    nr = 900;
    condition = dia_org_831_pickpocket_condition;
    information = dia_org_831_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_831_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 35);
};

func void dia_org_831_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_831_pickpocket);
	info_addchoice(dia_org_831_pickpocket, dialog_back, dia_org_831_pickpocket_back);
	info_addchoice(dia_org_831_pickpocket, dialog_pickpocket, dia_org_831_pickpocket_doit);
};

func void dia_org_831_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_831_pickpocket);
};

func void dia_org_831_pickpocket_back() {
    info_clearchoices(dia_org_831_pickpocket);
};