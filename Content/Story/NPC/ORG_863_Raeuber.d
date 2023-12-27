instance ORG_863_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;         
	level =					12;
	
	voice =					7;
	id =					863;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald", 6, 1, BAU_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;			
	
	//-------- Talente ----------
B_SetFightSkills(self,30);
	
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_863;
	};

FUNC VOID Rtn_start_863 ()
{
    TA_sleep		(21,00,09,00,"BN_SEN_863");	
    TA_Smoke		(09,00,10,00,"BN_PALENIE_863");	
	 TA_Stand		(10,00,13,30,"BN_PALENIE_863");	
	 TA_Skrzynka		(13,30,15,22,"BN_SKRZYNKA_863");	
	 TA_HerbAlchemy		(15,22,17,50,"BN_PRACA_869");
	 TA_Stand		(17,50,20,30,"BN_PALENIE_863");	
	 TA_Skrzynka		(20,30,21,00,"BN_SKRZYNKA_863");
};

FUNC VOID Rtn_OMFull_863 ()
{
	TA_RoastScavenger		(13,00,14,00,"LOCATION_11_12");	
    TA_RoastScavenger		(14,00,13,00,"LOCATION_11_12");	
};

FUNC VOID Rtn_FMTaken_863 () 
{
	TA_RoastScavenger		(13,00,14,00,"LOCATION_11_12");	
    TA_RoastScavenger		(14,00,13,00,"LOCATION_11_12");	
};

FUNC VOID Rtn_OrcAssault_863 () 
{
	TA_RoastScavenger		(13,00,14,00,"LOCATION_11_12");	
    TA_RoastScavenger		(14,00,13,00,"LOCATION_11_12");	
};














