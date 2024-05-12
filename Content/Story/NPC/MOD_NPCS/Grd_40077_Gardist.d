instance Grd_40077_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_BDT;
	level 		=	50;
	voice 		=	7;
	id 			=	40077;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 125;
	attribute[ATR_DEXTERITY] 	= 85;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 640;
	attribute[ATR_HITPOINTS] 	= 640;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);
	B_CreateAmbientInv (self);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40077;
};

FUNC VOID Rtn_start_40077 ()
{
	//
    TA_Smoke	(08,00,20,00,"WP_TMQAGUARD");
    TA_Smoke	(20,00,08,00,"WP_TMQAGUARD"); 
};