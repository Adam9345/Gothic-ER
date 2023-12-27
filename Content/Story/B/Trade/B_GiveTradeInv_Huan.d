func void B_Give_HuanChapter1Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems (npc,ItMiNugget,50);
	CreateInvItems	(npc, ItKeLockpick,7);
	CreateInvItems 	(self, ItMw_1H_Mace_War_02,2);

	CreateInvItem (npc,ItMw_2H_Axe_Big_01);
	//u sharkiego reszta

	CreateInvItems	(self,	ItMi_IronNugget,   10);
	//składniki
	CreateInvItems	(self,	ItMiSwordRaw,		10);
	CreateInvItems	(self,	ItMiSwordRawHot,	10);
	CreateInvItems	(self,	ItMiSwordBladeHot,	10);
	CreateInvItems	(self,	ItMiSwordBlade,		10);
	CreateInvItems	(self,	Gold01,		4);
	CreateInvItems	(self,	Pr_Wegiel,				 9);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		7);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,2);
	//plany
	CreateInvItems	(self,	Plan_Miecz1H15,		1);
};

func void B_Give_HuanChapter2Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems (npc,ItMiNugget,40);
	CreateInvItems	(npc, ItKeLockpick,3);
	
	CreateInvItems	(self,	Gold01,		4);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		7);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,2);
	
	CreateInvItems	(self,	Plan_BanditTrader,1);
	CreateInvItems	(self,	Plan1c,1);
	CreateInvItems	(self,	ItMw_2H_Axe_Big_05,1);
	CreateInvItem (npc,ItRe_ArmorBelt); 
};

func void B_Give_HuanChapter3Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems (npc,ItMiNugget,55);
	CreateInvItems	(npc, ItKeLockpick,3);
	CreateInvItems	(self,	ItMi_IronNugget,   10);
	CreateInvItems	(self,	Gold01,		6);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 4);
	CreateInvItems	(self,	Pr_SztabkaStali,		7);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,4);
    CreateInvItems	(self,	Plan_Miecz1H7,1);
    CreateInvItems	(self,	ItRe_SldBelt,1);
    CreateInvItems (self, ItRe_2H_AxeHevay_100, 1);
};

func void B_Give_HuanChapter4Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	CreateInvItem   (npc,Plan_Miecz1H9);
	CreateInvItem   (npc,Plan_Miecz2H5);
	CreateInvItem   (npc,ItMw_2H_Axe_Old_02);
	CreateInvItems  (npc,ItMiNugget,50);
	CreateInvItems	(self,	Gold01,		13);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		10);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,5);
	CreateInvItems	(npc, 	ItMi_Alchemy_Syrianoil_01,2);
};

func void B_Give_HuanChapter5Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems  (npc,ItMiNugget,50);
	CreateInvItems	(self,	Gold01,		5);
	CreateInvItems	(self,	Pr_Wegiel,				 8);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 3);
	CreateInvItems	(self,	Pr_SztabkaStali,		10);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,5);
  
};

func void B_Give_HuanChapter6Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(ORG_9550_Huan);
	
	CreateInvItems  (npc,ItMiNugget,60);
	CreateInvItems	(self,	Gold01,		7);
	CreateInvItems	(self,	Pr_Wegiel,				 5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 5);
	CreateInvItems	(self,	Pr_SztabkaStali,		5);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,6); 
};

