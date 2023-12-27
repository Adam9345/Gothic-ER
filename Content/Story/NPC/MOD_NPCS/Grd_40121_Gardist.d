instance GRD_40121_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype 	=	Npctype_Main;
	guild 		=	GIL_GOBBO;
	level 		=	15;
	voice 		=	13;
	id 			=	40121;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;


	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 14,  2, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	

	//-------- Talente -------- 
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	CreateInvItem	(self, ItMw_1H_Sword_Broad_01_Z);
	CreateInvItem	(self, ItRw_Crossbow_03_Z);
	CreateInvItems	(self, ItAmBolt, 10);
    B_CreateAmbientInv (self);
    
	
	//-------------Daily Routine-------------
	daily_routine	=	Rtn_start_40121;
   	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_40121 ()
{
	TA_Guard	(00,00,06,00,"ALEX_CAMP");
	TA_Guard	(06,00,24,00,"ALEX_CAMP");
};
