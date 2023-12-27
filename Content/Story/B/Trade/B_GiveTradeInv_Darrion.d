func void B_Give_DarrionChapter1Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_1H_Club_01);
	CreateInvItem (npc,ItMw_1H_Sledgehammer_01);
	CreateInvItem (npc,ItMw_1H_Mace_Light_01);
	CreateInvItem (npc,ItMw_1H_Hatchet_01);
	CreateInvItem (npc,ItMw_1H_Nailmace_01);
	//1h lekkie
	CreateInvItems (npc,Miecz1H6,1);
	CreateInvItems	(self,	ItMi_IronNugget,   10);
	//2h lekkie er 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_01);
	CreateInvItem (npc,ItMw_2H_Sword_Old_02);
	CreateInvItem (npc,ItMw_2H_Axe_Big_03);
	CreateInvItem (npc,ItMw_2H_Sword_New_01);
	
	//CreateInvItem (npc,ItMw_Addon_BanditTrader);
	CreateInvItem (npc,ItMw_Dagger);
	CreateInvItem (npc,ItMw_Dagger2);
	//CreateInvItem (npc,ItMw_Dagger3);
	//-------- Fernkampfwaffen --------


	//-------- Munition --------
  	CreateInvItems (npc,ItAm_Quiver,5);
	CreateInvItems (npc,ItAm_BQuiver,5);
	CreateInvItems (npc,ItMiNugget,150);
};

func void B_Give_DarrionChapter2Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_1H_Mace_01);
	CreateInvItem (npc,ItMw_1H_Mace_02);
	CreateInvItem (npc,ItMw_1H_Mace_03);
	CreateInvItem (npc,ItMw_1H_Mace_04);
	CreateInvItem (npc,ItMw_1H_Mace_War_01);
	CreateInvItem (npc,ItMw_1H_Mace_War_02);
	CreateInvItem (npc,ItMw_1H_Mace_War_03); 
	//2h er lekkie 1.4.5.v7
	CreateInvItem (npc,ItMw_2H_Axe_Big_04);
	CreateInvItem (npc,ItMw_2H_Sword_New_02);
	//-------- Fernkampfwaffen --------
	
 
	//-------- Munition --------
	CreateInvItems (npc,ItAm_Quiver_50,3);
	CreateInvItems (npc,ItAm_BQuiver_50,3);
	CreateInvItems (npc,ItMiNugget,200);
	//-------- Plany kowalaskie --------
	CreateInvItem (npc,Plan1b); 
	CreateInvItem (npc,ItRe_ArmorBelt); 
//	
//	CreateInvItem (npc,Plan2b); 

};

func void B_Give_DarrionChapter3Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	
	CreateInvItem (npc,ItMw_1H_Warhammer_02); 
	CreateInvItem (npc,ItMw_1H_Warhammer_03); 
	
	CreateInvItems	(self, ItKeLockpick,30);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_01);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_02);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_03);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_04);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_04);
	CreateInvItems	(npc,	ItMw_1H_Sword_Broad_01,1);
	CreateInvItems	(self,	ItMi_IronNugget,   10);
	//tępy miecz półtoraroczny
	
	//er 1.4.5 v7 ch3
	CreateInvItem	(npc,	ItMw_2H_Sword_New_02); 
	CreateInvItem	(npc,	ItMw_2H_Sword_New_03);
	CreateInvItem	(npc,	ItMw_2h_Sword_Solid_01);
	//-------- Fernkampfwaffen --------

 
	//-------- Munition --------
CreateInvItems (npc,ItAm_Quiver_50,4);
	CreateInvItems (npc,ItAm_BQuiver_50,4);
	CreateInvItems (npc,ItMiNugget,250);
	//-------- Plany kowalaskie --------
	CreateInvItem (npc,Plan_Rapier); 
	CreateInvItem (npc,ItRe_TempleBelt); 
	
//	CreateInvItem (npc,Plan1c);
//	CreateInvItem (npc,Plan3b); 
//	CreateInvItem (npc,Plan4b); 
  
};

func void B_Give_DarrionChapter4Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem	(npc,	ItMw_2H_Sword_New_05);
	
	CreateInvItem (npc,ItMw_2H_Sword_Old_01); 
	CreateInvItem (npc,ItMw_2H_Sword_Light_01);
	//CreateInvItem (npc,ItMw_2H_Sword_Light_02); 
	CreateInvItem (npc,ItMw_2H_Sword_Light_03); 
    CreateInvItems (npc,ItAm_Quiver_50,4);
	CreateInvItems (npc,ItAm_BQuiver_50,4);
	CreateInvItems (npc,ItMiNugget,345);
	//-------- Fernkampfwaffen --------
	CreateInvItem 	(npc,	Miecz1H_P_1); 
 
	//-------- Munition --------
  
	//plany kowalskie 
	CreateInvItem (npc,Plan3b); 
};

func void B_Give_DarrionChapter5Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	CreateInvItem (npc,ItMw_2H_Sword_Light_04); 
	CreateInvItem (npc,ItMw_2H_Sword_Light_05); 
	CreateInvItem (npc,ItMw_2H_Sword_01); 
	CreateInvItem (npc,ItMw_2H_Sword_02); 
	CreateInvItem (npc,ItMw_2H_Sword_03); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_01); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_02); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_03); 
	CreateInvItem (npc,ItMw_2H_Sword_Heavy_04); 

	CreateInvItems (npc,ItMiNugget,1000);
    CreateInvItems (npc,ItAm_Quiver_50,4);
	CreateInvItems (npc,ItAm_BQuiver_50,4);
	//-------- Fernkampfwaffen --------
	//-------- Munition --------
//	CreateInvItem (npc,Plan5b); 
//	CreateInvItem (npc,Plan5);
//	CreateInvItem (npc,Plan5c); 
//	CreateInvItem (npc,Plan7b); 
//	CreateInvItem (npc,Plan8); 
	
	CreateInvItem 	(npc,	Miecz1H_P_2); 
	CreateInvItem 	(npc,	Axe1H_P_1);
	CreateInvItem 	(npc,	Miecz1H_P_3);	
  
};

func void B_Give_DarrionChapter6Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1312_Darrion);
	
	//-------- Nahkampfwaffen --------
	
	CreateInvItems (npc,ItMiNugget,550);
	//-------- Fernkampfwaffen --------
	

	//-------- Munition --------
  
  CreateInvItem (npc,Plan7b); 
};

