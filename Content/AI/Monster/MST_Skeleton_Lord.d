
PROTOTYPE Mst_Skeleton_Lord	(C_NPC)
{
	//----- Monster ----
	name							=	NAME_UpadlyPaladyn;
	guild							=	GIL_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
	level							=	35;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	120; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	540;
	attribute	[ATR_HITPOINTS]		=	540;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	0; //hat RS!
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;	//so lassen!
		
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
   Npc_SetTalentSkill	(self,	NPC_TALENT_2H,			8);

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_HUMAN_MASTER;	
	
	EquipItem	(self,ItMw_2H_Sword_New_05_Z);

	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Skeleton_Lord()
{
    Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	B_SetNpcVisual 		(self, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);
	//Mdl_SetVisualBody	(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	ITAR_PAL_SKEL);
};


//**************************************************************
//	Schattenlord 	
//**************************************************************

INSTANCE Skeleton_Lord	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE LordAmorth (Mst_Skeleton_Lord)
{
    name = "Lord Amroth";
	CreateInvItem (self, ItWr_Urkunde_01);//
	B_SetVisuals_Skeleton_Lord ();
};
INSTANCE Skeleton_LordKH	(Mst_Skeleton_Lord)
{

    attribute	[ATR_STRENGTH]		=	80; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	460;
	attribute	[ATR_HITPOINTS]		=	460;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	B_SetVisuals_Skeleton_Lord ();
};

INSTANCE Skeleton_LordJO	(Mst_Skeleton_Lord)
{

    attribute	[ATR_STRENGTH]		=	70; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	B_SetVisuals_Skeleton_Lord ();
	
};


INSTANCE Skeleton_Lord_TPL	(Mst_Skeleton_Lord)
{

    attribute	[ATR_STRENGTH]		=	130; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	130;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	800;
	attribute	[ATR_MANA] 			=	800;

	B_SetVisuals_Skeleton_Lord ();
	
};
