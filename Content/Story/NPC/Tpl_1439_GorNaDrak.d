instance TPL_1439_GorNaDrak (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Drak";
	npctype =						npctype_Main;
	guild =							GIL_TPL;
	level =							40;
	
	voice =							9;
	id =							1439;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	520;
	attribute[ATR_HITPOINTS] =		520;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 63,  2, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
   B_SetFightSkills(self,80);
	//-------- inventory --------
	//-------- inventory --------
	EquipItem (self, ItMw_2H_Sword_Light_04);
B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1439;
};

FUNC VOID Rtn_start_1439 () //ST-OM-Pendler (MC-Jäger)
{
    TA_Smalltalk	(06,00,14,00,"PSI_WALK_05");
    TA_Smalltalk	(14,00,19,00,"OM_PSI_1");
	TA_SitAround	(19,00,06,00,"OM_PSI_1");
};

func void Rtn_FMTaken_1439 () //OM ist vollgelaufen
{
	TA_Smalltalk	(06,00,14,00,"PSI_WALK_05");
    TA_Smalltalk	(14,00,06,00,"PSI_WALK_05");
};

FUNC VOID Rtn_Blokada_1439 () //ST-OM-Pendler (MC-Jäger)
{
    TA_Guard	(06,00,14,00,"WP_BLO_GRD4");
    TA_Guard	(14,00,06,00,"WP_BLO_GRD4");
	
};