instance SLD_707_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =					    NpcType_Guard;
	guild =							GIL_SLD;       
	level =							16;
	
	voice =							8;
	id =							707;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 51, 2,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------
B_SetFightSkills(self,50);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
	
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_707;
	
	//------------- //MISSIONs------------------

};

FUNC VOID Rtn_start_707 ()
{
	TA_GuardPalisade  (06,30,22,15,"NC_LO_05");
	TA_GuardPalisade  (22,15,06,30,"NC_LO_05");		
};

FUNC VOID Rtn_NCEnter_707 ()
{
	TA_Guard (08,00,20,00,"NC_PATH_JARVIS");
	TA_Guard (20,00,08,00,"NC_PATH_JARVIS");
};
FUNC VOID Rtn_obrona_707 ()
{
	TA_GuardPalisade  (06,30,22,15,"PATH_OC_NC_14");
	TA_GuardPalisade  (22,15,06,30,"PATH_OC_NC_14");		
};
FUNC VOID Rtn_atak_707 ()
{
	TA_FollowPC  (06,30,22,15,"PATH_OC_NC_14");
	TA_FollowPC  (22,15,06,30,"PATH_OC_NC_14");		
};








