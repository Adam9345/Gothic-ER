
func void B_Give_HunoChapter1Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(VLK_538_Huno);
	CreateInvItems	(self,	ItMw_1H_Sledgehammer_01,2);
	CreateInvItems	(self,	ItMiSwordRaw,		10);
	CreateInvItems	(self,	ItMiSwordRawHot,	5);
	CreateInvItems	(self,	ItMiSwordBladeHot,	5);
	CreateInvItems	(self,	ItMiSwordBlade,		5);
	
	
	CreateInvItems	(self,	ItMi_IronNugget,   10);
	CreateInvItems	(self,	Gold01,			    5);
	CreateInvItems	(self,	Pr_Wegiel,		    5);
	CreateInvItems	(self,	Pr_SztabkaCiemnejStali,	 2);
	CreateInvItems	(self,	Pr_SztabkaStali,		5);
	CreateInvItems	(self,	Pr_SztabkaMagicznejStali,1);
	
	CreateInvItems	(self,	Plan_Miecz1H11,		1);
	CreateInvItems	(self,	Plan1b,		1);
	CreateInvItems	(self,	Plan1c,		1);
	CreateInvItems	(self,	Plan_Miecz1H7,		1);
	CreateInvItems	(self,	ItRe_ArmorBelt,		1);
	

};

func void B_Give_HunoChapter2Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(VLK_538_Huno);
	
	
    CreateInvItems	(self,	Gold01,			    10);
	CreateInvItems	(self,	Pr_Wegiel,		    10);
	CreateInvItems	(self,	Plan_Rapier,		1);
	CreateInvItems	(self,	Plan3b,		1);
};

