instance NOV_40033_Sakhar (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Sakhar";
	Npctype	 	=		Npctype_MAIN;
	guild 		=		GIL_NOV;
	level 		=		30;
	
	voice 		=		3;
	id 			=		40033;
		
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	80;
	attribute[ATR_DEXTERITY] 		=	120;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	476;
	attribute[ATR_HITPOINTS] 		=	476;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,         skin,  head mesh  ,headtex,teethtex,  ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 26,  3, NOV_ARMOR_Sakhar);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	B_SetFightSkills(self,50);
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Sword_Broad_01_Z);
	B_CreateAmbientInv (self);
	EquipItem (self, ItRw_Bow_War_01_Z);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40033;
};

FUNC VOID Rtn_start_40033 () //Sumpfkraut-Sammler
{
	TA_SitAround (07,00,11,00,"WP_PSI_SAKHAR01");
	TA_SitAround (11,00,18,00,"WP_PSI_SAKHAR01");
	TA_SitAround (18,00,01,00,"WP_PSI_SAKHAR01");
	TA_Sleep     (01,00,06,00,"WP_PSI_SAKHAR02");

};


FUNC VOID Rtn_Guide_40033 () //Sumpfkraut-Sammler
{
	TA_GuidePC (07,00,11,00,"WP_BLOOD_SAK");
	TA_GuidePC (11,00,18,00,"WP_BLOOD_SAK");

};
FUNC VOID Rtn_GZD_40033 () //Sumpfkraut-Sammler
{
	TA_GuidePC (07,00,11,00,"WP_BLOOD_SAK");
	TA_GuidePC (11,00,18,00,"WP_BLOOD_SAK");

};

