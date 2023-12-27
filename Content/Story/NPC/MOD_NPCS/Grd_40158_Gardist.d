instance Grd_40158_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_ORG;
	level 		=	15;
	voice 		=	13;
	id 			=	40158;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;
	//-------- Talente -------- 
				
B_SetFightSkills(self,70);
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
    B_CreateAmbientInv (self);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40158;
};

FUNC VOID Rtn_start_40158 ()
{
    TA_StandAround      	  (07,30,20,00,"SERAFIA_GOMEZ");	//2/3
    TA_StandAround		      (20,00,00,00,"SERAFIA_GOMEZ"); //CF1
    TA_StandAround            (00,00,07,30,"SERAFIA_GOMEZ");
};

