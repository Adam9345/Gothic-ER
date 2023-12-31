instance GRD_2018_Grobock (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Grobock";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 45;
voice = 8;
id = 2018;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 80;
attribute[ATR_DEXTERITY] = 80;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 300;
attribute[ATR_HITPOINTS] = 300;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 0,"Hum_Head_Bald",106, 1,GRD_ARMOR_M);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);

//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Sword_02);
EquipItem		(self, ItRw_Crossbow_02_Z);
CreateInvItems  (self,ItMiNugget,300);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMi_Stuff_Pipe_01,2);
CreateInvItems  (self,ItMi_Stuff_OldCoin_02,500);
CreateInvItems  (self,ItFo_Potion_Health_01,3);
CreateInvItems  (self,ItFo_wineberrys_01,3);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_2018;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_2018 ()
{
TA_Guard (06,00,15,44,"GRD125");
TA_Guard (15,44,21,00,"GRD125");
TA_SitCampfire (21,00,06,00,"GRD125");
};
