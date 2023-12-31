instance TPL_1418_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_TPL;
	level =							12;
	
	
	voice =							13;
	id =							1418;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_FatBald", 61,  0, TPL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,50);
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	B_CreateAmbientInv (self);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1418;
};

FUNC VOID Rtn_start_1418 ()
{
    TA_Sleep			(23,10,06,00,"PSI_33_HUT_IN");
    TA_Sleep			(06,00,23,10,"PSI_33_HUT_IN");	
    //TA_PracticeSword	(06,00,23,10,"PSI_PATH_6_7"); 	//SN: zum ewigen Schlafen verdammt, da der SC an dieser Stelle seine Lern-Anim abspielen soll
};
FUNC VOID Rtn_mine_1418 ()
{
    TA_stand			(23,10,06,00,"OW_PATH_1_16");
    TA_stand			(06,00,23,10,"OW_PATH_1_16");	
    //TA_PracticeSword	(06,00,23,10,"PSI_PATH_6_7"); 	//SN: zum ewigen Schlafen verdammt, da der SC an dieser Stelle seine Lern-Anim abspielen soll
};
