instance TPL_1442_Templer (Npc_Default)
{
	//-------- primary data --------
	name =					Name_Templer;
	Npctype					= NPCTYPE_FRIEND;
	guild =							GIL_TPL;
	level =							17;
	
	voice =							13;
	id =							1442;
		
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
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	senses 			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Talente -------- 
   B_SetFightSkills(self,50);
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	B_CreateAmbientInv (self);
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1442;
};

FUNC VOID Rtn_start_1442 ()
{
    TA_GuardPassage	(06,00,18,00,"PSI_TEMPLE_RIGHT_GUARD");	
    TA_GuardPassage	(18,00,06,00,"PSI_TEMPLE_RIGHT_GUARD");	
};

