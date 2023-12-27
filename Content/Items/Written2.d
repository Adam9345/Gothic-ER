//Ksiêgi do zadañ z Mrocznym Bractwem
var int darksect1Czytane;
var int darksect2Czytane;
var int darksect3Czytane;
var int darksect4Czytane;
var int darksect5Czytane;
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_01(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 1";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 1";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_01;
};

	FUNC VOID Use_DarkSect_01()
	{   
	if (darksect1Czytane == false)
	{
	  MIS_MroczneBractwo = LOG_RUNNING;

    Log_CreateTopic            (CH1_MroczneBractwo, LOG_MISSION);
    Log_SetTopicStatus       (CH1_MroczneBractwo, LOG_RUNNING);
    B_LogEntry                     (CH1_MroczneBractwo,"Ksiêga któr¹ otrzyma³em od Magnusa zawiera³a ciekaw¹ historiê. Mo¿e warto poznaæ dalsz¹ treœæ tej opowieœci?");
B_GiveXP (200);
darksect1Czytane = true;
};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, " Klasztor mnichów sta³ na krawêdzi skalnego klifu. By³a to budowla solidna o mocnych fundamentach. W koñcu przy budowie pomagali najlepsi in¿ynierowie znani na Khorinis. W najbardziej wysuniêtej w stronê morza czêœci kompleksu znajdowa³a siê wie¿a. Niegdyœ s³u¿y³a za czytelniê jednak póŸniej jej rola siê zmieni³a. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "To w³aœnie te skromne i zimne mury sta³y siê  nasz¹ w³asn¹ œwi¹tyni¹. Czytelnik z pewnoœci¹ nie zrozumie tych wyrwanych z kontekstu zdañ. Spieszê wiêc z pomoc¹. Wszystko zaczê³o siê gdy Elner znalaz³ ksiêgê w której opisane by³y prastare techniki walki skrytych zabójców. Postanowi³ posi¹œæ wiedzê legendarnych skrytobójców. ");
					Doc_Show		( nDocID );
					
	};
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_02(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 2";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 2";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_02;
};

	FUNC VOID Use_DarkSect_02()
	{ 
		if (darksect2Czytane == false)
	{
	  B_GiveXP (200);
    B_LogEntry                     (CH1_MroczneBractwo,"Z drugiego tomu sagi dowiedzia³em siê, ¿e uczniowie klasztoru posiadali wiedzê pradawnych zabójców. W Wie¿y Mgie³ znaleŸli cenn¹ broñ, któr¹ ukryli w cytadeli.");
darksect1Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Razem z Finarem zostaliœmy szybko wci¹gniêci do sekty. Elner by³ bowiem naszym wiernym przyjacielem. Nigdy nie mia³em w rêkach porz¹dnej broni bia³ej… Od tamtej pory wszystko siê zmieni³o. Szybko zacz¹³em siê uczyæ umiejêtnoœci bojowych zaniedbuj¹c lekcje magii. Z czasem do naszego krêgu dopuœciliœmy Rona – nowego ucznia.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Kolejnym prze³omem by³a noc, podczas której Elner postanowi³ z³amaæ zakaz Mistrza. Chcia³ dostaæ siê do katakumb pod Wie¿¹ Mgie³. Uwa¿a³, ¿e znajdzie tam jak¹œ wskazówkê dotycz¹c¹ zabójców. I rzeczywiœcie mu siê to uda³o. Zdobyliœmy wspania³e szaty legendarnych zabójców. Ale najwa¿niejsza by³a broñ, któr¹ postanowiliœmy ukryæ w starej cytadeli…");
					Doc_Show		( nDocID );
	};	
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_03(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 3";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 3";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_03;
};

	FUNC VOID Use_DarkSect_03()
	{   
			if (darksect2Czytane == false)
	{
	   B_GiveXP (400);
    B_LogEntry                     (CH1_MroczneBractwo,"Niedoszli asasyni musieli opuœciæ klasztor. Wszystkie zgromadzone bronie ukryli w katakumbach na szczycie, na którym niegdyœ sta³a cytadela. ");
darksect3Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Broñ, pancerze, amulety… Wszystkie znalezione pozosta³oœci po asasynach zabraliœmy ze sob¹. Klasztor nie by³ ju¿ bezpiecznym miejscem. Musieliœmy ukryæ nasze rzeczy gdzieœ indziej. Elner chcia³ wykorzystaæ pozosta³oœci prastarej budowli znajduj¹cej siê na wzniesieniu w centrum doliny.  Pron odkry³ drogê do sekretnych katakumb. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,  1, "Ciche, zapomniane miejsce na szczycie góry uznaliœmy za nasz¹ now¹ kryjówkê. Mogliœmy siê wreszcie skupiæ na mieczu znalezionym w wie¿y. Lœni¹ce, d³ugie ostrze. Pocz¹tkowo zdziwi³o nas, ¿e nie jest to sztylet. Brakowa³o tylko czaru wskrzeszaj¹cego poleg³ych wrogów. ");
					Doc_Show		( nDocID );
	};	

/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_04(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 4";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 4";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_04;
};

	FUNC VOID Use_DarkSect_04()
	{   
				if (darksect4Czytane == false)
	{
	 B_GiveXP (550);
    B_LogEntry                     (CH1_MroczneBractwo,"Asasyni próbowali zakl¹æ miecz, jednak czar spocz¹³ nie na tym ostrzu na którym planowano. Zaklêta broñ do tej pory nie zosta³a odnaleziona.  Tymczasem Nowicjusze zostali wyrzuceni z klasztoru. Zaczêli zabijaæ dla pieniêdzy i s³awy.");
darksect4Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Z zapisów pozostawionych przez asasynów dowiedzieliœmy siê, ¿e próba zaklêcia miecza uda³a siê. Jednak nie na tym mieczu, który znaleŸliœmy. Przez przypadek inne ostrze pad³o ofiar¹ zaklêcia. Fala czarnej energii spowodowa³a o¿ywienie martwych cia³ marynarzy. Skrytobójcy nie mog¹c sobie poradziæ w otwartej walce musieli opuœciæ wie¿e. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  );  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID, 1, "Wiele lat szukaliœmy zaklêtego ostrza. Nasze wysi³ki posz³y na marne. Z czasem wyrzucono nas z klasztoru. Zostaliœmy z niczym. Elner postanowi³, ¿e wykorzystamy swoje nowe umiejêtnoœci. Zaczêliœmy zabijaæ dla z³ota. Staliœmy siê znani wœród rzezimieszków i oprychów. Pocz¹tkowo podoba³o mi siê to. PóŸniej wszystko siê zmieni³o.");
					Doc_Show		( nDocID );
	};		
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_05(C_Item)
{	
	name 					=	"Mroczne Bractwo TOM 5";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Mroczne Bractwo - TOM 5";
	
	TEXT[5]				=	 NAME_Value;
	COUNT[5]			=	 value;
	on_state[0]			=	Use_DarkSect_05;
};

	FUNC VOID Use_DarkSect_05()
	{   
	if (darksect5Czytane == false)
	{
	  B_GiveXP (550);
    B_LogEntry                     (CH1_MroczneBractwo,"Nieprzygotowani do zabijania niedoszli asasyni powoli zaczêli siê rozsypywaæ. G³ówny za³o¿yciel Mrocznego Bractwa na tyle wci¹gn¹³ siê w œwiat asasynów, ¿e zapomnia³ o przyjacio³ach. Nieznany mi z imienia przyjaciel Elnera postanowi³ zabiæ przyjaciela. Chcia³ pomœciæ wszystkich, którzy niewinnie zginêli z rêki Mrocznego Bractwa. Wojownicy stoczyli walkê. Walczyli do koñca. ¯aden z nich nie prze¿y³. Po Mrocznym Bractwie pozosta³y wy³¹cznie kroniki...");
    B_GiveXP (550);
	darksect5Czytane = true;
	};
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Mroczne Bractwo"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Pierwszy wypali³ siê Ron. By³ z nas najm³odszy. Nie radzi³ sobie z tym wszystkim. Czêsto musieliœmy zabijaæ niewinnych ludzi, który poza tym, ¿e byli przeszkod¹ w karierze kogoœ innego nic z³ego nie zrobili. Powiesi³ siê na drzewie w pobli¿u cytadeli. Pron d³ugo nie móg³ siê pogodziæ ze œmierci¹ towarzysza. By³ tak roztrzêsiony, ¿e kilka dni póŸniej zosta³ zabity przy wykonywaniu zlecenia. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,1,"Zosta³em tylko ja z Elnerem. Elner w ogóle nie przej¹³ siê œmierci¹ ani Rona, ani Prona. Wtedy do mnie dotar³o, ¿e to ju¿ nie ten cz³owiek co kiedyœ. Postanowi³em go zabiæ, aby pomœciæ wszystkich niewinnych, którzy zginêli z naszej rêki. Dziœ w cytadeli poleje siê krew…");
					Doc_Show		( nDocID );
	};	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_Tower01(C_Item)
{	
	name 					=	"Wyprawa do Wie¿y Mgie³ TOM 1";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= "Wyprawa do Wie¿y Mgie³";
		TEXT[2]				=	 "TOM 1";
	TEXT[5]					=	 NAME_Value;
	COUNT[5]				=	 value;
	on_state[0]				=	Use_DarkSectTower_01;
};

	FUNC VOID Use_DarkSectTower_01()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wyprawa"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "W tym tomie streszczê to czego dowiedzia³em siê o Wie¿y Mgie³. O tej tajemniczej budowli s³ysza³em wiele. Ponoæ w zamierzch³ych czasach mia³a s³u¿yæ jako latarnia morska, jednak w jej okolicy nie widaæ ¿adnych œladów budowy portu lub czegokolwiek zwi¹zanego z ¿eglug¹. ");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,1,"Bardziej prawdopodobne, ¿e s³u¿y³a jako krypta do chowania martwych ¿eglarzy i wilków morskich. Sensowna wydaje siê opowieœæ ³¹cz¹ca obie wersje wydarzeñ: zarz¹dzono budowê latarni jednak z nieznanych powodów zakoñczono pracê. Zrezygnowano równie¿ z budowy portu. Wkrótce u wybrze¿y rozbi³ siê statek. Martwych ¿eglarzy pochowano w³aœnie w wie¿y. ");
					Doc_Show		( nDocID );
	};		
	
/******************************************************************************************/
INSTANCE ItWr_Book_DarkSect_Tower02(C_Item)
{	
	name 					=	"Wyprawa do Wie¿y Mgie³ TOM 2";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	130;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				= 	"Wyprawa do Wie¿y Mgie³";
		TEXT[2]				=	"TOM 2";
	TEXT[5]					=	NAME_Value;
	COUNT[5]				=	value;
	on_state[0]				=	Use_DarkSectTower_02;
};

	FUNC VOID Use_DarkSectTower_02()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
									//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Wyprawa"			);
				//	Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Co ma to wspólnego z tajemniczymi skrytobójcami? Nie mam pojêcia. Wed³ug Ÿróde³, które znalaz³ Elner, skrytobójcy byli rozproszeni po ca³ej dolinie. Gdy wszyscy zapomnieli o  marynarzach, widocznie musieli zaj¹æ wie¿ê i wykorzystaæ j¹ jako swoj¹ kryjówkê. PóŸniej postanowili opuœciæ nowe miejsce…");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLines	( nDocID,1,"Nie bez powodu. Asasyni rozpoczêli eksperymentowaæ z czarn¹ magi¹. Chcieli stworzyæ potê¿n¹ broñ, która potrafi wskrzesiæ martwego wroga i wykorzystaæ go jak swego s³ugê. Szybko okaza³o siê, ¿e nie jest to ³atwe. Przez przypadek nieudolni magowie o¿ywili za³ogê ca³ego statku. Wielu z nich zginê³o w walce. To ich pancerze znaleŸliœmy w wie¿y. ");
					Doc_Show		( nDocID );
	};		