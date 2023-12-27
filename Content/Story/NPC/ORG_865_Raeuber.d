instance ORG_865_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level =					12;
	
	voice =					13;
	id =					865;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Thief", 35, 2, BAU_ARMOR_L);

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

	daily_routine = Rtn_start_865;
};

FUNC VOID Rtn_start_865 ()
{
    TA_Sleep			(21,00,08,00,"BN_SEN_865");	
    TA_PracticeSword	(08,00,11,00,"BN_TRENING_WSZYSCY");
	TA_RepairHut		(11,00,14,00,"BN_NAPRAWA_CH1");
	TA_PracticeBow		(14,00,15,20,"BN_TRENING2_WSZYSCY");
	TA_SitAround		(15,20,19,30,"BN_SIAT_DOYLE");	
	TA_Smalltalk		(19,30,21,00,"LOCATION_11_07");	
};

FUNC VOID Rtn_OMFull_865 ()
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_07");	
    TA_StandAround		(14,00,13,00,"LOCATION_11_07");
};

FUNC VOID Rtn_FMTaken_865 ()
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_07");	
    TA_StandAround		(14,00,13,00,"LOCATION_11_07");
};

FUNC VOID Rtn_OrcAssault_865 ()
{
TA_StandAround		(13,00,14,00,"LOCATION_11_07");	
    TA_StandAround	(14,00,13,00,"LOCATION_11_07");
};













