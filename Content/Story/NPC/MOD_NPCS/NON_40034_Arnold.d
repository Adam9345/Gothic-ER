////////////////////////////////////////////////
// 
// 
////////////////////////////////////////////////

instance NON_40034_Arnold (Npc_Default)
{
//----------Info ogolne----------

name = "Arnold";
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 8;
id = 40034;
flags = 2;

//----------Handlarz_aivar------


//----------Statystyki----------

attribute[ATR_STRENGTH] = 90;
attribute[ATR_DEXTERITY] = 140;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 400;
attribute[ATR_HITPOINTS] = 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Bald", 13,  1, HUN_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_01);//ostrze
EquipItem		(self, ITHE_Helmet2);
EquipItem		(self, ItRw_Bow_Long_01);
B_CreateAmbientInv (self);
//----------Pozostale----------

fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_40034;
};
FUNC VOID Rtn_start_40034 ()
{
TA_Stand (06,00,13,00,"WP_ARNOLD_HUN");
TA_StandAround (13,00,19,00,"SPAWN_TALL_PATH_BANDITOS2");
TA_Smalltalk (19,00,06,22,"WP_ARNOLD_HUN");
};

FUNC VOID Rtn_Cavalorn_40034 ()
{
TA_Stand (06,00,22,00,"OC_ROUND_21");
TA_Smalltalk (22,00,06,22,"OC_ROUND_21");
};
FUNC VOID Rtn_Bears_40034 ()
{
TA_Stand (06,00,22,00,"WP_ARNOLD_ABEARS");
TA_Stand (22,00,06,22,"WP_ARNOLD_ABEARS");
};
FUNC VOID Rtn_BearsAttack_40034 ()
{
TA_FollowPC (06,00,22,00,"WP_ARNOLD_BEAR1");
TA_FollowPC (22,00,06,22,"WP_ARNOLD_BEAR1");
};
