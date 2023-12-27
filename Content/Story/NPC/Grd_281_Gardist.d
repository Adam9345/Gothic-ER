instance GRD_281_Gardist (Npc_Default) 

// z.Zt. raus

{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	Npctype_Main;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	281;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 3,  3, GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
    B_SetFightSkills(self,40);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_281;
};

FUNC VOID Rtn_start_281 ()
{
	TA_GuardWheelOpen 	(07,55,19,55,"OW_PATH_1_16_C");
	TA_GuardWheelOpen   (19,55,07,55,"OW_PATH_1_16_C");
};
FUNC VOID Rtn_start2_281 ()
{
	TA_GuardWheelOpen 	(07,55,19,55,"OW_PATH_1_16_A");
	TA_GuardWheelOpen   (19,55,07,55,"OW_PATH_1_16_A");
};

