instance GRD_225_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	225;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 3,  3, GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
    B_SetFightSkills(self,40);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
B_CreateAmbientInv (self);
	EquipItem	(self, ItRw_Crossbow_01);//### Palisadenwache
	CreateInvItems	(self, ItAmBolt, 10);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_225;
};

FUNC VOID Rtn_start_225 ()
{
	TA_GuardPalisade (00,00,12,00,"OCC_PALISADE_WALLCRACK");
	TA_GuardPalisade (12,00,00,00,"OCC_PALISADE_WALLCRACK");
};

