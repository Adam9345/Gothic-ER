instance BAU_925_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SFB;      
	level 		=	2;
	voice 		=	4;
	id 			=	925;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex2,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald",45 , 1, -1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	                            	
	//-------- Talente -------- 	                                  
    B_SetFightSkills(self,10);
	
	//-------- inventory --------                                    

		
	EquipItem (self, ItMw_1H_Sickle_01);
	B_CreateAmbientInv (self);
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_925;
};

FUNC VOID Rtn_start_925 ()
{
	TA_Smalltalk	(08,00,20,00,"OW_PATH_069");
	TA_Smalltalk	(20,00,08,00,"OW_PATH_069");
};


