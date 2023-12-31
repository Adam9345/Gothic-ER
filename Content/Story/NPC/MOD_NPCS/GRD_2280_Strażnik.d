instance GRD_2280_Stra�nik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik";
Npctype = Npctype_Ambient;
guild = GIL_GRD;
level = 30;
voice = 3;
id = 2280;

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
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",50, 1,GRD_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_03);
EquipItem		(self, ItRw_Crossbow_01);
CreateInvItems  (self,ItMiNugget,30);
CreateInvItems  (self,ItFoApple,2);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_master;
daily_routine = Rtn_start_2280;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2280 ()
{
TA_GuardPatrol (09,00,12,45,"LOCATION_11_09");
TA_GuardPatrol (12,45,09,00,"LOCATION_11_09");
};
