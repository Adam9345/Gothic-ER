instance ORG_40151_Podejrzany (Npc_Default)
{
	//-------- primary data --------
	
	name =						"Wystraszony typ";
	Npctype =					Npctype_MAIN;
	guild =						GIL_ORG;      
	level =						20;

	
	voice =						7;
	id =						40151;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	836;
	attribute[ATR_HITPOINTS] =		836;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 37, 2, ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

B_SetFightSkills(self,50);
	

	//-------- inventory --------                                    
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItWr_PZ_Message, 1);
	CreateInvItem (self, ItFoMutton);
	EquipItem (self, ItMw_1H_Sword_Broad_01_Z);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40151;
};

FUNC VOID Rtn_start_40151 ()
{
	TA_Stand	(01,00,13,00,	"NC_SPAWN_DAM_LURKER2");
	TA_Stand	(13,00,01,00,	"NC_SPAWN_DAM_LURKER2");
};