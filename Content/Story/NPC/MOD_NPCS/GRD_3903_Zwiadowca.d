instance GRD_3903_Zwiadowca (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn
//----------Info ogolne----------

name = "Zwiadowca";
Npctype = Npctype_ambient;
guild = GIL_GRD;
level = 14;
voice = 6;
id = 3903;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 70;
attribute[ATR_DEXTERITY] = 70;
attribute[ATR_MANA_MAX] = 10;
attribute[ATR_MANA] = 10;
attribute[ATR_HITPOINTS_MAX] = 200;
attribute[ATR_HITPOINTS] = 200;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 0,"Hum_Head_Bald",8, 1,STT_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
B_SetFightSkills(self,30);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_LightGuardsSword_03_Old);
EquipItem		(self, ItRw_Bow_Long_05_Z);
CreateInvItems  (self,ItFocheese,3);
CreateInvItems  (self,ItForice,2);
CreateInvItems  (self,ItFoMutton,3);
CreateInvItems  (self,ItFoApple,3);
CreateInvItems  (self,ItFoLoaf,2);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMiNugget,20);
CreateInvItems  (self,ItAmArrow,50);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Ranged;
daily_routine = Rtn_start_3903;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3903 ()
{ //można jeszcze rozbudować jak ktoś woli
TA_Boss (00,00,12,00,"OCC_TOWER_PLATFORM_01");
TA_Boss (12,00,00,00,"OCC_TOWER_PLATFORM_01");
};
