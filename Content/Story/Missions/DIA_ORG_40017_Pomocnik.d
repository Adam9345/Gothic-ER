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
	description = "Mam eskortowaæ ciê do obozu w kotle.";
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
	AI_Output (other, self,"Info_Pomocnik_Hello_15_00"); //Mam eskortowaæ ciê do obozu w kotle.
	AI_Output (self, other,"Info_Pomocnik_Hello_09_01"); //Ty? Niech bêdzie ale mam nadziejê, ¿e umiesz w³adaæ orê¿em. W tamtej okolicy grasuj¹ ostatnio zbójeckie bandy.
	AI_Output (other, self,"Info_Pomocnik_Hello_15_02"); //Damy sobie radê.
	AI_Output (self, other,"Info_Pomocnik_Hello_09_03"); //Mam nadzieje….
	AI_Output (other, self,"Info_Pomocnik_Hello_15_04"); //Nie marudŸ, ruszamy w drogê.
	AI_Output (self, other,"Info_Pomocnik_Hello_09_05"); //W porz¹dku, obyœmy nie mieli po drodze jakiœ nieprzyjemnych przygód.
	 B_LogEntry              (CennyKwarcyt ,"Zabra³em pomocnika Silasa i ruszyliœmy do Kot³a. Oby oby³o siê bez zbêdnych komplikacji.");
//	 B_SetPermAttitude	(ORG_40017_Pomocnik,    ATT_FRIENDLY);
	Npc_ExchangeRoutine         (ORG_40017_Pomocnik,"Droga");
	Wld_InsertNpc				(NON_40018_Rabus, "FMC_ENTRANCE" );
	Wld_InsertNpc				(NON_40019_Rabus, "FMC_ENTRANCE" );
	Wld_InsertNpc				(NON_40020_Rabus, "FMC_ENTRANCE" );
	ORG_40017_Pomocnik.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ************************************************************
// 						Schürfer
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
	
	AI_Output (self, other,"Info_Pomocnik_Schuerfer_09_00"); //Uda³o siê! Myœla³em, ¿e to wszystko siê nie powiedzie.
	AI_Output (other, self,"Info_Pomocnik_Schuerfer_15_01"); //Wiêcej wiary. Wykonaliœmy misje a rozbójnicy wkrótce bêd¹ po¿ywk¹ dla okolicznych zwierz¹t.
	AI_Output (self, other,"Info_Pomocnik_Schuerfer_09_02"); //Dziêki za pomoc.
	AI_Output (other, self,"Info_Pomocnik_Schuerfer_15_03"); //Nie ma sprawy, zrobiliœmy dobr¹ robotê. W takim razie wracam do Silasa.
	AI_Output (self, other,"Info_Pomocnik_Schuerfer_09_04"); //Trzymaj siê.
	AI_Output (other, self,"Info_Pomocnik_Schuerfer_15_05"); //Na razie. 
	ORG_40017_Pomocnik.aivar[AIV_PARTYMEMBER] = FALSE;
	ORG_40017_Pomocnik.guild = GIL_ORG;
	Npc_ExchangeRoutine         (ORG_40017_Pomocnik,"Stop");
	 B_LogEntry               (CennyKwarcyt,"Pomocnik Silasa dotar³ do Kot³a. Teraz muszê wróciæ do karczmy i z nim pomówiæ.");
	
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














