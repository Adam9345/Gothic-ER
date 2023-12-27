//******************************************
//******************************************
//             PRZEPISY
//   NA POTRAWY ORAZ SCHEMATY NA BRONIE
//******************************************
//******************************************
/*****************************************************
******* KATEGORIA: PRZEPISY KUCHARSKIE
*****************************************************/

/******************************************************************************************/	
INSTANCE ItRe_MoleratSoup (C_Item)
{	
	name 				=	"Przepis na zupê z kretoszczura";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisMoleratSoup;
	scemeName			=	"MAP";
	description			=   name;
	
	TEXT[2]                 = "Bonus P¯: 42";
//	TEXT[3]                 = "Wymagana si³a: 73";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePrzepisMoleratSoup ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);

					printAllIngredients(Recipe_MoleratSoup, nDocID);

					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Do gotowanej wody wrzucamy miêso. Nastêpnie czekamy a¿ zacznie wrzeæ. Dopiero potem delikatnie wlewamy t³uszcz i mieszamy. Solimy na koñcu. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pyszna zupa dla myœliwego w sam raz na ch³odne dni."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );	
					MoleratSoup_Recipe = TRUE;
					Log_CreateTopic	(Cooking,	LOG_NOTE);
					B_LogEntry(Cooking,"Zupa z kretoszczura - 1x w¹troba kretoszczura, 3x surowe miêso, 1x sól, 1x piwo."); 
					Npc_RemoveInvItems (hero, ItRe_MoleratSoup,1);
};
/******************************************************************************************/
INSTANCE ItRe_SnafSoup (C_Item)
{	
	name 				=	"Przepis na potrawkê z chrz¹szcza";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisSnafSoup;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[2]                 = "Bonus P¯: 35";
	TEXT[5]				=   NAME_Value;
	COUNT[5]			=   value;
	
};
func void UsePrzepisSnafSoup ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_SnafSoup, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Do gotowanej wody wrzucamy posiekane chrz¹szcze. Nastêpnie czekamy a¿ zacznie wrzeæ. Potem wrzucamy pokrojone piekielniki i mieszamy to wszystko dosypuj¹c ry¿. "	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus				
					Doc_Show		( nDocID );	
					MeatbugSoup_Recipe = TRUE;
					Log_CreateTopic	(Cooking,	LOG_NOTE);
					B_LogEntry(Cooking,"Potrawka z chrz¹szcza - 3x miêso chrz¹szcza, 5x piekielnik, 2x ry¿."); 
};
/******************************************************************************************/
	INSTANCE ItRe_CheeseSoup (C_Item)
{	
	name 				=	"Przepis na zupê serow¹";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	16;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   CheeseSoup_Rec;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[2]                 = "Bonus P¯: 45";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void CheeseSoup_Rec ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_CheeseSoup, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Gotujemy miêso. Gdy wywar zacznie wrzeæ wrzucamy ser, który natychmiast siê topi. Ca³oœæ mieszamy i dodajemy pokrojony na pajdy chleb.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Smacznego!"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		CheeseSoup_Recipe = TRUE;
			Log_CreateTopic	(Cooking,	LOG_NOTE);
					B_LogEntry(Cooking,"Zupa serowa - 3x ser, 2x surowe miêso, 1x chleb."); 
};
/******************************************************************************************/
INSTANCE ItRe_CrawelSoup (C_Item)
{	
	name 				=	"Przepis na zupê z pe³zacza";

	mainflag 			=	ITEM_KAT_DOCS;
	//flags 				=	ITEM_MISSION;

	value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisKRW;
	scemeName			=	"MAP";
	description			=   name;
    TEXT[2]                 = "Bonus P¯: 30";
    TEXT[3]                 = "Bonus Mana: 15";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void UsePrzepisKRW ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_CrawelSoup, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Najpierw preparujemy pe³zacza. Z wnêtrza delikatnie wycinamy narz¹dy wewnêtrzne. Czekamy, a¿ sp³ynie krew. Naci¹æ nale¿y delikatnie pod brzuchem. Œwie¿e flaki wrzucamy do wody z ry¿em.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		            MinecrawlerSoup_Recipe = TRUE;
						Log_CreateTopic	(Cooking,	LOG_NOTE);
					B_LogEntry(Cooking,"Zupa z pe³zacza - 1x wnêtrznoœci pe³zacza, 2x sól, 1x ry¿, 1x leœne ziele."); 
};
/******************************************************************************************/
INSTANCE ItRe_ScaSoup (C_Item)
{	
	name 				=	"Przepis na zupê ze œcierwojada";

	mainflag 			=	ITEM_KAT_DOCS;

	value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePrzepisSCA;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[2]                 = "Bonus P¯: 45";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void UsePrzepisSCA ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_ScaSoup, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Wrzucamy miêso do gor¹cej wody. Dopóki siê nie ugotuje suszymy krucze ziele, a nastêpnie siekamy. Wrzucamy wszystko do gara i dodajemy sól."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Tylko nie przesadzaj z sol¹."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		ScavengerSoup_Recipe = TRUE;
			Log_CreateTopic	(Cooking,	LOG_NOTE);
					B_LogEntry(Cooking,"Zupa ze œcierwojada - 3x surowe miêso , 2x krucze ziele, 2x sól, 2x gorzki chleb."); 
};
/******************************************************************************************/
INSTANCE ItRe_BerrysDrink (C_Item)
{	
	name 				=	"Przepis na kompot z jagód";

	mainflag 			=	ITEM_KAT_DOCS;

	value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   BerrysDrink;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[2]                 = "Bonus P¯: 50";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void BerrysDrink ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: ");
					printAllIngredients(Recipe_BerrysDrink, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Przysmak cieni."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
		Doc_Show		( nDocID );
		Kompot01_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
	    B_LogEntry(Cooking,"Kompot z jagód - 4x jagoda, 2x woda, 2x serafis."); 
};
/******************************************************************************************/
INSTANCE ItRe_Jam (C_Item)
{	
	name 				=	"Przepis na konfiture";

	mainflag 			=	ITEM_KAT_DOCS;

	value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   KonfituraRecipe;
	scemeName			=	"MAP";
	description			=   name;
	TEXT[2]                 = "Bonus P¯: 45";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
	
};
func void KonfituraRecipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_Jam, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "S³odka i uwielbana przez kopaczy."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		Konfitura_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Konfitura - 3x jagoda, 2x woda, 1x serafis, 2x cukier."); 
};

/******************************************************************************************/
INSTANCE ItWr_GhoranWine (C_Item)
{	
	name 				=	"Przepis na wino Ghorana";

	mainflag 			=	ITEM_KAT_DOCS;


	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   GhoranWineRecipe;
	scemeName			=	"MAP";
	description			=   name;
    TEXT[1]             =   "Specjalne wino Ghorana.";
	TEXT[2]                 = "Bonus P¯: 50";
	TEXT[3]                 = "Bonus do maks. P¯: 3";
	
};
func void GhoranWineRecipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_GhoranWine, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Specjalne wino przepisu Ghorana. S³odkie i ³agodne w smaku z nutk¹ bagiennego ziela."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		GhoranWine_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na wino Ghorana - 3x jagoda, 4x winogron, 3x roztarte bagienne ziele, 4x winogron, 2x cukier, 1x woda."); 
};
/******************************************************************************************/
INSTANCE ItWr_MushroomStew (C_Item)
{	
	name 				=	"Przepis na grzybowy gulasz";

	mainflag 			=	ITEM_KAT_DOCS;

    value 				=	15;
	
	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   MushroomStewRecipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: 35";
	TEXT[3]                 = "Bonus Mana: 30";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void MushroomStewRecipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_MushroomStew, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Bardzo smaczny i syc¹cy posi³ek."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		MushroomStew_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na grzybowy gulasz - 3x piekielnik, 4x gorzki chleb, 1x ciemny grzyb, 4x winogron, 2x surowe miêso, 1x woda."); 
};
/******************************************************************************************/
INSTANCE ItWr_MeatStew (C_Item)
{	
	name 				=	"Przepis na miêsny gulasz";

	mainflag 			=	ITEM_KAT_DOCS;

    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   MeatStewRecipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: 65";
	//TEXT[3]                 = "Bonus Mana: 30";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void MeatStewRecipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_MeatStew, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Potrawa w sam raz dla myœliwych po ciê¿kich polowaniach."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		MeatStew_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na miêsny gulasz - 5x surowe miêso, 2x zio³a uzdrawiaj¹ce, 1x chleb, 1x woda."); 
};
/******************************************************************************************/
INSTANCE ItWr_BigCasserole (C_Item)
{	
	name 				=	"Przepis na myœliwsk¹ zapiekanke";

	mainflag 			=	ITEM_KAT_DOCS;

    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   MeatBigCasserole;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: 60";
	//TEXT[3]                 = "Bonus Mana: 30";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void MeatBigCasserole ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "					);
					printAllIngredients(Recipe_BigCasserole, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Wielki kawa³ miêcha,grzybów i chleba..."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		BigCasserole_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na myœliwsk¹ zapiekanke - 2x sma¿one miêso, 1x chleb, 3x piekielnik, 1x polne ziele."); 
};
/******************************************************************************************/
INSTANCE ItRe_HotWine (C_Item)
{	
	name 				=	"Przepis na grzane wino";

	mainflag 			=	ITEM_KAT_DOCS;
    
    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   HotWineRecipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: -50";
	TEXT[3]                 = "Bonus do maks. Mana: 2";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void HotWineRecipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		        );  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "				     	);
					printAllIngredients(Recipe_HotWine, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					            );
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "S³odko-gorzkie, rozgrzewaj¹ce wino. Nie dla amatorów..."					);


					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   	);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		HotWine_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na zupê z pstr¹ga - 2x wino, 1x czysty alkohol, 2x czarne ziele, 1x nasiona czerwonego buka."); 
};
/******************************************************************************************/
INSTANCE ItWr_SoupFish2 (C_Item)
{	
	name 				=	"Przepis na zupê z pstr¹ga";

	mainflag 			=	ITEM_KAT_DOCS;
    
    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   SoupFish2Recipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: 48";
	TEXT[3]                 = "";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void SoupFish2Recipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		        );  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "				     	);
					printAllIngredients(Recipe_SoupFish2, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Zupa w sam raz na d³ugie wyprawy..."					);


					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   	);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		SoupFish2_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na zupê z pstr¹ga - 2x pstr¹g, 1x woda, 1x piekielnik, 1x roœlina lecznicza, 1x sól."); 
};
/******************************************************************************************/
INSTANCE ItWr_SoupFish3 (C_Item)
{	
	name 				=	"Przepis na zupê z sandacza";

	mainflag 			=	ITEM_KAT_DOCS;
    
    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   SoupFish3Recipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: 75";
	TEXT[3]                 = "Pozwala szybciej biegaæ";
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void SoupFish3Recipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		        );  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "				     	);
					printAllIngredients(Recipe_SoupFish3, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Pobudza nie tylko kubki smakowe..."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Ricardo Milos, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   	);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		SoupFish3_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na zupê z sandacza - 2x sandacz, 1x woda, 2x gorzki chleb, 1x ser, 1x sól."); 
};
/******************************************************************************************/
INSTANCE ItWr_SoupFish4 (C_Item)
{	
	name 				=	"Przepis na zupê z karasi";

	mainflag 			=	ITEM_KAT_DOCS;

    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   SoupFish4Recipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus Mana: 75";
	
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void SoupFish4Recipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		        );  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki: "				     	);
					printAllIngredients(Recipe_SoupFish4, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					            );
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Jedna z ulubioncyh potraw rybaków."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   	);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		SoupFish4_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na zupê z karasi - 2x karaœ, 1x piwo, 1x twardzieñ, 1x roœlina lecznicza."); 
};
/******************************************************************************************/
INSTANCE ItWr_SoupFish5 (C_Item)
{	
	name 				=	"Przepis na zupê z pstr¹ga têczowego";

	mainflag 			=	ITEM_KAT_DOCS;

    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   SoupFish5Recipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: 90";
	
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void SoupFish5Recipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		        );  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki:"				     	);
					printAllIngredients(Recipe_SoupFish5, nDocID);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Wyœmienite danie uwielbiane przez myœliwych i rybaków."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   	);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		SoupFish5_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na zupê z pstr¹ga têczowego - 1x pstr¹g têczowy, 1x wino, 1x ry¿, 2x velais, 2x sól."); 
};
/******************************************************************************************/
INSTANCE ItRe_LurkerSoup (C_Item)
{	
	name 				=	"Przepis na zupê z topielca";

	mainflag 			=	ITEM_KAT_DOCS;

    value 				=	15;

	visual 				=	"ER_FOOD_RECIPE.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   LurkerSoupRecipe;
	scemeName			=	"MAP";
	description			=   name;
  
	TEXT[2]                 = "Bonus P¯: 120";
	
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;
};
func void LurkerSoupRecipe ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		        );  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sk³adniki:"				     	);
					printAllIngredients(Recipe_LurkerSoup, nDocID);
					//Doc_PrintLine	( nDocID,  0, "- 2x sól"					            );
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Syta zupa z miêsa topielca."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   	);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
					
		LurkerSoup_Recipe = TRUE;
		Log_CreateTopic	(Cooking,	LOG_NOTE);
		B_LogEntry(Cooking,"Przepis na zupê z topielca - 4x miêso topielca, 1x ry¿ówka, 1x ry¿, 2x serafis."); 
};

//**********************************************************
//*************
//***************** SCHEMATY BRONI
//*************
//**********************************************************


/***************----------------------------------UMIEJÊTNOŒÆ POZIOM 1---------------------******************************/

INSTANCE Plan_BanditTrader(C_Item) //do kupienia u Huana
{	
	name 					=	"Plan: Pa³asz";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	35;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_BanditTrader;

	description				= name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 40";
	TEXT[3]                 = "Wymagana zrêcznoœæ: 38";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_BanditTrader()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Rapier"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 40"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana zrêcznoœæ: 38"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					printAllIngredients(Recipe_BanditTrader, nDocID);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_Show		( nDocID 	);
					ItMw_Addon_BanditTrader_Recipe = TRUE;
};
/******************************************************************************************/
INSTANCE Plan_Miecz1H6(C_Item)
{	
	name 					=	"Plan: Miecz kowala";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	35;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H6;

	description				= name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 40";
	TEXT[3]                 = "Wymagana si³a: 30";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H6()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Miecz kowala"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 40"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 30"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					printAllIngredients(Recipe_Miecz1H6, nDocID);
					Doc_Show		( nDocID 	);
					Miecz1H6_Recipe = TRUE;
					
	};
/******************************************************************************************/
INSTANCE Plan_Miecz1H11(C_Item) //handel Huno
{	
	name 					=	"Plan: Porz¹dny miecz jednorêczny";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	35;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H11;

	description				= name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 30";
	TEXT[3]                 = "Wymagana si³a: 22";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H11()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Porz¹dny miecz jednorêczny"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 30"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 22"					);
					Doc_PrintLine	( nDocID,  0, ""	);				
					printAllIngredients(Recipe_Miecz1H11, nDocID);
					Doc_Show		( nDocID 	);
					Miecz1H11_Recipe = TRUE;
					
	};	
/******************************************************************************************/
INSTANCE Plan_Miecz1H15(C_Item) //handel Huan
{	
	name 					=	"Plan: B³ysk nocy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	35;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H15;

	description				= name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 26";
	TEXT[3]                 = "Wymagana si³a: 18";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H15()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "B³ysk nocy"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 26"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 18"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					printAllIngredients(Recipe_Miecz1H15, nDocID);
					Doc_Show		( nDocID 	);
					Miecz1H5_Recipe = TRUE;
					
	};
/******************************************************************************************/
	INSTANCE Plan1b(C_Item) //dodany u darriona
{	
	name 					=	"Plan: Miecz bojowy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	35;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePlan1b;

	description				= 	name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 33";
	TEXT[3]                 = "Wymagana si³a: 30";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID UsePlan1b()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Miecz bojowy"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 33"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 30"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					printAllIngredients(Recipe_Plan1b, nDocID);
					Doc_Show		( nDocID 	);
					ItMw_1H_Sword_04_Recipe = TRUE;
	};	
/******************************************************************************************/
INSTANCE Plan1c(C_Item) //kamien ogniskuj¹cy milten
{	
	name 					=	"Plan: D³ugi miecz";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	35;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePlan1c;

	description				= 	name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 34";
	TEXT[3]                 = "Wymagana si³a: 35";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID UsePlan1c()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "D³ugi miecz"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna");
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 34");
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 40");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_Plan1c, nDocID);
					Doc_Show		( nDocID 	);
					ItMw_1H_Sword_Long_01_Recipe = TRUE;
	};	
/******************************************************************************************/
	INSTANCE Plan_DaggerOfMurder(C_Item) //otrzymujemy od Snake'a
{	
	name 					=	"Plan: Sztylet zabójcy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_DaggerOfMurder;

	description				= name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 40";
	TEXT[3]                 = "Wymagana si³a: 30";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_DaggerOfMurder()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Sztylet zabójcy"					);
										Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 40"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 30"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					printAllIngredients(Recipe_DaggerOfMurder, nDocID);
					Doc_Show		( nDocID 	);
	};

/***************----------------------------------UMIEJÊTNOŒÆ POZIOM 2---------------------******************************/


INSTANCE Plan_Miecz1H7(C_Item) //do kupienia u Mila
{	
	name 					=	"Plan: Szeroki miecz";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H7;

	description				= 	name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 47";
	TEXT[3]                 = "Wymagana si³a: 37";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID Use_Plan_Miecz1H7()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Szeroki miecz"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 47"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 37"					);
					Doc_PrintLine	( nDocID,  0, ""		);				
					printAllIngredients(Recipe_Miecz1H7, nDocID);
					Doc_Show		( nDocID 	);
					Miecz1h7_Recipe = TRUE;
	};
/******************************************************************************************/
INSTANCE Plan_Miecz1H9(C_Item) //do znalezienia w skrzyni w Wie¿y Mgie³
{	
	name 					=	"Plan: Miecz Rozpaczy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H9;

	description				= 	name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 65";
	TEXT[3]                 = "Wymagana si³a: 50";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID Use_Plan_Miecz1H9()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Miecz Rozpaczy"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 65"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 50"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					printAllIngredients(Recipe_Miecz1H9, nDocID);
					Doc_Show		( nDocID 	);
					Miecz1h9_Recipe = TRUE;
    };
/******************************************************************************************/
INSTANCE Plan_Miecz1H8(C_Item)
{	
	name 					=	"Plan: Œwiêty Mœciciel";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz1H8;

	description				= name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 65";
	TEXT[3]                 = "Wymagana si³a: 45";
	TEXT[4]                 = "Wymagana mana: 30";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz1H8()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Œwiêty Mœciciel"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 65"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 45"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana mana: 30"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					printAllIngredients(Recipe_Miecz1H8, nDocID);
					Doc_Show		( nDocID 	);
					Miecz1H8_Recipe = TRUE;
	};
/******************************************************************************************/
INSTANCE Plan_Rapier(C_Item) //do kupienia u Darriona
{	
	name 					=	"Plan: Rapier";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Rapier;

	description				= name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 60";
	TEXT[3]                 = "Wymagana zrêcznoœæ: 45";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Rapier()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()	  ;	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	); 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Rapier"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Broñ jednorêczna"					);
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 60"					);
					Doc_PrintLine	( nDocID,  0, "Wymagana zrêcznoœæ: 45"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					printAllIngredients(Recipe_Rapier, nDocID);
					Doc_Show		( nDocID 	);
					Rapier_Recipe = TRUE;
	};	
/******************************************************************************************/
INSTANCE Plan3b(C_Item) //handlarz: Darrion, ch4
{	
	name 					=	"Plan: Lekki miecz dwurêczny";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePlan3b;

	description				= 	name;
	TEXT[1]                 = "Broñ jednorêczna";
	TEXT[2]                 = "Obra¿enia: 70";
	TEXT[3]                 = "Wymagana si³a: 56";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID UsePlan3b()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Lekki miecz dwurêczny"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna");
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 70");
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 56");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_Plan3b, nDocID);
					Doc_Show		( nDocID 	);
					ItMw_2H_Sword_Light_01_Recipe = TRUE;
	};		
/******************************************************************************************/	
INSTANCE Plan3(C_Item) //handlarz Scorpio, ch4
{	
	name 					=	"Plan: Miecz królewski";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePlan3;

	description				= name;
	TEXT[1]                 = "Broñ dwurêczna";
	TEXT[2]                 = "Obra¿enia: 74";
	TEXT[3]                 = "Wymagana si³a: 73";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePlan3()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Miecz królewski"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna");
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 74");
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 73");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_Plan3, nDocID);
					Doc_Show		( nDocID 	);
	};	
/******************************************************************************************/	
INSTANCE Plan5c(C_Item) //handlarz: Martin, ch4
{	
	name 					=	"Plan: Lekki topór bojowy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePlan5c;

	description				= name;
	TEXT[1]                 = "Broñ dwurêczna";
	TEXT[2]                 = "Obra¿enia: 77";
	TEXT[3]                 = "Wymagana si³a: 75";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePlan5c()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Lekki topór bojowy"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna");
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 77");
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 75");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_Plan5c, nDocID);
					Doc_Show		( nDocID 	);
					ItMw_2H_Axe_light_01_Recipe = TRUE;
	};	
	
/******************************************************************************************/	
INSTANCE ItRe_2H_AxeHevay_100(C_Item) //handlarz: Gavilian ch3/ huan
{	
	name 					=	"Plan: Zdobiony dwurêczny topór";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	70;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use2HAxeHeavy100;

	description				= name;
	TEXT[1]                 = "Broñ dwurêczna";
	TEXT[2]                 = "Obra¿enia: 80";
	TEXT[3]                 = "Wymagana si³a: 75";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use2HAxeHeavy100()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Zdobiony dwurêczny topór"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna");
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 80");
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 75");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_2H_AxeHevay_100, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_Show		( nDocID 	);
					ItMw_2H_AxeHevay_100_Recipe = TRUE;
	};	
/***************----------------------------------UMIEJÊTNOŒÆ POZIOM 3---------------------******************************/

INSTANCE Plan4b(C_Item) //miasto orków, podziemia
{	
	name 					=	"Plan: Ostrze bohatera";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePlan4b;

	description				= 	name;
	TEXT[1]                 = "Broñ dwurêczna";
	TEXT[2]                 = "Obra¿enia: 83";
	TEXT[3]                 = "Wymagana si³a: 78";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID UsePlan4b()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
										Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Ostrze bohatera"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna");
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 83");
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 78");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_Plan4b, nDocID);					
					Doc_Show		( nDocID 	);
					ItMw_2H_Sword_02_Recipe = TRUE;
	};	
/******************************************************************************************/	
INSTANCE Plan_Miecz2H5(C_Item) 
{	
	name 					=	"Plan: Pogromca orków";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Plan_Miecz2H5;

	description				= name;
	TEXT[1]                 = "Broñ dwurêczna";
	TEXT[2]                 = "Obra¿enia: 85";
	TEXT[3]                 = "Wymagana si³a: 75";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Use_Plan_Miecz2H5()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	();	
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	       ); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"           ); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	       );  
					Doc_PrintLine	( nDocID,  0, "Pogromca orków"			   );
					Doc_PrintLine	( nDocID,  0, ""					       );
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna"			   );
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 85"			   );
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 75"		   );
					Doc_PrintLine	( nDocID,  0, ""	                       );
					printAllIngredients(Recipe_Miecz2H5, nDocID);

					Doc_Show		( nDocID);
					Miecz2H5_Recipe = TRUE;
	};
/******************************************************************************************/
	INSTANCE Plan7b(C_Item) //handlarze: skorpion, darrion, martin, sharky ch6
{	
	name 					=	"Plan: Topór wojenny";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ER_SMITH_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePlan7b;

	description				= 	name;
	TEXT[1]                 = "Broñ dwurêczna";
	TEXT[2]                 = "Obra¿enia: 94";
	TEXT[3]                 = "Wymagana si³a: 90";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID UsePlan7b()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Topór wojenny"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Broñ dwurêczna");
					Doc_PrintLine	( nDocID,  0, "Obra¿enia: 94");
					Doc_PrintLine	( nDocID,  0, "Wymagana si³a: 90");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_Plan7b, nDocID);			
		
					Doc_Show		( nDocID 	);
					ItMw_2H_Axe_Heavy_01_Recipe = TRUE;
	};
/******************************************************************************************/	
//***********************************
//********PASY
//***********************************
/******************************************************************************************/
	INSTANCE ItRe_LeatherBelt(C_Item) //handlarze: Cavalorn, Huan
{	
	name 					=	"Plan: Skórzany pas";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	LeatherBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 2";
	TEXT[3]                 = "Pociski: 2";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID LeatherBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Skórzany pas"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 2");
					Doc_PrintLine	( nDocID,  0, "Pociski: 2");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_LeatherBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					LeatherBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_SldBelt(C_Item) //handlarze: Wilk, Huan Ch3
{	
	name 					=	"Plan: Pas najemnika";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	SldBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 2";
	TEXT[3]                 = "Pociski: 2";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID SldBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas najemnika"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 2");
					Doc_PrintLine	( nDocID,  0, "Pociski: 2");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_SldBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					SldBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_FNovBelt(C_Item) //handlarze: Torrez,Jim CH2
{	
	name 					=	"Plan: Szarfa gotowoœci";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	FNovBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 2";
	TEXT[3]                 = "Pociski: 2";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID FNovBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Szarfa gotowoœci"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 2");
					Doc_PrintLine	( nDocID,  0, "Pociski: 2");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_FNovBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					FNOVBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_GrdBelt(C_Item) //handlarze: Skip, CH3
{	
	name 					=	"Plan: Pas stra¿nika";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	GrdBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 2";
	TEXT[3]                 = "Pociski: 2";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID GrdBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas stra¿nika"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 2");
					Doc_PrintLine	( nDocID,  0, "Pociski: 2");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_GrdBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					GRDBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_KdfBelt(C_Item) //handlarze: Torrez CH2
{	
	name 					=	"Plan: Szarfa Ognia";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	KdfBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 2";
	TEXT[3]                 = "Pociski: 2";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID KdfBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Szarfa Ognia"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 2");
					Doc_PrintLine	( nDocID,  0, "Pociski: 2");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_KdfBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					KdfBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_CrawlerBelt(C_Item) //handlarze: Wilk ch4
{	
	name 					=	"Plan: Pas Pe³zacza";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	CrawlerBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 2";
	TEXT[3]                 = "Pociski: 2";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID CrawlerBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Pe³zacza"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 2");
					Doc_PrintLine	( nDocID,  0, "Pociski: 2");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_CrawlerBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					CrawlerBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_StrengthBelt(C_Item) //handlarze: Wilk, Martin
{	
	name 					=	"Plan: Pas Si³y";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	StrengthBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Atrybuty";
	TEXT[2]                 = "Si³a: 5";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID StrengthBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Si³y"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Atrybuty");
					Doc_PrintLine	( nDocID,  0, "Si³a: 5");
					Doc_PrintLine	( nDocID,  0, "");		
					printAllIngredients(Recipe_StrengthBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					StrengthBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_PowerBelt(C_Item) //handlarze: Wilk,Martin
{	
	name 					=	"Plan: Pas Mocy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	PowerBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Atrybuty";
	TEXT[2]                 = "Si³a: 10";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID PowerBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga",0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Mocy"				);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Atrybuty");
					Doc_PrintLine	( nDocID,  0, "Si³a: 10");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_PowerBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, "");				
		
					Doc_Show		( nDocID 	);
					PowerBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_SkillBelt(C_Item) //handlarze: Cavalorn,
{	
	name 					=	"Plan: Pas Umiejêtnoœci";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	SkillBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Atrybuty";
	TEXT[2]                 = "Zrêcznoœæ: 5";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID SkillBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Umiejêtnoœci"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Atrybuty");
					Doc_PrintLine	( nDocID,  0, "Zrêcznoœæ: 5");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_SkillBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					SkillBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_DexterityBelt(C_Item) //handlarze: Cavalorn,
{	
	name 					=	"Plan: Pas Zrêcznoœci";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	DexterityBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Atrybuty";
	TEXT[2]                 = "Zrêcznoœæ: 10";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID DexterityBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Zrêcznoœci"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Atrybuty");
					Doc_PrintLine	( nDocID,  0, "Zrêcznoœæ: 10");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_DexterityBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					DexterityBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_ArmorBelt(C_Item) //handlarze: Huno, Huan, Darrion, CH2
{	
	name 					=	"Plan: Pas Ochrony";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	ArmorBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 5";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID ArmorBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Ochrony"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 5");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_ArmorBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					ArmorBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_DefendBelt(C_Item) //handlarze: Cavalorn, Huan
{	
	name 					=	"Plan: Pas Obrony";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	DefendBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Pociski: 5";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID DefendBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Obrony"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Pociski: 5");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_DefendBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					DefendBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_MagicArmorBelt(C_Item) //handlarze: Jim
{	
	name 					=	"Plan: Pas Magicznej Obrony";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	MagicArmorBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Magia: 5";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

	FUNC VOID MagicArmorBeltRecipe()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Magicznej Obrony"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Magia: 5");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_MagicArmorBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					MagicArmorBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_FireRunnerBelt(C_Item) //handlarze: Cavalorn, Huan
{	
	name 					=	"Plan: Pas ognistego biegacza";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	FireRunnerBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Ogieñ: 5";
	TEXT[3]                 = "";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

FUNC VOID FireRunnerBeltRecipe()
{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas ognistego biegacza"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Ogieñ: 5");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_FireRunnerBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					FireRunnerBelt_Recipe = TRUE;
};
/******************************************************************************************/
INSTANCE ItRe_ProtectionBelt(C_Item) //handlarze: Cavalorn, Huan
{	
	name 					=	"Plan: Ciê¿ki Pas Ochrony";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	ProtectionBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 3";
	TEXT[3]                 = "Pociski: 3";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

FUNC VOID ProtectionBeltRecipe()
{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas ognistego biegacza"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 3");
					Doc_PrintLine	( nDocID,  0, "Pociski: 3");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_ProtectionBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					ProtectionBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_TempleBelt(C_Item) //handlarze: Cavalorn, Huan
{	
	name 					=	"Plan: Pas Œwi¹tynny";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	TempleBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona";
	TEXT[2]                 = "Broñ: 2";
	TEXT[3]                 = "Pociski: 2";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

FUNC VOID TempleBeltRecipe()
{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas Stra¿nika"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona");
					Doc_PrintLine	( nDocID,  0, "Broñ: 2");
					Doc_PrintLine	( nDocID,  0, "Pociski: 2");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_TempleBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					TempleBelt_Recipe = TRUE;
};
/******************************************************************************************/
	INSTANCE ItRe_OrcHunterBelt(C_Item) //handlarze: Stanley
{	
	name 					=	"Plan: Pas £owcy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ER_BELT_RECIPE.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	OrcHunterBeltRecipe;

	description				= 	name;
	TEXT[1]                 = "Ochrona i atrybuty ";
	TEXT[2]                 = "Ochrona przed wszystkim: 3";
	TEXT[3]                 = "P¯: 40";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

FUNC VOID OrcHunterBeltRecipe()
{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Letters.tga", 	0	);  //  1 -> DO NOT SCALE 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  
					Doc_PrintLine	( nDocID,  0, "Pas £owcy"					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ochrona i atrybuty");
					Doc_PrintLine	( nDocID,  0, "Ochrona przed wszystkim: 3");
					Doc_PrintLine	( nDocID,  0, "P¯: 40");
					Doc_PrintLine	( nDocID,  0, "");
					printAllIngredients(Recipe_OrcHunterBelt, nDocID);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);				
		
					Doc_Show		( nDocID 	);
					OrcHunterBelt_Recipe = TRUE;
};
