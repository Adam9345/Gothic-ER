instance STT_314_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_STT;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		314;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		20;
	attribute[ATR_DEXTERITY] 		=		15;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		100;
	attribute[ATR_HITPOINTS] 		=		100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 54,  3, STT_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente -------- 
B_SetFightSkills(self,30);
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_04);
	EquipItem	(self, ItRw_Bow_Small_02);
	CreateInvItems	(self, ItAmArrow, 15);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_314;
};

FUNC VOID Rtn_start_314 ()
{

	TA_Sleep		(22,45,07,45,"OCR_HUT_38");
	TA_StandAround	(07,45,15,30,"OCR_OUTSIDE_HUT_39");
	TA_SitAround	(15,30,17,00,"OCR_HUT_38");
	TA_SitCampfire	(17,00,22,45,"OCR_OUTSIDE_HUT_39");	
};
FUNC VOID Rtn_ded_314 ()
{

	TA_Sleep		(22,45,07,45,"WAR10");
	TA_StandAround	(07,45,15,30,"WAR10");
	TA_SitAround	(15,30,17,00,"WAR10");
	TA_SitCampfire	(17,00,22,45,"WAR10");	
};


