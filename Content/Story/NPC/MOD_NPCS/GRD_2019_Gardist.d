instance GRD_2019_Gardist (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_Gardist;
Npctype = Npctype_Ambient;
guild = GIL_GRD;
level = 50;
voice = 7;
id = 2019;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 80;
attribute[ATR_DEXTERITY] = 120;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 400;
attribute[ATR_HITPOINTS] = 400;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",107, 1,GRD_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Mace_04);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,ItMiNugget,300);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMi_Stuff_Pipe_01,2);
CreateInvItems  (self,ItMi_Stuff_OldCoin_02,500);
CreateInvItems  (self,ItFo_Potion_Health_01,3);
CreateInvItems  (self,ItFo_wineberrys_01,3);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_2019;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2019 ()
{
TA_Guard (06,00,16,00,"GRD18");
TA_Stand (16,00,18,00,"GRD18");
TA_Smoke (18,00,22,00,"GRD18");
TA_Guard (22,00,06,00,"GRD18");
};
