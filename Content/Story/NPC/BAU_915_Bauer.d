instance BAU_915_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SFB;      
	level 		=	2;
	voice 		=	4;
	id 			=	915;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex1,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",84 ,  2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
		
	//-------- Talente --------                                    
	    B_SetFightSkills(self,10);
	//-------- inventory --------                                    

		B_CreateAmbientInv (self);
		EquipItem (self, ItMw_1H_Scythe_01); 		
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_915;

};

FUNC VOID Rtn_start_915 ()
{
	TA_Sleep		(20,25,07,25,"NC_PATH_PEASANT2");
	TA_PickRice		(07,25,20,25,"NC_PATH80");
};
FUNC VOID Rtn_goto_915 ()
{
	TA_PickRice		(20,25,07,25,"NC_PATH80");
	TA_PickRice		(07,25,20,25,"NC_PATH80");
};
FUNC VOID Rtn_bunt_915 ()
{
	TA_stand		(20,25,07,25,"NC_PATH53");
	TA_stand		(07,25,20,25,"NC_PATH53");
};

// REBEL
FUNC VOID Rtn_rebel_915 ()
{
	TA_stand		(20,25,07,25,"LIBA1");
	TA_stand		(07,25,20,25,"LIBA1");
};










