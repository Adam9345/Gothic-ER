instance ORG_869_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;        
	level =					12;
	
	voice =					13;
	id =					869;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Bald", 3,  2, BAU_ARMOR_H);
	
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
	daily_routine = Rtn_start_869;
};

FUNC VOID Rtn_start_869 ()
{
    TA_StandAround		(12,00,14,30,"BN_PALENIE_869");	
	TA_HerbAlchemy (14,30,17,22,"BN_PRACA_869");
	TA_Stand		(17,22,20,30,"BN_PALENIE_869");	
	TA_Smoke		(20,30,23,30,"BN_PALENIE_869");	
    TA_Sleep		(23,30,08,10,"BN_SEN_869");
	TA_HerbAlchemy (08,10,12,00,"BN_PRACA_869");
};

FUNC VOID Rtn_pupil_869 ()
{
	TA_StandAround		(13,00,14,00,"BIJACZ2");	
    TA_StandAround		(14,00,13,00,"BIJACZ2");
};
FUNC VOID Rtn_help_869 ()
{
	TA_FollowPC		(13,00,14,00,"BIJACZ2");	
    TA_FollowPC		(14,00,13,00,"BIJACZ2");
};












