
//Amulette +Ringe//

INSTANCE ItMi_Amulet_Psi_01(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	5;

	visual 			=	"ItMi_Amulet_Psi_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= "Znak Bractwa";
	//TEXT[0]			= "";
	//TEXT[2]			= "";
	////COUNT[2]		= ;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

};
/******************************************************************************************/
INSTANCE  Schutzamulett_Feuer(C_Item) //Nagroda od Y'Beriona
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Feuer;
	on_unequip		=	UnEquip_Schutzamulett_Feuer;

	description		= "Amulet P³omieni";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Feuer()
	{
	 	self.protection [PROT_FIRE] += 10;
	};


	FUNC VOID UnEquip_Schutzamulett_Feuer()
	{
		self.protection [PROT_FIRE] -= 10;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Waffen(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1500;//600

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Waffen;
	on_unequip		=	UnEquip_Schutzamulett_Waffen;

	description		= "Amulet Ochronny";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 8;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Waffen()
	{
		self.protection [PROT_EDGE] += 8;
		self.protection [PROT_BLUNT] += 8;
	};


	FUNC VOID UnEquip_Schutzamulett_Waffen()
	{
		self.protection [PROT_EDGE] -= 8;
		self.protection [PROT_BLUNT] -= 8;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Geschosse(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1200;//600

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Geschosse;
	on_unequip		=	UnEquip_Schutzamulett_Geschosse;

	description		= "Amulet Dêbowej Skóry";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 8;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Geschosse()
	{
		self.protection [PROT_POINT] += 8;
	};


	FUNC VOID UnEquip_Schutzamulett_Geschosse()
	{
		self.protection [PROT_POINT] -= 8;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Magie(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	900;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Magie;
	on_unequip		=	UnEquip_Schutzamulett_Magie;

	description		= "Amulet Duchowej Si³y";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 4;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Magie()
	{
		self.protection [PROT_MAGIC] += 4;
	};

	FUNC VOID UnEquip_Schutzamulett_Magie()
	{
		self.protection [PROT_MAGIC] -= 4;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Magie_Feuer(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=    1800;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Magie_Feuer;
	on_unequip		=	UnEquip_Schutzamulett_Magie_Feuer;

	description		= "Amulet Oczyszczenia";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Magic;
	COUNT[3]		= 4;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Magie_Feuer()
	{
		self.protection [PROT_MAGIC] += 4;
		self.protection [PROT_FIRE]  += 5;
	};


	FUNC VOID UnEquip_Schutzamulett_Magie_Feuer()
	{
	self.protection [PROT_MAGIC] -= 4;
	self.protection [PROT_FIRE]  -= 5;

	};

/******************************************************************************************/
		INSTANCE  Schutzamulett_Waffen_Geschosse(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	3000;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Waffen_Geschosse;
	on_unequip		=	UnEquip_Schutzamulett_Waffen_Geschosse;

	description		= "Amulet Kamiennej Skóry";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 8;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 8;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Waffen_Geschosse()
	{
		self.protection [PROT_EDGE]   += 8;
		self.protection [PROT_BLUNT]  += 8;
		self.protection [PROT_POINT]  += 8;
	};

	FUNC VOID UnEquip_Schutzamulett_Waffen_Geschosse()
	{
		self.protection [PROT_EDGE]   -= 8;
		self.protection [PROT_BLUNT]  -= 8;
		self.protection [PROT_POINT]  -= 8;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Total(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	4000;

	visual 			=	"ItMi_Amulet_03.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Total;
	on_unequip		=	UnEquip_Schutzamulett_Total;

	description		= "Amulet Magicznego Pancerza";
	//TEXT[0]			= "";
	TEXT[1]			= NAME_Prot_Fire;
	COUNT[1]		= 8;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 8;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 8;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= 8;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   += 8;
		self.protection [PROT_BLUNT]  += 8;
		self.protection [PROT_POINT]  += 8;
		self.protection [PROT_FIRE]   += 8;
		self.protection [PROT_MAGIC]  +=  8;

	};

	FUNC VOID UnEquip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   -= 8;
		self.protection [PROT_BLUNT]  -= 8;
		self.protection [PROT_POINT]  -= 8;
		self.protection [PROT_FIRE]   -= 8;
		self.protection [PROT_MAGIC]  -=  8;
	};

/******************************************************************************************/
	INSTANCE  Gewandtheitsamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	800;//320

	visual 			=	"ItMi_Amulet_01.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Gewandtheitsamulett;
	on_unequip		=	UnEquip_Gewandtheitsamulett;

	description		= "Amulet Zwinnoœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Gewandtheitsamulett()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
	};


	FUNC VOID UnEquip_Gewandtheitsamulett()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
	};

/******************************************************************************************/
	INSTANCE  Gewandtheitsamulett2(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1800;

	visual 			=	"ItMi_Amulet_02.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Gewandtheitsamulett2;
	on_unequip		=	UnEquip_Gewandtheitsamulett2;

	description		= "Amulet Zrêcznoœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 8;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Gewandtheitsamulett2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,8);
	};

	FUNC VOID UnEquip_Gewandtheitsamulett2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-8);
	};

/******************************************************************************************/
	INSTANCE  Staerkeamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	900;

	visual 			=	"ItMi_Amulet_01.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Staerkeamulett;
	on_unequip		=	UnEquip_Staerkeamulett;

	description		= "Amulet Mocy";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkeamulett()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
	};

	FUNC VOID UnEquip_Staerkeamulett()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
	};

/******************************************************************************************/
	INSTANCE  Staerkeamulett2(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1800;

	visual 			=	"ItMi_Amulet_02.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Staerkeamulett2;
	on_unequip		=	UnEquip_Staerkeamulett2;

	description		= "Amulet Si³y";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 8;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkeamulett2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,8);
	};


	FUNC VOID UnEquip_Staerkeamulett2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-8);
	};

/******************************************************************************************/
	INSTANCE  Lebensamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1500;//720

	visual 			=	"ItMi_Amulet_02.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Lebensamulett;
	on_unequip		=	UnEquip_Lebensamulett;

	description		= "Amulet Witalnoœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 40;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Lebensamulett()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 40;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 40;
		
	};


	FUNC VOID UnEquip_Lebensamulett()
	{
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

/******************************************************************************************/
	INSTANCE  Amulett_der_Magie(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItMi_Amulet_02.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Magie;
	on_unequip		=	UnEquip_Amulett_der_Magie;

	description		= "Amulet Magii";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 20;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 20;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 20;
	};

	FUNC VOID UnEquip_Amulett_der_Magie ()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 20;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 20;
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Macht(C_Item)
{
	name 			=	"Amulet Potêgi";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1300;

	visual 			=	"ItMi_Amulet_03.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Macht;
	on_unequip		=	UnEquip_Amulett_der_Macht;

	description		= "Amulet Potêgi";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 4;
	TEXT[3] 		= NAME_Bonus_Str;
	COUNT[3]		= 4;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Macht()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,4 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,4 );
	};


	FUNC VOID UnEquip_Amulett_der_Macht ()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-4 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,-4 );
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Erleuchtung(C_Item)
{
	name 			=	"Amulet Oœwiecenia";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	2000;

	visual 			=	"ItMi_Amulet_03.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Erleuchtung;
	on_unequip		=	UnEquip_Amulett_der_Erleuchtung;

	description		= "Amulet Oœwiecenia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 25;
	TEXT[3] 		= NAME_Bonus_Mana;
	COUNT[3]		= 25;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Erleuchtung()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 25;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 25;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 25;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 25;
		
	};


	FUNC VOID UnEquip_Amulett_der_Erleuchtung ()
	{
		
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 25;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 25;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
		
		if (self.attribute[ATR_HITPOINTS] > 26)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};

/******************************************************************************************/
INSTANCE  FireMaster_Amulet(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	4000;

	visual 			=	"ItMi_Amulet_01.3DS";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_FireMaster_Amulet;
	on_unequip		=	UnEquip_FireMaster_Amulet;

	description		= "Amulet p³omiennej nieœmiertelnoœci";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 50;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_FireMaster_Amulet()
	{
	 	self.protection [PROT_FIRE] += 50;
	};


	FUNC VOID UnEquip_FireMaster_Amulet()
	{
		self.protection [PROT_FIRE] -= 50;
	};	
	

/******************************************************************************************/


	INSTANCE  Amulett_Joru(C_Item)
{
	name 			=	"Medalion Joru";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1300;

	visual 			=	"ItMi_Amulet_03.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Joru;
	on_unequip		=	UnEquip_Amulett_Joru;

	description		= "Medalion Joru";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 4;
	
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Joru()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,4 );
	
	};


	FUNC VOID UnEquip_Amulett_Joru ()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-4 );
	
	};
//-----------------------------------------------------------------------------
	INSTANCE  Amulett_BrandickS(C_Item)
{
	name 			=	"Œwi¹tynny Medalion";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	0;

	visual 			=	"ITMI_AMULET_BRANDICKAR.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Brandick;
	on_unequip		=	UnEquip_Amulett_Brandick;

	description		= name;
	TEXT[0]			= "Wygl¹da na uszkodzony,";
	TEXT[1]			= "brakuje w nim klejnotu.";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 5;
	
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Brandick()
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,5 );
	
	};


	FUNC VOID UnEquip_Amulett_Brandick ()
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-5 );
	
	};

//------------------------------------------------------------------



	INSTANCE  Amulett_BrandickS_02(C_Item)
{
	name 			=	"Œwi¹tynny Medalion";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	0;

	visual 			=	"ITMI_AMULET_BRANDICKAR.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Brandick2;
	on_unequip		=	UnEquip_Amulett_Brandick2;

	description		= name;
	TEXT[0]			= "Oprawa zosta³a naprawiona,";
	TEXT[1]			= "brakuje w nim klejnotu.";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 8;
	
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_Brandick2()
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,8 );
	
	};


	FUNC VOID UnEquip_Amulett_Brandick2 ()
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-8 );
	
	};

//--------------------------------------------------------------------------

	INSTANCE  Amulett_Brandick_01(C_Item)
{
	name 			=	"Œwi¹tynny Amulet";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	0;

	visual 			=	"ITMI_AMULET_BRANDICKAR_01.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Brandick_01;
	on_unequip		=	UnEquip_Amulett_Brandick_01;

	description		= name;
	TEXT[0]			= "Pulsuje magi¹ œni¹cego.";
	
	TEXT[1]			= NAME_Prot_Edge;
	COUNT[1]		= 10;
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 3;
	TEXT[4]			= NAME_Prot_Magic;
	COUNT[4]		= 8;
	
	TEXT[5]			= NAME_Bonus_HP;
	COUNT[5]		= 30;
	
};

	FUNC VOID Equip_Amulett_Brandick_01()
	{
		
		self.protection [PROT_EDGE]   += 10;
		self.protection [PROT_BLUNT]  += 10;
		self.protection [PROT_POINT]  += 5;
		self.protection [PROT_FIRE]   += 3;
		self.protection [PROT_MAGIC]  += 8;
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,30 );
	};


	FUNC VOID UnEquip_Amulett_Brandick_01 ()
	{
	    self.protection [PROT_EDGE]   -= 10;
		self.protection [PROT_BLUNT]  -= 10;
		self.protection [PROT_POINT]  -= 5;
		self.protection [PROT_FIRE]   -= 3;
		self.protection [PROT_MAGIC]  -= 8;
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-30 );
	
	};
//---------------------------------------------------------------------------------------



	INSTANCE  Amulett_Brandick_03(C_Item)
{
	name 			=	"Œwi¹tynny Amulet";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	0;

	visual 			=	"ITMI_AMULET_BRANDICKAR_01.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_Brandick_03;
	on_unequip		=	UnEquip_Amulett_Brandick_03;

	description		= name;
	TEXT[0]			= "Amulet posiada klejnot.";
	
	TEXT[1]			= NAME_Prot_Edge;
	COUNT[1]		= 10;
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 3;
	TEXT[4]			= NAME_Prot_Magic;
	COUNT[4]		= 8;
	
	TEXT[5]			= NAME_Bonus_HP;
	COUNT[5]		= 30;
	
};

	FUNC VOID Equip_Amulett_Brandick_03()
	{
		
		self.protection [PROT_EDGE]   += 6;
		self.protection [PROT_BLUNT]  += 6;
		self.protection [PROT_POINT]  += 2;
		self.protection [PROT_FIRE]   += 2;
		self.protection [PROT_MAGIC]  += 2;
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,15 );
	};


	FUNC VOID UnEquip_Amulett_Brandick_03 ()
	{
	    self.protection [PROT_EDGE]   -= 6;
		self.protection [PROT_BLUNT]  -= 6;
		self.protection [PROT_POINT]  -= 2;
		self.protection [PROT_FIRE]   -= 2;
		self.protection [PROT_MAGIC]  -= 2;
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-15 );
	
	};




















/*
// FIXME: was soll das machen? Dämon beschwören???
	INSTANCE  Beschwörungsamulett(C_Item)
{
	name 			=	"Amulett der Erleuchtung";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	300;

	visual 			=	"ItMi_Amulet_03.3DS";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Beschwörungsamulett;
	on_unequip		=	UnEquip_Beschwörungsamulett;
	description		= "Dämonenbeschwörung";
	TEXT[0]			= "Schwarz wie die Seele";
	TEXT[1]			= "Schwarz wie die Nacht";
	////COUNT[1]		= ;
	TEXT[2]			= "Schwarz wie das Böse";
	////COUNT[2]		= ;
	TEXT[3] 		= "Schwarz verheisst Macht";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Beschwörungsamulett()
	{

	FUNC VOID Equip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   += 15;
		self.protection [PROT_BLUNT]  += 15;
		self.protection [PROT_POINT]  += 15;
		self.protection [PROT_FIRE]   += 10;
		self.protection [PROT_MAGIC]  +=  8;

	};

	FUNC VOID UnEquip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   -= 15;
		self.protection [PROT_BLUNT]  -= 15;
		self.protection [PROT_POINT]  -= 15;
		self.protection [PROT_FIRE]   -= 10;
		self.protection [PROT_MAGIC]  -=  8;
	};
	};


	FUNC VOID UnEquip_Beschwörungsamulett ()
	{


	};
	
*/
