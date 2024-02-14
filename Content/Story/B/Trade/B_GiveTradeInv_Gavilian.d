
func void B_Give_Items_GavilianCh1 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_40138_Gavilan);
	CreateInvItems  (npc, ItKeLockpick,10);		
	CreateInvItems  (npc,ItAm_Quiver,4);
	CreateInvItems  (npc,ItAm_BQuiver,4);
	CreateInvItems  (npc,ItMiNugget,100);
	CreateInvItem	(npc,ItMw_1H_Sword_Long_01);
	CreateInvItems  (npc,itfochessesoup,10);
	CreateInvItems	(npc,ItMi_IronNugget,15);
};

func void B_Give_Items_GavilianCh2 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_40138_Gavilan);
	CreateInvItems  (npc,ItAm_Quiver,4);
	CreateInvItems  (npc,ItAm_BQuiver,4);
	CreateInvItems  (npc,ItMiNugget,115);
};

func void B_Give_Items_GavilianCh3 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_40138_Gavilan);
	//outlam
	CreateInvItems (npc, ItFo_Plants_Berrys_01, 10);
	CreateInvItems (npc, ItRe_2H_AxeHevay_100, 1);
	
	CreateInvItems  (npc,itmiflask,10);
	CreateInvItems  (npc,ItMiNugget,115);//handel

};

func void B_Give_Items_GavilianCh4 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_40138_Gavilan);
	CreateInvItems	(npc, ItFoMutton,10);
	CreateInvItems	(npc, ItFo_mutton_01,5);
	CreateInvItems	(npc, ItRe_OrcHunterBelt,1);
	CreateInvItems	(npc, ItWrWorldmap,1);
	CreateInvItems	(npc, ItFoCheese,5);
	CreateInvItems  (npc, ItFo_Plants_Berrys_01, 15);
	CreateInvItems  (npc,ItMiNugget,50);//handel
};

func void B_Give_Items_GavilianCh5 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_40138_Gavilan);
	CreateInvItems	(npc, ItFo_Sausage,10);
	CreateInvItems	(npc, ItFoApple,5);
	CreateInvItems	(npc, ItFo_Fish6,5);
	CreateInvItems  (npc,ItMiNugget,200);//handel
};

