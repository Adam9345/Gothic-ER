instance GRD_209_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	209;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Thief", 3,  1, GRD_ARMOR_M);        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
   B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
     
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_209;
};

FUNC VOID Rtn_start_209 ()
{
	TA_Sleep 		(00,20,07,20,"OCC_MERCS_UPPER_LEFT_ROOM_BED1");
	TA_Smalltalk	(07,20,21,20,"OCC_GATE_INSIDE_SMALLTALK");
	TA_Smalltalk	(21,20,00,20,"OCC_SHADOWS_CORNER_MOVEMENT4");
};
FUNC VOID Rtn_atak_209 ()
{
	TA_SitCampFire 		(00,20,07,20,"SPAWN_GRD4");
	TA_SitCampFire	(07,20,21,20,"SPAWN_GRD4");
	TA_SitCampfire	(21,20,00,20,"SPAWN_GRD4");
};



