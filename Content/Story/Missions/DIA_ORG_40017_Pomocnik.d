// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Pomocnik_EXIT(C_INFO)
{
	npc			= ORG_40017_Pomocnik ;
	nr			= 999;
	condition	= Info_Pomocnik_EXIT_Condition;
	information	= Info_Pomocnik_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Pomocnik_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Pomocnik_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Pomocnik_Hello(C_INFO)
{
	npc			= ORG_40017_Pomocnik;
	nr			= 1;
	condition	= Info_Pomocnik_Hello_Condition;
	information	= Info_Pomocnik_Hello_Info;
	permanent	= 0;
	description = "Mam eskortowa� ci� do obozu w kotle.";
};                       

FUNC INT Info_Pomocnik_Hello_Condition()

{
if (Npc_KnowsInfo(hero,DIA_Silas_Cyrus_Alcohol_Part))
{
	return 1;
};
};
FUNC VOID Info_Pomocnik_Hello_Info()
{	
	AI_Output (other, self,"Info_Pomocnik_Hello_15_00"); //Mam eskortowa� ci� do obozu w kotle.
	AI_Output (self, other,"Info_Pomocnik_Hello_09_01"); //Ty? Niech b�dzie ale mam nadziej�, �e umiesz w�ada� or�em. W tamtej okolicy grasuj� ostatnio zb�jeckie bandy.
	AI_Output (other, self,"Info_Pomocnik_Hello_15_02"); //Damy sobie rad�.
	AI_Output (self, other,"Info_Pomocnik_Hello_09_03"); //Mam nadzieje�.
	AI_Output (other, self,"Info_Pomocnik_Hello_15_04"); //Nie marud�, ruszamy w drog�.
	AI_Output (self, other,"Info_Pomocnik_Hello_09_05"); //W porz�dku, oby�my nie mieli po drodze jaki� nieprzyjemnych przyg�d.
	 B_LogEntry              (CennyKwarcyt ,"Zabra�em pomocnika Silasa i ruszyli�my do Kot�a. Oby oby�o si� bez zb�dnych komplikacji.");
//	 B_SetPermAttitude	(ORG_40017_Pomocnik,    ATT_FRIENDLY);
	Npc_ExchangeRoutine         (ORG_40017_Pomocnik,"Droga");
	Wld_InsertNpc				(NON_40018_Rabus, "FMC_ENTRANCE" );
	Wld_InsertNpc				(NON_40019_Rabus, "FMC_ENTRANCE" );
	Wld_InsertNpc				(NON_40020_Rabus, "FMC_ENTRANCE" );
	ORG_40017_Pomocnik.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE Info_Pomocnik_Schuerfer(C_INFO)
{
	npc			= ORG_40017_Pomocnik;
	nr			= 1;
	condition	= Info_Pomocnik_Schuerfer_Condition;
	information	= Info_Pomocnik_Schuerfer_Info;
	permanent	= false;
	important   = TRUE;
};                       

FUNC INT Info_Pomocnik_Schuerfer_Condition()
{
	if ( Hlp_StrCmp(Npc_GetNearestWP(self),"FMC_ENTRANCE") ) 
	&& (Npc_KnowsInfo(hero,DIA_Silas_Cyrus_Alcohol_Part))
	{
		return 1;
	};
};

FUNC VOID Info_Pomocnik_Schuerfer_Info()
{	
	
	AI_Output (self, other,"Info_Pomocnik_Schuerfer_09_00"); //Uda�o si�! My�la�em, �e to wszystko si� nie powiedzie.
	AI_Output (other, self,"Info_Pomocnik_Schuerfer_15_01"); //Wi�cej wiary. Wykonali�my misje a rozb�jnicy wkr�tce b�d� po�ywk� dla okolicznych zwierz�t.
	AI_Output (self, other,"Info_Pomocnik_Schuerfer_09_02"); //Dzi�ki za pomoc.
	AI_Output (other, self,"Info_Pomocnik_Schuerfer_15_03"); //Nie ma sprawy, zrobili�my dobr� robot�. W takim razie wracam do Silasa.
	AI_Output (self, other,"Info_Pomocnik_Schuerfer_09_04"); //Trzymaj si�.
	AI_Output (other, self,"Info_Pomocnik_Schuerfer_15_05"); //Na razie. 
	ORG_40017_Pomocnik.aivar[AIV_PARTYMEMBER] = FALSE;
	ORG_40017_Pomocnik.guild = GIL_ORG;
	Npc_ExchangeRoutine         (ORG_40017_Pomocnik,"Stop");
	 B_LogEntry               (CennyKwarcyt,"Pomocnik Silasa dotar� do Kot�a. Teraz musz� wr�ci� do karczmy i z nim pom�wi�.");
	
};

instance dia_pomocnik_pickpocket(c_info) {
    npc = org_40017_pomocnik;
    nr = 900;
    condition = dia_pomocnik_pickpocket_condition;
    information = dia_pomocnik_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pomocnik_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_pomocnik_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pomocnik_pickpocket);
	info_addchoice(dia_pomocnik_pickpocket, dialog_back, dia_pomocnik_pickpocket_back);
	info_addchoice(dia_pomocnik_pickpocket, dialog_pickpocket, dia_pomocnik_pickpocket_doit);
};

func void dia_pomocnik_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_pomocnik_pickpocket);
};

func void dia_pomocnik_pickpocket_back() {
    info_clearchoices(dia_pomocnik_pickpocket);
};


//-----------==-=-===--==-=-=--------------------=--=-=-=-=-=-=-=-=-=-=-














