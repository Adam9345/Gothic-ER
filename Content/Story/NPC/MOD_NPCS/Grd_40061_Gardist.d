instance GRD_40061_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_ORCSCOUT;
	level 		=	10;
	voice 		=	13;
	id 			=	40061;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 95;
	attribute[ATR_DEXTERITY] 	= 95;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 460;
	attribute[ATR_HITPOINTS] 	= 460;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_LightGuardsSword_03_Old);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40061;
};

FUNC VOID Rtn_start_40061 ()
{
	//siedzi na ziemi
    TA_SitCampfire	(00,00,12,00,"WP_GWM_05");
    TA_SitCampfire	(12,00,00,00,"WP_GWM_05"); 
};
