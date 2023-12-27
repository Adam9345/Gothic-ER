instance NOV_40000_Brago (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Brago";
	Npctype	 	=		Npctype_MAIN;
	guild 		=		GIL_NONE;
	level 		=		15;
	
	voice 		=		3;
	id 			=		40000;
		
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	60;
	attribute[ATR_DEXTERITY] 		=	60;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	276;
	attribute[ATR_HITPOINTS] 		=	276;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,         skin,  head mesh  ,headtex,teethtex,  ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Bald", 146,  1, NON_LEATHER_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
B_SetFightSkills(self,70);
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Sword_Long_02);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40000;
};

FUNC VOID Rtn_start_40000 () //Sumpfkraut-Sammler
{
	TA_SitAround (07,00,19,00,"WP_BRAGO");
	TA_SitAround (19,00,07,00,"WP_BRAGO");

};


FUNC VOID Rtn_Mosul_40000 () //Sumpfkraut-Sammler
{
	TA_Smalltalk (07,00,24,00,"PSI_HANGAROUND");
	TA_Smalltalk (24,00,07,00,"PSI_HANGAROUND");
};


FUNC VOID Rtn_Ucieczka_40000 () //Sumpfkraut-Sammler
{
	TA_SitAround (07,00,19,00,"WP_BRAGO_TAVERN");
	TA_Smoke (19,00,07,00,"WP_BRAGO_TAVERN1");
};

