instance GRD_251_Kirgo (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kirgo";
	npctype		= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	10;
	voice		=	5;
	id 			=	251;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 2,  1, GRD_ARMOR_L);
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
    B_SetFightSkills(self,40);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_01);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_251;
};

FUNC VOID Rtn_start_251 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_21");
	TA_StandAround  (07,45,10,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_PracticeSword(10,00,14,05,"OCR_ARENABATTLE");
	TA_Smith_Sharp	(14,05,17,15,"OCR_ARENABATTLE_OUTSIDE");
	TA_SitCampfire	(17,15,23,45,"OCR_ARENABATTLE_OUTSIDE");
};

func VOID Rtn_Guide_251 ()
{
	TA_GuidePC (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};
