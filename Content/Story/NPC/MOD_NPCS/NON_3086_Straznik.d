instance NON_3086_Straznik (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Stra�nik";
Npctype = Npctype_Main;
guild = GIL_NONE;
level = 35;
voice = 8;
id = 3086;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 120;
attribute[ATR_DEXTERITY] = 100;
attribute[ATR_MANA_MAX] = 100;
attribute[ATR_MANA] = 100;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Psionic",23, 1,TPL_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_Bastard_03);
CreateInvItems  (self,ItAt_Wolf_01,3);
//CreateInvItems  (self,ItAt_Crawel_01,8);
CreateInvItems  (self,ItFo_Potion_Elixier,10);
CreateInvItems  (self,ItMijoint_3,8);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3086;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3086 ()
{
TA_Stay (00,00,06,00,"LOCATION_19_03_PATH_RUIN10");
TA_Stay (06,00,00,00,"LOCATION_19_03_PATH_RUIN10");
};
