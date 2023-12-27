instance SLD_40130_Zerron (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Zerron";
	npctype 	=		NPCTYPE_Main;
	guild 		=		GIL_SLD;
	level 		=		40;
	flags       =       NPC_FLAG_IMMORTAL;
	
	voice 		=		10;
	id 			=		40130;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	80;
	attribute[ATR_DEXTERITY] 		=	80;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	560;
	attribute[ATR_HITPOINTS] 		=	560;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung

    Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 19,  1, SLD_ARMOR_M);    
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talente -------- 

B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	( self, ItMw_1H_Mace_War_02_Z );
	EquipItem	( self, ItRw_Bow_War_01_Z );

	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_40130;
};


FUNC VOID Rtn_PreStart_40130 () //Südtor Unten
{
	TA_Guard		(08,00,20,00,"NC_LO_09"); //mit Org_827_Fox
	TA_SitAround		(20,00,08,00,"NC_ASHTON");
};

