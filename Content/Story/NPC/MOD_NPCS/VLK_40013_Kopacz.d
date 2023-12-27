instance VLK_40013_Kopacz (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Kopacz";
	npctype =						npctype_main;
		guild =							GIL_NONE;      
	level =							3;
	
	
	voice =							3;
	id =							40010;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		35;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	130;
	attribute[ATR_HITPOINTS] =		130;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_FatBald", 114,  3, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talents  --------                                    
B_SetFightSkills(self,50);                

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);


	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_40013;
};

FUNC VOID Rtn_FMstart_40013 ()	//FM
{
	TA_Stand	(00,00,23,00,"WP_MINE_KOPACZ03");
	TA_Stand	(23,00,24,00,"WP_MINE_KOPACZ03");
};

FUNC VOID Rtn_Walka_40013 ()	//FM
{
	TA_Stand		(08,00,24,00,"FP_MINE_ARENA");
	TA_Stand		(24,00,08,00,"FP_MINE_ARENA");
};












