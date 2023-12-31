instance NON_3077_Peratur (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Peratur";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 14;
voice = 11;
id = 3077;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 360;
attribute[ATR_HITPOINTS] = 360;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",15, 0,GRD_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_LightGuardsSword_03_Old);
EquipItem		(self, ItRw_Crossbow_02_Z);
CreateInvItems  (self,ItFoMuttonRaw,2);
CreateInvItems  (self,ItFoBooze,3);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3077;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3077 ()
{
TA_Boss 		(06,00,00,00,"GRD15");
TA_Smoke 	(00,00,04,00,"GRD15");
TA_Stand 	(04,00,06,00,"GRD15");
};

FUNC VOID Rtn_down_3077 ()
{
TA_SitAround (06,00,00,00,"BARON1");
TA_SitAround (00,00,06,00,"BARON1");
};

/*
ER 1.2
FUNC VOID Rtn_explore_3077 ()
{
TA_GuidePC (06,00,00,00,"LOCATION_12_02");
TA_GuidePC (00,00,04,00,"LOCATION_12_02");
TA_GuidePC (04,00,06,00,"LOCATION_12_02");
};

FUNC VOID Rtn_castle_3077 ()
{
TA_FollowPC (06,00,00,00,"BM_PERATERUR");
TA_FollowPC (00,00,04,00,"BM_PERATERUR");
TA_FollowPC (04,00,06,00,"BM_PERATERUR");
};
FUNC VOID Rtn_wait4player_3077 ()
{
TA_Stand (06,00,00,00,"LOCATION_11_06");
TA_Smoke (00,00,04,00,"LOCATION_11_06");
TA_Stand (04,00,06,00,"LOCATION_11_06");
};
FUNC VOID Rtn_defAv_3077 ()
{
TA_Def (06,00,00,00,"BM_PERATERUR");
TA_Def (00,00,04,00,"BM_PERATERUR");
TA_Def (04,00,06,00,"BM_PERATERUR");
};
FUNC VOID Rtn_bandyta_3077 ()
{
TA_PracticeSword (06,00,11,00,"LOCATION_11_06");
TA_Stand (11,00,13,22,"WORK_LORENZO");
TA_PracticeSword (13,22,14,00,"LOCATION_11_06");
TA_Sleep (14,00,18,00,"BED_LORENZO");
TA_Smoke (18,00,21,00,"WORK_LORENZO");
TA_UseHorn (21,00,23,00,"OW_PATH_187");
TA_Sleep (23,00,06,00,"BED_LORENZO");
};*/