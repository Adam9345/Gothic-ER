
func void B_Give_HunoChapter1Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(VLK_538_Huno);
	CreateInvItems	(npc,	ItMw_1H_Sledgehammer_01,2);
	CreateInvItems	(npc,	ItMiSwordRaw,		10);
	CreateInvItems	(npc,	ItMiSwordRawHot,	5);
	CreateInvItems	(npc,	ItMiSwordBladeHot,	5);
	CreateInvItems	(npc,	ItMiSwordBlade,		5);
	
	
	CreateInvItems	(npc,	ItMi_IronNugget,   10);
	CreateInvItems	(npc,	Gold01,			    5);
	CreateInvItems	(npc,	Pr_Wegiel,		    5);
	CreateInvItems	(npc,	Pr_SztabkaCiemnejStali,	 2);
	CreateInvItems	(npc,	Pr_SztabkaStali,		5);
	CreateInvItems	(npc,	Pr_SztabkaMagicznejStali,1);
	
	CreateInvItems	(npc,	Plan_Miecz1H11,		1);
	CreateInvItems	(npc,	Plan1b,		1);
	CreateInvItems	(npc,	Plan1c,		1);
	CreateInvItems	(npc,	Plan_Miecz1H7,		1);
	CreateInvItems	(npc,	ItRe_ArmorBelt,		1);
	

};

func void B_Give_HunoChapter2Ingredients ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(VLK_538_Huno);
	
	
    CreateInvItems	(npc,	Gold01,			    10);
	CreateInvItems	(npc,	Pr_Wegiel,		    10);
	CreateInvItems	(npc,	Plan_Rapier,		1);
	CreateInvItems	(npc,	Plan3b,		1);
};

