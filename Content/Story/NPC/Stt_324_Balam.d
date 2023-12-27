instance STT_324_Balam (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Balam";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_VLK;
	level 		=		3;
	voice 		=		4;
	id 			=		324;
		
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

	//-------- Talente -------- 
B_SetFightSkills(self,30);
	//-------- inventory --------
	EquipItem	(self, ItMw_1H_Sword_Short_02);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_324;
};

FUNC VOID Rtn_start_324 ()
{
	TA_Cook		(08,00,18,00,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook		(18,00,08,00,"OCC_KITCHEN");
};

FUNC VOID Rtn_CH4_324 ()
{ 
	TA_Smoke		    (20,30,23,30,"WP_KRZYKACZ_CH4");
	TA_Smoke	     	(23,30,02,30,"WP_KRZYKACZ_CH4");
	TA_Smoke			(02,30,08,00,"WP_KRZYKACZ_CH4");
	TA_Smoke			(08,00,20,30,"WP_KRZYKACZ_CH4");  //auf Stand-FP
};