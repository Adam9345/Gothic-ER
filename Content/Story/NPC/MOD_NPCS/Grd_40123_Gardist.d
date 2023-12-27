instance GRD_40123_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_MAIN;
	guild 		=	GIL_GOBBO;
	level 		=	20;
	voice		=	6;
	id 			=	40123;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 560;
	attribute[ATR_HITPOINTS] 	= 560;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Psionic", 2,  1, GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	
B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);
	EquipItem	(self, ItRw_Crossbow_03_Z);
	CreateInvItems	(self, ItAmBolt, 16);
	B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40123;
};

FUNC VOID Rtn_start_40123 ()//### unbeschäftigter Gardist!
{
	TA_Stand	(06,00,21,00,"WP_ZM_ATTACK_02"); 
	TA_Stand	(21,00,06,00,"WP_ZM_ATTACK_02"); 
};




