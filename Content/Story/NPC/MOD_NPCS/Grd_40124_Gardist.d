instance GRD_40124_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Main;
	guild 		=	GIL_GOBBO;
	level 		=	30;
	voice		=	7;
	id 			=	40124;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Thief", 1,  2, GRD_ARMOR_H);
        
 	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_Master;

	//-------- Talente -------- 
				

B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);
	B_CreateAmbientInv (self);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40124;
};

FUNC VOID Rtn_start_40124 ()
{
	TA_Boss	(06,00,21,00,"WP_ZM_ATTACK_03"); 
	TA_Boss	(21,00,06,00,"WP_ZM_ATTACK_03"); 
};



