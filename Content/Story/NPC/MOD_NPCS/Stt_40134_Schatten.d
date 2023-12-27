instance Stt_40134_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Zwiadowca";
	npctype 	=		NPCTYPE_AMBIENT	;
	guild 		=		GIL_ORCSCOUT;
	level 		=		7;

	
	voice 		=		12;
	id 			=		40134;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	40;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	224;
	attribute[ATR_HITPOINTS] 		=	224;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic",108 ,  1, STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

B_SetFightSkills(self,50);
		
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Short_04);
	EquipItem	(self, ItRw_Bow_Small_01);
	CreateInvItems	(self, ItAmArrow, 20);
	CreateInvItem	(self, ItKeLockpick);
	CreateInvItem	(self, ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40134;
};

FUNC VOID Rtn_start_40134 ()
{
TA_Stand (00,00,12,00,"WP_STT_BQ4");
TA_Stand (12,00,00,00,"WP_STT_BQ4");

};

