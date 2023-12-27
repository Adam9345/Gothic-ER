instance GRD_279_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	279;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 13,  1, GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 
				
    B_SetFightSkills(self,40);		
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_02);
B_CreateAmbientInv (self);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_279;
	
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};

FUNC VOID Rtn_start_279 ()
{
	TA_Guard (06,00,23,00,"OCC_BARONS_LEFT_ROOM_FRONT");	
	TA_Guard (23,00,06,00,"OCC_BARONS_LEFT_ROOM_FRONT");	
};

FUNC VOID Rtn_die_279 ()
{
	TA_Stand (06,00,23,00,"OCC_GUARD_ROOM_FRONT");	
	TA_Stand (23,00,06,00,"OCC_GUARD_ROOM_FRONT");	
};

