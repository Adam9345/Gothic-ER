instance TPL_1405_GorNaRan (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Ran";
	npctype =						npctype_Main;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1405;
		
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
	//			Body-Mesh	Body-Tex  Skin-Color	Head-MMS    Head-Tex	Teeth-Tex Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 3,"Hum_Head_FatBald", 0, 1, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
   B_SetFightSkills(self,80);
	//-------- inventory --------
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	EquipItem	(self, ItRw_Crossbow_02_Z);//### Palisadenwache
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1405;
};

FUNC VOID Rtn_start_1405 ()
{

    TA_GuardPalisade	(00,00,12,00,"PSI_GUARD3");
    TA_GuardPalisade	(12,00,24,00,"PSI_GUARD3");
};

FUNC VOID Rtn_TOXIC_1405 ()
{
    TA_Stand	(20,00,09,00,"WP_GORNARAN_IN_ORCGRAVE");
    TA_Smoke	(09,00,20,00,"WP_GORNARAN_IN_ORCGRAVE");
};

FUNC VOID Rtn_PrepareRitual_1405 ()
{
	TA_GuardPalisade	(00,00,12,00,"PSI_GUARD3");
    TA_GuardPalisade	(12,00,24,00,"PSI_GUARD3");
};

FUNC VOID Rtn_OMFull_1405 ()
{
	TA_Stay	(00,00,12,00,"BRO1");
    TA_Stay	(12,00,24,00,"BRO1");
};

FUNC VOID Rtn_FMTaken_1405 ()
{
	TA_GuardPalisade	(00,00,12,00,"PSI_GUARD3");
    TA_GuardPalisade	(12,00,24,00,"PSI_GUARD3");
};

FUNC VOID Rtn_OrcAssault_1405 () 
{
	TA_GuardPalisade	(00,00,12,00,"PSI_GUARD3");
    TA_GuardPalisade	(12,00,24,00,"PSI_GUARD3");
};
