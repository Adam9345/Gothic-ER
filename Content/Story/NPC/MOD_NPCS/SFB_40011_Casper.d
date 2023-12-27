instance SFB_40011_Casper (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Casper";
	npctype = 				Npctype_MAIN;
	guild =					GIL_SFB;      
	level =					6;
	flags =					0;
	
	voice =					5;
	id =					40011;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 42,  1,SFB_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
		B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItMiNugget, 10);
	
	CreateInvItem  (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMwPickaxe);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_40011;

};

FUNC VOID Rtn_FMCstart_40011 ()
{
	TA_PickOre	(01,00,13,00,	"FMC_ORE_08");
	TA_PickOre	(13,00,01,00,	"FMC_ORE_08");
};

FUNC VOID Rtn_CH4_40011 ()
{
	TA_PlayTune	(01,00,13,00,	"WP_CASPER_CH4");
	TA_PlayTune	(13,00,01,00,	"WP_CASPER_CH4");
};

