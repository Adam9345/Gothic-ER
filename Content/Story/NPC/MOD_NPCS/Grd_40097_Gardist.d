instance GRD_40097_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_main;
	guild 		=	GIL_GOBBO;
	level 		=	15;
	voice 		=	7;
	id 			=	40097;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 460;
	attribute[ATR_HITPOINTS] 	= 460;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 1,  1, GRD_ARMOR_H);

	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
B_SetFightSkills(self,70);

			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);	
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40097;
};

FUNC VOID Rtn_start_40097()
{
    TA_Guard     	(00,00,08,00,"WP_ATTACK_PSI4");	
    TA_Guard		(08,00,24,00,"WP_ATTACK_PSI4");	
    
};




