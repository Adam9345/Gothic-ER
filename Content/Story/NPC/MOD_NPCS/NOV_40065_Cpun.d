instance NOV_40065_Cpun (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Cpunisko;
	Npctype 		=	Npctype_Main;
	guild 		=		GIL_NOV;
	level 		=		3;

	voice 		=		3;
	id 			=		40065;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	40;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	156;
	attribute[ATR_HITPOINTS] 		=	156;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Bald", 34,  2, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,5);
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		B_SetFightSkills(self,50);
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Sword_04_Z);
	B_CreateAmbientInv (self);      
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_40065;
};

FUNC VOID Rtn_Start_40065 ()
{
    TA_SitCampfire 		(01,00,08,00,"PSI_PATH_4_13");
    TA_SitCampfire	    (08,00,01,00,"PSI_PATH_4_13");
};
FUNC VOID Rtn_AWAY_40065 ()
{
    TA_SitCampfire 		(01,00,08,00,"PSI_PATH_4_13");
    TA_SitCampfire	    (08,00,01,00,"PSI_PATH_4_13");
};
