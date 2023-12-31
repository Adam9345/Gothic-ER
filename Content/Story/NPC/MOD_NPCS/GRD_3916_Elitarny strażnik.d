instance GRD_3916_Elitarny_straznik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Garotnik";
Npctype = Npctype_main;
guild = GIL_GRD;
level = 50;
voice = 14;
id = 3916;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 400;
attribute[ATR_HITPOINTS] = 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald",18, 1,GRD_ARMOR_H2);
B_Scale (self);
Mdl_SetModelFatness(self,1);

//----------Umiejetnasci----------
B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Broad_02);
EquipItem		(self, ItRw_Crossbow_04);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3916;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3916 ()
{
TA_Guard (08,00,20,00,"OCC_BARONS_DANCE2");
TA_SitAround (20,00,23,00,"OCR_ARENA_BARONS_HUT_ROOFTOP");
TA_Stand (23,00,00,00,"OCC_BARONS_RIGHT_ROOM_TABLE");
TA_BodyGuard (00,00,08,00,"OCC_BARONS_UPSTAIRS_PROMENADE_LEFT_CORNER");
};

FUNC VOID Rtn_OT_3916 ()
{
TA_Stand (08,00,20,00,"OCC_CHAPEL_RIGHT_SAIRCASE_BOTTOM");
TA_Stand (20,00,08,00,"OCC_CHAPEL_RIGHT_SAIRCASE_BOTTOM");
};
