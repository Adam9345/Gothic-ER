instance Grd_200_Thorus (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Thorus";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_GRD;
	level 		=  	50;
	voice 		=  	9;
	id 			=   200;
	flags       =   NPC_FLAG_IMMORTAL;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 680;
	attribute[ATR_HITPOINTS] 	= 680;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 12,  0, GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,90);
        
	//-------- inventory --------
	
	EquipItem	(self, Thorus_Schwert);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_200;
};

FUNC VOID Rtn_Start_200 ()
{	
	TA_boss		(08,00,23,00,"OCR_THORUS");
    TA_Sleep	(23,00,08,00,"OCC_BARONS_UPPER_RIGHT_ROOM_BED1");
};
FUNC VOID Rtn_nockruka_200 ()
{	
	TA_SitCampfire		(08,00,23,00,"WP_THORUS_NK");
    TA_SitCampfire	(23,00,08,00,"WP_THORUS_NK");
};
