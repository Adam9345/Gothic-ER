instance Non_1501_Wegelagerer (Npc_Default)

{
	//-------- primary data --------
	
	name 		=		"W³óczêga";
	npctype 	=		npctype_ambient;
	guild 		=		GIL_NONE;      
	level 		=		9;
	
	
	voice 		=		6;
	id 			=		1501;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	175;
	attribute[ATR_HITPOINTS] 		=	175;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	3, 			0,			"Hum_Head_Thief", 	11,  		3,NON_LEATHER_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    
B_SetFightSkills(self,40);
	
	//-------- inventory --------                                    
	EquipItem 		(self, ItMw_1H_Axe_Old_01);
B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1501;
	};

FUNC VOID Rtn_start_1501 ()
{
	// Angreifen bei Sichtung
//	Npc_SetPermAttitude (self, ATT_HOSTILE);

	TA_SitCampfire		(22,00,06,00,"SPAWN_TALL_PATH_BANDITOS2_03");
    TA_Smalltalk		(06,00,22,00,"SPAWN_TALL_PATH_BANDITOS2_02_04");		
};
FUNC VOID Rtn_szwalnia_1501 ()
{
	// Angreifen bei Sichtung
	//Npc_SetPermAttitude (self, ATT_HOSTILE);

	TA_PickRice		(15,00,06,00,"SZWALNIA2");
    TA_Stand		(06,00,15,00,"SZWALNIA2");		
};