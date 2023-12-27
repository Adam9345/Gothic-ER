instance NOV_1323_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		3;

	voice 		=		3;
	id 			=		1323;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 34,  2, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		B_SetFightSkills(self,10);
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	
	EquipItem	(self, ItMiLute);       
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_1323;
};

FUNC VOID Rtn_Start_1323 ()
{
    TA_Sleep 		(01,00,08,00,"PSI_29_HUT_IN");
    TA_SitCampfire	(08,00,01,00,"PSI_PATH_4_CAMPFIRE_A");
};
FUNC VOID Rtn_work_1323 ()
{
	TA_PickRice		(08,00,21,00,"WINNICA4");
	TA_Sleep 		(21,00,08,00,"PSI_29_HUT_IN");
};