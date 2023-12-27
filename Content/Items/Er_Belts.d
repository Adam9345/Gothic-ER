//------------------------------------------------------------------------------------------
//Visuals --> aus den Armors
/*
ItAr_Pal_M       ItMi_Belt_01.3DS
ItAr_Kdf_L                 ItMi_Belt_02.3DS --> alle KDF/NOV Belts 
ItAr_MIL_L                ItMi_Belt_03.3DS -->  MIL_01 MIL_02 
ItAr_Pal_H       ItMi_Belt_04.3DS 
ItAr_Sld_L                  ItMi_Belt_05.3DS --> SLD_01 SLD_02
ItAr_Bau_L       			ItMi_Belt_06.3DS  --> Leder
ItAr_Bdt_H                 ItMi_Belt_07.3DS --> SLD_03 
ItAr_Bdt_M                ItMi_Belt_08.3DS MC
ItAr_CorAngar    ItMi_Belt_09.3DS 
ItAr_Djg_H       ItMi_Belt_10.3DS
ItAr_MIL_M               ItMi_Belt_11.3DS --> MIL_03aa
*/
//------------------------------------------------------------------------------------------
//Values
//------------------------------------------------------------------------------------------

const int Value_ItBE_Addon_Leather_01 = 250;

const int Value_ItBE_Addon_Leather_02 = 250;

const int Value_ItBE_Addon_SLD_01	  = 250;


const int Value_ItBE_Addon_NOV_01	  = 250;

const int Value_ItBE_Addon_MIL_01	  = 250;


const int Value_ItBE_Addon_KDF_01	  = 250;


const int Value_ItBE_Addon_MC		  = 250;

const int Value_ItBE_Addon_STR_5	  = 500;
const int Value_ItBE_Addon_STR_10	  = 1000;
const int Value_ItBE_Addon_DEX_5	  = 500;
const int Value_ItBE_Addon_DEX_10	  = 1000;

const int Value_ItBE_Addon_Prot_Edge	= 500;
const int Value_ItBE_Addon_Prot_Point	= 500;
const int Value_ItBE_Addon_Prot_Magic	= 500;
const int Value_ItBE_Addon_Prot_Fire	= 500;
const int Value_ItBE_Addon_Prot_EdgPoi	= 1000;
const int Value_ItBE_Addon_Prot_Total	= 2000;

//---------------------------------------------------------
// Boni
//---------------------------------------------------------
const int BA_Bonus01 = 3;
const int BA_Bonus02 = 3;
const int Belt_Prot_00 = 1;
const int Belt_Prot_01 = 3;
const int Belt_Prot_02 = 4;
//const int Belt_Prot_02 = 5;
//---------------------------------------------------------
const int BeltBonus_STR01	= 5;
const int BeltBonus_STR02	= 10;
const int BeltBonus_DEX01	= 5;
const int BeltBonus_DEX02	= 10;

const int BeltBonus_HP01    = 40;

const int BeltBonus_ProtEdge	= 5;
const int BeltBonus_ProtPoint	= 5;
const int BeltBonus_ProtMagic	= 5;
const int BeltBonus_ProtFire	= 5;
const int BeltBonus_ProtEdgPoi	= 3;
const int BeltBonus_ProtTotal	= 3;

const int MAX_BELTS_Equiped = 1;
var int Belt_Equipped;
//------------------------------------------------------------------------------------
// Guertel (Belts)
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
// Lederguertel  
//------------------------------------------------------------------------------------------
/*
FUNC VOID UnEquipBelts()
{
   UnEquip_ItBE_Addon_MIL_02();
   UnEquip_ItBe_Addon_Prot_TOTAL();
   UnEquip_ItBe_Addon_Leather_01();
   UnEquip_ItBe_Addon_Sld_01();
   UnEquip_ItBe_Addon_Nov_01();
   UnEquip_ItBe_Addon_KDF_01();
   UnEquip_ItBe_Addon_MC();
   UnEquip_ItBe_Addon_Str_5();
   UnEquip_ItBe_Addon_Str_10();
   UnEquip_ItBe_Addon_Prot_Edge();
   UnEquip_ItBe_Addon_Prot_Point();
   UnEquip_ItBe_Addon_Prot_Edge();
   UnEquip_ItBe_Addon_Prot_Magic();
   UnEquip_ItBe_Addon_Prot_Fire();
   UnEquip_ItBe_Addon_Prot_EdgPoi();

};
*/


INSTANCE  ItBE_Addon_Fatigue (C_Item)  //Krzykacz,
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	15;

	visual 			=	"ItMI_Belt_06.3ds";
   // wear 					=	WEAR_BELT;
	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_Fatigue;
	on_unequip		=	UnEquip_ItBE_Addon_Fatigue;

	description		=  "Popêkany pas";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_00;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_00;
	
	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;
	
};
func void AvoidEquip(var C_NPC slf, var int itmID) 
{
    var int amount; amount = Npc_HasItems(slf, itmID);
    Npc_RemoveInvItems(slf, itmID, amount);
    CreateInvItems(slf, itmID, amount);
};


FUNC VOID Equip_ItBE_Addon_Fatigue()
{
   if (Belt_Equipped) {
        AvoidEquip(self, ItBE_Addon_Fatigue);
        return;
    };
    Belt_Equipped = TRUE;
	self.protection[PROT_EDGE]  += Belt_Prot_00;
	self.protection[PROT_BLUNT] += Belt_Prot_00;
	self.protection[PROT_POINT] += Belt_Prot_00;
	

};
FUNC VOID UnEquip_ItBE_Addon_Fatigue()
{
    Belt_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_00;
	self.protection[PROT_BLUNT] -= Belt_Prot_00;
	self.protection[PROT_POINT] -= Belt_Prot_00;
	
};

INSTANCE  ItBE_Addon_Leather_01 (C_Item)  //Krzykacz,
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Leather_01;

	visual 			=	"ItMI_Belt_06.3ds";
   // wear 					=	WEAR_BELT;
	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_Leather_01;
	on_unequip		=	UnEquip_ItBE_Addon_Leather_01;

	description		=  "Skórzany pas";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;
	
	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;
	
};

FUNC VOID Equip_ItBE_Addon_Leather_01()
{
   if (Belt_Equipped) {
        AvoidEquip(self, ItBE_Addon_Leather_01);
        return;
    };
    Belt_Equipped = TRUE;
	self.protection[PROT_EDGE]  += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	

};
FUNC VOID UnEquip_ItBE_Addon_Leather_01()
{
    Belt_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	
};
//------------------------------------------------------------------------------------------
// Fellgürtel (SLD) Zweihand
//------------------------------------------------------------------------------------------
INSTANCE  ItBE_Addon_SLD_01 (C_Item)  //Wilk
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_SLD_01;

	visual 			=	"ItMi_Belt_05.3ds";
    //wear 					=	WEAR_BELT;
	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_SLD_01;
	on_unequip		=	UnEquip_ItBE_Addon_SLD_01;

	description		=  "Pas najemnika";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;

	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

};
FUNC VOID Equip_ItBE_Addon_SLD_01()
{
	  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_Addon_SLD_01);
        return;
    };
	Belt_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	

};
FUNC VOID UnEquip_ItBE_Addon_SLD_01()
{
	 Belt_Equipped = FALSE;
	
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	

};
//------------------------------------------------------------------------------------------
// Novizenschärpe (Zweihand)
//------------------------------------------------------------------------------------------
	INSTANCE  ItBE_Addon_NOV_01 (C_Item)  //Gorax (Kap1)
{
	name 			=	NAME_Addon_BeltMage;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_NOV_01;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_NOV_01;
	on_unequip		=	UnEquip_ItBE_Addon_NOV_01;

	description		=  "Szarfa Gotowoœci";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;
	TEXT[3]			= 	NAME_Addon_BeArNOV;
	COUNT[3]		= 	BA_Bonus01;	
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBE_Addon_NOV_01()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_Addon_NOV_01);
        return;
    };
	Belt_Equipped = TRUE;
	
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	
	
};
FUNC VOID UnEquip_ItBE_Addon_NOV_01()
{
	 Belt_Equipped = FALSE;
	
	self.protection[PROT_EDGE]  -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	
	
};
//------------------------------------------------------------------------------------------
// Miliz  (Zweihand)
//------------------------------------------------------------------------------------------
	INSTANCE  ItBE_Addon_GRD_01 (C_Item)  //Hakon(Kap1)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_MIL_01;

	visual 			=	"ItMi_Belt_03.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_MIL_01;
	on_unequip		=	UnEquip_ItBE_Addon_MIL_01;

	description		=  "Pas stra¿nika";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;
	TEXT[3]			=   NAME_Addon_BeArMIL;
	COUNT[3]		=   BA_Bonus01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
	
};
FUNC VOID Equip_ItBE_Addon_MIL_01()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_Addon_GRD_01);
        return;
    };
	Belt_Equipped = TRUE;
	
	self.protection[PROT_EDGE]  += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	
	
};
FUNC VOID UnEquip_ItBE_Addon_MIL_01()
{
	Belt_Equipped = FALSE;
	
	self.protection[PROT_EDGE]  -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	
	
};
//------------------------------------------------------------------------------------------
// Feuermagier Mana 
//------------------------------------------------------------------------------------------
	INSTANCE  ItBE_Addon_KDF_01 (C_Item)  //Gorax(Kap1)
{
	name 			=	NAME_Addon_BeltMage;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_KDF_01;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_KDF_01;
	on_unequip		=	UnEquip_ItBE_Addon_KDF_01;

	description		=  "Szarfa Ognia";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;
	TEXT[3]			= 	NAME_Addon_BeArKDF;
	COUNT[3]		= 	BA_Bonus01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;


};
FUNC VOID Equip_ItBE_Addon_KDF_01()
{
			  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_Addon_KDF_01);
        return;
    };
	Belt_Equipped = TRUE;
	
	self.protection[PROT_EDGE]  += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	
	
};
FUNC VOID UnEquip_ItBE_Addon_KDF_01()
{
	
	Belt_Equipped = FALSE;
	self.protection[PROT_EDGE]  -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	
	
};

//------------------------------------------------------------------------------------------
// Minecrawler Gürtel Zweihand
//------------------------------------------------------------------------------------------
	INSTANCE  ItBE_Addon_MC (C_Item)  //Wilk(Kap3)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_MC;

	visual 			=	"ItMi_Belt_08.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_MC;
	on_unequip		=	UnEquip_ItBE_Addon_MC;

	description		=  "Pas Pe³zacza";
	
	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;
	TEXT[3]			= 	NAME_Addon_BeArMC;
	COUNT[3]		= 	BA_Bonus01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
	
};
FUNC VOID Equip_ItBE_Addon_MC()
{
			  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_Addon_MC);
        return;
    };
	Belt_Equipped = TRUE;
	
	self.protection[PROT_EDGE]  += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	
	if (MCArmor_Equipped == TRUE)
	{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;		
	};
	
};
FUNC VOID UnEquip_ItBE_Addon_MC()
{
Belt_Equipped = FALSE;
	
	self.protection[PROT_EDGE]  -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	if (MCArmor_Equipped == TRUE)
	{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus02;
			self.protection[PROT_FIRE] 	-= BA_Bonus02;		
	};
	
};


// *****************************************************
// 						kleine Gürtel
// *****************************************************
// -----------------------------------------------------
// STR 5
// -----------------------------------------------------
INSTANCE  ItBe_Addon_STR_5 (C_Item)		//Spielstart Xardas(Kap1)  
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_STR_5;

	visual 			=	"ItMi_Belt_08.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_STR_5;
	on_unequip		=	UnEquip_ItBe_Addon_STR_5;

	description		=  "Pas Si³y";
	
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= BeltBonus_STR01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_STR_5()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_STR_5);
        return;
    };
	Belt_Equipped = TRUE;
	Npc_ChangeAttribute(self, ATR_STRENGTH, + BeltBonus_STR01 );
};
FUNC VOID UnEquip_ItBe_Addon_STR_5()
{
Belt_Equipped = FALSE;
	Npc_ChangeAttribute(self, ATR_STRENGTH, - BeltBonus_STR01 );

};

// -----------------------------------------------------
// STR 10
// -----------------------------------------------------
INSTANCE  ItBe_Addon_STR_10 (C_Item)  	//Jora(Kap4)/Sengrath(4)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_STR_10;

	visual 			=	"ItMi_Belt_05.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_STR_10;
	on_unequip		=	UnEquip_ItBe_Addon_STR_10;

	description		=  "Pas Mocy";
	
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= BeltBonus_STR02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_STR_10()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_STR_10);
        return;
    };
	Belt_Equipped = TRUE;
	Npc_ChangeAttribute(self, ATR_STRENGTH, + BeltBonus_STR02 );
};
FUNC VOID UnEquip_ItBe_Addon_STR_10()
{
Belt_Equipped = FALSE;
	Npc_ChangeAttribute(self, ATR_STRENGTH, - BeltBonus_STR02 );
	
};

// -----------------------------------------------------
// DEX 5
// -----------------------------------------------------
INSTANCE  ItBe_Addon_DEX_5 (C_Item)  //Bosper(Kap2)/Orlan(2)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_DEX_5;

	visual 			=	"ItMi_Belt_08.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_DEX_5;
	on_unequip		=	UnEquip_ItBe_Addon_DEX_5;

	description		=  "Pas Umiejêtnoœci";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= BeltBonus_DEX01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;


};
FUNC VOID Equip_ItBe_Addon_DEX_5()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_DEX_5);
        return;
    };
	Belt_Equipped = TRUE;
	Npc_ChangeAttribute(self, ATR_DEXTERITY, + BeltBonus_DEX01 );
};
FUNC VOID UnEquip_ItBe_Addon_DEX_5()
{
Belt_Equipped = FALSE;
	Npc_ChangeAttribute(self, ATR_DEXTERITY, - BeltBonus_DEX01 );
	
};

// -----------------------------------------------------
// DEX 10
// -----------------------------------------------------
INSTANCE  ItBe_Addon_DEX_10 (C_Item)  //Bosper(Kap3)/Lutero(3)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_DEX_10;

	visual 			=	"ItMi_Belt_05.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_DEX_10;
	on_unequip		=	UnEquip_ItBe_Addon_DEX_10;

	description		=  "Pas Zrêcznoœci";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= BeltBonus_DEX02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;


};
FUNC VOID Equip_ItBe_Addon_DEX_10()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_DEX_10);
        return;
    };
	Belt_Equipped = TRUE;
	Npc_ChangeAttribute(self, ATR_DEXTERITY, + BeltBonus_DEX02 );
};
FUNC VOID UnEquip_ItBe_Addon_DEX_10()
{
Belt_Equipped = FALSE;
	Npc_ChangeAttribute(self, ATR_DEXTERITY, - BeltBonus_DEX02 );
	
};


// -----------------------------------------------------
// PROT EDGE
// -----------------------------------------------------
INSTANCE  ItBe_Addon_Prot_EDGE (C_Item)  //Hakon(Kap4)/Khaled(4)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Prot_EDGE;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_Prot_EDGE;
	on_unequip		=	UnEquip_ItBe_Addon_Prot_EDGE;

	description		=  "Pas Ochrony";
	
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= BeltBonus_ProtEdge;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_Prot_Edge()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_Prot_EDGE);
        return;
    };
	Belt_Equipped = TRUE;
	self.protection [PROT_EDGE]   += BeltBonus_ProtEdge;
	self.protection [PROT_BLUNT]  += BeltBonus_ProtEdge;
};
FUNC VOID UnEquip_ItBe_Addon_Prot_Edge()
{
Belt_Equipped = FALSE;
	self.protection [PROT_EDGE]   -= BeltBonus_ProtEdge;
	self.protection [PROT_BLUNT]  -= BeltBonus_ProtEdge;
	
};

// -----------------------------------------------------
// PROT POINT
// -----------------------------------------------------
INSTANCE  ItBe_Addon_Prot_Point (C_Item)  //Hakon(Kap3)/Khaled(3)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Prot_Point;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_Prot_Point;
	on_unequip		=	UnEquip_ItBe_Addon_Prot_Point;

	description		=  "Pas Obrony";
	
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= BeltBonus_ProtPoint;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_Prot_Point()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_Prot_Point);
        return;
    };
	Belt_Equipped = TRUE;
	self.protection [PROT_POINT]   += BeltBonus_ProtPoint;
};
FUNC VOID UnEquip_ItBe_Addon_Prot_Point()
{
Belt_Equipped = FALSE;
	self.protection [PROT_POINT]   -= BeltBonus_ProtPoint;
	
};

// -----------------------------------------------------
// PROT MAGIC
// -----------------------------------------------------
INSTANCE  ItBe_Addon_Prot_MAGIC (C_Item)  //Gorax(Kap3)/Zuris(3)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Prot_MAGIC;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_Prot_MAGIC;
	on_unequip		=	UnEquip_ItBe_Addon_Prot_MAGIC;

	description		=  "Pas Magicznej Obrony";
	
	TEXT[2]			= NAME_Prot_MAGIC;
	COUNT[2]		= BeltBonus_ProtMAGIC;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_Prot_MAGIC()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_Prot_MAGIC);
        return;
    };
	Belt_Equipped = TRUE;
	self.protection [PROT_MAGIC]   += BeltBonus_ProtMAGIC;
};
FUNC VOID UnEquip_ItBe_Addon_Prot_MAGIC()
{
Belt_Equipped = FALSE;
	self.protection [PROT_MAGIC]   -= BeltBonus_ProtMAGIC;

};

// -----------------------------------------------------
// PROT FIRE
// -----------------------------------------------------
INSTANCE  ItBe_Addon_Prot_FIRE (C_Item)  //Constantino(Kap3)/Sengrath(4)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Prot_FIRE;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_Prot_FIRE;
	on_unequip		=	UnEquip_ItBe_Addon_Prot_FIRE;

	description		=  "Pas Ognistego Biegacza";
	
	TEXT[2]			= NAME_Prot_FIRE;
	COUNT[2]		= BeltBonus_ProtFIRE;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_Prot_FIRE()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_Prot_FIRE);
        return;
    };
	Belt_Equipped = TRUE;
	self.protection [PROT_FIRE]   += BeltBonus_ProtFIRE;
};
FUNC VOID UnEquip_ItBe_Addon_Prot_FIRE()
{
Belt_Equipped = FALSE;
	self.protection [PROT_FIRE]   -= BeltBonus_ProtFIRE;
	
};

// -----------------------------------------------------
// PROT EdgPoi
// -----------------------------------------------------
INSTANCE  ItBe_Addon_Prot_EdgPoi (C_Item)  //Khaled(Kap4)/Orlan(3)	Missionbelohnung von Garett für Feuerwarane (Kap2)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MISSION|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Prot_EdgPoi;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_Prot_EdgPoi;
	on_unequip		=	UnEquip_ItBe_Addon_Prot_EdgPoi;

	description		=  "Ciê¿ki Pas Ochrony";
	
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= BeltBonus_ProtEdgPoi;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= BeltBonus_ProtEdgPoi;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_Prot_EdgPoi()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_Prot_EdgPoi);
        return;
    };
	Belt_Equipped = TRUE;
	self.protection [PROT_EDGE]   += BeltBonus_ProtEdgPoi;
	self.protection [PROT_BLUNT]  += BeltBonus_ProtEdgPoi;
	self.protection [PROT_POINT]   += BeltBonus_ProtEdgPoi;
};
FUNC VOID UnEquip_ItBe_Addon_Prot_EdgPoi()
{
Belt_Equipped = FALSE;
	self.protection [PROT_EDGE]   -= BeltBonus_ProtEdgPoi;
	self.protection [PROT_BLUNT]  -= BeltBonus_ProtEdgPoi;
	self.protection [PROT_POINT]   -= BeltBonus_ProtEdgPoi;
	
};

// -----------------------------------------------------
// PROT TOTAL
// -----------------------------------------------------
INSTANCE  ItBe_Addon_Prot_TOTAL (C_Item)  //Hakon(Kap4)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Prot_TOTAL;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBe_Addon_Prot_TOTAL;
	on_unequip		=	UnEquip_ItBe_Addon_Prot_TOTAL;

	description		=  "Pas Stra¿nika";
	
	TEXT[1]			= NAME_Prot_Edge;
	COUNT[1]		= BeltBonus_ProtTOTAL;
	TEXT[2] 		= NAME_Prot_Point;
	COUNT[2]		= BeltBonus_ProtTOTAL;
	TEXT[3]			= NAME_Prot_Magic;
	COUNT[3]		= BeltBonus_ProtTOTAL;
	TEXT[4]			= NAME_Prot_Fire;
	COUNT[4]		= BeltBonus_ProtTOTAL;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
};
FUNC VOID Equip_ItBe_Addon_Prot_TOTAL()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBe_Addon_Prot_TOTAL);
        return;
    };
	Belt_Equipped = TRUE;
	self.protection [PROT_EDGE]   += BeltBonus_ProtTOTAL;
	self.protection [PROT_BLUNT]   += BeltBonus_ProtTOTAL;
	self.protection [PROT_POINT]   += BeltBonus_ProtTOTAL;
	self.protection [PROT_MAGIC]   += BeltBonus_ProtTOTAL;
	self.protection [PROT_FIRE]   += BeltBonus_ProtTOTAL;
};
FUNC VOID UnEquip_ItBe_Addon_Prot_TOTAL()
{
Belt_Equipped = FALSE;
	self.protection [PROT_EDGE]   -= BeltBonus_ProtTOTAL;
	self.protection [PROT_BLUNT]   -= BeltBonus_ProtTOTAL;
	self.protection [PROT_POINT]   -= BeltBonus_ProtTOTAL;
	self.protection [PROT_MAGIC]   -= BeltBonus_ProtTOTAL;
	self.protection [PROT_FIRE]   -= BeltBonus_ProtTOTAL;
	
};
//------------------------------------------------------------------------------------------
INSTANCE  ItBE_WAR (C_Item)  //Hakon(Kap1)
{
	name 			=	"Ciê¿ki pas";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	1000;

	visual 			=	"ItMi_Belt_03.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_Addon_MIL_02;
	on_unequip		=	UnEquip_ItBE_Addon_MIL_02;

	description		=  name;

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_02;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_02;
	TEXT[3]		    =   NAME_Bonus_Str;
	COUNT[3]		=   BeltBonus_STR01;
	
	//TEXT[4]		    = "Noszony przez stra¿ników";
	
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
	
};
FUNC VOID Equip_ItBE_Addon_MIL_02()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_WAR);
        return;
    };
	Belt_Equipped = TRUE;
	
	self.protection[PROT_EDGE]  += Belt_Prot_02;
	self.protection[PROT_BLUNT] += Belt_Prot_02;
	self.protection[PROT_POINT] += Belt_Prot_01;
	Npc_ChangeAttribute(self, ATR_STRENGTH, + BeltBonus_STR01 );
	
};
FUNC VOID UnEquip_ItBE_Addon_MIL_02()
{
	
	Belt_Equipped = FALSE;
	self.protection[PROT_EDGE]  -= Belt_Prot_02;
	self.protection[PROT_BLUNT] -= Belt_Prot_02;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	Npc_ChangeAttribute(self, ATR_STRENGTH, - BeltBonus_STR01 );
	
	
};
//------------------------------------------------------------------------------------------
// Temple guard  (Zweihand)
//------------------------------------------------------------------------------------------
	INSTANCE  ItBE_TPL_01 (C_Item)  //Hakon(Kap1)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_MIL_01;

	visual 			=	"ItMi_Belt_03.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_TPL_01;
	on_unequip		=	UnEquip_ItBE_TPL_01;

	description		=  "Pas Œwi¹tynny";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;
	TEXT[3]			=   NAME_Addon_BeArMIL;
	COUNT[3]		=   BA_Bonus01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
	
};
FUNC VOID Equip_ItBE_TPL_01()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_TPL_01);
        return;
    };
	Belt_Equipped = TRUE;
	
	self.protection[PROT_EDGE]  += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	
	
};
FUNC VOID UnEquip_ItBE_TPL_01()
{
	Belt_Equipped = FALSE;
	
	self.protection[PROT_EDGE]  -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	
	
};//------------------------------------------------------------------------------------------
// Orc Hunter  (Zweihand)
//------------------------------------------------------------------------------------------
	INSTANCE  ItBE_OrcHunter_01 (C_Item)  //Hakon(Kap1)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Prot_EdgPoi;

	visual 			=	"ItMi_Belt_10.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItBE_OrcHunter_01;
	on_unequip		=	UnEquip_ItBE_OrcHunter_01;

	description		=  "Pas £owcy";

	TEXT[1]			=	"Ochrona przed wszystkim";			
	COUNT[1]		= 	Belt_Prot_01;
    TEXT[2]         =   "Bonus P¯";
	COUNT[2]        = BeltBonus_HP01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	
	
};
FUNC VOID Equip_ItBE_OrcHunter_01()
{
		  if (Belt_Equipped) {
        AvoidEquip(self, ItBE_OrcHunter_01);
        return;
    };
	Belt_Equipped = TRUE;
	
	self.protection[PROT_EDGE]  += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;
	
	self.protection[PROT_FIRE] += Belt_Prot_01;
	self.protection[PROT_MAGIC] += Belt_Prot_01;
	
	    self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 40;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 40;
};
FUNC VOID UnEquip_ItBE_OrcHunter_01()
{
	Belt_Equipped = FALSE;
	
	self.protection[PROT_EDGE]  -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;
	
	self.protection[PROT_FIRE] -= Belt_Prot_01;
	self.protection[PROT_MAGIC] -= Belt_Prot_01;
	
	
	self.attribute [ATR_HITPOINTS_MAX] = self.attribute [ATR_HITPOINTS_MAX] -40;
		if (self.attribute[ATR_HITPOINTS] > 41) //31
		{
		self.attribute [ATR_HITPOINTS] = self.attribute [ATR_HITPOINTS] -40;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
};

//------------------------------------------------------------------------------------------


INSTANCE ItSe_Belts (C_Item)
{
	name 				=	"Worek z pasami";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"itmi_arrowbag.3ds";
    material            =       MAT_LEATHER;

	
	scemeName           =       "MAPSEALED";
	on_state[0]		    =	UseItAm_Minso;
	
	description			= NAME;
	TEXT[3]				= "W œrodku znajduje siê minso.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};
func void UseItAm_Minso()
{
    CreateInvItems (self, ItBE_WAR, 1);
	CreateInvItems (self, ItBe_Addon_Prot_TOTAL, 1);
	CreateInvItems (self, ItBe_Addon_Leather_01, 1);
	CreateInvItems (self, ItBe_Addon_Sld_01, 1);
	CreateInvItems (self, ItBe_Addon_Nov_01, 1);
	//CreateInvItems (self, ItBe_Addon_Mil_01, 1);
	CreateInvItems (self, ItBe_Addon_KDF_01, 1);
	CreateInvItems (self, ItBe_Addon_MC, 1);
	CreateInvItems (self, ItBe_Addon_Str_5, 1);
	CreateInvItems (self, ItBe_Addon_Str_10, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Edge, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Point, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Magic, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Fire, 1);
	CreateInvItems (self, ItBe_Addon_Prot_EdgPoi, 1);
	
	
    if (Npc_IsPlayer(self))
	{
	PrintS_Ext	("Znaleziono pasy", COL_WHITE);
	
	};

};


