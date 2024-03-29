instance SLD_3915_Gestath (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn
//----------Info ogolne----------

name = "Gestath";
Npctype = Npctype_Main;
guild = GIL_SLD;
level = 15;
voice = 9;
id = 3915;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 86;
attribute[ATR_DEXTERITY] = 50;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 200;
attribute[ATR_HITPOINTS] = 200;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 3,"Hum_Head_Psionic",12, 1,SLD_ARMOR_HUN);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,70);
//----------Ekwipunek----------
EquipItem		(self, ItMw_2H_Sword_01);
EquipItem		(self, ItRw_Bow_Long_03);
CreateInvItems  (self,ItFoApple,3);
CreateInvItems  (self,ItFocheese,1);
CreateInvItems  (self,ItFoMutton,2);
CreateInvItems  (self,ItFoBeer,2);
CreateInvItems  (self,ItFoLoaf,2);
CreateInvItems  (self,ItFo_Potion_Health_01,5);
CreateInvItems  (self,ItLsTorch,2);
CreateInvItems  (self,ItMiNugget,20);
CreateInvItems  (self,ItAmArrow,50);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3915;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3915 ()
{
TA_SitCampfire (00,00,12,00,"SLD_HTS_GESTAH");
TA_SitCampfire (12,00,00,00,"SLD_HTS_GESTAH");
};
FUNC VOID Rtn_hunters_3915 () //na odwal się
{
TA_Stand (06,30,10,33,"HUNTERS_GESTAH");
TA_WashSelf (10,33,11,02,"HUNTERS_VIEWPOINT");
TA_Stand (11,02,14,30,"HUNTERS_GESTAH");
TA_SitCampfire (14,30,06,30,"HUNTERS_GESTAH");
};
FUNC VOID Rtn_cavalorn_3915 () 
{
TA_SitAround (06,00,17,30,"OW_SAWHUT_BENCH2");
TA_SitCampfire (17,30,06,00,"OW_CAVALORN_01");
};