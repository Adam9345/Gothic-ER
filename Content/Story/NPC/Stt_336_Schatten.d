instance STT_336_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_GRD;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		336;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 56,  1, STT_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

B_SetFightSkills(self,10);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_01);
	EquipItem	(self, ItRw_Bow_Small_05);
	CreateInvItems	(self, ItAmArrow, 15);
B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_336;
};

FUNC VOID Rtn_FMstart_336 ()
{
	TA_SitAround (0,00,13,00,  "FM_162");
	TA_SitAround (13,00,00,00, "FM_162");
};


