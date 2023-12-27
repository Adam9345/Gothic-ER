//poprawione i sprawdzone -  

instance  GUR_1212_MadCorKalom_Talk2SC (C_INFO)
{
	npc				= GUR_1212_MadCorKalom;
	condition		= GUR_1212_MadCorKalom_Talk2SC_Condition;
	information		= GUR_1212_MadCorKalom_Talk2SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return TRUE;
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Nareszcie, znÛw siÍ spotykamy!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //MÛj pan uprzedzi≥ mnie o twoim przybyciu!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //On potrafi wyczuÊ, øe jesteú w pobliøu!
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //WkrÛtce znajdÍ siÍ bliøej niego, niø mÛg≥by sobie tego øyczyÊ!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nie pozwolimy, byú pokrzyøowa≥ nasze plany.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //åwiat doúwiadczy wkrÛtce przebudzenia wielkiego Odkupiciela i nikt nie jest w stanie temu zapobiec.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Wszyscy niewierni zap≥acπ s≥onπ cenÍ.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //A ty bÍdziesz mia≥ zaszczyt byÊ pierwszym z nich.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //åNI•CY, ZBUDè SI !!!

	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "W åwiπtyni åniπcego spotka≥em oszala≥ego Cor Kaloma. Ani trochÍ mnie to nie zdziwi≥o. To chyba moja ostatnia walka z opÍtanym s≥ugami åniπcego. Zauwaøy≥em, øe dawny Guru dosta≥ od åniπcego ma≥y prezent, ktÛry skutecznie utrudni mi jego uúmiercenie. ");
	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
	
	self.guild = GIL_GRD;
	B_ChangeGuild   		 (self,GIL_GRD);  
	
	NOV_1370_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1370_Novize,GIL_GRD); 
	
	NOV_1369_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1369_Novize,GIL_GRD); 
	
	NOV_1368_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1368_Novize,GIL_GRD);

	NOV_1367_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1367_Novize,GIL_GRD); 

	NOV_1366_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1366_Novize,GIL_GRD); 

	NOV_1365_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1365_Novize,GIL_GRD); 

	NOV_1364_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1364_Novize,GIL_GRD); 

	NOV_1363_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1363_Novize,GIL_GRD); 	
	
	NOV_1362_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1362_Novize,GIL_GRD); 
	
	NOV_1361_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1361_Novize,GIL_GRD); 
	
	NOV_1360_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1360_Novize,GIL_GRD);

	NOV_1359_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1359_Novize,GIL_GRD); 


    Sleeper.guild = GIL_GRD;
	B_ChangeGuild   		 (Sleeper,GIL_GRD); 

};