instance Org_834_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_Guard;
	guild =						     	GIL_ORG;       
	level =							10;
	
	voice =							13;
	id =							834;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =	50;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA]                      =			0;
	attribute[ATR_HITPOINTS_MAX]    =	    160;
	attribute[ATR_HITPOINTS]              = 		160;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 30 by Wyzyskk
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 3,"Hum_Head_FatBald", 125, 1, ORG_ARMOR_M);
	
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

	daily_routine = Rtn_start_834;

};

FUNC VOID Rtn_start_834 ()
{
	TA_GuardWheelOpen	(23,30,08,00,"OW_PATH_067_WHEEL");
	TA_GuardWheelOpen	(08,00,23,30,"OW_PATH_067_WHEEL");
};

// REBEL
FUNC VOID Rtn_rebel_834 ()
{
	TA_Smalltalk		(23,30,08,00,"OW_PATH_069");
	TA_Smalltalk		(08,00,23,30,"OW_PATH_069");
};