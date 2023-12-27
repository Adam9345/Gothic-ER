instance ORG_861_Killian (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Killian";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					8;

	
	voice =					13;
	id =					861;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 38,  4, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,30);
	
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	
	EquipItem (self, ItMw_1H_Mace_02);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_861;
	};

FUNC VOID Rtn_start_861 ()
{
    TA_PotionAlchemy		(00,00,08,00,"LOCATION_23_CAVE_1_02");
	TA_PotionAlchemy		(08,00,24,00,"LOCATION_23_CAVE_1_02");
};

FUNC VOID Rtn_arbeitslos_861 ()
{
    TA_Smoke		(20,00,08,00,"OW_CAVE_KILIAN");
	TA_Smoke		(08,00,20,00,"OW_CAVE_KILIAN");
};










