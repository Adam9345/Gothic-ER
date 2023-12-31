instance ORG_850_Wedge (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Klin";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					5;
	id =					850;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fatbald", 37, 1, ORG_ARMOR_M);
	
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    
B_SetFightSkills(self,30);

	//-------- inventory --------
	                                    
B_CreateAmbientInv (self);	
	EquipItem (self, ItMw_1H_Mace_War_01);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_850;
};

FUNC VOID Rtn_start_850 ()
{
	TA_StandDrunk	(21,00,00,00,"WEDGE_KARCZMA");
	TA_Sleep		(00,00,08,00,"NC_HUT17_IN");
	TA_Smalltalk	(08,00,21,00,"NC_PATH06");
};

FUNC VOID Rtn_hanargument_850 ()
{
	TA_Smalltalk		(00,00,06,00,"OW_KLIN_F1");
	TA_Smalltalk		(06,00,00,00,"OW_KLIN_F1");
};