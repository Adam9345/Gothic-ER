/*************************************************************************
**	Skeleton Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Skeleton(C_Npc)			
{
	name							=	"Szkielet";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	Level_Skeleton;//25
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	115;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;

	
    B_SetFightSkills(self,70);
	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_HUMAN_MASTER;	
//----------------------------------------------------------
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

	//aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Skeleton_Visuals()
{
    Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonWarrior_Visuals()
{
    Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonScout_Visuals()
{
    Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonMage_Visuals()
{
	
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton_fly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Fly_Body",	01,			DEFAULT,	"",			01,  		DEFAULT,	-1);
};


func void Set_SkeletonBranTow_Visuals()
{
	
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SKE_BRANDSKT8",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	//Mdl_SetVisualBody     (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 30,  2, TPL_ARMOR_M);
};

/*************************************************************************
**	Skeleton    														**
*************************************************************************/

INSTANCE Skeleton			(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETON;
	Set_Skeleton_Visuals();
	//Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};

/*************************************************************************
**	SkeletonSH - für die Gruft unter den Stonehenge (SH) 														**
*************************************************************************/

INSTANCE SkeletonSH			(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETON;
	Set_Skeleton_Visuals();
	
	EquipItem	(self,ItMw_1H_Axe_Old_01);//Npc_SetToFightMode		(self, );

	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!

	protection	[PROT_FIRE]		= 40;
	
     B_SetFightSkills(self,70);
	
	
	
	senses_range				= 1000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1000;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 1000;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;

};


/*************************************************************************
**	Skeleton   Scout													**
*************************************************************************/

INSTANCE SkeletonScout		(Mst_Default_Skeleton)
{
	name							=	"Szkielet zwiadowca";
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONSCOUT;
	Set_SkeletonScout_Visuals();
	EquipItem	(self,ItMw_1H_Scythe_01);//Npc_SetToFightMode		(self, );

	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};


/*************************************************************************
**	Skeleton  Warrior													**
*************************************************************************/

INSTANCE SkeletonWarrior	(Mst_Default_Skeleton)
{
	name							=	"Szkielet wojownik";
	Set_SkeletonWarrior_Visuals();
	level							=	Level_SkeletonWarrior;
	attribute	[ATR_STRENGTH]		=	120;
	aivar		[AIV_MM_REAL_ID]	= 	ID_SKELETONWARRIOR;

	EquipItem	(self,ItMw_2H_Sword_Old_01);//Npc_SetToFightMode		(self, );
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
};


/*************************************************************************
**	Skeleton   Mage 													**
*************************************************************************/

INSTANCE SkeletonMage		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet mag";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	Level_SkeletonMage;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;		


	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);

};


/*************************************************************************
**	Skeleton   Mage 	im Nebelturm									**
*************************************************************************/

INSTANCE SkeletonMage_fogtower		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet maga z Wie¿y Mgie³";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	Level_SkeletonMage_FogTower;
	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;		

	attribute	[ATR_HITPOINTS_MAX]	=	355;
	attribute	[ATR_HITPOINTS]		=	355;
	
	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	7);
	CreateInvItem			(self,	theriddle1);
};

/*************************************************************************
**	Szkielet Mag z Opuszczonej Kopalni								**
*************************************************************************/

INSTANCE SkeletonMage_abandonemine		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet maga z Opuszczonej Kopalni";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	50;
	
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	55;		

	attribute	[ATR_HITPOINTS_MAX]	=	420;
	attribute	[ATR_HITPOINTS]		=	420;

	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneFireball);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);
};

/*************************************************************************
**	Szkielet £ucznik							**
*************************************************************************/

INSTANCE Skeleton_bow (Mst_Default_Skeleton)
{
aivar[AIV_MM_REAL_ID] = ID_SKELETON;
Set_SkeletonWarrior_Visuals();
name = "Szkielet ³ucznik";
guild = GIL_NONE; // "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
level = 25;
Npctype = Npctype_ROGUE;
attribute [ATR_STRENGTH] = 100;
attribute [ATR_DEXTERITY] = 250;
fight_tactic = FAI_HUMAN_STRONG;//FAI_HUMAN_RANGED;
    B_SetFightSkills(self,70);

EquipItem (self, itmw_1h_sword_long_01);


EquipItem (self, itrw_bow_long_01);

CreateInvItems(self,ItAmArrow,20);

//EquipItem (self, itmw_1h_sword_long_01);
daily_routine = Rtn_Start_200;
};

/*************************************************************************
**	Summoned Skeleton    												**
*************************************************************************/

INSTANCE SummonedByPC_Skeleton	(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
//-----------------------------------------
	Set_Skeleton_Visuals();

//-----------------------------------------
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	senses						= SENSE_HEAR | SENSE_SEE;
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};

INSTANCE SummonedByNPC_Skeleton	(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
//-----------------------------------------
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
//-----------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};


/*************************************************************************
**	Summoned Skeleton Warrior											**
*************************************************************************/

INSTANCE SummonedByPC_SkeletonWarrior (Mst_Default_Skeleton)
{
	name							=	"Szkielet wojownik";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	120;
	senses						= SENSE_HEAR | SENSE_SEE;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONWARRIOR;
//------------------------------------------
	Set_SkeletonWarrior_Visuals();

//------------------------------------------
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};

INSTANCE SummonedByNPC_SkeletonWarrior (Mst_Default_Skeleton)
{
	name							=	"Szkielet wojownik";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	120;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETONWARRIOR;
//------------------------------------------
	Set_SkeletonWarrior_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
//------------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};

func void Set_OrcSkeleton_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_ske_body_01",DEFAULT,	DEFAULT,	"",	DEFAULT,  	DEFAULT,	-1);
};

INSTANCE OrcSkeleton	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Ork-szkielet";
	level							=	Level_OrcSkeleton;
	guild							=	GIL_SKELETON;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	115;
	attribute	[ATR_HITPOINTS_MAX]	=	320;
	attribute	[ATR_HITPOINTS]		=	320;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	55;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
};

INSTANCE Orcskeleton_Varr	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Stary szkielet orka";
	level							=	14;
	guild							=	GIL_ORCWARRIOR;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	55;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
};


INSTANCE SummonOrcSkeleton	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Przyzwany Ork-szkielet";
	level							=	14;
	guild							=	GIL_SKELETON;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();
	start_aistate	=	ZS_MM_Summoned;
	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	70;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
};

INSTANCE SummonbyPCOrcSkeleton	(Mst_Default_Skeleton)
{
	//-------- general --------
	name							=	"Przyzwany Ork-szkielet";
	level							=	0;
	guild							=	GIL_SKELETON;
	//-------- visual --------
	Set_OrcSkeleton_Visuals();
	start_aistate	=	ZS_MM_SummonedByPC;
	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	100; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
	start_aistate	=	ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 300;
	self.aivar[AIV_MM_TimeLooseHP] 	= 5;
	self.aivar[AIV_MM_PARTYMEMBER] = TRUE;
};




INSTANCE SkeletonBranTower			(Mst_Default_Skeleton)
{
    name							=	"Szkielet-Gwardzista";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	Level_Skeleton;//25
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	150; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	5;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;

	fight_tactic	=	FAI_HUMAN_STRONG;
//----------------------------------------------------------
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
    Set_SkeletonBranTow_Visuals();
	EquipItem (self,  ItMw_2H_Sword_Old_02);
	
};



INSTANCE SkeletonBranTowerR			(Mst_Default_Skeleton)
{
aivar[AIV_MM_REAL_ID] = ID_SKELETON;
Set_SkeletonBranTow_Visuals();
name                  = "Szkielet-Gwardzista";
guild                 = GIL_SKELETON; // "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
level                 = 25;
Npctype               = Npctype_ROGUE;



attribute [ATR_STRENGTH]  = 60;
attribute [ATR_DEXTERITY] = 60;


fight_tactic              =   FAI_HUMAN_STRONG;//FAI_HUMAN_RANGED;
    B_SetFightSkills(self,70);

EquipItem (self,  ItRw_Crossbow_02_S);
EquipItem (self, itmw_1h_sword_long_01);
CreateInvItems	(self, ItAmBolt, 30);

//-------------------------------------------------------------
	
};

INSTANCE SkeletonL			(Mst_Default_Skeleton)
{
    name							=	"Szkielet";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	Level_Skeleton;//25
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	150; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	5;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
     B_SetFightSkills(self,70);
	fight_tactic	=	FAI_HUMAN_STRONG;
//----------------------------------------------------------
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
    Set_Skeleton_Visuals();
	EquipItem (self,  ItMw_2H_Sword_Old_02);
	
};

INSTANCE SkeletonMage_Glest		(Mst_Default_Skeleton)
{
	aivar[AIV_MM_REAL_ID]	= 	ID_SKELETONMAGE;
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet mag";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	Level_SkeletonMage;
	
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	10;		


	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItFo_Potion_Health_Perma_02,	1);

};


//------------------------------------------------------------------------KH

INSTANCE SkeletonKH			(Mst_Default_Skeleton)
{
    name							=	"Szkielet-Gwardzista";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	Level_Skeleton;//25
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	150; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	5;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;

	fight_tactic	=	FAI_HUMAN_MASTER;
	Npc_SetTalentSkill (self, NPC_TALENT_2H,7);
//----------------------------------------------------------
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
    Set_SkeletonBranTow_Visuals();
	EquipItem (self,  ItMw_2H_Sword_Old_02);
	
};