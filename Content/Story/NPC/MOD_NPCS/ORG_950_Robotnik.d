instance ORG_950_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					15;

	
	voice =					6;
	id =					950;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 37, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente ----------

B_SetFightSkills(self,70);


	//------- Inventory ---------

	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 12);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, ItMw_1H_Mace_War_02);
	CreateInvItem (self, ItFoBooze);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_start_950;
};

FUNC VOID Rtn_start_950 () 
{
	TA_SitAround	(20,00,08,00,"ROB1");
	TA_SitAround	(08,00,20,00,"ROB1");
};
FUNC VOID Rtn_follow_950 () 
{
	TA_FollowPC	(20,00,08,00,"LOCATION_23_02");
	TA_FollowPC	(08,00,20,00,"LOCATION_23_02");
};

FUNC VOID Rtn_camp_950 () 
{
	TA_Sleep		(06,00,09,00,"LOCATION_23_04");
	TA_Cook			(09,00,12,00,"RYBAK2");
	TA_Smoke			(12,00,15,00,"POMOST4");
	TA_Stand		(15,00,17,30,"LOCATION_23_03");
	TA_Cook			(17,30,21,30,"RYBAK2");
	TA_Sleep	(21,30,06,00,"LOCATION_23_04");
};











