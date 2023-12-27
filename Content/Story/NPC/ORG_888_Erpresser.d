instance ORG_888_Erpresser (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Szanta¿ysta";
	Npctype =				Npctype_Main;
	guild =					GIL_SLD;      
	level =					15;
	
	voice =					13;
	id =					888;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fatbald", 35, 2,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	
	//-------- Talente ----------

B_SetFightSkills(self,70);
	//------- Inventory ---------

	B_CreateAmbientInv (self);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_War_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	//edit by Nocturn
	
	start_aistate = ZS_Erpresser;
	daily_routine = Rtn_start_888;
};	

FUNC VOID Rtn_start_888 ()
{
	TA_StandAround	(03,00,11,00,"OW_PATH_084");
	TA_StandAround	(11,00,03,00,"OW_PATH_084");	
};














