func void B_Give_WolfChapter1Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_855_Wolf);
	
	//-------- Nahkampfwaffen --------
		
	
	
	//-------- Fernkampfwaffen --------
	CreateInvItem (npc,ItRw_Bow_Small_02);
	CreateInvItem (npc,ItRw_Bow_Small_01);
	
	CreateInvItems (npc,ItAm_Quiver,5);
	CreateInvItems (npc,ItAm_BQuiver,5);
	
	CreateInvItems (npc,ItMiNugget,140);
	CreateInvItem (npc,ItWr_Bloodfly_01);
	//-------- Belts --------
  
 
};

func void B_Give_WolfChapter2Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_855_Wolf);
	
	//-------- Nahkampfwaffen --------
	
	
	
	//-------- Fernkampfwaffen --------
	CreateInvItem (npc,ItRw_Bow_Small_03);
	CreateInvItem (npc,ItRw_Bow_Small_04);
	CreateInvItem (npc,ItRw_Bow_Small_05);
	CreateInvItem (npc,ItRw_Bow_Long_01);
	
	
	CreateInvItems (npc,ItAm_Quiver_50,6);
	CreateInvItems (npc,ItAm_BQuiver_50,6);
	CreateInvItems (npc,ItMiNugget,100);
	//-------- Munition --------
    CreateInvItem (npc,ItRe_StrengthBelt);
    CreateInvItem (npc,ItRe_ProtectionBelt);
};

func void B_Give_WolfChapter3Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_855_Wolf);
	
	//-------- Nahkampfwaffen --------
	
	//-------- Fernkampfwaffen --------
	CreateInvItem (npc,ItRw_Bow_Long_02);	
 	CreateInvItem (npc,ItRw_Bow_Long_03);	
 	CreateInvItem (npc,ItRw_Bow_Long_04);	
 	CreateInvItem (npc,ItRw_Bow_Long_05);	
 
 	CreateInvItems (npc,ItAm_Quiver,6);
	CreateInvItems (npc,ItAm_BQuiver,6);
 	CreateInvItems (npc,ItMiNugget,200);
 	//-------- Munition --------
    CreateInvItem (npc,ItRe_SldBelt);
    CreateInvItem (npc,ItRe_PowerBelt);
    
};

func void B_Give_WolfChapter4Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_855_Wolf);
	
	//-------- Nahkampfwaffen --------
		
		CreateInvItems (npc,ItMiNugget,275);
	//-------- Fernkampfwaffen --------
	CreateInvItem (npc,ItRw_Bow_Long_06);
	CreateInvItem (npc,ItRw_Bow_Long_07);
	CreateInvItems (npc,ItAm_Quiver_100,8);
	CreateInvItems (npc,ItAm_BQuiver_100,8);
	CreateInvItem (npc,ItRw_Bow_Long_08);
	

		
		
	//-------- Belts --------
    CreateInvItem (npc,ItRe_CrawlerBelt);
};

func void B_Give_WolfChapter5Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_855_Wolf);
	
	//-------- Nahkampfwaffen --------
	CreateInvItems (npc,ItMiNugget,200);
	//-------- Fernkampfwaffen --------
	CreateInvItem (npc,ItRw_Bow_Long_09);
	CreateInvItem (npc,ItRw_Bow_War_01);
	CreateInvItem (npc,ItRw_Bow_War_02);
	CreateInvItems (npc,ItAm_Quiver,8);
	CreateInvItems (npc,ItAm_BQuiver,8);
	CreateInvItem (npc,ItRw_Bow_War_03);
	
	
	
	
	//-------- Munition --------
  
};

func void B_Give_WolfChapter6Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_855_Wolf);
	
	//-------- Nahkampfwaffen --------

	CreateInvItems (npc,ItMiNugget,230);
	//-------- Fernkampfwaffen --------
	CreateInvItem (npc,ItRw_Bow_War_04);
	CreateInvItem (npc,ItRw_Bow_War_05);
	CreateInvItems (npc,ItAm_Quiver_50,8);
	CreateInvItems (npc,ItAm_BQuiver_50,8);
	//-------- Munition --------
  
};