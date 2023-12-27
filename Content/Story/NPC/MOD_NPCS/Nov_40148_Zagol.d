instance Nov_40148_Zagol (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Zagol";
	Npctype 	=		Npctype_Main;
	guild 		=	        GIL_NOV;
	level 		=	        9;
	flags       =   NPC_FLAG_IMMORTAL;
	voice 		=     		5;
	id 			=     		40148;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	35;
	attribute[ATR_DEXTERITY] 		=	35;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	188;
	attribute[ATR_HITPOINTS] 		=	188;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 27 ,  1, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------
		
B_SetFightSkills(self,50);
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Mace_01_Z);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40148;
};

FUNC VOID Rtn_start_40148 ()
{
    TA_Smoke	(01,00,06,00,"POSLANIEC_BRACTWO");
	TA_Stand	(06,00,01,00,"POSLANIEC_BRACTWO");	
};
