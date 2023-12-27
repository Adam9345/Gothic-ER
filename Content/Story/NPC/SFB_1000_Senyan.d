instance SFB_1000_Senyan (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Senyan";
	npctype =				npctype_main;
	guild =					GIL_SFB;      
	level =					10;
	voice =					1;
	id =					1000;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		45;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	150;
	attribute[ATR_HITPOINTS] =		150;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 42,  1, SFB_ARMOR_L);
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_Bald", 1,  3, SFB_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    

B_SetFightSkills(self,10);
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,4);
	CreateInvItems (self, ItMiNugget, 7);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItMw_1H_Nailmace_01);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1000;
};

FUNC VOID Rtn_start_1000 ()
{
	TA_StandAround 	(10,05,03,05,"NC_TAVERN_ROOM06");
	TA_StandAround	(03,05,10,05,"NC_TAVERN_ROOM06");
};
FUNC VOID Rtn_follow_1000 ()
{
	TA_FollowPC 	(10,05,03,05,"NC_TAVERN_ROOM06");
	TA_FollowPC		(03,05,10,05,"NC_TAVERN_ROOM06");
};

FUNC VOID Rtn_nockruka_1000 ()
{
	TA_Smalltalk 	(10,05,03,05,"SENYAN_NK");
	TA_Smalltalk	(03,05,10,05,"SENYAN_NK");
};

FUNC VOID Rtn_karczma_1000 ()
{
	TA_Boss 	(10,05,03,05,"SENYAN_KARCZMA");
	TA_Boss		(03,05,10,05,"SENYAN_KARCZMA");
};











