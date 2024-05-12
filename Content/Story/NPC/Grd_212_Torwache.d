instance GRD_212_Torwache (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Torwache;
	Npctype			= NPCTYPE_MAIN;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	212;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 19,  1, GRD_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	self.aivar[AIV_IMPORTANT] 	= TRUE;
	self.aivar[AIV_RESPAWN] 	= TRUE;
	
	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
   B_SetFightSkills(self,70);
			
	//-------- inventory --------
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_212;
};

FUNC VOID Rtn_start_212 ()
{
	TA_GuardPassage	(06,00,21,00,"OCC_GATE_RIGHT_GUARD");
	TA_GuardPassage	(21,00,06,00,"OCC_GATE_RIGHT_GUARD");
};

FUNC VOID Rtn_OMFull_212 ()
{
	TA_GuardPassage	(06,00,21,00,"OCC_GATE_RIGHT_GUARD");
	TA_StandAround	(21,00,22,00,"OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_SitAround	(22,00,24,00,"OCC_GATE_CAMPFIRE_1");
	TA_Sleep	(24,00,06,00,"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
};
FUNC VOID Rtn_FMTaken_212 ()
{
};

FUNC VOID Rtn_OrcAssault_212 ()
{
};


