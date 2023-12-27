const int	Value_Dietrich			=	15;
//	Dietrich
INSTANCE ItKeLockpick (C_Item)
{
	name 				=	"Wytrych";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Dietrich;

	visual 				=	"ItKe_Lockpick_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Dietrich;
};
/******************************************************************************************/
//	Schl�ssel
//ER _ KLUCZ LORDA
INSTANCE It_KeyLord(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	100;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= "Otwiera drog� do nieumar�ego lorda.";
};
// FIXME: aussagekr�ftigere Schl�sselnamen?
INSTANCE ItKeKey1(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;

};
/******************************************************************************************/
INSTANCE ItKeKey2(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};
/******************************************************************************************/
INSTANCE ItKeKey3(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;


	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};
/******************************************************************************************/
INSTANCE ItKeKey4(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};
/******************************************************************************************/
INSTANCE ItKeCavalorn01(C_Item)
{
	name 				=	"Klucz Cavalorna";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;

};
/*********************************************
**  KLUCZ DO SKRZYNI Z CZARN� RUD� **
*********************************************/	
INSTANCE KluczUlberta2(C_Item)
{
	name 				=	"Klucz do skrzyni w szopie Ulberta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};	
/********************************************************/
INSTANCE ItKeKeyPLAC(C_Item)
{
	name 				=	"Klucz do skrzy� na placu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};	
//*******************************************************************************
INSTANCE ItKe_DunegonKeyOC(C_Item)
{	
	name 			=	"Klucz do loch�w";

	mainflag		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MISSION;	
	
	visual 			=	"ItKe_Key_04.3ds";
	material 		=	MAT_METAL;
	description		= 	name;
	TEXT[2]			= 	"Otwiera tylne wej�cie do loch�w";

};
/******************************************************************************************/
INSTANCE ItKe_Miguel(C_Item)
{	
	name 					=	"Klucz od Miguela";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie"; 
	TEXT[1]				= "w dawnej sali treningowej";

	
};
/********************************************************/
INSTANCE ItKe_Ncbaal(C_Item)
{	
	name 					=	"Klucz Baala";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[2]				= "Otwiera skrzynie w Nowym Obozie.";
	TEXT[3]				= "Nale�y do Baal Kagana";

};
/******************************************************************************************/
//	KLUCZ DO CELI ALEXA																		//
/******************************************************************************************/
INSTANCE ItKe_Alex(C_Item)
{	
	name 					=	"Klucz do celi";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	


	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[1]				= "Otwiera jedn�";
	TEXT[2]				= "z celi w lochach.";


};
/****************************************************
**  	ROBOTNIK 2004: KLUCZ PLAC	   **
****************************************************/
INSTANCE ItMis_KeyOrryChest(C_Item)
{
	name 				=	"Klucz Orry'ego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Otwiera skrzyni�";
	TEXT[2]				= "na placu wymian";
	
};	
/********************************************************/
INSTANCE itmi_hysenkey(C_Item)
{
	name 				=	"Klucz do ukrytej skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Zabrany Hysenowi";
	
};	
/********************************************************/
INSTANCE itmi_grd2002_key(C_Item)
{
	name 				=	"Klucz do ukrytej skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[1]				= 	"Zabrany Stra�nikowi z posterunku";
	TEXT[2]				= 	"przy Opuszczonej Kopalni";
	
};	
/********************************************************/
INSTANCE ItMis_JoruKey(C_Item)
{
	name 					=	"Klucz Joru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;

	description				= 	name;
	TEXT[2]					= 	"Otwiera skrzyni� w chacie Joru";
};	
/********************************************************/
INSTANCE ItMis_KeyFingers(C_Item)
{
	name 					=	"Klucz R�czki";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;

	description				= 	name;
	TEXT[2]					= 	"Znaleziony w chacie Cienia R�czki";
};	
/******************************************************************************************/
INSTANCE ItMis_AidanKey (C_Item)
{
	name 				=	"Klucz Gortha";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[2]				= "Otwiera skrzyni�";
	TEXT[3]				= "w jaskini z�baczy.";
};
/******************************************************************************************/
INSTANCE DUNGEONKEY_ALEX (C_Item)
{
	name 				=	"Klucz do celi Alexa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[2]				= "Otwiera cel� Alexa";
	TEXT[3]				= "w lochach Starego Obozu.";
};
/********************************************************/
INSTANCE ItKe_Jacko_Kuznia(C_Item)
{
	name 				=	"Klucz Jacko";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Zabra�em go Jacko,";
	TEXT[2]				= "cholernie sie lepi...";
};
/********************************************************/
INSTANCE ItKe_Stone_Kuznia(C_Item)
{
	name 				=	"Klucz Stone'a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Nale�a� do Stone'a,";
	
};

//**********************************
// Klucz pirata
//*********************************
INSTANCE PiratKey01(C_Item)
{	
	name 					=	"Klucz do skrzy� ze skarbem";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;
	description				= 	"Klucz do skrzy� ze skarbem";

};

////////////////////////////////////////////////////////
// KLUCZ DO SKRYZNI Z BRONI� DLA BUNTOWNIK�W
// KLUCZ OTRZYMUJEMY OD RUFUSA
////////////////////////////////////////////////////////

INSTANCE ItMi_KeyFromRufus (C_Item)
{
	name 				=	"Klucz od Rufusa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;	
	TEXT[1]				= 	"Otwiera skrzyni� w chacie w Kotle.";
};
/********************************************************/
INSTANCE ItMi_KeyToChestInStorage (C_Item)
{
	name 				=	"Klucz bandzior�w";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;	
	TEXT[1]				= 	"Otwiera skrzyni� w magazynie ry�u.";
};

/********************************************************************************/
//SCHL�SSEL 
/*********************************************************************************/
//GOMEZ SCHL�SSEL
INSTANCE ItKe_Gomez_01(C_Item)
{	
	name 					=	"Klucz Gomeza";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	



	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie Gomeza.";
	TEXT[1]				= "Otwiera sk�adowisko w piwnicy Magnat�w.";

};


/*********************************************************************************/
//RICELORDS SCHL�SSEL
INSTANCE ItKey_RB_01(C_Item)
{	
	name 				=	"Klucz Ry�owego Ksi�cia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Otwiera skrzynie Ry�owego Ksi�cia.";
};

/*********************************************************************************/
//SCHMIEDESCHL�SSEL ERZBARONE
INSTANCE ItKe_OB_Smith_01(C_Item)
{	
	name 					=	"�elazny klucz";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	

	visual 					=	"ItKe_Key_02.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera drzwi w ku�ni.";

};
/*********************************************************************************/
// 
INSTANCE ItKe_Storage_01(C_Item)
{	
	name 					=	"Klucz do sk�adowiska";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	



	visual 					=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera g��wne drzwi do sk�adowiska ";
	TEXT[1]				= "w piwnicy Magnat�w.";

};

/********************************************************/
//			SCHL�SSEL IN DER ALTEN MINE
/********************************************************/

/********************************************************/
INSTANCE ItKe_OM_01(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Magazyn Santino.";
	TEXT[1]				= "Wy�sze miejsce wymiany.";
	TEXT[2]				= "Stara Kopalnia";
};
/********************************************************/
INSTANCE ItKe_OM_02(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "otwiera skrzyni� Aarona ";
	TEXT[1]				= "w Starej Kopalni.";
};

/********************************************************/
INSTANCE ItKe_OM_03(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie w sk�adowisku";
	TEXT[1]             = "Starej Kopalni.";
};

/********************************************************/
INSTANCE ItKe_OM_04(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Magazyn Alberto.";
	TEXT[1]				= "Ni�sze miejsce wymiany.";
};


//---------------------------------------------------------------------
//	Schl�ssel zu Kaloms Truhe
//---------------------------------------------------------------------
INSTANCE ITKE_PSI_KALOM_01(C_Item)
{	
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= "Klucz do laboratorium.";
	TEXT[0]				= "Otwiera skrzyni� w laboratorium";
	TEXT[1]				= "alchemicznym w obozie Bractwa.";

};

//---------------------------------------------------------------------
//	Truhenschl�ssel in der Bergfestung
//---------------------------------------------------------------------
INSTANCE ItKe_BERG_01(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Opuszczona g�rska forteca.";
	TEXT[1]				= "Zardzewia�y klucz do skrzyni.";
	
	
};

//---------------------------------------------------------------------
//	Schl�ssel zum Bonusraum in der Klosterruine
//---------------------------------------------------------------------
INSTANCE ItKe_Focus4(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Ten klucz pochodzi z jaskini";
	TEXT[2]				= "przed ruinami klasztoru.";
};

//---------------------------------------------------------------------
//	Schl�ssel unter dem Steinkreis
//---------------------------------------------------------------------
INSTANCE ItKe_Focus5(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Ten klucz pochodzi z krypty";
	TEXT[2]				= "pod kamiennym kr�giem.";
};

//---------------------------------------------------------------------
//	Schl�ssel zur Freien Mine
//---------------------------------------------------------------------
INSTANCE ItKe_Freemine(C_Item)
{	
	name 					=	"Klucz do Wolnej Kopalni";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;
	description			= "Klucz do Wolnej Kopalni";

};
/********************************************************/
INSTANCE ItKe_BrandickTower(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Nale�a� do nieumar�ego gwardzisty...";
};
/********************************************************/
INSTANCE ItKe_US_GOBBO(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};
/********************************************************/
INSTANCE ItKe_KUR_BLA(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};
/********************************************************/
INSTANCE ItKe_Magnaci01  (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};
/********************************************************/
INSTANCE ITKE_Tower_01  (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	
};
/********************************************************/
INSTANCE ITKE_KH_Tirrut  (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]       = PRINT_TirrutKey;
};
/********************************************************/
INSTANCE ITKE_ER_CHEST01  (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]       = "Klucz do Skrzyni";
};
/********************************************************/
INSTANCE ITKE_ER_GUYHOUSE  (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]       = "Klucz do chaty z baldachimem.";
};
/********************************************************/
INSTANCE ITKE_BG  (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]       = "Klucz do skrzyni...";
};
/********************************************************/
INSTANCE ITKE_PWS (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]       = "Zwyk�y klucz.";
};
/********************************************************/
INSTANCE ITKE_Foster (C_Item)
{
	name 				=	"Klucz Fostera";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;



	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	 TEXT[1]       = "Klin go dla mnie ukrad�.";
};
/********************************************************/




