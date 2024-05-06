instance GRD_3358_Gardist (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name 		=	NAME_Gardist;
Npctype = Npctype_Main;
guild = GIL_BDT;
level = 30;
voice = 6;
id = 3358;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 60;
attribute[ATR_DEXTERITY] = 60;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 100;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 3,"Hum_Head_Bald",10, 3,GRD_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_01);
EquipItem		(self, ItRw_Crossbow_01);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3358;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3358 ()
{
TA_Guard (09,00,18,00,"PIC2");
TA_Guard (18,00,09,00,"PIC2");
};
