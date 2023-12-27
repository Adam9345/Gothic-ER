instance ORG_864_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	npctype			=	npctype_ambient;
	guild 			=	GIL_BAU;         
	level =					20;
	
	voice =					13;
	id =					864;


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
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Thief", 9,  1, BAU_ARMOR_L);
	
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
	daily_routine = Rtn_start_864;
};

FUNC VOID Rtn_start_864 ()
{
    TA_WorkMOB		(07,20,14,00,"BN_PRACA_864");	
	TA_SitAround		(14,00,16,20,"BN_SIAT_864");	
    TA_Smalltalk		(16,20,18,00,"BN_PRACA_864");// z Jensem
	TA_SitAround		(18,00,22,35,"BN_SIAT_864");	
	TA_Sleep		(22,35,07,20,"BN_SEN_864");	
	
};

FUNC VOID Rtn_pupil_864 ()
{
	TA_StandAround		(13,00,14,00,"BIJACZ3");	
    TA_StandAround		(14,00,13,00,"BIJACZ3");
};

FUNC VOID Rtn_help_864 ()
{
	TA_FollowPC		(13,00,14,00,"BIJACZ3");	
    TA_FollowPC		(14,00,13,00,"BIJACZ3");
};

FUNC VOID Rtn_OrcAssault_864 ()
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_14");	
    TA_StandAround		(14,00,13,00,"LOCATION_11_14");
};

