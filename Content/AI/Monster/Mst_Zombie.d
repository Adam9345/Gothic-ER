/*************************************************************************
**	Zombie Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Zombie(C_Npc)			
{
	name							=	"Zombie";
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	Level_Zombie;//20
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;//+20

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;	// immun
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	10;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-----------------------------------------------------------
	fight_tactic							=	FAI_ZOMBIE;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	

//	senses_range                = PERC_DIST_MONSTER_ACTIVE_MAX;
//	aivar[AIV_MM_FOLLOWTIME]    = FOLLOWTIME_MEDIUM;
//	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
//	start_aistate               = zs_mm_allscheduler;
//	aivar[AIV_MM_RESTSTART]     = ONLYROUTINE;
	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void Set_Zombie_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie2_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie3_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie4_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,			-1);
};


/*************************************************************************
**	Zombie    															**
*************************************************************************/

INSTANCE Zombie		(Mst_Default_Zombie)
{
	Set_Zombie_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Zombie2   															**
*************************************************************************/

INSTANCE Zombie2	(Mst_Default_Zombie)
{
	Set_Zombie2_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Zombie3   															**
*************************************************************************/

INSTANCE Zombie3	(Mst_Default_Zombie)
{
	Set_Zombie3_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Zombie4   															**
*************************************************************************/

INSTANCE Zombie4	(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	Npc_SetToFistMode(self);
};

/*************************************************************************
**	ZombieOrkHunter														**
*************************************************************************/
// SN: Endgegner vor Fokus 5 unter dem Steinkreis (Ende Kapitel 3)
INSTANCE ZombieTheKeeper	(Mst_Default_Zombie)
{
	name	= "Nadzorca";
	level	=	150;		// für XP!
	ID 		= MID_THEKEEPER;

	Mdl_SetVisual			(self,	"Zombie.mds");
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,EBR_ARMOR_H);
	Npc_SetToFistMode(self);

	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_FIRE]			=	9999;	//immun

	senses_range					= 1000;

	aivar[AIV_MM_Behaviour]			= HUNTER;
	
	aivar[AIV_MM_PercRange]			= 1000;
	aivar[AIV_MM_DrohRange]			= 1000;
	aivar[AIV_MM_AttackRange]		= 1000;
	aivar[AIV_MM_DrohTime]			= 0;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater] 	= FALSE;



	CreateInvItem	(self,	ItMi_OrcTalisman);
	CreateInvItem	(self,	ItKe_Focus5);
	Npc_SetToFistMode(self);
	Npc_SetToFightMode (self, ItMw_2h_OldRedSword);
};

/*************************************************************************
**	ZombieWeapon   															**
*************************************************************************/

INSTANCE ZombieWithWeapon	(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetToFightMode (self, ItMw_1H_Mace_03);
};
/*************************************************************************
**	Hrodgir   															**
*************************************************************************/

INSTANCE Zom_Hrodgir	(Mst_Default_Zombie)
{
	name	=   "Hrodgir";
	level	=	80;		// für XP!
	guild   =	GIL_ZOMBIE;
	

	Mdl_SetVisual			(self,	"Zombie.mds");
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,HRODGIR_ARMOR_H);
	
	damagetype 						=	DAM_EDGE|DAM_FLY;

	
    attribute	[ATR_HITPOINTS_MAX]	=	520;
	attribute	[ATR_HITPOINTS]		=	520;//+20
	
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	70;
	protection	[PROT_FIRE]			= 9999;	//immun
    protection	[PROT_MAGIC]		=   10;
	protection	[PROT_FLY]		    = 9999;
	
	senses_range					= 1000;

	aivar[AIV_MM_Behaviour]			= HUNTER;
	
	aivar[AIV_MM_PercRange]			= 1000;
	aivar[AIV_MM_DrohRange]			= 1000;
	aivar[AIV_MM_AttackRange]		= 1000;
	aivar[AIV_MM_DrohTime]			= 0;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater] 	= FALSE;



	CreateInvItem	    (self,ItHe_Hrodgir);
	CreateInvItem	    (self,ItMiNugget);
	Npc_SetToFistMode(self);
	Npc_SetToFightMode (self, ItMw_2h_Sword_Hrodgir);
};

INSTANCE ZombieTMQ1	(Mst_Default_Zombie)
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		3,			GRD_ARMOR_H);
	Npc_SetToFistMode(self);
	Npc_SetToFightMode (self, ItMw_1H_Sword_04_Z);
};
INSTANCE ZombieTMQ2	(Mst_Default_Zombie)
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		3,			GRD_ARMOR_H);
	Npc_SetToFistMode(self);
	Npc_SetToFightMode (self, ItMw_1H_Sword_04_Z);
};
INSTANCE ZombieTMQ3	(Mst_Default_Zombie)
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		3,			GRD_ARMOR_H);
	Npc_SetToFistMode(self);
	Npc_SetToFightMode (self, ItMw_1H_Sword_04_Z);
};
INSTANCE ZombieTMQ4	(Mst_Default_Zombie)
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,			GRD_ARMOR_H);
	Npc_SetToFistMode(self);
	Npc_SetToFightMode (self, ItMw_1H_Sword_04_Z);
};