instance ORG_874_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_EnterGuard;//fix
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;         
	level 		=	25;

	
	voice 		=	13;
	id 			=	874;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	260;
	attribute[ATR_HITPOINTS] =		260;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 38,  4, BAU_ARMOR_M);
	
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
	daily_routine = Rtn_start_874;
	};

FUNC VOID Rtn_start_874 ()
{
    TA_RepairHut		(14,00,15,00,"BN_NAPRAWA_CH1");	
    TA_Sleep			(15,00,14,00,"BN_SEN_DOYLE");
};

FUNC VOID Rtn_after_start_874 ()
{
    TA_Guard		(19,00,06,00,"LOCATION_11_02");	
    TA_Sleep		(06,00,17,00,"BN_SEN_DOYLE");
	TA_RepairHut	(17,00,18,30,"BN_NAPRAWA_CH1");
	TA_SitAround	(18,30,19,00,"BN_SIAT_DOYLE");
};

FUNC VOID Rtn_OMFull_874 ()
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_07");	
    TA_StandAround		(14,00,13,00,"LOCATION_11_07");
};












