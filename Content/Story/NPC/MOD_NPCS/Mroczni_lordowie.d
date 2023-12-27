instance NONE_DarkLord_Tower (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Theodrik";
	npctype =						npctype_main;
	guild =							GIL_SKELETON;      
	level =							50;
	
	
	voice =							1;
	id =							7890;

	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	600;
	attribute[ATR_HITPOINTS] =		600;

	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	45;		
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_master; 

	//-------- Talents  --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_2H,8);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_2H_Axe_Old_03);
	CreateInvItems (self, Gold01,10);
	CreateInvItems			(self,	ItFo_Potion_Health_01,	10);	
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7890;
};

FUNC VOID Rtn_start_7890 ()
{
    TA_StandAround	    (08,00,18,00,"LORD2");  
	TA_StandAround     (18,00,08,00,"LORD2");
};


instance NONE_DarkLord_Monestry (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Mertinos";
	npctype =						npctype_main;
	guild =							GIL_NONE;      
	level =							50;
	
	
	voice =							1;
	id =							7891;

	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		1000;
	attribute[ATR_MANA] =			1000;
	attribute[ATR_HITPOINTS_MAX] =	600;
	attribute[ATR_HITPOINTS] =		600;

	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony", 84, 1, MERTINOS_ARMOR);
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		3,		MERTINOS_ARMOR);
	B_Scale (self);		
	Mdl_SetModelFatness (self, 0);
	fight_tactic	=	FAI_HUMAN_MAGE;
		

	//-------- Talents  --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_MAGE,6);
	
	//-------- inventory --------                                    
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);
	CreateInvItems			(self,	ItArScrollChainLightning,10);
	CreateInvItems			(self,	ItArScrollSummonGolem,1);	
	CreateInvItems (self, Gold01,10);
	CreateInvItems			(self,	ItFo_Potion_Mana_01,	10);	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7891;
};

FUNC VOID Rtn_start_7891 ()
{
    TA_StandAround	    (08,00,18,00,"LORD1");  
	TA_StandAround     (18,00,08,00,"LORD1");
};
// It_KeyLord
instance NONE_DarkLord_Castle (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Armand";
	npctype =						npctype_main;
	guild =							GIL_SKELETON;      
	level =							50;
	
	
	voice =							1;
	id =							7892;

	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		100;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	600;
	attribute[ATR_HITPOINTS] =		600;

	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	55;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	70;		
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_master; 

	//-------- Talents  --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_2H,8);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_2H_Axe_Old_03);
	CreateInvItems (self, Pr_Wegiel,10);
	CreateInvItems			(self,	ItFo_Potion_Health_02,	10);	
		
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7892;
};

FUNC VOID Rtn_start_7892 ()
{
    TA_StandAround	    (08,00,18,00,"LORD3");  
	TA_StandAround     (18,00,08,00,"LORD3");
};




