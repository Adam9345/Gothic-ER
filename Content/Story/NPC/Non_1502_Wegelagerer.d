instance Non_1502_Wegelagerer (Npc_Default)

{
	//-------- primary data --------
	
	name 		=		"W³óczêga";
	npctype 	=		npctype_ambient;
	guild 		=		GIL_NONE;      
	level 		=		9;
	
	
	voice 		=		6;
	id 			=		1502;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] 		=	35;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	195;
	attribute[ATR_HITPOINTS] 		=	195;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	2, 			3,			"Hum_Head_Thief", 	5,  		2, 			NON_LEATHER_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
   B_SetFightSkills(self,40);
	//-------- inventory --------                                    
	EquipItem 		(self, ItMw_1H_Sword_Old_01);
B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1502;
	};

FUNC VOID Rtn_start_1502 ()
{
	// Angreifen bei Sichtung
	//Npc_SetPermAttitude (self, ATT_HOSTILE);

	TA_SitCampfire		(22,00,06,00,"SPAWN_TALL_PATH_BANDITOS2_03");
    TA_Smalltalk		(06,00,22,00,"SPAWN_TALL_PATH_BANDITOS2_02_04");		
};
FUNC VOID Rtn_szwalnia_1502 ()
{
	// Angreifen bei Sichtung
	//Npc_SetPermAttitude (self, ATT_HOSTILE);

	TA_Stand		(22,00,06,00,"SZWALNIA1");
    TA_PickRice		(06,00,22,00,"SZWALNIA1");		
};