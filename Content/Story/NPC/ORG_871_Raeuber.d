instance ORG_871_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level =						12;

	
	voice =						7;
	id =						871;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 38,  4, BAU_ARMOR_L);
	
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
	daily_routine = Rtn_start_871;
};

FUNC VOID Rtn_start_871 ()
{
	TA_Sleep		(21,00,09,00,"HELP1");
	TA_Smoke		(09,00,11,11,"HELP1");
	TA_SitCampfire		(11,11,18,00,"HELP1");
	TA_Smalltalk		(18,00,21,00,"LOCATION_11_07");
};

FUNC VOID Rtn_OMFull_871 ()
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_13");	
    TA_StandAround		(14,00,13,00,"LOCATION_11_13");
};

FUNC VOID Rtn_FMTaken_871 () 
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_13");	
    TA_StandAround		(14,00,13,00,"LOCATION_11_13");
};

FUNC VOID Rtn_OrcAssault_871 () 
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_13");	
    TA_StandAround		(14,00,13,00,"LOCATION_11_13");
};












