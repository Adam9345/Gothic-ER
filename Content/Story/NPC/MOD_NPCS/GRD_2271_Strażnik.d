instance GRD_2271_Stra�nik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik";
Npctype = Npctype_Ambient;
guild = GIL_GRD;
level = 30;
voice = 3;
id = 2271;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 50;
attribute[ATR_DEXTERITY] = 50;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 270;
attribute[ATR_HITPOINTS] = 270;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",48, 1,GRD_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_03);
EquipItem		(self, ItRw_Crossbow_01);
CreateInvItems  (self,ItAt_Wolf_01,2);
CreateInvItems  (self,ItAt_Claws_01,5);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,Schutzring_Geschosse2,1);
CreateInvItems  (self,ItMiNugget,300);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_master;
daily_routine = Rtn_start_2271;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2271 ()
{
TA_Guard (06,00,18,00,"WORK_LORENZO");
TA_Guard (18,00,06,00,"WORK_LORENZO");
};
