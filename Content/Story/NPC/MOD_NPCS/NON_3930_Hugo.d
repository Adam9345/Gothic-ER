instance NON_3930_Hugo (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn

//----------Info ogolne----------

name = "Hugo";
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 20;
voice = 11;
id = 3930;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 70;
attribute[ATR_DEXTERITY] = 70;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Psionic", 10, 1, NON_ORCHUNTERARMOR_01);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);

//----------Ekwipunek----------
EquipItem		(self, Miecz2h4);
EquipItem		(self, ItRw_Er_Crossbow_H01);
B_CreateAmbientInv (self);

//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3930;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3930 ()
{
TA_ReadBook (00,00,12,00,"HUGO_3");
TA_skrzynka (12,00,13,00,"HUGO_1");
TA_stand (13,00,17,00,"HUGO_2");
TA_ReadBook (17,00,22,00,"HUGO_3");
TA_stand (22,00,00,00,"HUGO_1");
};
FUNC VOID Rtn_lowcy_3930 ()
{
TA_sitcampfire 	(00,00,12,00,"HUNTERS_VIEWPOINT");
ta_workmob 		(12,00,15,00,"HUNTERS_WORK1");
TA_smoke 		(15,00,17,22,"HUNTERS_VIEWPOINT");
TA_workmob 		(17,22,19,00,"HUNTERS_WORK1");
TA_boss 		(19,00,00,00,"HUNTERS_VIEWPOINT");
};