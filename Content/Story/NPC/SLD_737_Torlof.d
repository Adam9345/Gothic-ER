instance SLD_737_Torlof (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Torlof";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_SLD;       
	level =					40;
	
	voice =					4;
	id =					737;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		95;
	attribute[ATR_DEXTERITY] =		75;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	540;
	attribute[ATR_HITPOINTS] =		540;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 53,  1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 1);

	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

B_SetFightSkills(self,80);

	//-------- inventory --------                                    

	EquipItem (self, Torlofs_Axt);
	EquipItem (self, ItRw_Bow_Long_01);
	//CreateInvItems(self, ItAmArrow, 20);
    B_CreateAmbientInv (self);
	
	
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_737;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_start_737 ()
{
	TA_Smalltalk	(08,00,23,00,"NC_HUT04_OUT");
	TA_Boss			(23,00,01,15,"NC_HUT04_OUT");
	TA_Sleep 		(01,15,08,00,"NC_HUT04_IN");
};
FUNC VOID Rtn_obrona_737 ()
{
	TA_Smalltalk	(08,00,23,00,"TALK2");
	TA_Smalltalk	(23,00,01,15,"TALK2");
	TA_Smalltalk 	(01,15,08,00,"TALK2");
};
FUNC VOID Rtn_atak_737 ()
{
	TA_GuidePC	    (08,00,23,00,"KOX");
	TA_GuidePC		(23,00,01,15,"KOX");
	TA_GuidePC 		(01,15,08,00,"KOX");
};
FUNC VOID Rtn_mine_737 ()
{
	TA_Stand		(08,00,23,00,"CAMP01");
	TA_Stand		(23,00,01,15,"CAMP01");
	TA_Stand 		(01,15,08,00,"CAMP01");
};
FUNC VOID Rtn_droga_737 ()
{
	TA_FollowPC		(08,00,23,00,"CAMP01");
	TA_FollowPC		(23,00,01,15,"CAMP01");			
};



//sub

FUNC VOID Rtn_ObozMoroka_737 ()
{
	TA_GuidePC		(08,00,23,00,"OW_PATH_047");
	TA_GuidePC		(23,00,01,15,"OW_PATH_047");			
};


FUNC VOID Rtn_droga1_737 ()
{
	TA_GuidePC		(08,00,23,00,"OW_PATH_BANDITOS01");
	TA_GuidePC		(23,00,01,15,"OW_PATH_BANDITOS01");			
};

FUNC VOID Rtn_NcAttack_737 ()
{
	TA_FollowPC	    (23,00,07,30,"NC_HUT04_OUT");
	TA_FollowPC		(07,30,23,00,"NC_HUT04_OUT");
};
//------------------Zagrożeni Myśliwi-----------------------------------

FUNC VOID Rtn_ZMW_737 ()
{
	TA_Lean	    (23,00,07,30,"WP_NC_TORLOF_ZM");
	TA_Lean		(07,30,23,00,"WP_NC_TORLOF_ZM");
};

FUNC VOID Rtn_ZMHuntersAttack_737 ()
{
	TA_FollowPC	    (23,00,07,30,"SPAWN_TALL_PATH_BANDITOS2");
	TA_FollowPC		(07,30,23,00,"SPAWN_TALL_PATH_BANDITOS2");
};



