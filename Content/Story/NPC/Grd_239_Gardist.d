instance GRD_239_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Stra�nik wi�zienia";
	npctype		= 	NPCTYPE_AMBIENT;
	guild 		= 	GIL_GRD;
	level 		= 	15;
	voice 		= 	7;
	id 			= 	239;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 10,  1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
   B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);   
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_239;
};

FUNC VOID Rtn_start_239 ()
{
	TA_StandAround (18,00,19,00,"OCC_CELLAR_HALLWAY_FRONT");
	TA_StandAround (19,00,18,00,"OCC_CELLAR_HALLWAY_FRONT");
};

FUNC VOID Rtn_OT_239 ()
{
	TA_Guard	(07,00,20,00,"OCC_CELLAR_HALL"); 
	TA_Guard	(20,00,07,00,"OCC_CELLAR_HALL"); 
};