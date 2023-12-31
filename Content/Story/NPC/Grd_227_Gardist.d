instance GRD_227_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	6;
	id 			=	227;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 17, 2, GRD_ARMOR_L);
        
        B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
    B_SetFightSkills(self,40);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_227;
};

FUNC VOID Rtn_start_227 ()
{
	TA_Sleep			(01,35,07,45,"OCC_MERCS_UPPER_LEFT_ROOM_BED5");
	TA_STANDAROUND		(07,45,11,00,"OCC_WELL_RIGHT_MOVEMENT2");
	TA_RoastScavenger 	(11,00,21,00,"OCC_WELL_RIGHT_MOVEMENT2");
	TA_STANDAROUND		(21,00,01,35,"OCC_WELL_RIGHT_MOVEMENT2");
};

