/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4.5
******* ZBROJE PRZEZNACZONE DLA NPC
******* Opis: Zbroje dodane w tym pliku s� przeznaczone
******* tylko dla NPC. Gracz nie mo�e ich dosta�, podnie��,
******* znale�� ani kupi�. Precyzja w zwi�zku z balansem
******* nie jest ju� a� tak wymagana (chyba, �e zbroje 
******* przeznaczone s� dla przeciwnik�w).
******* GOTHIC1210
*****************************************************/

/******************************************************************************************/
/**** SZATA DRENA
/******************************************************************************************/
INSTANCE DREN_ARMOR(C_Item)
{
	name 					=	"Szata Drena";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	25;
	wear 					=	WEAR_TORSO;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	visual 					=	"kdfh.3ds";
	visual_change 			=	"Hum_KDFS_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;
	owner 					= 	NON_2234_Medrzec;
	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
/**** SZATA MERTINOSA
/******************************************************************************************/
INSTANCE MERTINOS_ARMOR(C_Item)
{
	name 					=	"Szata Mertinosa";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	80;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	45;
	wear 					=	WEAR_TORSO;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	visual 					=	"kdfh.3ds";
	visual_change 			=	"Hum_KDFS_ARMOR.asc";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;
	owner 					= 	NONE_DarkLord_Monestry;
	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
/**** NOWICJUSZE - �WI�TYNIA �NI�CEGO
/******************************************************************************************/
INSTANCE DarkNovize_Armor_H(C_Item)
{
	name 					=	"Zbroja Mrocznego Nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	65;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	15;
	wear 					=	WEAR_TORSO;

	value 					=	0;//nie na sell

 
	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_NOVM_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
/**** STRA�NICY - �WI�TYNIA �NI�CEGO
/******************************************************************************************/
INSTANCE DarkTempler_Armor_H(C_Item)
{
	name 					=	"Zbroja Apokaliptycznego Stra�nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	80;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	30;

	value 					=	0;//nie na sell

	wear 					=	WEAR_TORSO;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
/**** HE�M - �WI�TYNIA �NI�CEGO
/******************************************************************************************/
instance DarkHelmet(C_Item)
{
        name = "He�m wyznawcy �ni�cego";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
        protection[PROT_EDGE] = 40;
        protection[PROT_BLUNT] = 40;
        protection[PROT_POINT] = 40;
        protection[PROT_FIRE] = 40;
        protection[PROT_MAGIC] = 40;
        value = 5000;
        wear = WEAR_HEAD;  
        visual = "ItroX_Maskfinal4.3DS";   
        visual_skin = 0;
        material = MAT_LEATHER; 
        description = name;
        text[0] = ""; 
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
        text[5] = NAME_Value;
        count[5] = value;
};

/*******************************************************************************************
**	PANCERZ QUENTINA                                              			 **
*******************************************************************************************/
INSTANCE QUENTIN_ARMOR_H(C_Item)
{
	name 					=	"Pancerz Quentina";


	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90;
	protection [PROT_BLUNT] = 	90;
	protection [PROT_POINT] = 	90;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	35;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
  	ownerGuild 				= 	GIL_BAU;

	owner					=   BAN_1610_Quentin;
	visual 					=	"pancerz_bandyta_h.3DS";
	visual_change 			=	"Hum_EBRS_ARMOR.asc";
	visual_skin 			=	3;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/*******************************************************************************************
**	ZBROJA SNAKE'A                                       			 **
*******************************************************************************************/
INSTANCE SNAKE_ARMOR(C_Item)
{
	name 					=	"Zbroja Snake'a";


	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	45;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_szmaty.3DS";
	visual_change 			=	"ARMOR_SNAKE.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	owner					=	NON_7852_Snake;
	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	ZBROJA NORDMARCZYKA                                         			 **
*******************************************************************************************/
INSTANCE NORDMARIAN_ARMOR(C_Item)
{
	name 					=	"Ci�ki pancerz Nordmarczyka";


	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	5;

	value 					=	5000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ebrm.3DS";

	//visual_change 			=	"Hum_EBRS_ARMOR.asc";
	visual_change 			=	"Nrd_Elite.ASC";
	visual_skin 			=	5;
	material 				=	MAT_METAL;
	owner					=	NON_7851_Nordmarczyk;
	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	P�ASZCZ DLA BLIZNY                                          			 **
*******************************************************************************************/
INSTANCE BLIZNA_ARMOR_H(C_Item)
{
	name 					=	"P�aszcz ze sk�ry bia�ego wilka";


	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ebrm.3DS";
	visual_change 			=	"Hum_EBRS_ARMOR.asc";
	visual_skin 			=	4;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	SPODNIE GRAVO                                        			 **
*******************************************************************************************/
instance GRAVO_ARMOR(C_Item)
{
	name 					=	"Niebieskie spodnie Gravo";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	13;
	protection [PROT_BLUNT] = 	13;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;

	description				=	name;
	owner					=	VLK_572_Gravo;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	SPODNIE HEREKA                                        			 **
*******************************************************************************************/
instance HEREK_ARMOR(C_Item)
{
	name 					=	"Zielone spodnie Hereka";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	455;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;
	owner 					=	VLK_511_Herek;
	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	ZBROJA GAROTNIKA                                      			 **
*******************************************************************************************/
INSTANCE GRD_ARMOR_H2(C_Item)
{
	name 					=	"Zbroja Garotnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	83;
	protection [PROT_BLUNT] = 	83;
	protection [PROT_POINT] = 	83;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	15;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GRD;

	visual 					=	"grdh.3ds";
	visual_change 			=	"Hum_GRDS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	ZBROJA ALTER EGO                                      			 **
*******************************************************************************************/
INSTANCE VM_ALTER_EGO_ARMOR(C_Item)
{
	name 					=	"Zbroja Alter Ego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	12;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	ZBROJA MY�LIWYCH NAJEMNIK�W                                    			 **
*******************************************************************************************/
INSTANCE SLD_ARMOR_HUN(C_Item)
{
	name 					=	"Zbroja My�liwego-Najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	43;
	protection [PROT_BLUNT]	= 	43;
	protection [PROT_POINT] = 	43;
	protection [PROT_FIRE] 	=	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	1550;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldl.3ds";
	visual_change 			=	"LeichteSoeldner.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************/



INSTANCE ITAR_GRD_J (C_Item)
{
	name 					=	"Zbroja gwardii kr�lewskiej";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	5;

	value 					=	2500;
	

	wear 					=	WEAR_TORSO;

	visual 					=	"grdh.3ds";
	visual_change 			=	"Armor_GRD_J.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	
	
	description				=	name;

    TEXT[1]  				=	NAME_Prot_Edge;			
	COUNT[1]    			= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};



INSTANCE ITAR_GRD_JS (C_Item)
{
	name 					=	"Zbroja gwardii kr�lewskiej";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	5;

	value 					=	2500;
	

	wear 					=	WEAR_TORSO;

	visual 					=	"grdh.3ds";
	visual_change 			=	"Armor_GRD_JS.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	
	
	description				=	name;

    TEXT[1]  				=	NAME_Prot_Edge;			
	COUNT[1]    			= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};



INSTANCE ItHe_Przylbica (C_Item)
{
        name = "Przy�bica";
        mainflag = ITEM_KAT_ARMOR; 
        flags = 0;
		
		
        protection[PROT_EDGE]     = 10;
        protection[PROT_BLUNT]    = 5;
        protection[PROT_POINT]    = 5;
        protection[PROT_FIRE]     = 5;
        protection[PROT_MAGIC]    = 1;
		
		
        wear              = WEAR_HEAD;  
        visual            = "przylbica.3ds";   
        visual_skin       = 0;
		
		
        material          = MAT_LEATHER; 
        description       = name;
        
        text[1] = NAME_Prot_Edge;
        count[1] = protection[PROT_EDGE];
        text[2] = NAME_Prot_Point;
        count[2] = protection[PROT_POINT];
        text[3] = NAME_Prot_Fire;
        count[3] = protection[PROT_FIRE];
        text[4] = NAME_Prot_Magic;
        count[4] = protection[PROT_MAGIC];
};

/*******************************************************************************************
**	PANCERZ HRODGIRA                                             			 **
*******************************************************************************************/
INSTANCE HRODGIR_ARMOR_H(C_Item)
{
	name 					=	"Stary pancerz";


	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	55;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	25;

	value 					=	1500;

	wear 					=	WEAR_TORSO;
  	

	
	visual 					=	"GRDH.3DS";
	visual_change 			=	"ItAr_OldArmor_h.asc";
	
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	                                   			 **
*******************************************************************************************/
INSTANCE Armor_och_Wilson(C_Item)
{
	name 					=	"Pancerz Wilsona";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	65;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	20;

	value 					=	VALUE_STT_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"pancerz_bandyta_l.3ds";
	visual_change 			=	"HUM_DHT2S_ARMOR.ASC";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/*******************************************************************************************
**	                                   			 **
*******************************************************************************************/
INSTANCE NOV_ARMOR_Sakhar(C_Item)
{
	name 					=	"Zbroja Sakhara";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	17;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_NOV_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"novh.3ds";
	visual_change 			=	"BS_NOVS.ASC";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};