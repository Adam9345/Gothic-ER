instance GRD_2277_Stra�nik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik";
Npctype = Npctype_Ambient;
guild = GIL_GRD;
level = 30;
voice = 5;
id = 2277;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 50;
attribute[ATR_DEXTERITY] = 70;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 150;
attribute[ATR_HITPOINTS] = 150;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald",98, 1,GRD_ARMOR_L);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);
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
daily_routine = Rtn_start_2277;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2277 ()
{
TA_Guard (06,00,18,00,"LOCATION_11_16");
TA_Guard (18,00,06,00,"LOCATION_11_16");
};
