//poprawione i sprawdzone -  
/*
// ***************************** 
//				EXIT 
// *****************************

instance DIA_Grd_264_Exit (C_INFO)
{
	npc			= Grd_264_Gardist;
	nr			= 999;
	condition	= DIA_Grd_264_Exit_Condition;
	information	= DIA_Grd_264_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Grd_264_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Grd_264_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
*/
/*------------------------------------------------------------------------
//						GARDEAUFNAHME		und der andere gardist...					
------------------------------------------------------------------------*/
instance Grd_264_Gardist_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_264_Gardist;
	condition		= Grd_264_Gardist_GARDEAUFNAHME_Condition;
	information		= Grd_264_Gardist_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_264_Gardist_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_260_Drake_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_264_Gardist_GARDEAUFNAHME_Info()
{
if (!Npc_KnowsInfo   (hero,DIA_Torrez_Gomez_success))
{
	AI_Output (self, other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_01"); //Hej, nie�le sobie poradzi�e� z tymi pe�zaczami! Zas�u�y�e� na przyj�cie w poczet Stra�nik�w.
	AI_Output (self, other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_02"); //Id� do Starego Obozu i porozmawiaj z Thorusem!
	
	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Jak tylko dostarcz� te jaja powinienem porozmawia� z Thorusem. Mo�e pozwoli mi do��czy� do stra�y.");
	}
	else 
	{
	AI_Output (self, other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_03"); //Wszyscy m�wi� o twoich dokonaniach w kopalni!
	AI_Output (self, other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_04"); //Szkoda, �e wolisz us�ugiwa� Magom. 
};
};