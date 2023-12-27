instance GRD_282_Nek (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Martwy Stra¿nik";  //Nek
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	282;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 0 ,"Hum_Head_Bald", 100,  2, GRD_ARMOR_L);
	//Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 2,  1, GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
    B_SetFightSkills(self,40);	
			
	//-------- inventory --------
	
	CreateInvItem	(self, Neks_Amulett);
B_CreateAmbientInv (self);        
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_282;
};

FUNC VOID Rtn_start_282 ()
{
	TA_Stand (08,00,20,00,"LOCATION_15_IN_2");
	TA_Stand (20,00,08,00,"LOCATION_15_IN_2");
};
