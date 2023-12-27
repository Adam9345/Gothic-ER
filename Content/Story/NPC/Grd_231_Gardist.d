instance GRD_231_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	13;
	id 			=	231;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Thief", 4,  1, GRD_ARMOR_L);
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
    B_SetFightSkills(self,40);	
	//-------- inventory --------
	
	CreateInvItem	(self, ItMw_1H_Sword_01);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_231;
};

FUNC VOID Rtn_start_231 ()
{
	TA_Sleep 		(01,40,07,50,"OCC_MERCS_UPPER_LEFT_ROOM_BED7");
	TA_Standaround	(07,50,01,40,"OCC_WELL_RIGHT_MOVEMENT3");
};

FUNC VOID Rtn_die_231 ()
{
	TA_Stand 		(01,40,07,50,"OCC_GUARD_ROOM_FRONT2");
	TA_Stand		(07,50,01,40,"OCC_GUARD_ROOM_FRONT2");
};

