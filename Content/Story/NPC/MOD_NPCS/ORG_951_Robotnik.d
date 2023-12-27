instance ORG_951_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					15;

	
	voice =					6;
	id =					951;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 35, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente ----------

B_SetFightSkills(self,50);


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
	
	daily_routine = Rtn_start_951;
};

FUNC VOID Rtn_start_951 () //Wache: Durchgang zu Lares
{
	TA_SitAround	(20,00,08,00,"ROB2");
	TA_SitAround	(08,00,20,00,"ROB2");
};
FUNC VOID Rtn_follow_951 () 
{
	TA_FollowPC	(20,00,08,00,"LOCATION_23_02");
	TA_FollowPC	(08,00,20,00,"LOCATION_23_02");
};
FUNC VOID Rtn_camp_951 () 
{
	TA_SitAround	(06,00,09,00,"RYBAK1");
	TA_RepairHut	(09,00,13,00,"NAPRAWA1");
	TA_Stand		(13,00,13,30,"PCL");
	TA_Smoke		(13,30,15,00,"POMOST");
	TA_PickRice		(15,30,18,30,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	TA_SitAround	(18,30,01,00,"RYBAK1");
	TA_Sleep		(01,00,06,00,"LOCATION_23_06");
};












