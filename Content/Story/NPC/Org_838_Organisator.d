instance Org_838_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_Ambient;
	guild =							GIL_ORG;       
	level =							4;
	
	voice =							13;
	id =							838;


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
	//twarz 62
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_FatBald", 132 , 2, ORG_ARMOR_L);
	
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

	daily_routine = Rtn_start_838;

};

FUNC VOID Rtn_start_838 ()
{
	TA_Sleep			(02,35,08,05,"NC_HUT31_IN");
	TA_Smalltalk		(08,05,18,05,"NC_HUT31_OUT");
	TA_Smalltalk		(18,05,02,35,"NC_TAVERN_TOP02");
};











