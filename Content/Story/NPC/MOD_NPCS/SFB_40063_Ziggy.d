instance SFB_40063_Ziggy (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Ziggy";
	npctype = 				Npctype_MAIN;
	guild =					GIL_NONE;      
	level =					6;
	flags =					0;
	
	voice =					5;
	id =					40063;

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

	B_CreateAmbientInv (self);
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItWr_ZiggyBook);

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_40063;

};

FUNC VOID Rtn_FMCstart_40063 ()
{
	TA_SitAround	(01,00,13,00,	"WP_ZIGGY_NC");
	TA_SitAround	(13,00,01,00,	"WP_ZIGGY_NC");
};


FUNC VOID Rtn_SZKODNICY_40063 ()
{
	TA_GuidePC	(01,00,13,00,	"WP_LSZ04");
	TA_GuidePC	(13,00,01,00,	"WP_LSZ04");
};

func void Rtn_Follow_40063 ()
{
	TA_FollowPC	(23,00,16,00,"WP_ZIGGY_NC");
	TA_FollowPC	(16,00,23,00,"WP_ZIGGY_NC");
};

FUNC VOID Rtn_Karczma_40063 ()
{
	TA_SitAround	(01,00,13,00,	"WP_ZIGGY_CH4");
	TA_SitAround	(13,00,01,00,	"WP_ZIGGY_CH4");
};