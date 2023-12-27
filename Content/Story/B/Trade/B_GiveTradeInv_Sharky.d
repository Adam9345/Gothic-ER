func void B_Give_SharkyChapter1Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
	
	
	//2h lekkie er 1.4.5.v7

	//-------- Fernkampfwaffen --------
	//-------- Munition --------
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,10);
  	CreateInvItems (npc,ItMiNugget,130);
	CreateInvItems	(npc, ItKeLockpick,10);
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,3);
	CreateInvItems  (self,itmiflask,100);
};

func void B_Give_SharkyChapter2Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
	
	//-------- Fernkampfwaffen --------
	//-------- Munition --------
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,10);
	CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,2);
	CreateInvItems (npc,ItFo_SeaHerb ,5);
	CreateInvItems (npc,ItFo_ForestHerb ,5);
	CreateInvItems (npc,ItFo_Konfitura ,2);
	CreateInvItems (self,itmiflask,30);
	CreateInvItems (npc, ItKeLockpick,20);
	CreateInvItems (npc,ItMiNugget,150);
};

func void B_Give_SharkyChapter3Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------

	CreateInvItem (npc,ItMw_1H_Warhammer_02);
	

	
	//-------- Fernkampfwaffen --------
		CreateInvItems (npc,ItFo_Konfitura ,10);
 	//-------- Munition --------
  	CreateInvItems (npc,ItMiNugget,300);
	CreateInvItems	(npc, ItKeLockpick,30);

};

func void B_Give_SharkyChapter4Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------
    CreateInvItems	(npc, ItMi_Alchemy_Salt_01,10);
	CreateInvItems (npc,ItMiNugget,250);
	CreateInvItems	(npc, ItKeLockpick,20);
	//-------- Fernkampfwaffen --------

	//-------- Munition --------
    CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,2);
    CreateInvItems	(npc, ItMw_2H_Axe_Old_02,1);

};

func void B_Give_SharkyChapter5Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	
	//-------- Nahkampfwaffen --------


	CreateInvItems  (npc,ItMiNugget,400);
	CreateInvItems	(npc, ItKeLockpick,10);
    CreateInvItems	(npc, ItMi_Alchemy_Salt_01,10);
	//-------- Fernkampfwaffen --------
	CreateInvItems  (self,itmiflask,30);
	//-------- Munition --------
  
};

func void B_Give_SharkyChapter6Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_843_Sharky);
	CreateInvItems (npc,ItFo_ForestHerb ,5);
	CreateInvItems (npc,ItFo_Konfitura ,10);


	CreateInvItems (npc,ItMiNugget,270);
    CreateInvItems	(npc, ItMi_Alchemy_Salt_01,10);

	
};

