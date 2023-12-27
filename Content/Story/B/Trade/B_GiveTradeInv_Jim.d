func void B_GiveJimItemsCH1 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
		//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,5);
	CreateInvItems (npc,ItArScrollLight,5);
	CreateInvItems (npc,ItArScrollThunderbolt,3);
	CreateInvItems (npc,ItArScrollIcecube,1);
	//--------- Boooks -------------
	CreateInvItem (npc,ItWr_Book_Circle_01);
	CreateInvItem (npc,ItWr_Book_Circle_02);
	CreateInvItem (npc,ItWr_Book_Circle_03);
	CreateInvItem (npc,Ring_der_Magie);
	
	//-------- POTIONS --------
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,6);
	CreateInvItems (npc,ItFo_Potion_Health_01 ,4);
	CreateInvItems (npc,ItFo_Potion_Water_01 ,10);
	CreateInvItems (npc,ItFo_Potion_Haste_01 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Dex_01 ,2);
	CreateInvItems (npc,ItFo_PotionTime_Strength_01 ,2);
	CreateInvItems (self,ItMi_Bandaz40,10);
	CreateInvItems  (self,itmiflask,12);
	CreateInvItems  (self,itminugget,150);
};

func void B_GiveJimItemsCH2 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,5);
	CreateInvItems (npc,ItArScrollLight,5);
	CreateInvItems (npc,ItArScrollFirebolt,4);
	CreateInvItems (npc,ItArScrollThunderbolt,3);
	CreateInvItems (npc,ItArScrollIcecube,1);
	
	CreateInvItems (npc,ItArScrollChainLightning,2);
	CreateInvItems (npc,ItArScrollThunderball,4);	
		
	//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,4);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,4);
   
   CreateInvItems (npc,ItFo_Potion_Health_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,3);
   
   CreateInvItems (npc,ItFo_Potion_Water_01 ,10);
	
   CreateInvItems (npc,ItFo_Potion_Haste_02 ,5);
   	CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,3);
	
   CreateInvItems (npc,ItFo_Potion_HealthTime_01 ,2);
   //CreateInvItems (self,ItMi_Bandaz40,20);
   CreateInvItems (npc,ItRe_FNovBelt,1);
   CreateInvItems (npc,ItRe_MagicArmorBelt,1);
   CreateInvItems (npc,ItRe_FireRunnerBelt,1);
};

func void B_GiveJimItemsCH3 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,5);
	CreateInvItems (npc,ItArScrollLight,12);
	CreateInvItems (npc,ItArScrollThunderbolt,2);
	CreateInvItems (npc,ItArScrollIcecube,2);
	CreateInvItems (npc,ItArScrollIceWave,1);
	CreateInvItems (npc,ItArScrollTrfWaran,2);
	CreateInvItems (npc,ItArScrollTrfBloodfly,3);
	
		//-------- POTIONS --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,3);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,1);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,2);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,2);
	
   CreateInvItems (npc,ItFo_Potion_Haste_01 ,4);	
   CreateInvItems (npc,ItFo_Potion_Haste_02 ,6);
   CreateInvItems (npc,ItFo_PotionTime_Mana_01 ,2);

			//SK£ADNIKI
	CreateInvItems	(npc, ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems	(npc, ItMi_Alchemy_Salt_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Moleratlubric_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Alcohol_01,3);
	CreateInvItems	(npc, ItMi_Alchemy_Quicksilver_01,3);
	CreateInvItems	(npc, ItFo_Potion_Water_01,10);
	CreateInvItems	(npc, ItFo_Plants_mushroom_01,10);
	CreateInvItems	(npc, ItMi_Plants_Swampherb_01,10);
	CreateInvItems	(npc, ItFo_MountainHerb,10);
	CreateInvItems	(npc, ItFo_FieldHerb,10);	
	CreateInvItems	(npc, ItFo_SeaHerb,10);	
	CreateInvItems	(npc, ItFo_Plants_Flameberry_01,1);	
};

func void B_GiveJimItemsCH4 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);

};

func void B_GiveJimItemsCH5 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(STT_2077_Jim);

};


