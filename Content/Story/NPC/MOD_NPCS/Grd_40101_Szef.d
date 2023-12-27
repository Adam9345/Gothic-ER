instance GRD_40101_Szef (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_GrdBoss;
	npctype		= 	NPCTYPE_main;
	guild 		=	GIL_GOBBO;
	level 		=	30;
	voice 		=	13;
	id 			=	40101;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 840;
	attribute[ATR_HITPOINTS] 	= 840;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;
	//-------- Talente -------- 
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_04_Z);
	CreateInvItems	(self, ItWr_Blokada, 1);
	
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40101;
};

FUNC VOID Rtn_start_40101 ()
{
    TA_SitCampfire	(06,00,23,00,"WP_GRD_BLOBOSS");
	TA_SitCampfire	(23,00,06,00,"WP_GRD_BLOBOSS");
};

