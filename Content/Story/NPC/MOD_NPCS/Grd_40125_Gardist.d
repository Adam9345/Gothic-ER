instance GRD_40125_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_MAIN;
	guild 		=	GIL_GOBBO;
	level 		=	30;
	voice 		=	13;
	id 			=	40125;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Thief", 1,  2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Broad_01_Z);
	EquipItem	(self, ItRw_Crossbow_03_Z);
	CreateInvItems	(self, ItAmBolt, 12);
	CreateInvItem	(self, ItFoApple);
	B_CreateAmbientInv (self);
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_40125;
};

FUNC VOID Rtn_FMstart_40125 ()	//FM
{
	TA_Lean (0,00,13,00,  "WP_ZM_ATTACK_04");
	TA_Lean (13,00,00,00, "WP_ZM_ATTACK_04");
};


