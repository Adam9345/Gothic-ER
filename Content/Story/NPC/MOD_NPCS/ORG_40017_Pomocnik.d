instance ORG_40017_Pomocnik (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Pomocnik Silasa";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					9;

	
	voice =					6;
	id =					40017;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		50;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_FatBald", 12, 1,ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente ----------
B_SetFightSkills(self,50);

	//------- Inventory ---------
    B_CreateAmbientInv (self);
	EquipItem		(self, ItMw_1H_Mace_03);
    EquipItem		(self, ItRw_Bow_Long_01);

	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_start_40017;
};

FUNC VOID Rtn_start_40017 () //Wache: Durchgang zu Lares
{
	TA_SitAround	    (20,00,08,00,"WP_SILAS_POMOCNIK");
	TA_SitAround	(08,00,20,00,"WP_SILAS_POMOCNIK");
};

FUNC VOID Rtn_Droga_40017 () 
{
	TA_FollowPC	(20,00,08,00,"FMC_ENTRANCE");
	TA_FollowPC	(08,00,20,00,"FMC_ENTRANCE");
};
FUNC VOID Rtn_Stop_40017 () 
{
	TA_STand	(06,00,13,00,"FMC_PATH07");
	TA_Boss		(13,00,14,00,"FMC_PATH07");

};











