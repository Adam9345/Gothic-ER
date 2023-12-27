instance NOV_1303_Nyras (Npc_Default)
{
	//-------- primary data -------- //edit by Nocturn
	name 		=		"Nyras";
	Npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_NONE;
	level 		=		Level_Nyras;
	voice 		=		3;
	id 			=		1303;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =	35;
	attribute[ATR_DEXTERITY] =	30;
	attribute[ATR_MANA_MAX] =	30;
	attribute[ATR_MANA] =	30;
	attribute[ATR_HITPOINTS_MAX] =	150;
	attribute[ATR_HITPOINTS] =	150;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_FatBald", 22,  1, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	B_SetFightSkills(self,30);		
	
	//-------- inventory --------

	EquipItem 		(self, ItMw_1H_Mace_04);
	CreateInvItems	(self, ItMiNugget,	15);
	CreateInvItems	(self, ItFoRice,	5);
	CreateInvItems	(self, ItFoBooze,	3);
	CreateInvItems	(self, ItMiJoint_1,	1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1303;
};

FUNC VOID Rtn_Start_1303 ()
{
    TA_Smalltalk(08,00,23,00,"PSI_3_HUT_EX");
    TA_Sleep	(23,00,08,00,"PSI_4_HUT_IN");
};

FUNC VOID Rtn_PrepareRitual_1303 ()
{
    TA_Stay	(00,00,07,00,"WP_CIRCLE_01");
    TA_Stay	(07,00,24,00,"WP_CIRCLE_01");
};
