
func void B_GiverivFishFoodCH2 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_952_Riv);
	
	CreateInvItems	(npc, ItFo_Fish4,4);
	CreateInvItems	(npc, ItFo_Fish3,4);
	CreateInvItems	(npc, ItFo_Fish2,4);
	CreateInvItems	(npc, ItFo_Fish,3);
	CreateInvItems	(npc, ItFo_Fish6,5);
	CreateInvItems (self, itmi_bait_01, 8);
	CreateInvItems (self, itmi_bait_02, 9);
    CreateInvItems (self, ItWr_SoupFish3, 1);
    //CreateInvItems (self, itmi_bait_02, 9);
};

func void B_GiverivFishFoodCH3 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_952_Riv);
	CreateInvItems	(npc, ItFo_Fish4,5);
	CreateInvItems	(npc, ItFo_Fish3,6);
	CreateInvItems	(npc, ItFo_Fish2,7);
	CreateInvItems	(npc, ItFo_Fish,8);
	CreateInvItems	(npc, ItFo_Fish6,5);

	CreateInvItems	(npc, ItFo_Fish,3);
	CreateInvItems (self, itmi_bait_01, 4);
	CreateInvItems (self, itmi_bait_02, 4);
};

func void B_GiverivFishFoodCH4 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_952_Riv);
	CreateInvItems	(npc, ItFo_Fish5,1);
	
	CreateInvItems	(npc, ItFo_Fish2,7);
	CreateInvItems	(npc, ItFo_Fish,5);

	CreateInvItems	(npc, ItFoApple,5);
	CreateInvItems	(npc, ItFo_Fish6,5);

};

func void B_GiverivFishFoodCH5 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_952_Riv);
	CreateInvItems	(npc, ItFo_Fish5,1);
	CreateInvItems	(npc, ItFo_Fish4,10);
	CreateInvItems	(npc, ItFo_Fish3,10);
	CreateInvItems	(npc, ItFo_Fish2,10);
	CreateInvItems	(npc, ItFo_Fish,10);
	CreateInvItems	(npc, ItFo_Fish6,5);
	CreateInvItems (self, itmi_bait_01, 7);
	CreateInvItems (self, itmi_bait_02, 5);

};