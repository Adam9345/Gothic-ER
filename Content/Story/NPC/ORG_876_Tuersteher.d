instance ORG_876_Tuersteher (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Tuersteher;
	Npctype			= NPCTYPE_FRIEND;
	guild =					GIL_ORG;      
	level =					15;
	voice =					6;
	id =					876;
	flags       =   NPC_FLAG_IMMORTAL;
	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				36hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 93, 2, ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

B_SetFightSkills(self,30);
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_876;
};

FUNC VOID Rtn_start_876 ()
{
	TA_GuardPassage	(23,00,08,00,"NC_TAVERN_OUT_GUARD2");
	TA_GuardPassage	(08,00,23,00,"NC_TAVERN_OUT_GUARD2");
};













