instance NOV_1378_Hanson (Npc_Default)
{
//Generated by Gothic NPC Maker

//----------Info ogolne----------

name = "Hanson";
Npctype = Npctype_Main;
guild = GIL_NOV;
level = 20;
voice = 3;
id = 1378;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 70;
attribute[ATR_DEXTERITY] = 10;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 220;
attribute[ATR_HITPOINTS] = 220;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",1, 2,"Hum_Head_Psionic",13, 2,NOV_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Axe_Old_01);
EquipItem		(self, ItRw_Bow_Small_03);
CreateInvItems  (self,ItAt_Swampshark_01,1);
CreateInvItems  (self,ItFoApple,1);
CreateInvItems  (self,ItFoLoaf,1);
CreateInvItems  (self,ItFosoup,1);
CreateInvItems  (self,ItFo_Potion_Health_01,1);
CreateInvItems  (self,ITMI_OSTRZECSI,5);
CreateInvItems  (self,ItMw_1H_Hatchet_01,5);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_1378;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_1378 ()
{
TA_RepairHut (06,00,13,00,"DRWAL1");
TA_SitCampfire (13,00,15,00,"DRWAL2");
TA_Smoke (15,00,16,00,"PATH_SW1");
TA_RepairHut (16,00,18,00,"DRWAL1");
TA_StandAround (18,00,22,00,"DRWAL3");
TA_SitCampfire (22,00,06,00,"DRWAL2");
};
FUNC VOID Rtn_temple_1378 ()
{
TA_Stand (06,00,13,00,"TRYP");
TA_Smoke (13,00,06,00,"TRYP");
};
func void rtn_tot_1378 ()
{
TA_Stand (06,00,13,00,"domnadrozlewiskiem");
TA_Smoke (13,00,06,00,"domnadwysypiskiem");
};