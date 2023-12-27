////////////////////////////////////////////////
// HANDLARZ W OBOZIE MYŚLIWYCH
// SPECJALIZACJA: TROFEA
////////////////////////////////////////////////

instance NON_5612_Mil (Npc_Default)
{
//----------Info ogolne----------

name = "Mil";
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 30;
voice = 8;
id = 5612;
flags = 2;

//----------Handlarz_aivar------
self.aivar[AIV_NPCISTRADER] = true;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 80;
attribute[ATR_DEXTERITY] = 140;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 400;
attribute[ATR_HITPOINTS] = 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_Bald", 2,  1, HUN_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04_Z);//ostrze
//EquipItem		(self, ItRw_Bow_Long_01);
B_Give_MilChapter1Ingredients ();
//----------Pozostale----------

fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_5612;
};
FUNC VOID Rtn_start_5612 ()
{
TA_Stand (06,00,22,00,"SHOP_MS1");
TA_Smalltalk (22,00,06,22,"TALK3_MS1");
};