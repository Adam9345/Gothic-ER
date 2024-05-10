/****************************************************
******* GOTHIC EDYCJA ROZSZERZONA 1.4
******* BRONIE DLA GRACZA
******* Opis: Wszystkie bronie znajduj¹ce siê w tym pliku
******* gracz mo¿e kupiæ, dostaæ lub znaleŸæ. Wa¿ny jest
******* balans, oraz cena. Ponadto do czêœci broni 
******* do³¹czany jest plan, który mo¿na wykorzystaæ
******* u kowala. 
*****************************************************/

/****************************************************
******* ROZDZIA£ 1
******* PARAMETRY MAX DLA ROZDZIA£U
******* maksymalna [DAM_EDGE]	=	32;
******* maksymalna [DAM_FIRE] = 	0;
******* maksymalna [DAM_MAGIC] = 	0;
*****************************************************/
	
/****************************************************
******* MIECZ HORYZONTÓW
******* Opis: jest to nagroda od Huno, jeœli nie wpêdzimy
******* go ponownie w na³óg. 
*****************************************************/
INSTANCE Miecz1H5 (C_Item) //nagroda od Huno
{	
	name 				=	"Miecz Horyzontów";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	35;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		
	
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	35;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_02.3DS";

	description			= name;
	TEXT[1]				= "porêczny miecz o dalekim zasiêgu";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* MIECZ KOWALA
******* Opis: miecz mo¿na wykuæ po zdobyciu planu, 
******* który sprzedaje Darrion.  
*****************************************************/
INSTANCE Miecz1H6 (C_Item) //do wykucia
{	
	name 				=	"Miecz Kowala";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	350;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	visual 				=	"DB_ItMw_1H_Sword_Broad_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	
/****************************************************
******* ŒWIÊTY MŒCICIEL
******* Opis: miecz stosowany w czasie wojny przez  
******* paladynów i dzier¿ony przez niektórych 
******* magów, poniewa¿ stanowi³ swoisty symbol oddania 
******* Innosowi. Plan na niego mo¿na znaleŸæ na Ziemi
******* Orków przy starym szkielecie (nale¿¹cym do kowala).
*****************************************************/
INSTANCE Miecz1H8 (C_Item) //Mœciciel
{	
	name 				=	"Œwiêty Mœciciel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1450;
	

	damageType				= DAM_EDGE;
	range    			=  	120;		
	damageTotal			= 	65;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	20;
	visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	
/****************************************************
******* PORZ¥DNY MIECZ JEDNORÊCZNY
******* Opis: zwyk³y miecz wykuty wed³ug projektu pewnego  
******* Myrtañskiego kowala. Mo¿na go kupiæ u Fiska lub kupiæ
******* plan u Huno. 
*****************************************************/
INSTANCE Miecz1H11 (C_Item) //handel Fisk
{	
	name 				=	"Porz¹dny Krótki Miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	400;
	
	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	80;		

	cond_atr[1]   		= 	ATR_STRENGTH;
	cond_value[1]  		= 	32;

	visual 				=	"DB_ItMw_1h_Sword_Rep_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


	
/****************************************************
******* MA£Y MIECZ OGNIA
******* Opis: tê broñ otrzymujemy jako nagrodê za zabicie  
******* morakha. 
*****************************************************/
INSTANCE Miecz1H13 (C_Item) //nagroda za zabicie morakha - Escalus - kim do cholery jest Morakh????!!
{	
	name 				=	"Ma³y miecz ognia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1200;
	
	damageTotal			= 	35;
	damagetype			=	DAM_EDGE|DAM_FIRE;
	range    			=  	90;		
	damage[DAM_INDEX_FIRE]	= 3;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	50;
	visual 				=	"DB_ItMw_1H_Sword_Short_Rep_01.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[1]				= NAME_Dam_Fire;				COUNT[1]	= damage[DAM_INDEX_FIRE];
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* SZTYLET INNOSA
******* Opis: tak¹ broñ nosz¹ nowicjusze ognia, oraz mo¿na  
******* j¹ kupiæ u Torreza.
*****************************************************/
INSTANCE Miecz1H14 (C_Item)  //Nowicjusze Ognia
{	
	name 				=	"Sztylet Innosa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	400;
	
	damageTotal			= 	15;
	damagetype			=	DAM_EDGE|DAM_FIRE;
	range    			=  	50;		
	damage[DAM_INDEX_FIRE]	= 2;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	
	cond_atr[1]   		= 	ATR_MANA_MAX;
	cond_value[1]  		= 	15;
	visual 				=	"DB_ItMw_1H_Sword_Short_Rep_02.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[1]				= NAME_Dam_Fire;				COUNT[1]	= damage[DAM_INDEX_FIRE];
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[1];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/****************************************************
******* B£YSK NOCY
******* Opis: plan kowalski na tê broñ mo¿na znaleŸæ   
******* w chacie Z³ego lub kupic u Huana. 
*****************************************************/
INSTANCE Miecz1H15 (C_Item)
{	
	name 				=	"B³ysk Nocy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	450;
	
	damageTotal			= 	25;
	damagetype			=	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	27;
	visual 				=	"DB_ItMw_1H_Sword_Short_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* PROMIEÑ ŒWIAT£A	
******* Opis: miecz by³ noszony przez wybitnie zas³u¿onych   
******* paladynów w czasie I wojny z orkami. Do znalezienia
******* w œwi¹tyni Œni¹cego przy ciele umêczonego paladyna.
*****************************************************/
INSTANCE Miecz2H1 (C_Item) //Œwi¹tynia Œni¹cego
{	
	name 				=	"Promieñ Œwiat³a";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	3500;
	
	damageTotal			= 	110;
	damagetype			=	DAM_EDGE|DAM_MAGIC;
	range    			=  	80;		
	damage[DAM_INDEX_MAGIC]	=	 10;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Dam_MAGIC;				COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* KIE£ CIENOSTWORA	
******* Opis: tê broñ znajdujemy przy ciele pustelnika z    
******* Bractwa, który umiera na Cmentarzysku Orków. - Escalus - propozycja ¿eby zmieniæ po³o¿enie na jedn¹ z sal pobocznych, bo miecz 2h nie ma sensu przy Guru
*****************************************************/
INSTANCE Miecz2H2 (C_Item) //pustelnik z bractwa (rozdzia³ 3)
{	
	name 				=	"Kie³ Cieniostwora";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1500;
	
	damageTotal			= 	53;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	58;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* MIECZ MAGNATA		
******* Opis: zapasowy miecz Gomeza. Mo¿na go znaleŸæ    
******* w jego skrzyni. 
*****************************************************/
INSTANCE Miecz2H3 (C_Item) //skrzynia Gomeza
{	
	name 				=	"Miecz Gubernatora";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	3000;
	
	damageTotal			= 	105;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	110;
	
	//cond_atr[1]   		= 	ATR_DEXTERITY;
	//cond_value[1]  		= 	70;
	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* POGROMCA ORKÓW		
******* Opis: orê¿ stosowany przez ³owców orków. Plan na   
******* niego mo¿na kupiæ lub znaleŸæ przy ciele Ur Grana.
*****************************************************/
INSTANCE Miecz2H5 (C_Item) // £owcy orków
{	
	name 				=	"Pogromca Orków";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1850;
	
	damageTotal			= 	85;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	visual 				=	"DB_ItMw_2H_Sword_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



/****************************************************
******* SZTYLET ZABÓJCY	
******* Opis: Nagroda za pomoc od Snake'a. Dostajemy od   
******* niego plan.
*****************************************************/
INSTANCE ItMw_DaggerOfMurder(C_Item) 
{	
	name 				=	"Sztylet Zabójcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	30;
	visual 				=	"steel_dagger.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/****************************************************
******* SZTYLETY	
******* Opis: Pospolite bronie, które mo¿na kupiæ u   
******* handlarzy lub znaleŸæ w œwiecie.
*****************************************************/	
INSTANCE ItMw_Dagger (C_Item) 
{	
	name 				=	"Sztylet";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	20;
	
	damageTotal			= 	10;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	7;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Dagger2 (C_Item) 
{	
	name 				=	"Zdobiony Sztylet";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	35;
	
	damageTotal			= 	15;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	11;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Dagger3 (C_Item) 
{	
	name 				=	"Sztylet Wojownika" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	350;
	
	damageTotal			= 	25;
	damagetype			=	DAM_EDGE;
	range    			=  	70;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_005_1H_Dagger_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* RAPIER		
******* Opis: Lekki, ale niezwykle ostry miecz jednorêczny   
******* wymagaj¹cy wyskiego wspó³czynnika zrêcznoœci. 
******* Plan do kupienia u Darriona w trzecim rozdziale. 
*****************************************************/

INSTANCE ItMw_Rapier (C_Item) 
{	
	name 				=	"Rapier" ;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1400;
	
	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	45;
	visual 				=	"ItMw_050_1H_Sword_Rapier_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



/****************************************************
******* MIECZ MISTRZOWSKI		
******* Opis: Wyj¹tkowa, niezwykle lekka i ostra broñ.   
******* Otrzymujemy j¹ jako prezent od Diego. 
*****************************************************/
//Meisterdegen - NEUE INSTANZ
const int Damage_Meisterdegen		= 95; //+10%
const int Condition_Meisterdegen	= 90; //DEX
const int Range_Meisterdegen		= 100;
const int Value_Meisterdegen		= 2200;
//----------------------------10----------------------------------
FUNC VOID Equip_1H_10()
{
	if Npc_IsPlayer (self)
	{ 
		//B_AddFightSkill (self, NPC_TALENT_1H, Waffenbonus_10);
		Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)+5);
	};
};
FUNC VOID UnEquip_1H_10()
{
	if Npc_IsPlayer (self)
	{ 
		//B_AddFightSkill (self, NPC_TALENT_1H, - Waffenbonus_10);
		Npc_SetTalentValue(hero, NPC_TALENT_1H, Npc_GetTalentValue(hero, NPC_TALENT_1H)-5);
	};
};
const string NAME_ADDON_BONUS_1H = "Premia do trafieñ krytycznych";
/******************************************************************************************/
INSTANCE ItMw_Meisterdegen (C_Item)
{	
	name 				=	"Miecz Mistrzowski";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	4400;
	
	damageTotal			= 	120;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	90;
	visual 				=	"ItMw_065_1h_SwordCane_02.3ds";
	
	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[1];
	TEXT[3]				= NAME_ADDON_BONUS_1H;			COUNT[3]	= 5;
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};	


/****************************************************
******* PA£ASZ		
******* Opis: Plan na tê lekk¹ broñ mo¿na kupiæ u Huana.   
*****************************************************/
//Degen 	- ItMw_1h_Vlk_Sword 
/******************************************************************************************/
INSTANCE ItMw_Addon_BanditTrader (C_Item)
{	
	name 				=	"Pa³asz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	800;
	
	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	90;		
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	30;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;

	TEXT[1]				= 	"Lekka i porêczna broñ";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


	
/****************************************************
******* WSPANIA£Y PA£ASZ		
******* Opis: Broñ mo¿na znaleŸæ w górnej sali Cmentarzyska    
******* Orków.
*****************************************************/
INSTANCE ItMw_DarkTrader (C_Item) //Cmentarzysko Orków - górna sala
{	
	name 				=	"Wspania³y Pa³asz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1000;
	
	damageTotal			= 	50;
	damagetype			=	DAM_EDGE;
	range    			=  	90;		
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	35;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;

	TEXT[1]				= 	"Lekka i porêczna broñ";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* TOPÓR £ASKI		
******* Opis: Jednorêczny topór, który otrzymujemy od    
******* Gorna na spotkaniu.  - ESCALUS - DO WYJEBANIA> ZAST¥PIÆ MIKSTUR¥ SI£Y
*****************************************************/
INSTANCE Gottfrieds_Axt (C_Item)
{
	name 				=	"Topór £aski";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	150;
	
	value 				=	900;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	20;

	//owner 				= 	PC_Hero;
	visual 				=	"ItMw_1H_Axe_Gottfried.3DS";

	description			= name;
	TEXT[0]				= "Wspaniale zdobiona broñ.";
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* MIECZ SZEROKI		
******* Opis: Jednorêczny, szeroki miecz o delikatnie     
******* zdobionym ostrzu. Plan na niego mo¿na kupiæ 
******* u Mila w rozdziale 2. - ESCALUS - DO WYJEBANIA>
*****************************************************/
INSTANCE Miecz1H7 (C_Item) 
{	
	name 				=	"Miecz szeroki";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	470;
	
	damageTotal			= 	47;
	damagetype			=	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	37;
	
	visual 				=	"DB_ItMw_1H_Sword_Broad_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Edge;				COUNT[2]	= damage[DAM_EDGE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

	
/****************************************************
******* MIECZ ROZPACZY		
******* Opis: Plan na miecz mo¿na znaleŸæ w skrzyni      
******* o szyfrze LPPPLLLPPPPPPL na Wie¿y Mgie³. Zostawi³ 
******* go pewien kowal, który wyku³ wspania³y miecz, 
******* aby pope³niæ przy jego u¿yciu samobójstwo,
******* poniewa¿ zes³anie do kolonii rozdzieli³o go
******* z ukochan¹.
*****************************************************/
INSTANCE Miecz1H9 (C_Item)
{	
	name 				=	"Miecz Rozpaczy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	650;
	range    			=  	100;
	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	
	visual 				=	"DB_ItMw_1H_Sword_Long_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



/****************************************************
******* Ostrze myrtañskiego ¿o³nierza		
******* Opis: U handlarzy na rozdzia³ 5.
*****************************************************/
INSTANCE Miecz1H_P_1 (C_Item) 
{	
	name 				=	"Ostrze myrtañskiego ¿o³nierza";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	800;
	
	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	115;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;
	
	visual 				=	"new_stl_mastersword.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* Prastary paladyn		
******* Opis: U handlarzy na rozdzia³ 5.
*****************************************************/
INSTANCE Miecz1H_P_2 (C_Item) 
{	
	name 				=	"Prastary paladyn";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;
	
	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	115;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	89;
	
	visual 				=	"new_stl_claymore.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* Miecz krwawego barbarzyñcy		
******* Opis: U handlarzy na rozdzia³ 6.
*****************************************************/
INSTANCE Miecz1H_P_3 (C_Item) 
{	
	name 				=	"Miecz krwawego barbarzyñcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1000;
	
	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	98;
	
	visual 				=	"new_stl_greatsword.3DS"; 

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/****************************************************
******* Topór krwawego barbarzyñcy		
******* Opis: U handlarzy na rozdzia³ 6.
*****************************************************/
INSTANCE Axe1H_P_1 (C_Item) 
{	
	name 				=	"Topór krwawego barbarzyñcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	1020;
	
	damageTotal			= 	102;
	damagetype			=	DAM_EDGE;
	range    			=  	115;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	
	visual 				=	"new_stl_waraxe.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[2]				= NAME_Dam_Fire;				COUNT[2]	= damage[DAM_INDEX_FIRE];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/****************************************************
******* JEDNORÊCZNY URIZIEL		
******* Opis: s¹ to ró¿ne wersje jednorêcznego URIZIELA    
******* które przekuwa dla nas kowal Nordmarczyk. 
*****************************************************/
INSTANCE URIZIEL_Touch (C_Item) //przekute przez Nordmarczyka
{	
	name 				=	"Dotyk URIZIELA";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;
	
	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	
	
	
	//visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";
	visual 				=	"ItMw_1H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Ostrze URIZIEL przekute na broñ jednorêczn¹.";
	TEXT[1]				=	NAME_Damage;			COUNT[1]	=	damageTotal;
	TEXT[2]				=	NAME_Dam_Fire;			COUNT[2]	=	damage[DAM_INDEX_FIRE];
	TEXT[3] 			=	NAME_Str_needed;		COUNT[3]	=	cond_value[2];
	TEXT[4]				=	NAME_OneHanded;
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};
//*****************************************************
INSTANCE URIZIEL_Touch_Full (C_Item) //nape³nione u Miltena
{	
	name 				=	"Dotyk URIZIELA";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;
	
	value 				=	10000;

//	damageType				=	DAM_EDGE|DAM_FIRE|DAM_MAGIC;//Templer sollten sofort tot sein
	damageType				=	DAM_FIRE|DAM_MAGIC;
//	damageType				=	DAM_MAGIC;
//	damage[DAM_INDEX_EDGE]	=	  1;						//Templer sollten sofort tot sein
	damage[DAM_INDEX_FIRE]	=	 30;
	damage[DAM_INDEX_MAGIC]	=	120;
	//damage[DAM_INDEX_MAGIC]	=	150;

	range    			=  	100;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	

	//visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";
	visual 				=	"ItMw_1H_Sword_Sleeper_02.3DS";

	description			= 	name;
	TEXT[0]				=	"Ostrze URIZIEL przekute na broñ jednorêczn¹ i magicznie na³adowane.";
	TEXT[1]				=	NAME_Dam_Magic;			COUNT[1]	=	damage[DAM_INDEX_MAGIC];
	TEXT[2]				=	NAME_Dam_Fire;			COUNT[2]	=	damage[DAM_INDEX_FIRE];
	TEXT[3] 			=	NAME_Str_needed;		COUNT[3]	=	cond_value[2];
	TEXT[4]				=	NAME_OneHanded;
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};
//*****************************************************
INSTANCE URIZIEL_Touch_Worst (C_Item) //bez runy
{	
	name 				=	"Dotyk URIZIELA";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;
	
	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	
	

	//visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";
	visual 				=	"ItMw_1H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Ostrze URIZIEL przekute na broñ jednorêczn¹. Pozbawione klejnotu.";
	TEXT[1]				=	NAME_Damage;			COUNT[1]	=	damageTotal;
	TEXT[2]				=	NAME_Dam_Fire;			COUNT[2]	=	damage[DAM_INDEX_FIRE];
	TEXT[3] 			=	NAME_Str_needed;		COUNT[3]	=	cond_value[2];
	TEXT[4]				=	NAME_OneHanded;
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};

//*****************************************************
INSTANCE ItMw_2h_Sword_Hrodgir (C_Item) //bez runy
{	
	name 				=	"Stary miecz Hrodgira";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;
	
	value 				=	650;

	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	
	
	
	visual 				=	"ItMw_2H_Sword_Hrodgir.3DS";

	description			= 	name;
	TEXT[1]				=	"Ma za sob¹ wiele wiosen...";
	TEXT[2]				=	NAME_Damage;			COUNT[2]	=   damageTotal;
	TEXT[3] 			=	NAME_Str_needed;		COUNT[3]	=	cond_value[2];
	TEXT[4] 			=   NAME_TwoHanded;
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};
//*****************************************************
INSTANCE ItMw_2h_NightSword (C_Item) 
{	
	name 				=	"Miecz nocy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;


	damageTotal			= 	110;
	damagetype			=	DAM_EDGE;
	range    			=  	145;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;
	protection[PROT_MAGIC]  = 5;
	
	
	visual 				=	"ItMw_2h_NightSword.3DS";

	description			= 	name;
	TEXT[0]				=	"Sieje panikê samym wygl¹dem...";
	TEXT[1]				=	NAME_Damage;			COUNT[1]	=   damageTotal;
	TEXT[2] 			=	NAME_Str_needed;		COUNT[2]	=	cond_value[2];
	TEXT[3]             =   NAME_Prot_Magic;		COUNT[3]	= 	protection[PROT_MAGIC];
	TEXT[4] 			=   NAME_TwoHanded;
	TEXT[5]				= 	NAME_Value;
	
};
//*****************************************************
INSTANCE ItMw_2h_SleeperEye (C_Item) 
{	
	name 				=	"Oko œni¹cego";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;


	damageTotal			= 	95;
	damagetype			=	DAM_EDGE;
	range    			=  	145;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	
	
	
	visual 				=	"ItMw_2h_SleeperEye.3ds";

	description			= 	name;
	TEXT[1]				=	"Broñ zdobi¹ piêkne szmaragdy.";
	TEXT[2]				=	NAME_Damage;			COUNT[2]	=   damageTotal;
	TEXT[3] 			=	NAME_Str_needed;		COUNT[3]	=	cond_value[2];
	TEXT[4] 			=   NAME_TwoHanded;
	TEXT[5]				= 	NAME_Value;
	
};
/*********************************************************************************
** Alte Zweihänder								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2h_OldRedSword (C_Item) 
{	
	name 				=	"Zardzewia³y ciê¿ki miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	

	damageTotal			= 	55;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	visual 				=	"ItMw_2h_OldRedSword.3DS";

	description			= name;
	TEXT[0]             = "Ostrze ca³kiem zardzewia³o...";
	TEXT[1]             = "Mo¿e uda siê je naprawiæ?";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;
	
};
/*********************************************************************************
** Alte Zweihänder								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2h_RepairedRedSword (C_Item) 
{	
	name 				=	"Naprawiony Ciê¿ki miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	

	damageTotal			= 	86;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	78;
	visual 				=	"ITMW_2H_REPAIREDREDSWORD.3DS";

	description			= name;
	TEXT[1]             = "Thongvor naprawi³ ostrze.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;
	
};
//*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1h_Sword_Katana (C_Item)
{	
	name 				=	"Katana";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value  = 650;

	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	range    			=  	95;		

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	60;
	visual 				=	"ItMw_1h_Sword_Katana.3DS";

	description			= name;
	TEXT[2]				=	NAME_Damage;			COUNT[2]	=   damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;		COUNT[3]	=	cond_value[2];
	TEXT[4] 			=   NAME_OneHanded;
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
	
};
//*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_AxeHevay_100 (C_Item)
{	
	name 				=	"Zdobiony dwurêczny topór";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value = 780;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
	visual 				=	"ItMw_2H_Axe_Heavy_100.3DS";

	description			= name;
	TEXT[2]				=	NAME_Damage;			COUNT[2]	=   damageTotal;
	TEXT[3] 			=	NAME_Str_needed;		COUNT[3]	=	cond_value[2];
	TEXT[4] 			=   NAME_TwoHanded;
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
	
};

//*****************************************************
INSTANCE ItMw_2h_DragonLick (C_Item) 
{	
	name 				=	"Smoczy kie³";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;


	damageTotal			= 	115;
	damagetype			=	DAM_EDGE;
	range    			=  	145;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;
	protection[PROT_FIRE]  = 5;
	
	
	visual 				=	"ItMw_2h_DragonLick.3DS";

	description			= 	name;
	TEXT[0]				=	"Mistrzowska robota Thongvora...";
	TEXT[1]				=	NAME_Damage;			COUNT[1]	=   damageTotal;
	TEXT[2] 			=	NAME_Str_needed;		COUNT[2]	=	cond_value[2];
	TEXT[3]             =   NAME_Prot_Fire;		    COUNT[3]	= 	protection[PROT_FIRE];
	TEXT[4] 			=   NAME_TwoHanded;
	TEXT[5]				= 	NAME_Value;
	
};
/*************************************************************************/
INSTANCE ItMw_1H_Sword_Grd_Master (C_Item) 
{	
	
	name 				=	"Porz¹dny miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	44;

	damageTotal			= 	44;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	
	visual 				=	"ItMw_1H_Sword_Grd_03.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};