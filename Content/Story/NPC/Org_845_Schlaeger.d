instance Org_845_Schlaeger (Npc_Default)
{
	//-------- primary data --------
	
	name =			Name_Schlaeger;
	Npctype =		NPCTYPE_MAIN;
	guild =			GIL_ORG;       
	level =			15;
	
	voice =			13;
	id =			845;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_FatBald", 10, 1, ORG_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
		
	//-------- Talente --------
B_SetFightSkills(self,30);
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_01);
B_CreateAmbientInv (self);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_845;

};

FUNC VOID Rtn_start_845 ()
{	
	TA_Stand		(08,10,20,20,"NC_PATH69");
	TA_SitCampfire 	(20,20,08,10,"NC_PATH53"); 
};

//REBEL
FUNC VOID Rtn_rebel_845 ()
{	
	TA_Boss		(08,10,20,20,"NC_PATH86_MOVEMENT");
	TA_Boss 	(20,20,08,10,"NC_PATH86_MOVEMENT"); 
};










