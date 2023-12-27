instance GRD_224_Pacho (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Pacho";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	13;
	id 			=	224;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 4,  1, GRD_ARMOR_L);
        
    B_Scale (self);
	Mdl_SetModelFatness(self,0);
    	
 
	//-------- Talente -------- 
    B_SetFightSkills(self,40);	
	//-------- inventory --------
	
	CreateInvItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//------------- ai -------------
	daily_routine	=	Rtn_start_224;
  	fight_tactic	=	FAI_HUMAN_STRONG;
};

FUNC VOID Rtn_start_224 ()
{
	TA_SitAround	(00,00,12,00,"OW_PATH_018");	// FP "SIT"
	TA_SitAround	(12,00,24,00,"OW_PATH_018");
};
