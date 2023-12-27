func void B_GiveMartinItemsCH1 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1603_Martin);
	CreateInvItem (npc,ItWrWorldmap);	
	CreateInvItem	(npc,	Miecz1H5);
	CreateInvItem	(npc,	Miecz1H11);
	CreateInvItem	(npc,	ItMw_Dagger);
	CreateInvItem	(npc,	ItMw_Dagger3);
	CreateInvItems  (npc,ItMiNugget,200);
	CreateInvItems  (self,ItKeLockpick,20);
	CreateInvItems  (self,ItMiHammer,15);
	CreateInvItems  (self,ItMiFlask,15);
	//CreateInvItems  (self,ItLsTorchFirespit,15);
};

func void B_GiveMartinItemsCH2 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1603_Martin);
		CreateInvItem	(npc,	ItMw_1H_Sword_Short_01);
	CreateInvItem	(npc,	ItMw_Rapier);
	CreateInvItem	(npc,	ItMw_Addon_BanditTrader);
	CreateInvItem	(npc,	ItMw_DarkTrader);
	CreateInvItem	(npc,	ItRe_StrengthBelt);
	CreateInvItem	(npc,	ItMw_Addon_BanditTrader);
	CreateInvItems (npc,ItMiNugget,300);
};

func void B_GiveMartinItemsCH3 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1603_Martin);
	CreateInvItems	(self, ItKeLockpick,30);
	CreateInvItem	(npc,	ItMw_1h_Sword_Katana);
	CreateInvItems  (self,ItKeLockpick,20);
	CreateInvItems	(npc,	ItRe_PowerBelt,1);
	CreateInvItems (npc,ItMiNugget,400);
};

func void B_GiveMartinItemsCH4 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1603_Martin);
	
    CreateInvItem 	(npc,	Miecz1H_P_1); 
	CreateInvItems (npc,ItMiNugget,200);
	
	CreateInvItems  (self,ItKeLockpick,15);
	CreateInvItems  (self,ItMiHammer,15);
	CreateInvItems  (self,ItMiFlask,15);
	
	CreateInvItems  (self,Plan5c,1);
	//CreateInvItems  (self,ItLsTorchFirespit,15);
};

func void B_GiveMartinItemsCH5 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1603_Martin);
	CreateInvItem	(npc,	ItMw_Meisterdegen);
	
	CreateInvItem 	(npc,	Miecz1H_P_2); 
	CreateInvItem 	(npc,	Axe1H_P_1);
	CreateInvItem 	(npc,	Miecz1H_P_3);	
	CreateInvItems (npc,ItMiNugget,550);
};

func void B_GiveMartinItemsCH6 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(BAN_1603_Martin);

	CreateInvItem (npc,Plan7b); 
};