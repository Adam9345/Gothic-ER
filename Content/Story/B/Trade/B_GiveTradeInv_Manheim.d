func void B_GiveManheimCH1 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GRD_2036_Karczmarz);
CreateInvItems  (self,ItMiNugget,50);
CreateInvItems  (self,ItMi_Alchemy_Salt_01,10);
CreateInvItems  (self,ItFoApple,8);
CreateInvItems  (self,ItFoLoaf,5);
CreateInvItems  (self,ItFoMutton,5);
CreateInvItems  (self,ItForice,5);
CreateInvItems  (self,ItFo_Potion_Water_01,5);
CreateInvItems  (self,ItFoBeer,6);
CreateInvItems  (self,ItFoWine,5);
CreateInvItems  (self,ItFoBooze,5);
CreateInvItems  (npc,ItRe_BerrysDrink,1);
CreateInvItems  (npc,ItRe_Jam,1);
CreateInvItems  (self,ItFo_Kompot_01,5);
};

func void B_GiveManheimCH2 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GRD_2036_Karczmarz);
	//-------- Scrolls --------
CreateInvItems  (self,ItFoCheese,5);
CreateInvItems  (self,ItFoLoaf,5);
CreateInvItems  (self,ItFo_Potion_Water_01,5);
CreateInvItems  (self,ItFoApple,6);
CreateInvItems  (self,ItFo_Kompot_01,5);
CreateInvItems  (self,ItFo_MushroomStew,5);

};

func void B_GiveManheimCH3 ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GRD_2036_Karczmarz);
	//-------- Scrolls --------
	CreateInvItems (npc,ItFo_MeatStew,5);
	CreateInvItems (npc,ItFo_BigCasserole,5);
	CreateInvItems (npc,ItFo_Konfitura,2);
	CreateInvItems (npc,ItFoScaSoup,4);
	CreateInvItems (npc,ItFo_Honey_Plaster,1);


};

