instance SLD_702_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Soeldner;
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_SLD;       
	level =					18;
	
	voice =					4;
	id =					702;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Fighter", 46, 2,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

B_SetFightSkills(self,50);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
		

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_702;
};

FUNC VOID Rtn_start_702 ()
{
	TA_Guard	(06,00,23,00,"NC_SMALL_CAVE_ENTRANCE_GUARD");
	TA_Guard	(23,00,06,00,"NC_SMALL_CAVE_ENTRANCE_GUARD");
};
FUNC VOID Rtn_obrona_702 ()
{
	TA_Stand	(06,00,23,00,"SLD1");
	TA_Stand	(23,00,06,00,"SLD1");
};
FUNC VOID Rtn_atak_702 ()
{
	TA_FollowPC	(06,00,23,00,"OW_PATH_53");
	TA_FollowPC	(23,00,06,00,"OW_PATH_53");
};