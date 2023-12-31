// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************

const int	Value_Bugmeat		=	 2;		const int	HP_Bugmeat			=	4;
const int	Value_Apfel			=	 4;		const int	HP_Apple			=	8;
const int	Value_Weintrauben	=	 6;		const int	HP_Weintrauben		=	8;


const int	Value_Bier			=	10;		const int	HP_Bier				=	8;
const int	Value_Wein			=	13;		const int	HP_Wein				=	3;
const int	Value_Reisschnaps	=	15;		const int	HP_Reisschnaps		=	3;

const int	Value_Reis			=	 5;		const int	HP_Reis				=	10;
const int	Value_Wurzelsuppe	=	 3;		const int	HP_Wurzelsuppe		=	 35;
const int	Value_Ragout		=	 4;		const int	HP_Ragout			=	 40;
const int	Value_CrawlerSuppe	=	10;		const int	HP_CrawlerSuppe		=	40;

const int	Value_FleischRoh	=	 5;		const int	HP_FleischRoh		=	10;
const int	Value_Brot			=	 8;		const int	HP_Brot				=	12;
const int	Value_K�se			=	10;		const int	HP_K�se				=	15;
const int	Value_Fleisch		=	 8;		const int	HP_Fleisch			=	15; // Rohes Fleisch mit Pfanne benutzt
const int	Value_Schinken		=	12;		const int	HP_Schinken			=	18;

const int	Value_Waldbeeren	=	5;		const int	HP_Waldbeeren		=	10;



const int	Value_Velayis		=	8;		const int	HP_Velayis			=	16;

const int	Value_Grabmoos		=	10;		const int	HP_Grabmoos			=	20;

//przeniesione do Plants.d
//sk�adnik du�ej mikstury szybko�ci


const int	Value_H�llenpilz	=	 3;		const int	HP_H�llenpilz		=	 6;
const int	Value_Sklavenbrot	=	 9;		const int	HP_Sklavenbrot		=	15;

//alchemiczny
const int	Value_Wasser		=	 5;		const int	HP_Wasser			=	5;

// Fixme: Trollkirsche als Handelsware mit Wert?
const int	Value_Trollkirsche	=	15;		const int	HP_Trollkirsche		=	-20;

// Mana
const int	Value_Blutbuche		=	3;		const int	Mana_Blutbuche		=	5;
const int	Value_Turmeiche		=	8;		const int	Mana_Turmeiche		=	10;

/*******************************************************************************************
**	Essbares				                                          					**
*******************************************************************************************/

INSTANCE ItAt_Meatbug_01 (C_Item)
{	
	name 				=	"Mi�so chrz�szcza";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bugmeat;
	
	visual 				=	"ItAt_Meatbug_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseBugmeat;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Bugmeat;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bugmeat;

};

	FUNC VOID UseBugmeat()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bugmeat);
	};

/******************************************************************************************/
INSTANCE ItFoApple(C_Item)
{	
	name 				=	"Jab�ko";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Apfel;

	visual 				=	"ItFo_Apple_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Apple;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Apple;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Apfel;
};
FUNC VOID Use_Apple()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Apple);
		
		if (Npc_IsPlayer (self))
		{
			Apple_Bonus = Apple_Bonus + 1;
			
			if (Apple_Bonus == 7)  
			{
				Print	(PRINT_Eat1);
			};
			if (Apple_Bonus == 15)  
			{
				Print (PRINT_Eat2);
			};
			if (Apple_Bonus == 25)  
			{
				Print (PRINT_Eat3);
				B_RaiseAttribute (ATR_STRENGTH, 1);
				Snd_Play	("LevelUp");
				Apple_Bonus = 0;
			};
		};
	};

/******************************************************************************************/
INSTANCE ItFo_wineberrys_01(C_Item)
{	
	name 				=	"Winogrona";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weintrauben;

	visual 				=	"ItFo_wineberrys_01.3ds";
	on_state[0]         = 	Usewineberrys;  
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Weintrauben;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Weintrauben;
};

	func void Usewineberrys () 
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Weintrauben);							
		
		if (Npc_IsPlayer (self))
		{
			Wineberrys_Bonus = Wineberrys_Bonus + 1;
			
			if (Wineberrys_Bonus == 7)  
			{
				Print	(PRINT_Eat1);
				
				Snd_Play	("LevelUp");
			};
			if (Wineberrys_Bonus == 15)  
			{
				Print (PRINT_Eat2);
			};
			if (Wineberrys_Bonus == 25)  
			{
				Print (PRINT_Eat3);
				B_RaiseAttribute (ATR_MANA_MAX, 1);
				Snd_Play	("LevelUp");
				Wineberrys_Bonus = 0;
			};
		};
		
	};

/******************************************************************************************/
INSTANCE ItFoLoaf(C_Item)
{	
	name 				=	"Chleb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brot;

	visual 				=	"ITFO_LOAF_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseLoaf;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Brot;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Brot;

};

	FUNC VOID UseLoaf()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Brot);
	};

/******************************************************************************************/
INSTANCE ItFoMutton (C_Item)
{	
	name 				=	"Sma�one mi�so";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Fleisch;

	visual 				=	"ItFoMutton.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMutton;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Fleisch;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Fleisch;
};

	FUNC VOID UseMutton()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fleisch);
	};

/******************************************************************************************/
INSTANCE ItFoMuttonRaw (C_Item)
{	
	name 				=	"Surowe mi�so";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_FleischRoh;

	visual 				=	"ItFoMuttonRaw.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMuttonRaw;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_FleischRoh;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_FleischRoh;
};

	FUNC VOID UseMuttonRaw()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_FleischRoh);
	};

/******************************************************************************************/
INSTANCE ItFo_mutton_01 (C_Item)
{	
	name 				=	"Szynka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Schinken;

	visual 				=	"ItFo_mutton_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseMutton1;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Schinken;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Schinken;

};

	FUNC VOID UseMutton1()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Schinken);
	};

/******************************************************************************************/
INSTANCE ItFoCheese(C_Item)
{	
	name 				=	"Ser";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_K�se;

	visual 				=	"ItFo_Cheese_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseCheese;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_K�se;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_K�se;
};

	FUNC VOID UseCheese()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_K�se);
	};

/******************************************************************************************/
INSTANCE ItFoRice(C_Item)
{	
	name 				=	"Ry�";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Reis;

	visual 				=	"ItFo_Rice_01.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseRice;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Reis;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Reis;
};

	FUNC VOID UseRice()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Reis);
	};

/******************************************************************************************/
INSTANCE ItFoSoup(C_Item)
{	
	name 				=	"Zupa korzenna";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wurzelsuppe;

	visual 				=	"ItFo_Soup_01.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseSoup;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 35;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wurzelsuppe;
};

	FUNC VOID UseSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	35);
			  			if (Npc_IsPlayer (self))
		{
			Food_Bonus = Food_Bonus + 1;
			
			if (Food_Bonus == 15)  
			{
				B_RaiseAttribute (ATR_HITPOINTS_MAX, 3);
			    Food_Bonus = 0;
			};
		
		
			
		};
	};

/******************************************************************************************/
INSTANCE ItFoMeatbugragout(C_Item)
{	
	name 				=	"Potrawka z chrz�szcza";
	
	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Ragout;

	visual 				=	"ItFo_Meatbugragout_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	UseMeatbugragout;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 38;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Ragout;
};

	FUNC VOID UseMeatbugragout()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	38);
			  			if (Npc_IsPlayer (self))
		{
			Food_Bonus = Food_Bonus + 1;
			
			if (Food_Bonus == 15)  
			{
				B_RaiseAttribute (ATR_HITPOINTS_MAX, 3);
			    Food_Bonus = 0;
			};
		
		
			
		};
	};

/******************************************************************************************/
INSTANCE ItFoCrawlersoup(C_Item)                                          
{	                                                                
	name 				=	"Zupa z pe�zacza";
	                                                            
	mainflag 			=	ITEM_KAT_FOOD;  
	flags 				=	ITEM_MULTI;
                                                                    
	value 				=	Value_CrawlerSuppe;              
                                                                    
	visual 				=	"ItFo_Crawlersoup_01.3ds";    
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseCrawlersoup;   
	scemeName			=	"RICE";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 30;
	TEXT[2]				= NAME_Bonus_Mana;				COUNT[2]	= 15;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_CrawlerSuppe;                                                    
};

	FUNC VOID UseCrawlersoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	30);
		Npc_ChangeAttribute	(self,	ATR_MANA,	15);
			  			if (Npc_IsPlayer (self))
		{
			Food_Bonus = Food_Bonus + 1;
			
			if (Food_Bonus == 15)  
			{
				B_RaiseAttribute (ATR_HITPOINTS_MAX, 3);
			    Food_Bonus = 0;
			};
		
		
			
		};
	};

/*******************************************************************************************
**	Trinkbares				                                        					  **
*******************************************************************************************/

/******************************************************************************************/
INSTANCE ItFo_Potion_Water_01(C_Item)
{
	name 			=	"Woda";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Wasser;	

	visual 			=	"ItFo_Potion_Water_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWaterPotion;
	scemeName		=	"POTIONFAST";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Wasser;
	TEXT[2]				= "Dodatek alchemiczny.";
	TEXT[2]				= "Baza s�abych mikstur.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wasser;
};

	func VOID UseWaterPotion()
	

	{
	Npc_ChangeAttribute	(hero,	ATR_HITPOINTS,	HP_Wasser);
	};
		

/******************************************************************************************/
// FIXME: zs_Drunk f�r SC oder nicht? 
INSTANCE ItFoBeer(C_Item)
{
	name 				=	"Piwo";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bier;	

	visual 				=	"ItFo_Beer_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBeer;
	scemeName			=	"POTIONFAST";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Bier;
	TEXT[2]				= NAME_Bonus_Mana;				COUNT[2]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bier;
};

	FUNC VOID UseBeer()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bier);
		Npc_ChangeAttribute	(self,	ATR_MANA,	5);
	};

/******************************************************************************************/

INSTANCE ItFoWine(C_Item)
{	
	name 				=	"Wino";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wein;

	visual	 			=	"ITFO_WINE_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseWine;
	scemeName			=	"POTIONFAST";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 15;
	TEXT[2]				= NAME_Bonus_Mana;				COUNT[2]	= 20;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wein;
};

	FUNC VOID UseWine()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	15);
		Npc_ChangeAttribute	(self,	ATR_MANA,	20);
	};

/******************************************************************************************/

INSTANCE ItFoBooze(C_Item)
{	
	name 				=	"Ry��wka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Reisschnaps;

	visual 				=	"ItFo_Booze_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBooze;
	scemeName			=	"POTIONFAST";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 10;
	TEXT[2]				= NAME_Bonus_Mana;				COUNT[2]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Reisschnaps;
};

	FUNC VOID UseBooze()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);
		Npc_ChangeAttribute	(self,	ATR_MANA,	5);
	};


//**************************************************************************************/
//						PFLANZEN  PFLANZEN PFLANZEN
/******************************************************************************************/ 
INSTANCE ItFo_Plants_Berrys_01(C_Item)
{	
	name 				=	"Jagody";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Waldbeeren;

	visual 				=	"ItFo_Plants_Berrys_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseBerrys;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Waldbeeren;
	TEXT[2]				= "Owoc.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Waldbeeren;
};

		func void UseBerrys ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Waldbeeren);
		
		};
		
/******************************************************************************************/

		
/******************************************************************************************/
INSTANCE ItFo_Plants_mountainmoos_02(C_Item)
{	
	name 				=	"Mech nagrobny";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Grabmoos;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Usemoos2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Grabmoos;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Grabmoos;
};

		func void Usemoos2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Grabmoos);

		};

		
/*****************************************************************************************/
//								PILZE
/*****************************************************************************************/


INSTANCE ItFo_Plants_mushroom_01(C_Item)
{	
	name 				=	"Piekielnik";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_H�llenpilz;

	visual 				=	"ITFO_PLANTS_MUSHROOM_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Usemush;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_H�llenpilz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_H�llenpilz;
};

		func void Usemush ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_H�llenpilz);
	
		};

/*****************************************************************************************/
INSTANCE ItFo_Plants_mushroom_02(C_Item)
{	
	name 				=	"Gorzki chleb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Sklavenbrot;

	visual 				=	"ITFO_PLANTS_MUSHROOM_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Usemush2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Sklavenbrot;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Sklavenbrot;
};

		func void Usemush2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Sklavenbrot);

		};



/*****************************************************************************************/
//							MANAREG. PFLANZEN
/*****************************************************************************************/
 
		                                  
/******************************************************************************************/
instance ItFo_Plants_Towerwood_01 (C_ITEM)
{	
	name 					=	"Nasienie wysokiego d�bu";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Turmeiche;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;
	on_state[0]				=  Useblood2;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Turmeiche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Turmeiche;                    	
};                                        

		func void Useblood2 ()
		{
			Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Turmeiche);
		
		};

		  
/******************************************************************************************/
//								GIFTPFLANZEN
/******************************************************************************************/
INSTANCE ItFo_Plants_Trollberrys_01(C_Item)
{	
	name 					=	"Trolest";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Trollkirsche;

	visual 					=	"ItFo_Plants_Trollberrys_01.3ds";
	material 				=	MAT_WOOD;
	on_state [0]			=   UseTrollberrys;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Trollkirsche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Trollkirsche;
};

		func void UseTrollberrys ()
		{
			Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Trollkirsche);

		};

		
INSTANCE TestFood (C_Item)
{	
	name 				=	"Udziec z dzikiej kuny";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bugmeat;
	
	visual 				=	"ItAt_Meatbug_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseBugmeat222;
    nutrition = 100;
	description			= name;
	

};

	FUNC VOID UseBugmeat222()
	{
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bugmeat);
	};	