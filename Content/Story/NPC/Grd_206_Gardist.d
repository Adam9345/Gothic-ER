instance GRD_206_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	206;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;


	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 13,  1, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 15);
B_CreateAmbientInv (self);
	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_206;
};

FUNC VOID Rtn_start_206 ()
{
	TA_Sleep		(23,30,08,30,"OCC_MERCS_UPPER_RIGHT_ROOM_BED5");
	TA_Smalltalk	(08,30,23,30,"OCC_MERCS_ENTRANCE");	
};
func void rtn_atak_206 ()
{
	TA_Guard		(23,30,08,30,"SPAWN_GRD3");
	TA_Guard	(08,30,23,30,"SPAWN_GRD3");	
};
