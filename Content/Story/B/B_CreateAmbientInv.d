// ******************
// B_CreateAmbientInv
// ******************

//Hier stehen die Hilfsfunktionen zum befüllen der NPCs

func void B_CreateAmbientInv_VLK (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFo_Plants_Seraphis_01, 1);
	CreateInvItems (self, ItMi_SilverRing, 1);
	CreateInvItems (self, ItFo_Potion_Water_01, 1);
	CreateInvItems (self, itminugget, 5);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_ForestHerb, 1);
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, ItFoBeer, 1);
	CreateInvItems (self, itminugget, 1);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, ItFoLoaf, 1);
	CreateInvItems (self, ItMiFlask, 1);
	CreateInvItems (self, itminugget, 17);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFoLoaf, 1);
	CreateInvItems (self, ItFo_Potion_Water_01, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, itminugget, 17);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFoCheese, 1);
	CreateInvItems (self, ItFoLoaf, 1);
	CreateInvItems (self, itminugget, 13);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFoCheese, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItems (self, itminugget, 11);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_ForestHerb, 1);
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFoBeer, 1);
	CreateInvItems (self, itminugget, 12);
	};
};
func void B_CreateAmbientInv_BAU (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	CreateInvItems (self, ItFo_Potion_Water_01, 1);
	CreateInvItems (self, itminugget, 12);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	CreateInvItems (self, ItFo_ForestHerb, 1);
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFoCheese, 1);
	CreateInvItems (self, itminugget, 10);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFoCheese, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItems (self, itminugget, 17);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFo_Plants_Seraphis_01, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItFoLoaf, 1);
	CreateInvItems (self, itminugget, 14);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	CreateInvItems (self, ItFoLoaf, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, itminugget, 13);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	CreateInvItems (self, ItMiJoint_2, 1);
	CreateInvItems (self, ItFoCheese, 1);
	CreateInvItems (self, ItFo_ForestHerb, 1);
	CreateInvItems (self, itminugget, 11);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_ForestHerb, 1);
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFoCheese, 4);
	CreateInvItems (self, ItFoBeer, 1);
	};
};
func void B_CreateAmbientInv_NOV (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	CreateInvItems (self, ItFo_Potion_Water_01, 3);
	CreateInvItems (self, ItFo_Plants_Seraphis_01, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItFoCheese, 1);
	CreateInvItems (self, ItMiFlask, 1);
	CreateInvItems (self, itminugget, 15);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFoApple, 3);
	CreateInvItems (self, ItFoCheese, 2);
	CreateInvItems (self, ItFoBeer, 2);
	CreateInvItems (self, ItMi_Alchemy_Sulphur_01, 1);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFo_Plants_Seraphis_01, 1);
	CreateInvItems (self, ItFoLoaf, 1);
	CreateInvItems (self, ItFo_Potion_Water_01, 1);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, itminugget, 13);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFoLoaf, 2);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, itminugget, 14);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, ItFoLoaf, 1);
	CreateInvItems (self, ItFo_Potion_Mana_01, 1);
	CreateInvItems (self, itminugget, 12);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_ForestHerb, 3);
	CreateInvItems (self, ItFoApple, 1);
	CreateInvItems (self, ItFoCheese, 1);
	CreateInvItems (self, ItFoBeer, 1);
	};
};
func void B_CreateAmbientInv_SLD (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItFo_Plants_mushroom_01, 1);
	CreateInvItems (self, itminugget, 17);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_Plants_Herb_01, 1);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItFo_Sausage, 1);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFoScaSoup, 1);
	CreateInvItems (self, ItMiJoint_2, 2);
	CreateInvItems (self, itminugget, 16);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFoScaSoup, 1);
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, itminugget, 15);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, itminugget, 11);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, ItFo_ForestHerb, 1);
	CreateInvItems (self, ItFoSoupFish4, 1);
	CreateInvItems (self, itminugget, 19);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Plants_mushroom_02, 3);
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, itminugget, 10);
	CreateInvItems (self, ItFoMutton, 2);
	};
};
func void B_CreateAmbientInv_KDF (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItMi_Quartz, 1);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, itminugget, 33);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_Potion_Mana_02, 1);
	CreateInvItems (self, ItMi_Alchemy_Sulphur_01, 1);
	CreateInvItems (self, ItMiFlask, 1);
	CreateInvItems (self, itminugget, 36);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItMi_SilverRing, 1);
	CreateInvItems (self, ItFo_Plants_mushroom_01, 1);
	CreateInvItems (self, ItFo_ForestHerb, 1);
	CreateInvItems (self, itminugget, 30);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItFo_Potion_Health_03, 1);
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, itminugget, 36);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Plants_Herb_01, 1);
	CreateInvItems (self, ItFo_Plants_mushroom_01, 1);
	CreateInvItems (self, ItFo_FieldHerb, 1);
	CreateInvItems (self, itminugget, 39);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, ItMi_Alchemy_Sulphur_01, 1);
	CreateInvItems (self, ItFo_Plants_Seraphis_01, 1);
	CreateInvItems (self, itminugget, 34);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Plants_mushroom_02, 1);
	CreateInvItems (self, ItMi_Quartz, 1);
	CreateInvItems (self, itminugget, 35);
	};
};
func void B_CreateAmbientInv_STT (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFoMutton, 3);
	CreateInvItems (self, ItFo_Plants_mushroom_01, 1);
	CreateInvItems (self, ItFoScaSoup, 1);
	CreateInvItems (self, itminugget, 15);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItems (self, ItFo_Plants_Herb_01, 3);
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, itminugget, 17);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Plants_mushroom_01, 1);
	CreateInvItems (self, ItFo_Plants_Herb_01, 1);
	CreateInvItems (self, itminugget, 25);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFo_Plants_mushroom_01, 1);
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, itminugget, 30);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFoBooze, 3);
	CreateInvItems (self, ItFoSoupFish4, 1);
	CreateInvItems (self, itminugget, 14);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Plants_Herb_01, 1);
	CreateInvItems (self, ItFoSoupFish4, 1);
	CreateInvItems (self, ItFo_Plants_mushroom_02, 1);
	CreateInvItems (self, itminugget, 26);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Plants_mushroom_02, 1);
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, ItFo_Sausage, 3);
	CreateInvItems (self, itminugget, 25);
	};
};
func void B_CreateAmbientInv_TPL (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, Itfowine, 1);
	CreateInvItems (self, ItFo_FieldHerb, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItAt_Wolf_01, 1);
	CreateInvItems (self, itminugget, 39);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItMiJoint_2, 1);
	CreateInvItems (self, ItFo_Plants_Herb_02, 1);
	CreateInvItems (self, itminugget, 46);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_mutton_01, 1);
	CreateInvItems (self, ItFo_Plants_Speed01, 1);
	CreateInvItems (self, itminugget, 45);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 1);
	CreateInvItems (self, ItFo_mutton_01, 1);
	CreateInvItems (self, itminugget, 44);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFoScaSoup, 1);
	CreateInvItems (self, ItFo_Plants_Herb_02, 1);
	CreateInvItems (self, ItMiJoint_2, 1);
	CreateInvItems (self, itminugget, 43);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Potion_Health_02, 1);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, Itfowine, 1);
	CreateInvItems (self, itminugget, 46);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, itminugget, 41);
	};
};
func void B_CreateAmbientInv_EBR (var int InventorySet)
{
if 		InventorySet ==1 
	{
	CreateInvItems (self, Itfowine, 1);
	CreateInvItems (self, ItFo_mutton_01, 1);
	CreateInvItems (self, ItFo_Plants_Speed01, 1);
	CreateInvItems (self, itminugget, 44);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, ItFo_FieldHerb, 1);
	CreateInvItems (self, itminugget, 42);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_mutton_01, 1);
	CreateInvItems (self, ItFo_FieldHerb, 2);
	CreateInvItems (self, ItMi_Alchemy_Sulphur_01, 1);
	CreateInvItems (self, itminugget, 23);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItMi_SilverRing, 1);
	CreateInvItems (self, ItFo_Plants_Herb_03, 1);
	CreateInvItems (self, itminugget, 46);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFoScaSoup, 1);
	CreateInvItems (self, ItFo_Plants_Herb_02, 1);
	CreateInvItems (self, itminugget, 43);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Potion_Health_02, 1);
	CreateInvItems (self, ItFo_Plants_Speed01, 2);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, itminugget, 37);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, ItFo_Plants_Herb_02, 1);
	CreateInvItems (self, itminugget, 40);
	};
};
func void B_CreateAmbientInv_NONE (var int InventorySet)
{
	if 	(InventorySet == 1) 
	{
		CreateInvItems (self, ItFo_Potion_Mana_01, 1);
		CreateInvItems (self, itminugget, 42);
	}
	else if (InventorySet == 2)
	{
		CreateInvItems (self, ItFo_Potion_Mana_02, 1);
		CreateInvItems (self, itminugget, 35);
	}
	else if (InventorySet == 3)
	{
		CreateInvItems (self, ItMi_Alchemy_Sulphur_01, 1);
		CreateInvItems (self, itminugget, 23);
		CreateInvItems (self, ItFo_Potion_Mana_01, 1);
	}
	else if (InventorySet == 4)
	{
		CreateInvItems (self, ItFo_Potion_Health_01, 1);
		CreateInvItems (self, itminugget, 46);
	}
	else if (InventorySet == 5)
	{
		CreateInvItems (self, ItMi_Quartz, 1);
		CreateInvItems (self, itminugget, 43);
		CreateInvItems (self, ItFo_Potion_Health_02, 1);
	}
	else if (InventorySet == 6)
	{
		CreateInvItems (self, ItMi_Coal, 1);
		CreateInvItems (self, itminugget, 37);
	}
	else if (InventorySet == 0)
	{
		CreateInvItems (self, ItFo_Potion_Health_01, 1);
		CreateInvItems (self, itminugget, 40);
	};
};
func void B_CreateAmbientInv_GRD (var int InventorySet)
{
if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFo_ForestHerb, 1);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFoApple, 1);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFoBeer, 1);
	}
	else if InventorySet ==4
	{ 
	CreateInvItems (self, ItFoCheese, 1);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Potion_Water_01, 1);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFoLoaf, 1);
	};
};

func void B_CreateAmbientInv_GUR (var int InventorySet)
{
if 	InventorySet ==1 
	{
		CreateInvItems (self, ItFo_ForestHerb, 1);
		CreateInvItems (self, ItFo_Plants_Herb_02, 1);
		
	}
	else if InventorySet ==2
	{
		CreateInvItems (self, ItFoApple, 1);
		CreateInvItems (self, itminugget,12);
		CreateInvItems (self ,ItMiJoint_2,3);
	}
	else if InventorySet ==3
	{
		CreateInvItems (self, ItFoBeer, 1);
		CreateInvItems (self ,ItFo_Potion_Health_01,1);
	}
	else if InventorySet ==4
	{ 
		CreateInvItems (self, ItFoCheese, 1);
		CreateInvItems (self ,ItMiJoint_2,1);
		CreateInvItems (self ,itminugget,9);
	}
	else if InventorySet ==5
	{
		CreateInvItems (self, ItFoBeer, 1);
	}
	else if InventorySet ==6
	{
		CreateInvItems (self ,itminugget, 23);
		CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	}
	else if InventorySet ==0
	{
		CreateInvItems (self ,itFO_Fish,1);
		CreateInvItems (self, ItFoLoaf, 1);
	};
};

func void B_CreateAmbientInv_ORG (var int InventorySet)
{
if 	InventorySet ==1 
	{
		CreateInvItems (self, ItFo_ForestHerb, 1);
		CreateInvItems (self, ItkeLockpick,2);
		CreateInvItems (self, ItFo_Plants_Herb_02, 1);
		
	}
	else if InventorySet ==2
	{
		CreateInvItems (self, ItFoApple, 1);
		CreateInvItems (self, ItFoBooze,2);
		CreateInvItems (self ,ItMiJoint_2,3);
	}
	else if InventorySet ==3
	{
		CreateInvItems (self, ItFoBeer, 1);
		CreateInvItems (self ,ItFo_Potion_Health_01,1);
		CreateInvItems (self ,ItMi_SilverRing,1);
		CreateInvItems (self, ItFoBeer,2);
	}
	else if InventorySet ==4
	{ 
		CreateInvItems (self, ItkeLockpick,1);
		CreateInvItems (self, ItFoCheese, 1);
		CreateInvItems (self ,ItMiJoint_2,1);
	}
	else if InventorySet ==5
	{
		CreateInvItems (self, ItFoBeer, 1);
		CreateInvItems (self ,ItFo_Fish,1);
	}
	else if InventorySet ==6
	{
		CreateInvItems (self ,itminugget, 23);
		CreateInvItems (self, ItFo_Plants_Berrys_01, 1);
	}
	else if InventorySet ==0
	{
		CreateInvItems (self ,itFO_Fish,1);
		CreateInvItems (self, ItFoLoaf, 1);
		CreateInvItems (self, ItkeLockpick, 3);
	};
};


// Hier der NPC Befehl
func void B_CreateAmbientInv (var C_NPC slf)
{
	var int Zufall;
	Zufall = Hlp_Random (7);

	if 		(slf.guild == GIL_VLK)			{		B_CreateAmbientInv_VLK (Zufall);}
			else if (slf.guild == GIL_BAU)	{		B_CreateAmbientInv_BAU (Zufall);		}
			else if (slf.guild == GIL_NOV)	{		B_CreateAmbientInv_NOV (Zufall);		}
			else if (slf.guild == GIL_SLD)	{		B_CreateAmbientInv_SLD (Zufall);		}
			else if (slf.guild == GIL_KDF)	{		B_CreateAmbientInv_KDF (Zufall);		}
			else if (slf.guild == GIL_STT)	{		B_CreateAmbientInv_STT (Zufall);		}
			else if (slf.guild == GIL_TPL)	{		B_CreateAmbientInv_TPL (Zufall);		}
			else if (slf.guild == GIL_EBR)	{		B_CreateAmbientInv_EBR (Zufall);		}
			else if (slf.guild == GIL_NONE)	{		B_CreateAmbientInv_NONE (Zufall);		}
			else if (slf.guild == GIL_GRD)	{		B_CreateAmbientInv_GRD(Zufall);		}
			else if (slf.guild == GIL_GUR)	{		B_CreateAmbientInv_GUR(Zufall);			}
			else if (slf.guild == GIL_ORG)	{		B_CreateAmbientInv_ORG(Zufall);			}
			else 							{		B_CreateAmbientInv_BAU (Zufall);		};
	
};



