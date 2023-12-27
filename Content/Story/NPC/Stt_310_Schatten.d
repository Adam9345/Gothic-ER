instance STT_310_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_STT;
	level 		=		5;
	
	voice 		=		12;
	id 			=		310;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	20;
	attribute[ATR_DEXTERITY] 		=	20;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Psionic", 10,  2, STT_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 
B_SetFightSkills(self,30);
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_02);
	EquipItem	(self, ItRw_Bow_Small_03);
	CreateInvItems	(self, ItAmArrow, 10);
	B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_310;
};

FUNC VOID Rtn_start_310 ()
{
	TA_Sleep			(22,00,07,00,"OCR_HUT_8");
	TA_Smalltalk		(07,00,11,00,"OCR_OUTSIDE_HUT_7");
	TA_StandAround		(11,00,20,05,"OCR_COOK_AT_HUT_10");
	TA_Smalltalk		(20,05,22,00,"OCR_OUTSIDE_HUT_7");
};
FUNC VOID Rtn_4CH_310 ()
{
	TA_Stand			(22,00,07,00,"SPAWN_GRD9");
	TA_Guard		(07,00,11,00,"SPAWN_GRD9");
	TA_StandAround		(11,00,20,05,"SPAWN_GRD9");
	TA_Guard		(20,05,22,00,"SPAWN_GRD9");
};


