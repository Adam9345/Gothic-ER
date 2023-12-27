instance Org_40137_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_Ambient;
	guild =							GIL_ORG;       
	level =							12;
	
	voice =							13;
	id =							40137;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		35;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	160;
	attribute[ATR_HITPOINTS] =		160;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//twarz 49
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 0,  1,ORG_ARMOR_L );
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	B_SetFightSkills(self,50);
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_01);
    B_CreateAmbientInv (self);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_40137;

};

FUNC VOID Rtn_start_40137 ()
{
	TA_Sleep		(00,00,07,30,"NC_HUT26_IN");	
	TA_SitCampfire	(07,30,00,00,"NC_PATH17_MOVEMENT2");	
};










