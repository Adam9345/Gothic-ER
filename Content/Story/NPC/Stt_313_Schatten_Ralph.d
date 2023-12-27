instance STT_313_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Ralph";
	npctype 	=		NPCTYPE_MAIN;//deaful: ambient 
	guild 		=		GIL_STT;
	level 		=		5;
	flags       =       1;
	
	voice 		=		12;
	id 			=		313;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		30;
	attribute[ATR_DEXTERITY] 		=		30;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		220;
	attribute[ATR_HITPOINTS] 		=		220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 58,  3, STT_ARMOR_M);
        
    B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
        
    	//-------- Talente -------- 

B_SetFightSkills(self,30);
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_03);
	EquipItem	(self, ItRw_Bow_Small_03);
	B_CreateAmbientInv (self);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_313;
};

FUNC VOID Rtn_start_313 ()
{
	TA_Sleep		(23,00,07,30,"OCR_HUT_36");
	TA_SitAround	(07,30,11,00,"OCR_OUTSIDE_HUT_36");
	TA_RepairHut	(11,00,17,00,"OCR_OUTSIDE_HUT_36");
	TA_SitAround	(17,00,23,00,"OCR_OUTSIDE_HUT_36");
};

FUNC VOID Rtn_FMtaken_313 ()
{
	TA_PickOre		(23,00,07,30,"FMC_ORE_05");
	TA_PickOre		(07,30,11,00,"FMC_ORE_05");
};
