instance GRD_40118_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	Npctype			= Npctype_Main;
	guild 		=	GIL_GOBBO;
	level 		=	30;
	voice		=	13;
	id 			=	40118;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Psionic", 2,  1, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_03);
	EquipItem	(self, ItRw_Crossbow_01);
    B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40118;
};

FUNC VOID Rtn_start_40118 ()
{
	TA_Stand		(06,00,21,00,"SHRAT_SLIP");
	TA_Stand		(21,00,06,00,"SHRAT_SLIP");
};

