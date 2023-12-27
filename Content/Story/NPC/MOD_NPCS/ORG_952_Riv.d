instance ORG_952_Riv (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Riv";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					15;
   // flags =                 NPC_FLAGS_NONE;
	
	voice =					6;
	id =					952;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_FatBald", 10, 1,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente ----------

B_SetFightSkills(self,70);


	//------- Inventory ---------



	EquipItem (self, ItMw_1H_Mace_War_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 10);

	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_start_952;
};

FUNC VOID Rtn_start_952 () //Wache: Durchgang zu Lares
{
	TA_SitAround	(20,00,08,00,"ROB3");
	TA_SitAround	(08,00,20,00,"ROB3");
};

FUNC VOID Rtn_guide_952 () 
{
	TA_GuidePC	(20,00,08,00,"LOCATION_23_02");
	TA_GuidePC	(08,00,20,00,"LOCATION_23_02");
};
FUNC VOID Rtn_camp_952 () 
{
	TA_STand	(06,00,13,00,"LOCATION_23_02");
	TA_Boss		(13,00,14,00,"LOCATION_23_02");
	TA_Stand		(14,00,16,00,"POMOST5");
    TA_SMOKE		(16,00,19,00,"LOCATION_23_02");
    TA_Sleep		(19,00,06,00,"RYBAK3");
};











