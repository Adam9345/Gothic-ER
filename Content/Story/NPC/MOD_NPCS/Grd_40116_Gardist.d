instance GRD_40116_Gardist (Npc_Default)
{
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_MAIN;
	guild 		=	GIL_GOBBO;
	level 		=	20;
	voice		=	7;
	id 			=	40116;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Thief", 1,  2, GRD_ARMOR_H);
        
 	B_Scale (self);
   	Mdl_SetModelFatness(self,0);
    	

	//-------- Talente -------- 
B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	CreateInvItem	(self, ItMw_1H_Sword_03);
	CreateInvItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 15);
     B_CreateAmbientInv (self);
	
	//------------- ai -------------
	daily_routine	=	Rtn_start_40116;
   	fight_tactic	=	FAI_HUMAN_MASTER;
};

FUNC VOID Rtn_start_40116 ()
{
	TA_Guard	(00,00,06,00,"REPAIR_MS1");
	TA_Guard	(06,00,24,00,"REPAIR_MS1");
};
