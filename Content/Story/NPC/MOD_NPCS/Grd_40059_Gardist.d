instance GRD_40059_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_ORCSCOUT;
	level 		=	10;
	voice 		=	7;
	id 			=	40059;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 85;
	attribute[ATR_DEXTERITY] 	= 85;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 360;
	attribute[ATR_HITPOINTS] 	= 360;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_LightGuardsSword_03_Old);
	B_CreateAmbientInv (self);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40059;
};

FUNC VOID Rtn_start_40059 ()
{
	//siedzi na ³awce na placu zamkowym
    TA_SitAround	(08,00,20,00,"WP_GWM_03");
    TA_Smalltalk	(20,00,08,00,"WP_GWM_03"); 
};