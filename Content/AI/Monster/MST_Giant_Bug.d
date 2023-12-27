//*************************
//	Giant_Bug Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Bug(C_Npc)			
{
	//----- Monster ----
	name							=	"Polna bestia";
	guild							=	GIL_WARAN;
	//aivar[AIV_MM_REAL_ID]			= 	ID_GIANT_BUG;
	level							=	8;
 
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	180;
	attribute	[ATR_HITPOINTS]		=	180;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic				=	FAI_GOLEM;
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= 22;	
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_Bug()
{
	Mdl_SetVisual			(self,	"Giant_Bug.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Bug_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Giant_Bug    
//***************

INSTANCE Giant_Bug	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};


