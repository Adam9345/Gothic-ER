instance NOV_1346_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		3;
	
	voice 		=		3;
	id 			=		1346;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 26 ,  2, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		B_SetFightSkills(self,10);
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	EquipItem	(self,ItMiLute);       
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1346;
};

FUNC VOID Rtn_start_1346 ()
{
	TA_Smalltalk	(08,00,23,00,"PSI_PATH_TEMPLE_9_MOVEMENT");
	TA_Smalltalk	(23,00,08,00,"PSI_PATH_TEMPLE_9_MOVEMENT");
};

FUNC VOID Rtn_Ritual_1346 ()
{
	TA_Meditate	(00,00,08,00,"PSI_TEMPLE_NOVIZE_PR2");
    TA_Meditate	(08,00,24,00,"PSI_TEMPLE_NOVIZE_PR2");	
};
