instance BAU_919_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SFB;      
	level 		=	2;
	voice 		=	4;
	id 			=	919;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",78 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	    B_SetFightSkills(self,10);
	//-------- inventory --------                                    

		
		B_CreateAmbientInv (self);
		EquipItem (self, ItMw_1H_Scythe_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_919;
};

FUNC VOID Rtn_start_919 ()
{
	TA_Sleep		(20,40,07,40,"NC_PATH_PEASANT");
	TA_PickRice		(07,40,20,40,"NC_PATH54");
};

FUNC VOID Rtn_goto_919 ()
{
	TA_PickRice		(20,40,07,40,"NC_PATH54");
	TA_PickRice		(07,40,20,40,"NC_PATH54");
};

// REBEL
FUNC VOID Rtn_rebel_919 ()
{
	TA_Stand		(20,40,07,40,"LIBA2");
	TA_Stand		(07,40,20,40,"LIBA2");
};









