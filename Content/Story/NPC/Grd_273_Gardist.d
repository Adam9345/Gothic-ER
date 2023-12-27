instance GRD_273_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NPCTYPE_MINE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	273;
		
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
	daily_routine = Rtn_start_273;
};

FUNC VOID Rtn_start_273 ()
{
    TA_Guard (00,00,06,00,"OM_CAVE1_63");
	TA_Guard (06,00,24,00,"OM_CAVE1_63");
	
};




