instance NOV_1324_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Davson";
	Npctype 		=		Npctype_main;
	guild 		=		GIL_NOV;
	level 		=		3;

	voice 		=		5;
	id 			=		1324;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Psionic", 28,  2, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		B_SetFightSkills(self,10);
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1324;
};

FUNC VOID Rtn_start_1324 ()
{
    TA_Sleep 		(00,00,08,00,"PSI_30_HUT_IN");
	TA_SitCampfire	(08,00,00,00,"PSI_PATH_4_CAMPFIRE_B");
};
FUNC VOID Rtn_wino_1324 ()
{
	TA_PickRice 	 		(06,30,20,22,"WINNICA2");
	TA_Sleep 				(20,22,06,30,"PSI_30_HUT_IN");
};
