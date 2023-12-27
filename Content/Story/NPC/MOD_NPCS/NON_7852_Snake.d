instance NON_7852_Snake (Npc_Default)
{

	name =					"Snake";
	npctype		=			npctype_main;
	guild 		=			GIL_NONE;      
	level =					50;
	voice =					10;
	id =					7852;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	270;
	attribute[ATR_HITPOINTS] =		270;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 120, 1, SNAKE_ARMOR);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

B_SetFightSkills(self,60);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,6);		
	CreateInvItems(self, ItMiNugget, 300);
	CreateInvItems (self, ItFoRice,5);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
 	EquipItem (self, ItMw_DaggerOfMurder);		
	EquipItem (self, ItRw_Crossbow_01);
	CreateInvItems (self, ItAmArrow, 60);

	daily_routine = Rtn_start_7852;
};

FUNC VOID Rtn_start_7852 ()
{
	TA_Sleep		(23,55,05,30,"FMC_HUT10_IN");
	TA_SitAround	(05,30,08,00,"FM_SNAKE_BENCH");
	TA_Smith_Sharp	(08,00,13,30,"FM_SNAKE_SHARP");
	TA_SitAround	(13,30,23,55,"FM_SNAKE_BENCH");
};

FUNC VOID Rtn_murder_7852 ()
{
	TA_Stand		(23,55,05,30,"OC_SNAKE_MURDERER"); //OCC_GUARD_ROOM_FRONT
	TA_Stand		(05,30,08,00,"OC_SNAKE_MURDERER"); //OCC_GUARD_ROOM_FRONT2
};

FUNC VOID Rtn_free_7852 ()
{
	TA_Stand		(23,55,05,30,"OCC_CELLAR_SECOND_ROOM");
	TA_Stand		(05,30,08,00,"OCC_CELLAR_SECOND_ROOM");
};

FUNC VOID Rtn_hunter_7852 ()
{
	TA_SitCampfire		(23,55,05,30,"HUN_SNAKE_SIT");
	TA_SitCampfire		(05,30,08,00,"HUN_SNAKE_SIT");
};
