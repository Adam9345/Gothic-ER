instance NONE_40157_Balam (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Balam";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_MEATBUG;
	level 		=		3;
	voice 		=		4;
	id 			=		40157;
	flags       = NPC_FLAG_IMMORTAL;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	35;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							body mesh,				bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung
	Mdl_SetVisualBody 	(self,	"Hum_Body_CookSmith", 	0, 		1,		"Hum_Head_Fighter", 15,			1,			-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

B_SetFightSkills(self,50);
		
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_Sword_Short_02);
	CreateInvItem	(self, ItFoApple);
	CreateInvItem	(self, ItKeLockpick);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40157;
};

FUNC VOID Rtn_start_40157 ()
{
	TA_Stand		(08,00,18,00,"OCC_GATE_INSIDE_SMALLTALK");
	TA_Stand		(18,00,08,00,"OCC_GATE_INSIDE_SMALLTALK");
};

