instance BAN_1610_Quentin (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Quentin";
	Npctype =				Npctype_main;
	guild =					GIL_BAU;     
	level =					80;
	flags			= NPC_FLAG_IMMORTAL;
	voice =					7;
	id =					858;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		120;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	500;
	attribute[ATR_HITPOINTS] =		500;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//	body mesh,	head mesh,	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, QUENTIN_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;		

    //aivar[AIV_ITEMSCHWEIN] = TRUE;
	//-------- Talente --------                                    
B_SetFightSkills(self,90);

	//-------- inventory --------
	B_CreateAmbientInv (self);
	EquipItem 		(self, Miecz1H3);
	EquipItem 		(self, ItRw_Bow_Long_03);
	CreateInvItems  (self, ItAmArrow, 30);
	CreateInvItems  (self, BAU_ARMOR_H, 2);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_858;
};

FUNC VOID Rtn_start_858 ()
{
    TA_SitAround	(05,15,08,20,"QUENTIN_SIT");
    TA_RepairHut	(08,20,09,00,"ROCKY");
	TA_skrzynka		(09,00,09,55,"CHEST1_BN1");
	TA_Boss			(09,55,12,00,"PATH_B1");
	TA_StandAround	(12,00,15,00,"LOCATION_11_09");
	TA_smoke		(15,00,16,30,"STAND_MAG");
	TA_boss			(16,30,18,20,"PATH_B1");
	TA_Smalltalk 	(18,20,21,20,"PATH_B1");
	TA_Sleep		(21,20,05,15,"QUENTIN_SIT");
};

FUNC VOID Rtn_OMFull_858 ()
{
    TA_SitAround		(04,15,09,32,"CHAIR_BN1");
    TA_StandAround		(09,32,13,00,"LOCATION_11_13");
	TA_SitAround		(13,00,14,55,"CHEST1_BN1");
	TA_Stand		(14,55,18,00,"LOCATION_11_13");
	TA_SitAround		(18,00,22,00,"CHAIR_BN1");
	TA_skrzynka		(22,00,22,15,"CHEST1_BN1");
	TA_SitAround		(22,15,04,15,"CHEST1_BN1");
};
FUNC VOID Rtn_wait_858 ()
{
    TA_StandAround		(13,00,14,00,"QUEN");	
    TA_StandAround		(14,00,13,00,"QUEN");	
};
FUNC VOID Rtn_atak_858 ()
{
    TA_FollowPC		(13,00,14,00,"QUEN");	
    TA_FollowPC		(14,00,13,00,"QUEN");	
};

//---------1.6.1------
FUNC VOID Rtn_TMQ1_858 ()
{
    TA_SitCampfire		(13,00,14,00,"WP_TMQ_QUENSIT");	
    TA_SitCampfire	(14,00,13,00,"WP_TMQ_QUENSIT");	
};
FUNC VOID Rtn_TMQNO_858 ()
{
    TA_Smalltalk		(13,00,14,00,"NC_SMALL_CAVE_CENTER");	
    TA_Smalltalk	(14,00,13,00,"NC_SMALL_CAVE_CENTER");	
};



