instance STT_40128_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=	NPCTYPE_MAIN;
	guild 		=		GIL_GOBBO;
	level 		=		22;
	
	
	voice 		=		12;
	id 			=		40128;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		80;
	attribute[ATR_DEXTERITY] 		=		80;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		380;
	attribute[ATR_HITPOINTS] 		=		380;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  3, STT_ARMOR_H);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
        
    	//-------- Talente -------- 

	B_SetFightSkills(self,50);
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_04_Z);
	EquipItem	(self, ItRw_Bow_War_01_Z);
	CreateInvItems	(self, ItAmArrow, 25);
    B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_40128;
};

FUNC VOID Rtn_FMstart_40128 ()
{
	TA_RoastScavenger (0,00,13,00,  "WP_ZM_ATTACK_07");
	TA_RoastScavenger (13,00,00,00, "WP_ZM_ATTACK_07");
};
