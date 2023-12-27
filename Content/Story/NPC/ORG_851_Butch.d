instance ORG_851_Butch (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Butch";
	Npctype =						Npctype_Main;
	guild =							GIL_ORG;      
	level =							15;
	
	voice =							13;
	id =							851;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald", 36, 1, ORG_ARMOR_H);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic = FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,30);
	//------- Inventory ---------

B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1h_Club_01);
	//EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_851;
	};

FUNC VOID Rtn_start_851 ()
{
	TA_Sleep		(01,00,07,30,"NC_HUT15_IN");
	TA_StandAround	(07,30,01,00,"NC_HUT16_OUT");
};

FUNC VOID Rtn_konwoj_851 ()
{
	TA_StandAround	(01,00,07,30,"WP_BUTCH_KONWOJ");
	TA_StandAround  (07,30,01,00,"WP_BUTCH_KONWOJ");
};

FUNC VOID Rtn_BRAMA_851 ()
{
    TA_Smoke	    (20,00,08,00,"OW_PATH_07_21");
	TA_STandAround	(08,00,20,00,"OW_PATH_07_21");
};









