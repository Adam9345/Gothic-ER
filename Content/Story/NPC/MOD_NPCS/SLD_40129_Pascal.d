instance SLD_40129_Pascal (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Pascal";
	npctype = 				Npctype_Main;
	guild =					GIL_SLD;      
	level =					40;
	flags =					0;
	
	voice =					2;
	id =					40129;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	540;
	attribute[ATR_HITPOINTS] =		540;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony", 143,  4,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talente --------                                    
	B_SetFightSkills(self,70);
	//-------- inventory --------                                    

	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1h_Sword_Blaise);
    EquipItem (self, ItRw_Bow_War_01_Z);
	//CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_40129;

};

FUNC VOID Rtn_start_40129 ()
{
	TA_SitCampfire	(06,00,08,30,	    "WP_PASCAL");
	TA_Smalltalk	(08,30,13,30,	    "NC_PATH_TO_PIT_02");	
	TA_PracticeBow  (13,30,17,30,       "NC_PATH66");	
	TA_Lean         (17,30,24,45,       "WP_ADD_13");
	TA_SitCampfire	(24,45,06,00,	    "WP_PASCAL");
	
};


//---------------------------Zagrozeni Myśliwi
FUNC VOID Rtn_WTHZM_40129 ()
{	
	TA_Stand		(00,00,	23,00,"NC_ENTRANCE_WP");    
	TA_Stand		(23,00,	24,00,"NC_ENTRANCE_WP");     
};	

FUNC VOID Rtn_WaitZM_40129 ()
{	
	TA_Stand		(00,00,	23,00,"OW_PATH_07_21");    
	TA_Stand		(23,00,	24,00,"OW_PATH_07_21");     
};	

FUNC VOID Rtn_ZMFollowToH_40129 ()
{	
	TA_FollowPC	(00,00,	23,00,"SPAWN_TALL_PATH_BANDITOS2");    
	TA_FollowPC	(23,00,	24,00,"SPAWN_TALL_PATH_BANDITOS2");     
};	
