instance ORG_40138_Gavilan (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Gavilan";
	guild 		=	GIL_ORG;
	npctype		=	NPCTYPE_MAIN;
	level 		=	50;
	voice 		=	13;
	id 			=	40138;
	flags       =   NPC_FLAG_IMMORTAL;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony", 0,  1, NON_LEATHER_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_2H_Sword_New_05_Z);
	B_Give_Items_GavilianCh1();
	EquipItem	    (self,ItRw_Crossbow_01 );	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40138;
};

FUNC VOID Rtn_start_40138 ()	//FM
{
	TA_GuardPalisade (0,00,13,00,  "WP_GAVILAN");
	TA_GuardPalisade (13,00,00,00, "WP_GAVILAN");
};
FUNC VOID Rtn_OH_40138 ()	//FM
{
	TA_Lean (0,00,13,00,  "WP_GAVILLAN_CH4");
	TA_Lean (13,00,00,00, "WP_GAVILLAN_CH4");
};