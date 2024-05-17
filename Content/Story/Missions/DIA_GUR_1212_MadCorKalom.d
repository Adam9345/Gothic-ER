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
	if (Npc_GetDistToNpc (self, other) < 1000) {
		return TRUE;
	};
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Nareszcie, znów siê spotykamy!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Mój pan uprzedzi³ mnie o twoim przybyciu!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //On potrafi wyczuæ, ¿e jesteœ w pobli¿u!
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Wkrótce znajdê siê bli¿ej niego, ni¿ móg³by sobie tego ¿yczyæ!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nie pozwolimy, byœ pokrzy¿owa³ nasze plany.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Œwiat doœwiadczy wkrótce przebudzenia wielkiego Odkupiciela i nikt nie jest w stanie temu zapobiec.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Wszyscy niewierni zap³ac¹ s³on¹ cenê.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //A ty bêdziesz mia³ zaszczyt byæ pierwszym z nich.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //ŒNI¥CY, ZBUD SIÊ!!!

	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "W Œwi¹tyni Œni¹cego spotka³em oszala³ego Cor Kaloma. Ani trochê mnie to nie zdziwi³o. To chyba moja ostatnia walka z opêtanym s³ugami Œni¹cego. Zauwa¿y³em, ¿e dawny Guru dosta³ od Œni¹cego ma³y prezent, który skutecznie utrudni mi jego uœmiercenie. ");
	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
	
	//self.guild = GIL_GRD;
	B_ChangeGuild   		 (self,GIL_BDT);  
	
	//NOV_1370_Novize.guild = GIL_BDT;
	B_ChangeGuild   		 (NOV_1370_Novize,GIL_BDT); 
	
	//NOV_1369_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1369_Novize,GIL_BDT); 
	
	//NOV_1368_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1368_Novize,GIL_BDT);

	//NOV_1367_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1367_Novize,GIL_BDT); 

	//NOV_1366_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1366_Novize,GIL_BDT); 

	//NOV_1365_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1365_Novize,GIL_BDT); 

	//NOV_1364_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1364_Novize,GIL_BDT); 

	//NOV_1363_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1363_Novize,GIL_BDT); 	
	
	//NOV_1362_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1362_Novize,GIL_BDT); 
	
	//NOV_1361_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1361_Novize,GIL_BDT); 
	
	//NOV_1360_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1360_Novize,GIL_BDT);

	//NOV_1359_Novize.guild = GIL_GRD;
	B_ChangeGuild   		 (NOV_1359_Novize,GIL_BDT); 


    //Sleeper.guild = GIL_GRD;
	B_ChangeGuild   		 (Sleeper,GIL_BDT); 

	AI_Function (hero, SetSleeperAttack);
};

func void SetSleeperAttack () {
	FF_ApplyOnceExtGT (DelaySleeperAttack, 5000, 1);
};

func void DelaySleeperAttack () {
	SLF_FIRE = TRUE;
};