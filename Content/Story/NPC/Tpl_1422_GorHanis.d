instance TPL_1422_GorHanis (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Hanis";
	npctype =						npctype_main;
	guild =							GIL_NONE;
	level =							12;
	
	
	voice =							8;
	id =							1422;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 66,  1, TPL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
   B_SetFightSkills(self,80);
	//-------- inventory --------
	//-------- inventory --------
	
	EquipItem (self, ItMw_1H_Sword_01);
	B_CreateAmbientInv (self);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1422;
};

FUNC VOID Rtn_start_1422 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_32");
	TA_StandAround  (07,45,10,05,"OCR_CAMPFIRE_I_1");
	TA_Smalltalk	(10,05,16,00,"OCR_SMALLTALK_A_OC_ARENA");
	TA_PracticeSword(16,00,17,15,"OCR_ARENABATTLE");
	TA_SitCampfire	(17,15,23,45,"OCR_CAMPFIRE_I_1");
};
FUNC VOID Rtn_mine_1422 ()
{
	TA_Sleep		(23,45,07,45,"CAMP02");
	TA_StandAround  (07,45,10,05,"CAMP02");
	TA_Smalltalk	(10,05,16,00,"CAMP02");
	TA_Stand 		(16,00,17,15,"CAMP02");
	TA_Stay			(17,15,23,45,"CAMP02");
};
func void Rtn_life_1422 ()
{
	TA_Smalltalk	(08,00,	23,00,"PSI_GUARD_TREE_EX");    
	TA_Smalltalk	(23,00,	08,00,"PSI_GUARD_TREE_EX");
};
func VOID Rtn_Guide_1422 ()
{
	TA_GuidePC (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};

func VOID Rtn_GuideS_1422 ()
{
	TA_GuidePC (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};


