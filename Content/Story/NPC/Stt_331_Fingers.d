instance STT_331_Fingers (Npc_Default)
{
	//-------- primary data --------
	name 			=		"R�czka";
	npctype			=		npctype_Main;
	guild 			=		GIL_STT;
	level 			=		7;
	
	
	voice 			=		5;
	id 				=		331;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	25;
	attribute[ATR_DEXTERITY] 		=	28;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_HITPOINTS_MAX]	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 56,  1, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 
B_SetFightSkills(self,50);
		
	//-------- inventory --------
	
	EquipItem	( self, ItMw_1H_Sword_Short_04 );
	EquipItem	( self, ItRw_Bow_Small_02);
	CreateInvItems	(self, ItAmArrow, 18);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_331;

	// //MISSION[0] = Mis_1_OC_Fingers_TeachLockpick;
};

FUNC VOID Rtn_start_331 ()
{
	TA_Sleep	(23,00,07,00,"OCR_HUT_20");             
	TA_Boss		(07,00,23,00,"OCR_OUTSIDE_HUT_20");
};
FUNC VOID Rtn_ded_331 ()
{
	TA_Stay		(00,00,06,00,"");             
	TA_Stay		(06,00,00,00,"");
};
FUNC VOID Rtn_zlo_331 ()
{
	TA_Stand		(02,35,23,50,"OCR_OUTSIDE_HUT_20");             
	TA_Stand		(23,50,02,35,"NC_TAVERN_MOVE2");
};
FUNC VOID Rtn_hanargument_331 ()
{
	TA_Smalltalk		(00,00,06,00,"OW_FINGERS_F1");
	TA_Smalltalk		(06,00,00,00,"OW_FINGERS_F1");
};