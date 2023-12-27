instance EBR_106_Bartholo (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Bartholo";
	npctype 	= 	npctype_main;
   	guild 		=	GIL_EBR;      
	level 		=	70;
	voice 		=	12;
	id 			=	106;
	flags		=	NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 65;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 388;
	attribute[ATR_HITPOINTS] 	= 388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 11, 3, EBR_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	aivar[AIV_ITEMSCHWEIN] = TRUE;

	//-------- Talente --------  
	
	
    B_SetFightSkills(self,80);
			
	//-------- inventory --------                                    
	EquipItem(self,Prankenhieb);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItKe_Storage_01);
	CreateInvItem(self,ItWr_Mod_IronGarotte);

	//------------- ai -------------
	daily_routine	=	Rtn_start_106;
	fight_tactic	=	FAI_HUMAN_MASTER;
	senses			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_106 ()
{
	TA_Sleep					(01,00,08,00,	"OCC_BARONS_UPSTAIRS_RIGHT_BACK_ROOM_RIGHT");
	TA_Stand					(08,00,15,55,	"OCC_BARONS_RIGHT_ROOM_BACK");
	TA_PlayTune			(15,55,20,00,	"OCC_BARONS_GREATHALL_RIGHT_BACK");
	TA_StandAround		(20,00,23,00,"OCR_ARENA_BARTHOLOWATCH");
	TA_StandAround		(23,00,01,00,	"OCC_BARONS_GREATHALL_LEFT_BACK"); 
};

func VOID Rtn_OT_106 ()
{
	TA_Guard	( 10,00,22,00, "OCC_CHAPEL_STAIRCASE_TOP" );  
	TA_Guard	( 22,00,10,00, "OCC_CHAPEL_STAIRCASE_TOP" );
};

func void rtn_pomoc_106 ()
{
TA_Stay    (06,00,18,00, "POMOC_BART");
TA_Stay    (18,00,06,00, "POMOC_BART");
};

func void rtn_PNAGATE_106 ()
{
TA_Stay    (06,00,18,00, "OCR_GATE_SQUARE");
TA_Stay    (18,00,06,00, "OCR_GATE_SQUARE");
};