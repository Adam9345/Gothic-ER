instance GRD_262_Aaron (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Aaron";
	npctype		=	npctype_Main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	9;
	id 			=	262;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;


	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Thief", 3,  1, GRD_ARMOR_M);        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
 
	//-------- Talente -------- 
				
   B_SetFightSkills(self,80);
	//-------- inventory --------
	
	EquipItem		(self, ItMw_1H_Sword_02);
	EquipItem		(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 10);
B_CreateAmbientInv (self);
 
	
	//-------------Daily Routine-------------
	daily_routine	=	Rtn_start_262;
   	fight_tactic	=	FAI_HUMAN_STRONG;
   	senses			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_262 ()
{
    TA_StandAround	(00,00,12,00,"OM_CAVE1_34");	
	TA_Standaround	(12,00,24,00,"OM_CAVE1_34");	
};

FUNC VOID Rtn_trick_262 ()
{
    TA_Stay			(00,00,12,00,"OM_CAVE1_47");	
	TA_Stay			(12,00,24,00,"OM_CAVE1_47");	
};

FUNC VOID Rtn_FMTaken_262 ()
{
	TA_StayNeutral	(07,00,20,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	TA_StayNeutral	(20,00,07,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};

FUNC VOID Rtn_FMTaken2_262 ()
{
	TA_Stand	(07,00,20,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
	TA_Stand	(20,00,07,00, "OCR_NORTHGATE_LEFT_GUARD_CHANGE");
};




