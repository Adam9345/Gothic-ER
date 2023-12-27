instance GRD_2276_Stra�nik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik";
Npctype = Npctype_Ambient;
guild = GIL_GRD;
level = 35;
voice = 10;
id = 2276;

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
Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",75, 1,GRD_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_04);
EquipItem		(self, ItRw_Crossbow_01);
CreateInvItems  (self,ItAt_Wolf_01,2);
CreateInvItems  (self,ItAt_Claws_01,5);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,ItMiNugget,300);
CreateInvItems  (self,ItKeLockpick,12);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_master;
daily_routine = Rtn_start_2276;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2276 ()
{
TA_Guard (06,00,18,00,"LOCATION_11_01");
TA_Guard (18,00,06,00,"LOCATION_11_01");
};
