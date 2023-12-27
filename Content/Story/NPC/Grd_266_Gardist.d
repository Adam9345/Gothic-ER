instance GRD_266_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NPCTYPE_MINE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	13;
	id 			=	266;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Fighter", 1,  2, GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
    B_SetFightSkills(self,40);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_266;
};

FUNC VOID Rtn_start_266 ()
{
    TA_Guard	(08,00,20,00,"OM_050");	
	TA_Guard	(20,00,08,00,"OM_050");
};
func void rtn_atak_266 ()
{
    TA_Guard	(08,00,20,00,"SPAWN_GRD2");	
	TA_Guard	(20,00,08,00,"SPAWN_GRD2");
};


