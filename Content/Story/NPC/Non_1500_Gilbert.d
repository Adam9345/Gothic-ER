instance Non_1500_Gilbert (Npc_Default)
{
	//-------- primary data --------
	
	name 		=		"Gilbert";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_NONE;      
	level 		=		4;
	
	
	voice 		=		4;
	id 			=		1500;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,0,"Hum_Head_Thief", 16,  1, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    

B_SetFightSkills(self,40);
	
	//-------- inventory --------                                    
	EquipItem		(self, ItMw_1H_Axe_Old_01);
B_CreateAmbientInv (self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1500;
	};

FUNC VOID Rtn_start_1500 ()
{
	TA_Sleep		(23,00,05,00,"BURDEL");
    TA_WashSelf		(05,00,05,30,"LOCATION_01_07");		
	TA_skrzynka		(05,30,07,30,"LOCATION_01_07");		
	TA_cookforme	(07,30,09,00,"LOCATION_01_07");	
	TA_StandAround	(09,00,12,00,"LOCATION_01_07");	
	TA_skrzynka		(12,00,13,33,"LOCATION_01_07");	
	TA_cookforme	(13,33,15,25,"LOCATION_01_07");	
	TA_StandAround	(15,25,19,30,"LOCATION_01_07");	
	TA_cookforme	(19,30,20,45,"LOCATION_01_07");	
	TA_WashSelf		(20,45,21,30,"LOCATION_01_07");	
	TA_SitAround	(21,30,23,00,"LOCATION_01_07");	
};
FUNC VOID Rtn_follow_1500 ()
{
	TA_FollowPC		(22,00,05,00,"LOCATION_01_07");
    TA_FollowPC		(05,00,22,00,"LOCATION_01_07");		
};
FUNC VOID Rtn_camp_1500 () //dodać FP
{
	TA_SitCampfire		(22,00,05,00,"GILMES");
    TA_SitCampfire		(05,00,22,00,"GILMES");		
};




