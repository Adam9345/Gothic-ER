

instance VLK_40012_Kopacz (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Kopacz";
	npctype =						npctype_main;
	guild =							GIL_NONE;      
	level =							3;
	
	
	voice =							3;
	id =							40012;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	90;
	attribute[ATR_HITPOINTS] =		90;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_FatBald", 106,  3, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talents  --------                                    

B_SetFightSkills(self,50);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);


	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_40012;
};

FUNC VOID Rtn_FMstart_40012 ()	//FM
{
	TA_Stand		(00,00,23,00,"WP_MINE_KOPACZ01");
	TA_Stand	(23,00,24,00,"WP_MINE_KOPACZ01");
};

FUNC VOID Rtn_Walka1_40012 ()	
{
	TA_Stand		(08,00,24,00,"FP_MINE_ARENA");
	TA_Stand		(24,00,08,00,"FP_MINE_ARENA");
};












