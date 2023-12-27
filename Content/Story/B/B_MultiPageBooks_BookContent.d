//########################################################################################
//##																					##
//##	B_MultiPageBooks_BookContent													##
//##	============================													##
//##																					##
//##	Hier wird der Inhalt der mehrseitigen Bücher definiert. Daz muss für jede		##
//##	Seite eine Funktion geschrieben werden.Wichtig ist, dass alle Funktionen,		##
//##	die zu einem Buch gehören, auf die gleiche Weise benannt werden, also			##
//##	'func void Funktionsname_x' wobei x die Seitenzahl darstellt.					##
//##																					##
//########################################################################################


// -------- Testbuch - Der Prototyp ----------------------------

func void Book_Test_1()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	(nDocID, 2);
	Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins	(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetPage 	(nDocID, 0, "Book_Brown_L.tga", 0); 
	Doc_SetPage		(nDocID, 1, "Book_Brown_R.tga", 0);

	//1.Seite
	Doc_SetFont 	(nDocID,-1, "font_10_book.tga");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "Testseite 1");

	//2.Seite
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "Testseite 2");

	Doc_Show		(nDocID);
};

func void Book_Test_2()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	(nDocID, 2);
	Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins	(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetPage 	(nDocID, 0, "Book_Brown_L.tga", 0); 
	Doc_SetPage		(nDocID, 1, "Book_Brown_R.tga", 0);

	//3.Seite
	Doc_SetFont 	(nDocID,-1, "font_10_book.tga");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "Testseite 3");

	//4.Seite
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "Testseite 4");

	Doc_Show		(nDocID);
};

func void Book_Test_3()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	(nDocID, 2);
	Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins	(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetPage 	(nDocID, 0, "Book_Brown_L.tga", 0); 
	Doc_SetPage		(nDocID, 1, "Book_Brown_R.tga", 0);

	//5.Seite
	Doc_SetFont 	(nDocID,-1, "font_10_book.tga");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "Testseite 5");

	//6.Seite
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "Testseite 6");

	Doc_Show		(nDocID);
};

func void Book_Test_4()
{
	var int nDocID;
	nDocID = Doc_Create();

	Doc_SetPages	(nDocID, 2);
	Doc_SetMargins	(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins	(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetPage 	(nDocID, 0, "Book_Brown_L.tga", 0); 
	Doc_SetPage		(nDocID, 1, "Book_Brown_R.tga", 0);

	//7.Seite
	Doc_SetFont 	(nDocID,-1, "font_10_book.tga");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "");
	Doc_PrintLine	(nDocID, 0, "Testseite 7");

	//8.Seite
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "");
	Doc_PrintLine	(nDocID, 1, "Testseite 8");

	Doc_Show		(nDocID);
};

