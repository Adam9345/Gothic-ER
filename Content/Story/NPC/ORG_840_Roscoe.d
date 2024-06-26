instance ORG_840_Roscoe (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Roscoe";
	Npctype			= NPCTYPE_MAIN;
	guild =					GIL_ORG;       
	level =					11;
	
	voice =					10;
	id =					840;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Pony", 9, 1, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    
B_SetFightSkills(self,70);

	//-------- inventory --------
	                                    
B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_War_01);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_840;
};

FUNC VOID Rtn_start_840 () //vor Lares H�tte
{
	TA_GuardPassage	(23,00,07,00,"NC_HUT22_OUT_MOVEMENT");
	TA_GuardPassage	(07,00,23,00,"NC_HUT22_OUT_MOVEMENT");	
};

FUNC VOID Rtn_spotkanie_840 () //vor Lares H�tte
{
	TA_Smoke	(23,00,07,00,"NC_TAVERN_ROOM07");
	TA_Smoke	(07,00,23,00,"NC_TAVERN_ROOM07");	
};











