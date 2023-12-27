instance GRD_40011_Cesar (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Cesar";
	npctype =						npctype_main;
	guild =							GIL_NONE;      
	level =							30;
	
	
	voice =							8;
	id =							40011;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		68;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 110,  3, GRD_ARMOR_H);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	//-------- Talents  --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_1H,9);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Sword_Long_03);	
	
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
    B_CreateAmbientInv (self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_40011;
};

FUNC VOID Rtn_FMstart_40011 ()	//FM
{
	TA_PickOre		(00,00,23,00,"WP_MINE_CESAR");
	TA_PickOre		(23,00,24,00,"WP_MINE_CESAR");
};

FUNC VOID Rtn_kopacz_40011 ()
{
    TA_PickOre	    (08,00,18,00,"OM_PICKORE_11");  
	TA_PickOre	    (18,00,08,00,"OM_PICKORE_11");
};












