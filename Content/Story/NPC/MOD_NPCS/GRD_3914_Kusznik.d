instance GRD_3914_Kusznik (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn
//----------Info ogolne----------

name = NAME_Kusznik;
Npctype = Npctype_ambient;
guild = GIL_GRD;
level = 20;
voice = 7;
id = 3914;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 70;
attribute[ATR_DEXTERITY] = 70;
attribute[ATR_MANA_MAX] = 10;
attribute[ATR_MANA] = 10;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald", 79, 4,GRD_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,1);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_LightGuardsSword_03_Old);
EquipItem		(self, ItRw_Crossbow_02_Z);
CreateInvItems  (self,ItFoApple,5);
CreateInvItems  (self,ItFocheese,3);
CreateInvItems  (self,ItFoMutton,3);
CreateInvItems  (self,ItFoBeer,2);
CreateInvItems  (self,ItFoLoaf,2);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMiNugget,15);
CreateInvItems  (self,ItAmBolt,50);
//----------Pozostale----------
//edit by Nocturn
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3914;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3914 ()
{
TA_Boss (0,00,12,00,"KUSZNIK1");
TA_Boss (12,00,0,00,"KUSZNIK1");
};
