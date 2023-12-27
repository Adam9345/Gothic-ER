instance NOV_40001_Mosul (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Mosul";
	Npctype	 	=		Npctype_MAIN;
	guild 		=		GIL_NOV;
	level 		=		10;
	
	voice 		=		3;
	id 			=		40001;
		
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	40;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	176;
	attribute[ATR_HITPOINTS] 		=	176;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody   (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 26,  3, NOV_ARMOR_M);

	B_Scale            (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	B_SetFightSkills(self,50);
		
	//-------- inventory --------

	EquipItem (self,  ItMw_1H_Axe_Old_01);
	CreateInvItem (self, ItMi_Stuff_Idol_Mosul);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40001;
};

FUNC VOID Rtn_start_40001 () //Sumpfkraut-Sammler
{
	TA_Smoke (07,00,19,00,"PSI_HANGAROUND");
	TA_Smoke (19,00,07,00,"PSI_HANGAROUND");
};

FUNC VOID Rtn_Brago_40001 () //Sumpfkraut-Sammler
{
	TA_Smalltalk (07,00,19,00,"FP_SMALLTALK_MOSUL_BRA");
	TA_Smalltalk (19,00,07,00,"FP_SMALLTALK_MOSUL_BRA");
};