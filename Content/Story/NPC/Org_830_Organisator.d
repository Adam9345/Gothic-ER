instance Org_830_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name    =				Name_Torwache;
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;       
	level =							20;

	
	voice =							13;
	id =							830;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		55;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	288;
	attribute[ATR_HITPOINTS] =		288;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 0,"Hum_Head_FatBald", 12 , 2, ORG_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
B_SetFightSkills(self,30);
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_01);
    B_CreateAmbientInv (self);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_830;
};

FUNC VOID Rtn_start_830 ()
{
	TA_Smoke	(08,00,20,00,"OW_PATH_07_21_GUARD_LEFT");
	TA_Smoke	(20,00,08,00,"OW_PATH_07_21_GUARD_LEFT");
};




