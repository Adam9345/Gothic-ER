func void B_Give_TradeInv_Kagan1 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1332_BaalKagan);
	
	//-------- Nahkampfwaffen --------
	
	
	//2h lekkie er 1.4.5.v7

	//-------- Fernkampfwaffen --------
	//-------- Munition --------
	CreateInvItems	(npc, ItMiJoint_1,10);
  	CreateInvItems  (npc,ItMiNugget,150);
  	CreateInvItems  (npc,ItArScrollSleep,5);


};

func void B_Give_TradeInv_Kagan2 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1332_BaalKagan);
		CreateInvItems  (npc,ItArScrollSleep,5);
		CreateInvItems  (npc,ItArScrollPyrokinesis,5);

};

func void B_Give_TradeInv_Kagan3 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1332_BaalKagan);
		CreateInvItems  (npc,ItArScrollControl,5);
		CreateInvItems  (npc,ItArScrollWindfist,5);


};

func void B_Give_TradeInv_Kagan4 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(NOV_1332_BaalKagan);
	CreateInvItems  (npc,ItArScrollWindfist,5);

};

