instance ORG_855_Wolf (Npc_Default)
{
	//-------- primary data --------
	
	name  =					"Wilk";
	Npctype			= NPCTYPE_FRIEND;
	guild =					GIL_SLD;      
	level =					11;
	
	voice =					9;
	id    =					855;
    	flags       =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	460;
	attribute[ATR_HITPOINTS] =		460;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 38,  1, SLD_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    
B_SetFightSkills(self,30);
	//-------- inventory -------- //edit by Nocturn
	B_Give_WolfChapter1Weapons ();                                  
    EquipItem (self, ItMw_1H_Mace_War_01);
    EquipItem (self, Wolfs_Bogen);		
	//CreateInvItems (self, ItAmArrow, 20);
	CreateInvItems (self, ItFo_wineberrys_01, 5);
//----------Handlarz_aivar------
	self.aivar[AIV_NPCISTRADER] = true;
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_855;
};

FUNC VOID Rtn_start_855 ()
{
	TA_Sleep 			(01,00,07,30,"NC_HUT11_IN");
	TA_Boss 			(07,30,10,30,"NC_HUT11_OUT");
	TA_RoastScavenger 	(10,30,20,30,"NC_PLACE04");
	TA_SitAround		(20,30,01,00,"NC_PLACE04");
};
//----------------------Zagrożeni Myśliwi
FUNC VOID Rtn_ZMHunters_855 ()
{
	TA_Smoke 			(07,30,10,30,"WP_BUTCH_BRAMA");
	TA_Smoke 	        (10,30,07,30,"WP_BUTCH_BRAMA");
};

FUNC VOID Rtn_ZMFollow_855 ()
{
	TA_FollowPc			(07,30,10,30,"SPAWN_TALL_PATH_BANDITOS2");
	TA_FollowPc	        (10,30,07,30,"SPAWN_TALL_PATH_BANDITOS2");
};









