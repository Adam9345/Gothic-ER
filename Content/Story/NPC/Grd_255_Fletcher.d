instance GRD_255_Fletcher (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Fletcher";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	255;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Thief", 1,  2, GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
   B_SetFightSkills(self,70);	
			
	//-------- inventory --------
	
	EquipItem	(self, ItMw_1H_Sword_Grd_Master);
	EquipItem	(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_255;
};

FUNC VOID Rtn_Start_255 ()
{
	TA_Guard	(06,00,07,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(07,00,08,00,"OCR_LADDER_TOP_01");
	TA_Guard	(08,00,09,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(09,00,10,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(10,00,11,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(11,00,12,00,"OCR_LADDER_TOP_01");
	TA_Guard	(12,00,13,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(13,00,14,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(14,00,15,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(15,00,16,00,"OCR_LADDER_TOP_01");
	TA_Guard	(16,00,17,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(17,00,18,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(18,00,19,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(19,00,20,00,"OCR_LADDER_TOP_01");
	TA_Guard	(20,00,21,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(21,00,22,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(22,00,23,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(23,00,00,00,"OCR_LADDER_TOP_01");
	TA_Guard	(00,00,01,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(01,00,02,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(02,00,03,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(03,00,04,00,"OCR_LADDER_TOP_01");
	TA_Guard	(04,00,05,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(05,00,06,00,"OCR_BEHIND_HUT_17");
};

FUNC VOID Rtn_FMTaken_255 ()
{
	TA_PracticeSword	(07,00,18,00, "FLETCHER_NK");
	TA_PracticeSword	(18,00,07,00, "FLETCHER_NK"); 
};

FUNC VOID Rtn_FMTaken2_255 ()
{
	TA_Stay			(07,00,20,00, "OC1");
	TA_Stay			(20,00,07,00, "OC1");
};
FUNC VOID Rtn_zamek_255 ()
{
	TA_Stand		(07,00,18,00, "FLETCHER_CASTLE");
	TA_SitAround	(18,00,07,00, "FLETCHER_SIT"); //przy stoisku Skipa
};

FUNC VOID Rtn_nockruka_255 ()
{
	TA_Smalltalk	(07,00,18,00, "WP_FLETCHER_NK");
	TA_Smalltalk	(18,00,07,00, "WP_FLETCHER_NK"); 
};

FUNC VOID Rtn_oc1_255 ()
{
	TA_Stay	(07,00,18,00, "OC1");
	TA_Stay	(18,00,07,00, "OC1"); 
};


FUNC VOID Rtn_bramus_255 ()
{
	TA_FollowPC	(07,00,18,00, "SPAWN_TOTURIAL_CHICKEN_2_2");
	TA_FollowPC	(18,00,07,00, "SPAWN_TOTURIAL_CHICKEN_2_2"); 
};














