instance GRD_2281_Stra�nik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik";
Npctype = Npctype_Ambient;
guild = GIL_GRD;
level = 30;
voice = 6;
id = 2281;

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
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",57, 1,GRD_ARMOR_M);
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
daily_routine = Rtn_start_2281;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2281 ()
{
TA_GuardPatrol (06,00,18,00,"MARTIN_SLEEP");
TA_GuardPatrol (18,00,06,00,"MARTIN_SLEEP");
};
