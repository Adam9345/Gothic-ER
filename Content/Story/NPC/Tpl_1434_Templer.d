instance TPL_1434_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_TPL;
	level =							17;
	
	voice =							8;
	id =							1434;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244;
	attribute[ATR_HITPOINTS] =		244;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 65,  1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,50);
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1434;
};

FUNC VOID Rtn_start_1434 ()
{
    TA_StandAround	(00,00,12,00,"OM_CAVE1_85");	
	TA_StandAround	(12,00,24,00,"OM_CAVE1_85");
};

FUNC VOID Rtn_PrepareRitual_1434 ()
{
	 TA_StandAround	(00,00,12,00,"OM_CAVE1_85");	
	TA_StandAround	(12,00,24,00,"OM_CAVE1_85");
};
FUNC VOID Rtn_mine_1434 ()
{
	 TA_StandAround	(00,00,12,00,"OW_PATH_1_16");	
	TA_StandAround	(12,00,24,00,"OW_PATH_1_16");
};



