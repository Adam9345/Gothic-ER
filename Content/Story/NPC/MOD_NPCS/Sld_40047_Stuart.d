instance SLD_40047_Stuart (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Stuart";
	npctype		=	NPCTYPE_main;
	guild 		=	GIL_SLD;
	level 		=	15;
	voice 		=	7;
	id 			=	40047;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Fighter", 1,  1, SLD_ARMOR_HUN);
    Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
	
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_04_Z);	
	B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40047;
};

FUNC VOID Rtn_START_40047()
{
    TA_Guard     	(00,00,08,00,"WP_NCSTUART");	
    TA_Guard		(08,00,24,00,"WP_NCSTUART");	
    
};




