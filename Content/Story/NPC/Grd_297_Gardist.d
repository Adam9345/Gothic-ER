instance GRD_297_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	guild 		=	GIL_GRD;
	npctype		=	npctype_guard;
	level 		=	8;
	voice 		=	7;
	id 			=	297;
		
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
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
    B_SetFightSkills(self,40);			
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_LightGuardsSword_03_Old);
	B_CreateAmbientInv (self);
	CreateInvItems	(self, ItAmBolt, 10);	        
	EquipItem	 (self,ItRw_Crossbow_01_Old );
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_297;
};

FUNC VOID Rtn_FMstart_297 ()	//FM
{
	TA_GuardPalisade (0,00,13,00,  "FM_14");
	TA_GuardPalisade (13,00,00,00, "FM_14");
};




