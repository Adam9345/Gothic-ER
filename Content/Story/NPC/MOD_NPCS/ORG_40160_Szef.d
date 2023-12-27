instance ORG_40160_Szef (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Szef bandy";
	guild 		=	GIL_ORG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	40;
	voice 		=	13;
	id 			=	40160;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 17,  4, ORG_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);
	CreateInvItems	(self, ItAmBolt, 18);
	B_CreateAmbientInv (self);
	EquipItem	 (self,ItRw_Crossbow_01 );	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40160;
};

FUNC VOID Rtn_start_40160 ()	//FM
{
	TA_GuardPalisade (0,00,13,00,  "GHOST_OLDBANDIT");
	TA_GuardPalisade (13,00,00,00, "GHOST_OLDBANDIT");
};