instance GRD_3935_Hector (Npc_Default)
{
//Generated by Gothic NPC Maker
//edit by Nocturn

//----------Info ogolne----------

name = "Skelden";
Npctype = Npctype_Main;
guild = GIL_GRD;
level = 50;
voice = 6;
id = 3935;

//----------Statystyki----------

attribute[ATR_STRENGTH] = 200;
attribute[ATR_DEXTERITY] = 200;
attribute[ATR_MANA_MAX] = 0;
attribute[ATR_MANA] = 0;
attribute[ATR_HITPOINTS_MAX] = 800;
attribute[ATR_HITPOINTS] = 800;

//----------Wyglad----------

Mdl_SetVisual		(self,"HUMANS.MDS");
Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
Mdl_SetVisualBody (self,"hum_body_naked0",0, 1,"Hum_Head_Bald",57,  2, GRD_ARMOR_H2);
B_Scale (self);
Mdl_SetModelFatness(self,0);

//----------Umiejetnasci----------

B_SetFightSkills(self,90);
//----------Ekwipunek----------
EquipItem		(self, Miecz2H6);
EquipItem		(self, ItRw_Crossbow_04);
CreateInvItems  (self,ItMi_LastFelgorLetter,1); //Żelazna Garota
CreateInvItems  (self,ItFoApple,5);

CreateInvItems  (self,Schutzring_Total2,1);
CreateInvItems  (self,ItMiNugget,150);
CreateInvItems  (self,ItAmBolt,15);
//----------Pozostale----------
fight_tactic	=	FAI_HUMAN_Strong;
daily_routine = Rtn_start_3935;
//Generated by Gothic NPC Maker
};
FUNC VOID Rtn_start_3935 ()
{
TA_Sleep (00,00,06,00,"OCC_BARONS_UPPER_RIGHT_ROOM_BACK");
TA_SitAround (06,00,18,00,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT4");
TA_Smoke (18,00,00,00,"HECTOR_STAND");
};

FUNC VOID Rtn_misja_3935 ()
{
	TA_SitAround	(05,15,08,20,"QUENTIN_SIT");
    TA_Boss			(09,55,12,00,"PATH_B1");
	TA_skrzynka		(09,00,09,55,"CHEST1_BN1");
	TA_Boss			(09,55,12,00,"PATH_B1");
	TA_StandAround	(12,00,15,00,"LOCATION_11_09");
	TA_smoke		(15,00,16,30,"STAND_MAG");
	TA_boss			(16,30,18,20,"PATH_B1");
	TA_Boss			(09,55,12,00,"PATH_B1");
	TA_Boss			(09,55,12,00,"PATH_B1");
};