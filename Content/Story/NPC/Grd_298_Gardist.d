instance GRD_298_Gardist (Npc_Default)
{
	//-------- primary data --------
	name 		=	NAME_Gardist;
	guild 		=	GIL_GRD;
	npctype		=	npctype_guard;
	level 		=	14;
	voice 		=	6;
	id 			=	298;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Thief", 1,  2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
    B_SetFightSkills(self,40);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	CreateInvItems	(self, ItAmBolt, 15);
B_CreateAmbientInv (self);
	EquipItem	 	(self,ItRw_Crossbow_01_Old );	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_298;
};

FUNC VOID Rtn_FMstart_298 ()	//FM
{
	TA_GuardPalisade (0,00,13,00,  "FM_07");
	TA_GuardPalisade (13,00,00,00, "FM_07");
};


