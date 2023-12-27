instance TPL_5001_Elite (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = NAME_EliteTPL;
Npctype = Npctype_ambient;
guild = GIL_TPL;
level = 50;
voice = 13;
id = 5001;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 100;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 100;
attribute[ATR_MANA] = 100;
attribute[ATR_HITPOINTS_MAX] = 450;
attribute[ATR_HITPOINTS] = 450;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 0,"Hum_Head_Psionic",19, 0,TPL_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------
B_SetFightSkills(self,80);
Npc_SetTalentSkill (self, NPC_TALENT_MAGE,3);

//----------Ekwipunek----------
//edit by Nocturn
EquipItem		(self, ItMw_2H_Sword_02);
EquipItem		(self, ItRw_Crossbow_02_Z);
CreateInvItems  (self,ItAt_Wolf_01,1);
CreateInvItems  (self,ItAt_Shadow_02,1);
CreateInvItems  (self,ItArRuneLight,1);
CreateInvItems  (self,ItArRuneFireball,1);
CreateInvItems  (self,ItMiNugget,50);
CreateInvItems  (self,ItAmBolt,50);

//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_5001;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_5001 ()
{
TA_Guard (06,00,18,00,"TEMP2");
TA_Guard (18,00,06,00,"TEMP2");
};
