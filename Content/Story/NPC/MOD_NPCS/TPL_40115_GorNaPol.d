instance TPL_40115_GorNaPol (Npc_Default)
{
	//edit by Nocturn
	
	//-------- primary data --------
	name 	=	"Gor Na Pol";
	npctype	=	npctype_main;
	guild 	=	GIL_TPL;
	level 	=	40;
	
	voice 	=	3;
	id 		=	40115;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	460;
	attribute[ATR_HITPOINTS] =		460;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_naked0",1, 2,"Hum_Head_Psionic",13, 2,TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	//-------- Talente -------- 

B_SetFightSkills(self,70);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02_Z);
	B_CreateAmbientInv (self);
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40115;
};

FUNC VOID Rtn_start_40115 ()
{
    	TA_SitCampfire	(09,00,21,00,"WP_TPL_GUARD3");
    	TA_SitCampfire	(21,00,03,00,"WP_TPL_GUARD3");	
};

FUNC VOID Rtn_Ghoran_40115 ()
{
    	TA_FollowPC		(04,00,23,00,"WP_TPL_GUARD3");
    	TA_FollowPC	    (23,00,04,00,"WP_TPL_GUARD3");
};

FUNC VOID Rtn_follow_40115 ()
{
    	TA_FollowPC	(04,00,23,00,"WP_TPL_GUARD3");
    	TA_FollowPC	(23,00,04,00,"WP_TPL_GUARD3");
};
FUNC VOID Rtn_GuideGOL_40115 ()
{
    	TA_GuidePC	(04,00,23,00,"PATH_AROUND_PSI09");
    	TA_GuidePC	(23,00,04,00,"PATH_AROUND_PSI09");
};

FUNC VOID Rtn_FollowGOL_40115 ()
{
    	TA_FollowPC	(04,00,23,00,"PATH_AROUND_PSI09");
    	TA_FollowPC	(23,00,04,00,"PATH_AROUND_PSI09");
};

