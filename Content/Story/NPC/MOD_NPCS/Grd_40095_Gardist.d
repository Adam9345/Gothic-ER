instance GRD_40095_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NPCTYPE_main;
	guild 		=	GIL_GOBBO;
	level 		=	15;
	voice 		=	13;
	id 			=	40095;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 17,  4, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);	
	B_CreateAmbientInv (self);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40095;
};

FUNC VOID Rtn_start_40095 ()
{
    TA_Guard	(06,00,23,00,"WP_ATTACK_PSI2");
	TA_Guard	(23,00,06,00,"WP_ATTACK_PSI2");
};


