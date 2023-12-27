//---------------------------------------------------------------------
//	Item Werte
//---------------------------------------------------------------------
const int 	Value_ItMi_JeweleryChest_01			=  10;
const int 	Value_ItMi_JeweleryChest_02 		=  20;
const int 	Value_ItMi_JeweleryChest_03 		=  30;
var int 	Shell_Opener;

//---------------------------------------------------------------------Drewniana szkatu³ka

FUNC VOID B_OpenChest_01()
{
	//Muschel zerbricht beim Öffnen --> keine leere Muschel 
	
	var int shellomizer;
	shellomizer = Hlp_Random (100);
	
	Shell_Opener  = (Shell_Opener + 1);
	
	if (Shell_Opener == 1)//die erste Muschel die der Spieler öffnet
	{
		B_PlayerFindItem (ItFoBeer,1);
		B_PlayerFindItem (ItFo_Plants_Berrys_01,2);                
		B_PlayerFindItem (ItFo_Plants_mushroom_01,4);
		PrintS_Ext	("Znaleziono jedzenie!", COL_WHITE);
	}
	else if (Shell_Opener == 25)
	{
		//Schwarze Perle
		B_PlayerFindItem (ItKeLockpick,3);
		PrintS_Ext	("Znaleziono 3 wytrychy!", COL_WHITE);
	}//------------------Jetzt gibt's zufällig Items----------------- 	
	else 
	{
		if (shellomizer >= 80) 
		{
			//weiße Perle
			B_PlayerFindItem (ItMiFlask,2);
			B_PlayerFindItem (ItMi_Alchemy_Sulphur_01,1);
			B_PlayerFindItem (ItMi_Quartz,1);
			PrintS_Ext	("Znaleziono 2x kolba!", COL_WHITE);
			PrintS_Ext	("Znaleziono 1x siarka!", COL_WHITE);
			PrintS_Ext	("Znaleziono 1x kwarc!", COL_WHITE);
			
		}
		else if (shellomizer >= 55)
		{
			 //Muschelfleisch
			 B_PlayerFindItem (ItMiBrush,1);
			 B_PlayerFindItem (ItMi_Stuff_Mug_01,2);
			 B_PlayerFindItem (ItMi_Stuff_Pipe_01,1);
			 PrintS_Ext	("Znaleziono 1x szczotka!", COL_WHITE);
			 PrintS_Ext	("Znaleziono 2x dzban!", COL_WHITE);
			 PrintS_Ext	("Znaleziono 1x fajka!", COL_WHITE);
		}
		else if (shellomizer >= 50)
		{
			  B_PlayerFindItem (ItMiJoint_1,3);
			  PrintS_Ext	("Znaleziono 3x skrêt!", COL_WHITE);
			  
		}
		else if (shellomizer >= 40)
		{
			   B_PlayerFindItem (ItMi_Worek_10,1);
			  PrintS_Ext	("Znaleziono 1x sakiewka!", COL_WHITE);
			
		}
		else if (shellomizer >= 35)
		{
			  B_PlayerFindItem (ItMiNugget,5);
			 PrintS_Ext	("Znaleziono 5x bry³ka rudy!", COL_WHITE);
			
		}
		else if (shellomizer >= 25)
		{
			   B_PlayerFindItem (ItFoMeatbugragout,2);
			   B_PlayerFindItem (ItFo_wineberrys_01,2);
			   B_PlayerFindItem (ItFoLoaf,1);
			   PrintS_Ext	("Znaleziono jedzenie!", COL_WHITE);
		}
		else //leere Muschel 25 
		{
		//	B_Say_Overlay (self, self, "$NOTHINGTOGET02");	
		PrintS_Ext ("Nic tu nie ma...",COL_Silver) ;
		};
	};
};


//---------------------------------------------------------------------Srebrna szkatu³ka


FUNC VOID B_OpenChest_02()
{
	//Muschel zerbricht beim Öffnen --> keine leere Muschel 
	
	var int shellomizer;
	shellomizer = Hlp_Random (100);
	
	Shell_Opener  = (Shell_Opener + 1);
	
	if (Shell_Opener == 1)//die erste Muschel die der Spieler öffnet
	{
	
		B_PlayerFindItem (ItMi_SilverRing,1);
		B_PlayerFindItem (itmi_silverplate,1);
		PrintS_Ext	("Znaleziono 1x srebrny pierœcien!", COL_WHITE);
		PrintS_Ext	("Znaleziono 1x srebrny talerz!", COL_WHITE);
	
	
	
	}
	else if (Shell_Opener == 25)
	{
		//Schwarze Perle
		B_PlayerFindItem (ItMiJoint_2,1);
		B_PlayerFindItem (ItMiJoint_1,1);
		B_PlayerFindItem (ItMiJoint_3,1);
		PrintS_Ext	("Znaleziono 3x skrêt!", COL_WHITE);
		
	}//------------------Jetzt gibt's zufällig Items----------------- 	
	else 
	{
		if (shellomizer >= 80) 
		{
			//weiße Perle
			B_PlayerFindItem (Gold01,1);
			B_PlayerFindItem (Pr_Wegiel,1);
			B_PlayerFindItem (ItMi_SilverNugget,1);
			PrintS_Ext	("Znaleziono 1x bry³ka z³ota!", COL_WHITE);
			PrintS_Ext	("Znaleziono 1x bry³ka wêgla!", COL_WHITE);
			PrintS_Ext	("Znaleziono 1x srebrny grom!", COL_WHITE);
		}
		else if (shellomizer >= 55)
		{
			 //Muschelfleisch
			 B_PlayerFindItem (ItArScrollLight,1);
			 B_PlayerFindItem (ItArScrollFirebolt,1);
			 B_PlayerFindItem (ItArScrollThunderbolt,1);
			 PrintS_Ext	("Znaleziono 3x zwój!", COL_WHITE);
		}
		else if (shellomizer >= 50)
		{
			  B_PlayerFindItem (ItFo_Plants_Herb_01,3);
			  B_PlayerFindItem (ItFoApple,3);
			  B_PlayerFindItem (ItFo_Plants_Berrys_01,3);
			  PrintS_Ext	("Znaleziono zio³a!", COL_WHITE);
		}
		else if (shellomizer >= 40)
		{
			   B_PlayerFindItem (ItMiNugget,30);
			PrintS_Ext	("Znaleziono 30x bry³ka rudy!", COL_WHITE);
		}
		else if (shellomizer >= 35)
		{
			  B_PlayerFindItem (ItFo_Potion_Mana_01,2);
			  B_PlayerFindItem (ItFo_Potion_Health_01,1);
			  PrintS_Ext	("Znaleziono 3x mikstura!", COL_WHITE);
		}
		else if (shellomizer >= 25)
		{
			   B_PlayerFindItem (ItMi_Alchemy_Sulphur_01,3);
			   B_PlayerFindItem (ItMi_Alchemy_Syrianoil_01,3);
			   PrintS_Ext	("Znaleziono 3x siarka!", COL_WHITE);
			   PrintS_Ext	("Znaleziono 3x olej syraniczny!", COL_WHITE);
		}
		else if (shellomizer >= 15)
		{
			  B_PlayerFindItem (ItMi_SilverCup,1);
	    B_PlayerFindItem (ItMi_SilverCandleHolder,1);
		PrintS_Ext	("Znaleziono 1x srebrny œwiecznik!", COL_WHITE);
		PrintS_Ext	("Znaleziono 1x srebrny puchar!", COL_WHITE);
	    }
		else //leere Muschel 25 
		{
			 B_PlayerFindItem (ItMiNugget,5);
			 PrintS_Ext	("Znaleziono 5x bry³ka rudy!", COL_WHITE);
		};
	};
};

//---------------------------------------------------------------------Z³ota szkatu³ka


FUNC VOID B_OpenChest_03()
{
	//Muschel zerbricht beim Öffnen --> keine leere Muschel 
	
	var int shellomizer;
	shellomizer = Hlp_Random (100);
	
	Shell_Opener  = (Shell_Opener + 1);
	
	if (Shell_Opener == 1)//die erste Muschel die der Spieler öffnet
	{
		B_PlayerFindItem (ItMi_GoldCandleHolder,1);
		B_PlayerFindItem (ItMi_GoldRing,1);
		B_PlayerFindItem (itmi_goldcup,1);
		B_PlayerFindItem (ItMi_GoldPlate,1);
		PrintS_Ext	("Znaleziono z³ote kosztownoœci!", COL_WHITE);
	}
	else if (Shell_Opener == 25)
	{
		
		B_PlayerFindItem (ItArScrollFirestorm,1);
		B_PlayerFindItem (ItArScrollHeal,1);
		B_PlayerFindItem (ItArScrollThunderball,1);
		PrintS_Ext	("Znaleziono 3x zwój!", COL_WHITE);
	}//------------------Jetzt gibt's zufällig Items----------------- 	
	else 
	{
		if (shellomizer >= 80) 
		{
			//weiße Perle
			B_PlayerFindItem (ItFo_Potion_Health_03,1);
			B_PlayerFindItem (ItFo_Potion_Health_02,2);
			B_PlayerFindItem (ItFo_Potion_Mana_02,2);
			B_PlayerFindItem (ItFo_Potion_Mana_03,1);
			PrintS_Ext	("Znaleziono 6x mikstura!", COL_WHITE);
		}
		else if (shellomizer >= 55)
		{
			 //Muschelfleisch
			 B_PlayerFindItem (Pr_SztabkaZlota,1);
			 B_PlayerFindItem (ItMi_SilverNugget,4);			
			 B_PlayerFindItem (Gold01,5);
			 B_PlayerFindItem (Pr_SztabkaStali,2);
			 PrintS_Ext	("Znaleziono 1x sztabka z³ota!", COL_WHITE);
			 PrintS_Ext	("Znaleziono 4x srebrny grom!", COL_WHITE);
			 PrintS_Ext	("Znaleziono 5x bry³ka z³ota!", COL_WHITE);
			 PrintS_Ext	("Znaleziono 2x sztabka stali!", COL_WHITE);
			 
		}
		else if (shellomizer >= 50)
		{
			  B_PlayerFindItem (ItMiJoint_Plant,2);
			  B_PlayerFindItem (ItMiJoint_Mush,2);
			  B_PlayerFindItem (ItMiJoint_Honey,2);
			  B_PlayerFindItem (ItMiJoint_Apple,2);
			  PrintS_Ext	("Znaleziono 8x skrêt!", COL_WHITE);
		}
		else if (shellomizer >= 40)
		{
			   B_PlayerFindItem (ItMiNugget,40);
			PrintS_Ext	("Znaleziono 40x bry³ka rudy!", COL_WHITE);
		}
		else if (shellomizer >= 35)
		{
			  B_PlayerFindItem (ItMi_runa0,1);
			  B_PlayerFindItem (ItMi_Alchemy_trucizna_01,1);
			  PrintS_Ext	("Znaleziono 1x kamieñ runiczny!", COL_WHITE);
			  PrintS_Ext	("Znaleziono 1x trucizna!", COL_WHITE);
		}
		else if (shellomizer >= 25)
		{
			   B_PlayerFindItem (ItMi_Bandaz60,5);
			    B_PlayerFindItem (ItFo_Plants_OrcHerb_01,3);
				PrintS_Ext	("Znaleziono 5x banda¿!", COL_WHITE);
				PrintS_Ext	("Znaleziono 3x orkowe ziele!", COL_WHITE);
		}
		else //leere Muschel 25 
		{
			 B_PlayerFindItem (ItFo_Plants_Herb_02,5);
			 B_PlayerFindItem (ItFo_Plants_Nightshadow_02,2);
			 B_PlayerFindItem (ItFo_Plants_Nightshadow_01,2);
			 PrintS_Ext	("Znaleziono 9x zio³a!", COL_WHITE);
		};
	};
};


//+ Schneckenmuschel
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//	Klappmuschel 
//---------------------------------------------------------------------
INSTANCE ItMi_JeweleryChest_01(C_Item)
{
	name 		=	"Szkatu³ka";

	mainflag 	=	ITEM_KAT_NONE;
	flags 		=	ITEM_MULTI;

	value 		=	Value_ItMi_JeweleryChest_01;

	visual 		=	"ItMi_JeweleryChest_Wooden.3ds";
	material 	=	MAT_STONE;
	
	scemeName	=	"MAPSEALED";
	on_state[0]	=	Use_ItMi_JeweleryChest_01;
	
	description	= 	name;
	
	TEXT[3]    = "W œrodku coœ jest...";
	
	TEXT[5]		= 	NAME_Value;	
	COUNT[5]	=	value;
	
	
};
FUNC VOID Use_ItMi_JeweleryChest_01()
{
	B_OpenChest_01();
};
//---------------------------------------------------------------------
//	Hornmuschel 
//---------------------------------------------------------------------

INSTANCE ItMi_JeweleryChest_02(C_Item)
{
	name 		=	"Szkatu³ka";

	mainflag 	=	ITEM_KAT_NONE;
	flags 		=	ITEM_MULTI;

	value 		=	Value_ItMi_JeweleryChest_02;

	visual 		=	"ItMi_JeweleryChest.3ds";
	material 	=	MAT_STONE;
	
	scemeName	=	"MAPSEALED";
	on_state[0]	=	Use_ItMi_JeweleryChest_02;
	
	description	= 	name;
	TEXT[3]     = "W œrodku coœ jest...";
	TEXT[5]		= 	NAME_Value;	
	COUNT[5]	=	value;
	
		
};
FUNC VOID Use_ItMi_JeweleryChest_02()
{
	B_OpenChest_02();
};

//******************************************************************************************************************/


INSTANCE ItMi_JeweleryChest_03(C_Item)
{
	name 		=	"Szkatu³ka";

	mainflag 	=	ITEM_KAT_NONE;
	flags 		=	ITEM_MULTI;

	value 		=	Value_ItMi_JeweleryChest_03;

	visual 		=	"ItMi_GoldChest.3ds";
	material 	=	MAT_STONE;
	
	scemeName	=	"MAPSEALED";
	on_state[0]	=	Use_ItMi_JeweleryChest_03;
	
	description	= 	name;
	TEXT[3]     = "W œrodku jest coœ ciê¿kiego...";
	TEXT[5]		= 	NAME_Value;	
	COUNT[5]	=	value;
	
		
};
FUNC VOID Use_ItMi_JeweleryChest_03()
{
	B_OpenChest_03();
};

