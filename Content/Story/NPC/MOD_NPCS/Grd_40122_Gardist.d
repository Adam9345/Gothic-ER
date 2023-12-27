instance GRD_40122_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		= 	GIL_GOBBO;
	level 		= 	30;
	voice 		= 	7;
	id 			= 	40122;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 10,  1, GRD_ARMOR_M);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,1);
    	
    	
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Broad_01_Z);
	EquipItem	(self, ItRw_Crossbow_03_Z);
	CreateInvItems	(self, ItAmBolt, 16);
    B_CreateAmbientInv (self);       
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40122;
};

FUNC VOID Rtn_start_40122 ()
{
	TA_StandAround (18,00,19,00,"WP_ZM_ATTACK_01");
	TA_StandAround (19,00,18,00,"WP_ZM_ATTACK_01");
};

