instance TPL_1404_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	Npctype =						NpcType_Guard;
	guild =							GIL_TPL;
	level =							17;
	
	voice =							13;
	id =							1404;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244;
	attribute[ATR_HITPOINTS] =		244;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Bald", 13 , 1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
   B_SetFightSkills(self,50);
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	EquipItem	(self, ItRw_Crossbow_01);//### Palisadenwache
	CreateInvItems	(self, ItAmBolt, 10);
	B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1404;
};

FUNC VOID Rtn_start_1404 () //ST Stegwache 1
{
    TA_GuardPalisade	(00,00,22,00,"PSI_PATH_2_2_GUARD");
    TA_GuardPalisade	(22,00,24,00,"PSI_PATH_2_2_GUARD");	
};
