instance Org_829_Organisator (Npc_Default)
//###Frei Mine-Waypoints eintragen
{
	//-------- primary data --------
	
	name =					Name_Torwache;
	Npctype =				NPCTYPE_MAIN;
	guild =							GIL_ORG;       
	level =							20;
	
	voice =							6;
	id =							829;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	280;
	attribute[ATR_HITPOINTS] =		280;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 26 
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 126, 2, ORG_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
B_SetFightSkills(self,30);
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_02_Z);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_829;

};

FUNC VOID Rtn_start_829 ()
{
	TA_GuardPassage	(08,00,20,00,"OW_PATH_07_21_GUARD_RIGHT");
	TA_GuardPassage	(20,00,08,00,"OW_PATH_07_21_GUARD_RIGHT");
};










