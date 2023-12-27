instance Org_831_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Przyjaciel Lewusa";
	Npctype =				NPCTYPE_MAIN;
	guild =							GIL_ORG;       
	level =							4;
	
	voice =					6;
	id =					831;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_FatBald", 10, 1, ORG_ARMOR_L);
	
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

	daily_routine = Rtn_start_831;

};

FUNC VOID Rtn_start_831 ()
{
	TA_Smalltalk	(20,00,08,00,"OW_PATH_067");
	TA_Smalltalk	(08,00,20,00,"OW_PATH_067");
};
FUNC VOID Rtn_bunt_831 ()
{
	TA_Stand	(20,00,08,00,"BUNT2");
	TA_Stand	(08,00,20,00,"BUNT2");
};









