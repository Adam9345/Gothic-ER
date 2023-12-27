instance NOV_1377_Starkad (Npc_Default)
{
//----------Info ogolne----------

name = "Starkad";
Npctype = Npctype_Main;
guild = GIL_NOV;
level = 7;
voice = 4;
id = 1377;
flags       =   NPC_FLAG_IMMORTAL;
//----------Statystyki----------

attribute[ATR_STRENGTH] = 30;
attribute[ATR_DEXTERITY] = 30;
attribute[ATR_MANA_MAX] = 15;
attribute[ATR_MANA] = 15;
attribute[ATR_HITPOINTS_MAX] = 360;
attribute[ATR_HITPOINTS] = 360;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 122,  1,NOV_ARMOR_H);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,50);
//----------Ekwipunek----------
EquipItem		(self, ItMw_1H_Hatchet_01);

CreateInvItems  (self,ItAt_Meatbug_01,30);
CreateInvItems  (self,ItFoApple,9);
CreateInvItems  (self,ItFoLoaf,21);
CreateInvItems  (self,ItFoMuttonRaw,9);
CreateInvItems  (self,ItFo_Sausage,10);
CreateInvItems  (self,ItFo_Konfitura,10);
CreateInvItems  (self,ItFo_Honey,10);
CreateInvItems  (self,ItFo_Milk,10);
CreateInvItems  (self,ItFo_Fish,10);
CreateInvItems  (self,ItFosoup,12);
CreateInvItems  (self,ItFoCrawlersoup,12);
CreateInvItems  (self,ItFo_Potion_Water_01,22);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_1377;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_1377 ()
{
TA_Stay (06,00,12,46,"PATROS_SHOP");
TA_Stand (12,46,15,22,"PATROS_SHOP");
TA_Smoke (15,22,17,00,"PATROS_SHOP");
TA_Stand (17,00,06,00,"PATROS_SHOP");
};
func void rtn_robota_1377 ()
{
TA_PickRice (06,00,18,00,"PATROS_SHOP");
TA_Stand (18,00,06,00,"PATROS_SHOP");
};
