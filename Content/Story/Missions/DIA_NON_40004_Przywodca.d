//poprawione i sprawdzone - Reflide

// **************************************************
//						 EXIT 
// **************************************************

instance Info_Przywodca_Exit (C_INFO)
{
	npc				= NON_40004_Przywodca;
	nr				= 999;
	condition		= Info_Przywodca_Exit_Condition;
	information		= Info_Przywodca_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Przywodca_Exit_Condition()
{
	return 1;
};

func VOID Info_Przywodca_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Przywodca_What(C_INFO)
{
	npc				= NON_40004_Przywodca;
	nr				= 1;
	condition		= Info_Przywodca_What_Condition;
	information		= Info_Przywodca_What_Info;
	permanent		= 0;
    important = TRUE;
};                       

FUNC INT Info_Przywodca_What_Condition()
{	
	if (Npc_KnowsInfo (hero,Info_Kirgo_Przesylka_Corristo))
	{
		return 1;
	};
};
func VOID Info_Przywodca_What_Info()
{

	AI_Output (self, other,"Info_Przywodca_What_05_00"); //O jakiegoœ cienia tu przywia³o! Zaraz go odwieje tylko, ¿e martwego!
	AI_Output (other,self, "Info_Przywodca_What_15_01"); //Wiêc to tak. Zamordowaliœcie jednego ze Stra¿ników a potem jeden z was w przebraniu okrad³ plac wymian!	
	AI_Output (self, other,"Info_Przywodca_What_05_02"); //Sprytny plan i jak siê okaza³o skuteczny! Jak ciê zabijemy to jeszcze go powtórzymy!
    AI_Output (other,self, "Info_Przywodca_What_15_03"); //Nie pozwolê wam na to. 
	AI_Output (self, other,"Info_Przywodca_What_05_04"); //W takim razie zdychaj kundelku. Ch³opcy braæ go! Migiem!
	AI_Output (other,self, "Info_Przywodca_What_15_05"); //To siê jeszcze oka¿e.
	AI_StopProcessInfos	(self);
	
	  B_LogEntry                     (PrzesylkaCorristo ,"Okaza³o siê, ¿e za wszystkim stoi szajka rozbójników. Po cichu zabili jednego ze Stra¿ników a potem ich przywódca przebra³ siê za niego i okrad³ plac wymian. Teraz nadszed³ czas by wyeliminowaæ tych drani i odzyskaæ skradzione towary. Ciekawe co na to Orry...");
	
	B_SetPermAttitude	(NON_40002_Rabus,    ATT_HOSTILE);
	B_SetPermAttitude	(NON_40003_Rabus,	 ATT_HOSTILE);
	B_SetPermAttitude	(NON_40004_Przywodca,ATT_HOSTILE);
	B_SetPermAttitude	(NON_40005_Rabus,	 ATT_HOSTILE);
	
	
	
	    /*
	    NON_40002_Rabus.guild = GIL_GOBBO;
	    NON_40003_Rabus.guild = GIL_GOBBO;
	    NON_40004_Przywodca.guild = GIL_GOBBO;
	    NON_40005_Rabus.guild = GIL_GOBBO;
	    
		Npc_SetTrueGuild	(NON_40002_Rabus,GIL_GOBBO);
		Npc_SetTrueGuild	(NON_40003_Rabus,GIL_GOBBO);
		Npc_SetTrueGuild	(NON_40004_Przywodca,GIL_GOBBO);
		Npc_SetTrueGuild	(NON_40005_Rabus,GIL_GOBBO);
		*/
	
	
};





