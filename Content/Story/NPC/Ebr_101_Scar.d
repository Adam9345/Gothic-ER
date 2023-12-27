instance EBR_101_Scar (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Blizna";
	npctype 	= 	npctype_main;
	guild 		=	GIL_EBR;
	level 		=	80;
	voice 		=	8;
	id 			=	101;
	flags		=	2;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 640;
	attribute[ATR_HITPOINTS] 	= 640;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 79,  1, EBR_ARMOR_H2);
        
    	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	
     B_SetFightSkills(self,80);
			
	//-------- inventory --------                                    
	EquipItem(self,Scars_Schwert);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItRw_Crossbow_04);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_101;
};

FUNC VOID Rtn_start_101 ()
{
	TA_Sleep			(02,10,07,40,"OCC_BARONS_UPPER_RIGHT_ROOM_BED3");
	TA_Smalltalk		(07,40,21,05,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_StandAround		(21,05,02,10,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
};

FUNC VOID Rtn_OT_101 ()
{
	TA_Guard		    (07,00,20,00,"OCC_MERCS_HALLWAY_MIDDLE");
	TA_Guard		    (20,00,07,00,"OCC_MERCS_HALLWAY_MIDDLE");
};
FUNC VOID Rtn_arena_101 ()
{
	TA_Stay		    (19,00,03,00,"OCR_ARENABATTLE_TRAIN");
	TA_STAY		    (03,00,19,00,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
};
FUNC VOID Rtn_kill_101 ()
{
	TA_Stay		    (19,00,03,00,"");
	TA_Stay		    (03,00,19,00,"");
};