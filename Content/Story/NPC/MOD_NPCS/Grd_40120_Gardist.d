instance GRD_40120_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	Npctype_Main;
	guild 		=	GIL_GOBBO;
	level 		=	20;
	voice		=	7;
	id 			=	40120;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0 , 0,"Hum_Head_Bald", 3, 1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
    B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40120;
};

FUNC VOID Rtn_start_40120 ()
{
	TA_GuardPalisade	(06,00,21,00,"SPAWN_TALL_PATH_BANDITOS2_03"); 
	TA_GuardPalisade	(21,00,06,00,"SPAWN_TALL_PATH_BANDITOS2_03"); 
};


