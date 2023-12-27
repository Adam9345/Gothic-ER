instance STT_40052_Perrick (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Perrick";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_STT;
	level 		=		10;
	flags		=       NPC_FLAG_IMMORTAL;
	
	voice 		=		12;
	id 			=		40052;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		60;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		120;
	attribute[ATR_MANA] 			=		120;
	attribute[ATR_HITPOINTS_MAX] 	=		300;
	attribute[ATR_HITPOINTS] 		=		300;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  3, STT_ARMOR_M);
        
    B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
        
    	//-------- Talente -------- 
B_SetFightSkills(self,50);
		
	//-------- inventory --------
	EquipItem		(self, ItMw_1H_Sword_04_Z);
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40052;
};

FUNC VOID Rtn_start_40052 ()
{
	TA_SitAround		(23,00,07,30,"WP_PERRICK_OC");
	TA_BOSS	            (07,30,11,00,"OCR_OUTSIDE_ARENA");
	TA_SitAround		(11,00,17,00,"WP_PERRICK_OC");
	TA_BOSS         	(17,00,23,00,"OCR_OUTSIDE_ARENA");	
};




