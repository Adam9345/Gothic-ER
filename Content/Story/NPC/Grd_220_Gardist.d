instance GRD_220_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	220;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
    B_SetFightSkills(self,40);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
B_CreateAmbientInv (self);        
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_220;
};

FUNC VOID Rtn_start_220 ()
{
    TA_PracticeSword	(07,35,20,05,"OCC_CENTER_4_TRAIN2");
    TA_StandAround		(20,05,00,05,"OCC_SHADOWS_CORNER_MOVEMENT"); //CF1
    TA_Sleep            (00,05,07,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED2");
};

FUNC VOID Rtn_OT_220 ()
{
	TA_Guard ( 07, 00, 20, 00, "OCC_CHAPEL_UPSTAIRS_LEFT" );
	TA_Guard ( 20, 00, 07, 00, "OCC_CHAPEL_UPSTAIRS_LEFT" );
};