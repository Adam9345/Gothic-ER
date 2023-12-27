instance GRD_40109_Gardist (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Gardist;
Npctype = Npctype_Ambient;
guild = GIL_GRD;
level = 30;
voice = 7;
id = 40109;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 55;
attribute[ATR_DEXTERITY] = 55;
attribute[ATR_MANA_MAX] = 90;
attribute[ATR_MANA] = 90;
attribute[ATR_HITPOINTS_MAX] = 320;
attribute[ATR_HITPOINTS] = 320;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald",16, 1,GRD_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,1);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_03);
EquipItem		(self, ItRw_Crossbow_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_40109;
//Generated by Gothic NPC Maker
};

FUNC VOID Rtn_start_40109()
{
    TA_Lean	(08,00,20,00,"WP_NOR_G");	
	TA_Lean	(20,00,08,00,"WP_NOR_G");
};