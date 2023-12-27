instance TPL_1406_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							"Ochroniarz Kaloma";
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_TPL;
	level =							40;
	
	voice =							13;
	id =							1406;
		
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
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
   B_SetFightSkills(self,80);
	//-------- inventory --------
	//-------- inventory --------
	EquipItem (self, ItMw_2H_Sword_Light_02);
    B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1406;
};

FUNC VOID Rtn_start_1406 () //Kaloms Wache
{
    TA_GuardPassage	(09,00,21,00,"PSI_LABOR_GUARD_1");
    TA_GuardPassage	(21,00,09,00,"PSI_LABOR_GUARD_1");
};
FUNC VOID Rtn_Arena_1406 () //Kaloms Wache
{
    TA_Stay	(09,00,21,00,"SPECTACTOR_2");
    TA_Stay	(21,00,09,00,"SPECTACTOR_2");
};

FUNC VOID Rtn_flee_1406 () //er 1.4 ucieczka 
{
    TA_Stay	(09,00,21,00,"");
    TA_Stay	(21,00,09,00,"");
};