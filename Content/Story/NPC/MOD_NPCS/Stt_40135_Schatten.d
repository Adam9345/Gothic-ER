instance STT_40135_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Zwiadowca";
	npctype 	=		NPCTYPE_main;
	guild 		=		GIL_BDT;
	level 		=		5;
	
	
	voice 		=		10;
	id 			=		40135;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	50;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	200;
	attribute[ATR_HITPOINTS] 		=	200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Thief", 57,  2, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

B_SetFightSkills(self,50);
		
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_03);
	EquipItem	(self, ItRw_Bow_Small_04);
	CreateInvItems	(self, ItAmArrow, 14);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40135;
};

FUNC VOID Rtn_start_40135 ()
{
TA_Stand (00,00,12,00,"WP_STT_BQ5");
TA_Stand (12,00,00,00,"WP_STT_BQ5");

};

