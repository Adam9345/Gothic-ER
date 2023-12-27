instance BAU_924_Foster (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Foster";
	npctype		=	npctype_main;
	guild 		=	GIL_SFB;      
	level 		=	200;
	voice 		=	8;
	id 			=	924;
    flags = NPC_FLAG_IMMORTAL;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 43;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 264;
	attribute[ATR_HITPOINTS] 	= 264;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,2headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fatbald",111 , 1,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    
    B_SetFightSkills(self,10);
	//-------- inventory --------                                    

		B_CreateAmbientInv (self);
		EquipItem (self, ItMw_1H_Sickle_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_924;
};

FUNC VOID Rtn_start_924 ()
{
	TA_SitCampfire 	(20,20,08,20,"NC_PATH_PEASANT_OUTSIDE20");
	TA_PickRice		(08,20,20,20,"NC_PATH83");
};

// REBEL
FUNC VOID Rtn_rebel_924 ()
{
	TA_SitCampfire 	(20,20,08,20,"NC_PATH86");
	TA_SitCampfire	(08,20,20,20,"NC_PATH86");
};


FUNC VOID Rtn_Robber_924 ()
{
	TA_STAND 	(20,20,08,20,"NC_PATH_PEASANT");
	TA_STAND	(08,20,20,20,"NC_PATH_PEASANT");
};


FUNC VOID Rtn_FollowPZ_924 ()
{
	TA_FollowPC 	(20,20,08,20,"NC_PATH_PEASANT");
	TA_FollowPC	    (08,20,20,20,"NC_PATH_PEASANT");
};

FUNC VOID Rtn_GuidePZ_924 ()
{
	TA_GuidePC 	(20,20,08,20,"OW_PATH_039");
	TA_GuidePC  (08,20,20,20,"OW_PATH_039");
};


FUNC VOID Rtn_GuidePZ2_924 ()
{
	TA_GuidePC 	(20,20,08,20,"RUBEN_FRIEND1");
	TA_GuidePC	(08,20,20,20,"RUBEN_FRIEND1");
};



















