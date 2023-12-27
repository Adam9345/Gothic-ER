instance Grd_40127_Dowodca (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_GrdBoss;
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_GOBBO;
	level 		=		45;
	
	
	voice 		=		10;
	id 			=		40127;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	120;
	attribute[ATR_DEXTERITY] 		=	100;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;	
	attribute[ATR_HITPOINTS_MAX] 	=	740;
	attribute[ATR_HITPOINTS] 		=	740;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 56,  1, GRD_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talente -------- 
B_SetFightSkills(self,70);
		
	//-------- inventory --------
	
	EquipItem	(self, ItMw_065_2h_greataxe_01);
	EquipItem	(self, ItRw_Er_Crossbow_L03);
	CreateInvItems	(self, ItAmBolt, 15);
    B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40127;
};

FUNC VOID Rtn_start_40127 ()
{
	TA_SitAround (0,00,13,00,  "WP_ZM_ATTACK_06");
	TA_SitAround (13,00,00,00, "WP_ZM_ATTACK_06");
};


