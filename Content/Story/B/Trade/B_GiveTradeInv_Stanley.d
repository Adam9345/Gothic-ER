
func void B_Give_StanleyChapter1Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5602_Stanley);
	CreateInvItems  (npc,ItMi_Alchemy_Sulphur_01,5);
	CreateInvItems  (npc,ItMi_Alchemy_Quicksilver_01,3);
	CreateInvItems  (npc,ItMi_Alchemy_Salt_01,10);
	CreateInvItems  (npc,ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems  (npc,ItMi_Alchemy_Moleratlubric_01,5);
	CreateInvItems  (npc,ItMi_Alchemy_Alcohol_01,4);
	
	CreateInvItems  (npc,ItMi_Plants_Swampherb_01,3);
	CreateInvItems  (npc,itmiflask,6);//kolby
	

};

func void B_Give_StanleyChapter2Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5602_Stanley);
	CreateInvItems  (npc,itmiflask,10);//kolby
};

func void B_Give_StanleyChapter3Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5602_Stanley);

	CreateInvItems  (npc,ItMi_Alchemy_Sulphur_01,5);
	CreateInvItems  (npc,ItMi_Alchemy_Quicksilver_01,2);
	CreateInvItems  (npc,ItMi_Alchemy_Salt_01,10);
	CreateInvItems  (npc,ItMi_Alchemy_Syrianoil_01,2);
	CreateInvItems  (npc,ItMi_Alchemy_Moleratlubric_01,5);
	CreateInvItems  (npc,ItMi_Alchemy_Alcohol_01,7);
	
	CreateInvItems  (npc,ItMiNugget,70);
};

func void B_Give_StanleyChapter4Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5602_Stanley);
	CreateInvItems  (npc,itmiflask,10);//kolby
	CreateInvItems  (npc,ItMiNugget,50);//handel
};

func void B_Give_StanleyChapter5Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NON_5602_Stanley);
	
	CreateInvItems  (npc,ItMi_Alchemy_Salt_01,10);
	CreateInvItems  (npc,ItRe_OrcHunterBelt,1);




};

