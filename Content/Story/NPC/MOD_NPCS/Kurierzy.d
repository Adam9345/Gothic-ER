instance STT_2078_KDF_NOV (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Kurier Magów Ognia";
	npctype 	=		NPCTYPE_AMBIENT;
	guild 		=		GIL_STT;
	level 		=		5;
	
	
	voice 		=		2;
	id 			=		2078;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		20;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		60;
	attribute[ATR_MANA] 			=		60;
	attribute[ATR_HITPOINTS_MAX] 	=		200;
	attribute[ATR_HITPOINTS] 		=		200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	2, 			3,			"Hum_Head_Thief", 	5,  		2, STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
        
    	//-------- Talente -------- 

B_SetFightSkills(self,50);
	//-------- inventory --------
	EquipItem		(self, Miecz1H14);
	CreateInvItems	(self, ItAmArrow, 12);
	CreateInvItem	(self, ItFo_Potion_Water_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItem	(self, ItKeLockpick);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2078;
};

FUNC VOID Rtn_start_2078 ()
{
	TA_SitAround		(06,00,12,00,"INNOS_BENCH1_OC");
	TA_Stay				(13,00,14,00,"MSZA3");
	TA_SitAround		(14,00,15,00,"INNOS_BENCH1_OC");
	TA_SitAround		(15,00,21,00,"NOV_SIAT");
	TA_Sleep			(21,00,06,00,"OCC_CHAPEL_RIGHT_ROOM");
};
instance STT_2079_KDF_NOV (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Kurier Magów Ognia";
	npctype 	=		NPCTYPE_AMBIENT;
	guild 		=		GIL_STT;
	level 		=		7;
	
	
	voice 		=		2;
	id 			=		2079;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		20;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		60;
	attribute[ATR_MANA] 			=		60;
	attribute[ATR_HITPOINTS_MAX] 	=		200;
	attribute[ATR_HITPOINTS] 		=		200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_naked0",1, 1,"Hum_Head_Bald",103, 1, STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
        
    	//-------- Talente -------- 

B_SetFightSkills(self,50);
	//-------- inventory --------
	EquipItem		(self, Miecz1H14);
	CreateInvItem	(self, ItFo_Potion_Water_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItKeLockpick,2);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2079;
};
FUNC VOID Rtn_start_2079 ()
{
	TA_Smalltalk			(06,00,12,00,"INNOS_TALK2");
	TA_Stay					(12,00,13,00,"MSza2");
	TA_PracticeMagic		(13,00,15,00,"OCC_CENTER_3");
	TA_PracticeMagic		(15,00,20,00,"OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_Sleep				(20,00,06,00,"OCC_CHAPEL_LEFT_ROOM");
};
//---------------------------------------------------------B³achostka
instance STT_2080_KDF_NOV (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Kurier Magów Ognia";
	npctype 	=		NPCTYPE_main;
	guild 		=		GIL_STT;
	level 		=		10;
	
	
	voice 		=		2;
	id 			=		2080;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		40;
	attribute[ATR_DEXTERITY] 		=		18;
	attribute[ATR_MANA_MAX] 		=		60;
	attribute[ATR_MANA] 			=		60;
	attribute[ATR_HITPOINTS_MAX] 	=		200;
	attribute[ATR_HITPOINTS] 		=		200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 49, 1,STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
        
    	//-------- Talente -------- 

B_SetFightSkills(self,50);
	//-------- inventory --------
	EquipItem		(self, Miecz1H14);
	
	B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2080;
};
FUNC VOID Rtn_start_2080 ()
{
	TA_Smalltalk		(06,00,12,00,"INNOS_TALK1");
	TA_Stay			    (12,00,14,00,"MSZA1");
	TA_Pray		        (14,00,17,00,"INNOS_OC");
	TA_SitAround		(17,00,22,00,"NOV_SIT2");
	TA_SitAround	    (22,00,06,00,"INNOS_BENCH1_OC");
};

FUNC VOID Rtn_blachostka_2080 ()
{
	TA_Stay		    (06,00,12,00,"OW_PATH_249");
	TA_Stay			(12,00,06,00,"OW_PATH_249");
	
};