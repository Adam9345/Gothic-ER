instance BAU_929_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SFB;      
	level 		=	2;
	voice 		=	2;
	id 			=	929;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 13;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 64;
	attribute[ATR_HITPOINTS] 	= 64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	

	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 74,  1, -1);
	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	                            	
	//-------- Talente -------- 	                                  

	    B_SetFightSkills(self,10);
	//-------- inventory --------                                    

		
	EquipItem (self, ItMw_1H_Sickle_01);
	B_CreateAmbientInv (self);
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_929;
};

FUNC VOID Rtn_start_929 ()
{
	TA_SitCampfire  (20,30,08,30,"NC_PATH_PEASANT_OUTSIDE9"); //CF3
	TA_PickRice		(08,30,20,30,"NC_PATH80");
};

// REBEL
FUNC VOID Rtn_rebel_929 ()
{
	TA_SitCampfire  (20,30,08,30,"NC_PATH83"); 
	TA_SitCampfire	(08,30,20,30,"NC_PATH83");
};










