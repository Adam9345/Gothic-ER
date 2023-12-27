
instance GRD_3932_DungeonGuard (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn

//----------Info ogolne----------

name = "Ernesto";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 20;
voice = 13;
id = 3932;

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
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",16, 1,GRD_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,1);

//----------Umiejetnasci----------
B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Long_01);
EquipItem		(self, ItRw_Crossbow_02_Z);
CreateInvItems  (self,ItFoMutton,3);
CreateInvItems  (self,ItFoBeer,3);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,ItMijoint_1,1);
CreateInvItems  (self,ItMiNugget,15);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMi_Stuff_Barbknife_01,1);
CreateInvItems  (self,ItAmBolt,30);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3932;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3932 ()
{
TA_BodyGuard (00,00,12,00,"OCC_CELLAR_LAST_ROOM");
TA_BodyGuard (12,00,00,00,"OCC_CELLAR_LAST_ROOM");
};
