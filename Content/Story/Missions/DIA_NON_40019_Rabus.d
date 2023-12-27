// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Rabus_EXIT(C_INFO)
{
	npc			= NON_40019_Rabus ;
	nr			= 999;
	condition	= Info_Rabus_EXIT_Condition;
	information	= Info_Rabus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Rabus_EXIT_Condition()
{
if (Npc_KnowsInfo(hero,Info_Pomocnik_Hello))
{
	return 1;
};
};
FUNC VOID Info_Rabus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


func void ORGQUARTZ_hostile()
{
  AI_Wait( NON_40018_Rabus, 6); 
  AI_Wait( NON_40019_Rabus, 6 ); 
  AI_Wait( NON_40020_Rabus, 6); 
  AI_Wait( ORG_40017_Pomocnik, 6); 
  NON_40018_Rabus.guild = GIL_DEMON;
  NON_40019_Rabus.guild = GIL_DEMON;
  NON_40020_Rabus.guild = GIL_DEMON;



};
// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Rabus_Hello(C_INFO)
{
	npc			= NON_40019_Rabus;
	nr			= 1;
	condition	= Info_Rabus_Hello_Condition;
	information	= Info_Rabus_Hello_Info;
	permanent	= 0;
	important   = TRUE;
};                       

FUNC INT Info_Rabus_Hello_Condition()

{
if (Npc_KnowsInfo(hero,Info_Pomocnik_Hello))
{
	return 1;
};
};
FUNC VOID Info_Rabus_Hello_Info()
{	

	AI_Output (self, other,"Info_Rabus_Hello_09_01"); //No proszê, kogo my tu mamy! Ktoœ chyba zaraz odda nam wszystko co posiada.
	AI_Output (other, self,"Info_Rabus_Hello_15_02"); //Nie ma mowy!
		ORGQUARTZ_hostile();
	AI_Output (self, other,"Info_Rabus_Hello_09_03"); //W takim razie dacie gardzio³ki pod nasze miecze!
	AI_Output (other, self,"Info_Rabus_Hello_15_04"); //Obawiam siê ¿e bêdzie odwrotnie.
	AI_Output (self, other,"Info_Rabus_Hello_09_05"); //Dobra ch³opcy, skopcie im dupy! I porz¹dnie obszukajcie ich truch³a!
	AI_Output (other, self,"Info_Rabus_Hello_15_06"); //Zapraszam!
   
   
	 B_LogEntry              (CennyKwarcyt ,"Oczywiœcie problemy jednak siê pojawi³y. Spotkaliœmy bandê rozbójników, którzy postanowili nas okraœæ i zaszlachtowaæ jak owce.");
	AI_StopProcessInfos	(self);
	
};


