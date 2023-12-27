instance ORG_889_CoErpresser (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Wspólnik szanta¿ysty";
	Npctype =				Npctype_main;
	guild =					GIL_SLD;      
	level =					11;
	
	voice =					7;
	id =					889;

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
	//	body mesh,	head mesh,	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, ORG_ARMOR_M);
	
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
	//edit by Nocturn
	
	start_aistate = ZS_Erpresser;
	daily_routine = Rtn_start_889;
};

FUNC VOID Rtn_start_889 ()
{
	TA_StandAround	(03,00,11,00,"OW_PATH_084");
	TA_StandAround	(11,00,03,00,"OW_PATH_084");	
};




