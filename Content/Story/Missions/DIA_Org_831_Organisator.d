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
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_02"); //Ach, daj mi spokój. Pilnujê bramy.
    AI_Output (other, self ,"DIA_OrganisatorPupil_HELLO1_15_03"); //Co mo¿esz mi powiedzieæ o Obozie?
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_04"); //Jesteœ bardzo nachalny... Powinieneœ wiedzieæ, komu nale¿y ufaæ. W Nowym Obozie ka¿dy musi radziæ sobie sam.
    AI_Output (other, self ,"DIA_OrganisatorPupil_HELLO1_15_05"); //Na przyk³ad, komu powinienem zaufaæ?
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_06"); //Mojemu kumplowi Lewusowi - idŸ do niego na pola ry¿owe. Z pewnoœci¹ znajdzie dla ciebie jak¹œ pracê.
    AI_Output (other, self ,"DIA_OrganisatorPupil_HELLO1_15_07"); //Dziêki za radê.
    AI_Output (self, other ,"DIA_OrganisatorPupil_HELLO1_03_08"); //He he. Jeszcze mi podziêkujesz, mo¿esz byæ tego pewien. 
};

