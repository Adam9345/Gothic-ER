instance GRD_40058_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_ORCSCOUT;
	level 		=	15;
	voice 		=	13;
	id 			=	40058;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 17,  4, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_LightGuardsSword_03_Old);
	
    B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40058;
};

FUNC VOID Rtn_start_40058 ()
{
	//pali oraz rozmawia z przywódcą
    TA_Smoke		(08,00,20,05,"WP_GWM_02");
    TA_Smalltalk	(20,05,08,00,"WP_GWM_02"); 
};
