

func void B_Give_MilChapter1Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5612_Mil);
	CreateInvItems  (npc,ItMiNugget,80);//handel
	CreateInvItems  (npc,ItFo_MeatStew,5);//
	CreateInvItems  (npc,ItWr_MeatStew,1);//
	CreateInvItems  (npc,ItWr_BrownShadowbeast,1);
	CreateInvItems  (npc,ItWr_WhiteScavenger,1);
};

func void B_Give_MilChapter2Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5612_Mil);
	CreateInvItems  (npc,ItAt_Wolf_02,1);//skóra warga
	CreateInvItems  (npc,ItAt_Lurker_02,1);//skóra jaszczura
	CreateInvItems  (npc,Plan_Miecz1H7,1);
	CreateInvItems  (npc,ItMiNugget,55);//handel
};

func void B_Give_MilChapter3Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5612_Mil);
	CreateInvItems	(npc, ItFo_Fish5,3);
	CreateInvItems	(npc, ItFo_Fish4,4);
	CreateInvItems	(npc, ItFo_Fish3,2);
	CreateInvItems	(npc, ItFo_Fish2,1);
	CreateInvItems	(npc, ItWr_BigCasserole,1);
	CreateInvItems	(npc, ItFo_Fish,4);
	CreateInvItems	(npc, ItFo_Sausage,1);
	CreateInvItems	(npc, ItFoApple,5);
	CreateInvItems	(npc, ItFo_Fish6,5);
	CreateInvItems	(npc, ItFoMutton,5);
	CreateInvItems	(npc, ItFo_mutton_01,5);
	CreateInvItems	(npc, ItFoCheese,5);
	//outlam
	CreateInvItems (npc, ItFo_Plants_Berrys_01, 10);
	CreateInvItems (npc, ItFo_Potion_Health_01, 2);
	CreateInvItems (npc, ItAt_Crawler_02, 2);
	CreateInvItems (npc, itmi_bait_01, 15);
	CreateInvItems (npc, itmi_bait_02, 12);
	
	CreateInvItems  (npc,itmiflask,10);
	CreateInvItems  (npc,ItMiNugget,112);//handel

};

func void B_Give_MilChapter4Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5612_Mil);
	CreateInvItems	(npc, ItFo_Sausage,10);
	CreateInvItems	(npc, ItFoApple,5);
	CreateInvItems	(npc, ItFo_Fish6,5);
	CreateInvItems	(npc, ItFoMutton,5);
	CreateInvItems	(npc, ItFo_mutton_01,5);
	CreateInvItems	(npc, ItFoCheese,5);
	//outlam
	CreateInvItems (npc, ItFo_Plants_Berrys_01, 15);
	CreateInvItems (npc, ItAt_Teeth_01, 5);
    CreateInvItems (npc, ItAt_Wolf_01, 5);
    CreateInvItems (npc, ItAt_Lurker_02, 5);
	CreateInvItems (npc, itmi_bait_01, 30);
	CreateInvItems (npc, itmi_bait_02, 30);
	CreateInvItems (npc, ItFo_Potion_Dex_02, 1);
	CreateInvItems  (npc,itmiflask,3);
	CreateInvItems  (npc,ItMiNugget,50);//handel
};

func void B_Give_MilChapter5Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5612_Mil);
	CreateInvItems	(npc, ItFo_Sausage,10);
	CreateInvItems	(npc, ItFoApple,5);
	CreateInvItems	(npc, ItFo_Fish6,5);
	CreateInvItems	(npc, ItFoMutton,5);
	CreateInvItems	(npc, ItFo_mutton_01,5);
	CreateInvItems	(npc, ItFoCheese,5);
	//outlam
	CreateInvItems (npc, ItFo_Plants_Berrys_01, 15);
    CreateInvItems (npc, ItAt_Lurker_02, 5);
	CreateInvItems (npc, itmi_bait_01, 30);
	CreateInvItems (npc, itmi_bait_02, 30);
	CreateInvItems (npc, ItFo_Potion_Dex_02, 1);
	CreateInvItems  (npc,itmiflask,5);
	CreateInvItems  (npc,ItMiNugget,200);//handel
};

