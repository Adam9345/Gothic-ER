//MEALS

INSTANCE Recipe_MoleratSoup (C_Recipe)
{	
	recipeitem 				= ItFoMoleratSoup;
	mintalent 				= 0;
    recId 					= Recipe_MoleratSoupId;
    totalrequired 			= 4;
    requireditem 			= ItFo_MoleratW;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Alchemy_Salt_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFoMuttonRaw;
    requireditemamount[2] 	= 3;
	requireditem[3] 		= ItFoBeer;
    requireditemamount[3] 	= 1;
    docinst 				= ItRe_MoleratSoup;
};

INSTANCE Recipe_SnafSoup (C_Recipe)
{	
	recipeitem 				= ItFoMeatbugragout;
	mintalent 				= 0;
    recId 					= Recipe_SnafSoupId;
    totalrequired 			= 3;
    requireditem 			= ItAt_Meatbug_01;
    requireditemamount 		= 3;
    requireditem[1] 		= ItFo_Plants_mushroom_01;
    requireditemamount[1] 	= 5;
    requireditem[2] 		= ItFoRice;
    requireditemamount[2] 	= 2;
    docinst 				= ItRe_SnafSoup;
};

INSTANCE Recipe_CheeseSoup (C_Recipe)
{	
	recipeitem 				= ItFoChesseSoup;
	mintalent 				= 0;
    recId 					= Recipe_CheeseSoupId;
    totalrequired 			= 3;
    requireditem 			= ItFoCheese;
    requireditemamount 		= 3;
    requireditem[1] 		= ItFoMuttonRaw;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFoLoaf;
    requireditemamount[2] 	= 1;
    docinst 				= ItRe_CheeseSoup;
};

INSTANCE Recipe_CrawelSoup (C_Recipe)
{	
	recipeitem 				= ItFoCrawlersoup;
	mintalent 				= 0;
    recId 					= Recipe_CrawelSoupId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Crawler_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Alchemy_Salt_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFo_ForestHerb;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFoRice;
    requireditemamount[3] 	= 1;
    docinst 				= ItRe_CrawelSoup;
};

INSTANCE Recipe_ScaSoup (C_Recipe)
{	
	recipeitem 				= ItFoScaSoup;
	mintalent 				= 0;
    recId 					= Recipe_ScaSoupId;
    totalrequired 			= 4;
    requireditem 			= ItFo_Plants_mushroom_02;
    requireditemamount 		= 2;
    requireditem[1] 		= ItMi_Alchemy_Salt_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFoMuttonRaw;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItFo_Plants_RavenHerb_01;
    requireditemamount[3] 	= 1;
    docinst 				= ItRe_ScaSoup;
};

INSTANCE Recipe_BerrysDrink (C_Recipe)
{	
	recipeitem 				= ItFo_Kompot_01;
	mintalent 				= 0;
    recId 					= Recipe_BerrysDrinkId;
    totalrequired 			= 3;
    requireditem 			= ItFo_Potion_Water_01;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_Plants_Berrys_01;
    requireditemamount[1] 	= 4;
    requireditem[2] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[2] 	= 2;
    docinst 				= ItRe_BerrysDrink;
};

INSTANCE Recipe_Jam (C_Recipe)
{	
	recipeitem 				= ItFo_Konfitura;
	mintalent 				= 0;
    recId 					= Recipe_JamId;
    totalrequired 			= 4;
    requireditem 			= ItFo_Potion_Water_01;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_Plants_Berrys_01;
    requireditemamount[1] 	= 3;
    requireditem[2] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItMi_Alchemy_Zucker_01;
    requireditemamount[3] 	= 2;
    docinst 				= ItRe_Jam;
};

INSTANCE Recipe_GhoranWine (C_Recipe)
{	
	recipeitem 				= ItFo_GhoranWine;
	mintalent 				= 0;
    recId 					= Recipe_GhoranWineId;
    totalrequired 			= 5;
    requireditem 			= ItFo_Potion_Water_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_Berrys_01;
    requireditemamount[1] 	= 3;
    requireditem[2] 		= ItFo_wineberrys_01;
    requireditemamount[2] 	= 4;
    requireditem[3] 		= ItFo_Plants_PapkaZziela;
    requireditemamount[3] 	= 3;
    requireditem[4] 		= ItMi_Alchemy_Zucker_01;
    requireditemamount[4] 	= 2;
    docinst 				= ItWr_GhoranWine;
};

INSTANCE Recipe_MushroomStew (C_Recipe)
{	
	recipeitem 				= ItFo_MushroomStew;
	mintalent 				= 0;
    recId 					= Recipe_MushroomStewId;
    totalrequired 			= 4;
    requireditem 			= ItFo_Plants_mushroom_01;
    requireditemamount 		= 3;
    requireditem[1] 		= ItFo_Plants_mushroom_02;
    requireditemamount[1] 	= 4;
    requireditem[2] 		= ItFoMuttonRaw;
    requireditemamount[2] 	= 2;
    requireditem[3] 		= ItFo_Potion_Water_01;
    requireditemamount[3] 	= 1;
    docinst 				= ItWr_MushroomStew;
};

INSTANCE Recipe_MeatStew (C_Recipe)
{	
	recipeitem 				= ItFo_MeatStew;
	mintalent 				= 0;
    recId 					= Recipe_MeatStewId;
    totalrequired 			= 4;
    requireditem 			= ItFoMuttonraw;
    requireditemamount 		= 5;
    requireditem[1] 		= ItFo_Plants_Herb_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFoLoaf;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_Potion_Water_01;
    requireditemamount[3] 	= 1;
    docinst 				= ItWr_MeatStew;
};

INSTANCE Recipe_BigCasserole (C_Recipe)
{	
	recipeitem 				= ItFo_BigCasserole;
	mintalent 				= 0;
    recId 					= Recipe_BigCasseroleId;
    totalrequired 			= 4;
    requireditem 			= ItFoMutton;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFoLoaf;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_mushroom_01;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItFo_FieldHerb;
    requireditemamount[3] 	= 1;
    docinst 				= ItWr_BigCasserole;
};

INSTANCE Recipe_HotWine (C_Recipe)
{	
	recipeitem 				= ItFo_HotWine;
	mintalent 				= 0;
    recId 					= Recipe_HotWineId;
    totalrequired 			= 4;
    requireditem 			= ItFoWine;
    requireditemamount 		= 2;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_RavenHerb_02;
    requireditemamount[2] 	= 2;
    requireditem[3] 		= ItFo_Plants_Bloodwood_01;
    requireditemamount[3] 	= 1;
    docinst 				= ItRe_HotWine;
};

INSTANCE Recipe_SoupFish2 (C_Recipe)
{	
	recipeitem 				= ItFoSoupFish2;
	mintalent 				= 0;
    recId 					= Recipe_SoupFish2Id;
    totalrequired 			= 5;
    requireditem 			= ItFo_Fish2;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_mushroom_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_Plants_Herb_01;
    requireditemamount[3] 	= 1;
    requireditem[4] 		= ItMi_Alchemy_Salt_01;
    requireditemamount[4] 	= 1;
    docinst 				= ItWr_SoupFish2;
};

INSTANCE Recipe_SoupFish3 (C_Recipe)
{	
	recipeitem 				= ItFoSoupFish3;
	mintalent 				= 0;
    recId 					= Recipe_SoupFish3Id;
    totalrequired 			= 5;
    requireditem 			= ItFo_Fish3;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_mushroom_02;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFoCheese;
    requireditemamount[3] 	= 1;
    requireditem[4] 		= ItMi_Alchemy_Salt_01;
    requireditemamount[4] 	= 1;
    docinst 				= ItWr_SoupFish3;
};

INSTANCE Recipe_SoupFish4 (C_Recipe)
{	
	recipeitem 				= ItFoSoupFish4;
	mintalent 				= 0;
    recId 					= Recipe_SoupFish4Id;
    totalrequired 			= 4;
    requireditem 			= ItFo_Fish4;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFoBeer;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_Stoneroot_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_Plants_Herb_01;
    requireditemamount[3] 	= 1;
    docinst 				= ItWr_SoupFish4;
};

INSTANCE Recipe_SoupFish5 (C_Recipe)
{	
	recipeitem 				= ItFoSoupFish1;
	mintalent 				= 0;
    recId 					= Recipe_SoupFish5Id;
    totalrequired 			= 5;
    requireditem 			= ItFo_Fish5;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFoWine;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFoRice;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_Plants_Velayis_01;
    requireditemamount[3] 	= 2;
    requireditem[4] 		= ItMi_Alchemy_Salt_01;
    requireditemamount[4] 	= 2;
    docinst 				= ItWr_SoupFish5;
};

INSTANCE Recipe_LurkerSoup (C_Recipe)
{	
	recipeitem 				= ItFo_LurkerSoup;
	mintalent 				= 0;
    recId 					= Recipe_LurkerSoupId;
    totalrequired 			= 4;
    requireditem 			= ItFo_MuttonLurkerCooked;
    requireditemamount 		= 4;
    requireditem[1] 		= ItFoBooze;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFoRice;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[3] 	= 2;
    docinst 				= ItRe_LurkerSoup;
};

// WEAPONS

INSTANCE Recipe_BanditTrader (C_Recipe)
{	
	recipeitem 				= ItMw_Addon_BanditTrader;
	mintalent 				= 0;
    recId 					= Recipe_BanditTraderId;
    totalrequired 			= 4;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 2;
    requireditem[1] 		= ItMi_IronNugget;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItAt_Bloodfly_02;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= Gold01;
    requireditemamount[3] 	= 1;
    docinst 				= Plan_BanditTrader;
};

INSTANCE Recipe_Miecz1H6 (C_Recipe)
{	
	recipeitem 				= Miecz1H6;
	mintalent 				= 0;
    recId 					= Recipe_Miecz1H6Id;
    totalrequired 			= 4;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 2;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItAt_Claws_01;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItMi_Wood_02;
    requireditemamount[3] 	= 1;
    docinst 				= Plan_Miecz1H6;
};

INSTANCE Recipe_Miecz1H11 (C_Recipe)
{	
	recipeitem 				= Miecz1H11;
	mintalent 				= 0;
    recId 					= Recipe_Miecz1H11Id;
    totalrequired 			= 3;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 2;
    requireditem[1] 		= ItMi_Wood_02;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= Pr_Wegiel;
    requireditemamount[2] 	= 2;
    docinst 				= Plan_Miecz1H11;
};

INSTANCE Recipe_Miecz1H15 (C_Recipe)
{	
	recipeitem 				= Miecz1H15;
	mintalent 				= 0;
    recId 					= Recipe_Miecz1H15Id;
    totalrequired 			= 3;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 2;
    requireditem[1] 		= ItMi_Wood_02;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[2] 	= 1;
    docinst 				= Plan_Miecz1H15;
};

INSTANCE Recipe_Plan1b (C_Recipe)
{	
	recipeitem 				= ItMw_1H_Sword_04;
	mintalent 				= 0;
    recId 					= Recipe_Plan1bId;
    totalrequired 			= 2;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 2;
    requireditem[1] 		= Pr_Wegiel;
    requireditemamount[1] 	= 2;
    docinst 				= Plan1b;
};

INSTANCE Recipe_Plan1c (C_Recipe)
{	
	recipeitem 				= ItMw_1H_Sword_Long_01;
	mintalent 				= 0;
    recId 					= Recipe_Plan1cId;
    totalrequired 			= 6;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 2;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= Pr_Wegiel;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 3;
    requireditem[4] 		= ItAt_Teeth_01;
    requireditemamount[4] 	= 1;
    requireditem[5] 		= ItMi_Wood_02;
    requireditemamount[5] 	= 1;
    docinst 				= Plan1c;
};

INSTANCE Recipe_DaggerOfMurder (C_Recipe)
{	
	recipeitem 				= ItMw_DaggerOfMurder;
	mintalent 				= 0;
    recId 					= Recipe_DaggerOfMurderId;
    totalrequired 			= 0;
    docinst 				= Plan_DaggerOfMurder;
};

INSTANCE Recipe_Miecz1H7 (C_Recipe)
{	
	recipeitem 				= Miecz1H7;
	mintalent 				= 0;
    recId 					= Recipe_Miecz1H7Id;
    totalrequired 			= 7;
    requireditem 			= Pr_SztabkaMagicznejStali;
    requireditemamount 		= 1;
    requireditem[1] 		= Pr_SztabkaStali;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItAt_Teeth_01;
    requireditemamount[2] 	= 2;
    requireditem[3] 		= Pr_Wegiel;
    requireditemamount[3] 	= 2;
    requireditem[4] 		= ItMi_Wood_02;
    requireditemamount[4] 	= 1;
    requireditem[5] 		= ItAt_Lurker_02;
    requireditemamount[5] 	= 1;
    requireditem[6] 		= Gold01;
    requireditemamount[6] 	= 1;
    docinst 				= Plan_Miecz1H7;
};

INSTANCE Recipe_Miecz1H9 (C_Recipe)
{	
	recipeitem 				= Miecz1H9;
	mintalent 				= 0;
    recId 					= Recipe_Miecz1H9Id;
    totalrequired 			= 6;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 4;
    requireditem[1] 		= Gold01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItMi_IronNugget;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= Pr_Wegiel;
    requireditemamount[3] 	= 5;
    requireditem[4] 		= ItAt_Teeth_01;
    requireditemamount[4] 	= 4;
    requireditem[5] 		= ItAt_Claws_02;
    requireditemamount[5] 	= 1;
    docinst 				= Plan_Miecz1H9;
};

INSTANCE Recipe_Miecz1H8 (C_Recipe)
{	
	recipeitem 				= Miecz1H8;
	mintalent 				= 0;
    recId 					= Recipe_Miecz1H8Id;
    totalrequired 			= 7;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 3;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= Pr_SztabkaCiemnejStali;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItAt_Teeth_01;
    requireditemamount[3] 	= 2;
    requireditem[4] 		= ItMi_Wood_02;
    requireditemamount[4] 	= 1;
    requireditem[5] 		= Gold01;
    requireditemamount[5] 	= 1;
    requireditem[6] 		= ItMi_Alchemy_BlueStone;
    requireditemamount[6] 	= 1;
    docinst 				= Plan_Miecz1H8;
};

INSTANCE Recipe_Rapier (C_Recipe)
{	
	recipeitem 				= ItMw_Rapier;
	mintalent 				= 0;
    recId 					= Recipe_RapierId;
    totalrequired 			= 5;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 2;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItAt_Bloodfly_02;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItAt_Lurker_01;
    requireditemamount[3] 	= 1;
    requireditem[4] 		= Gold01;
    requireditemamount[4] 	= 1;
    docinst 				= Plan_Rapier;
};

INSTANCE Recipe_Plan3b (C_Recipe)
{	
	recipeitem 				= ItMw_2H_Sword_Light_01;
	mintalent 				= 0;
    recId 					= Recipe_Plan3bId;
    totalrequired 			= 5;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 4;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 3;
    requireditem[2] 		= Pr_Wegiel;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 4;
    requireditem[4] 		= ItMi_Wood_02;
    requireditemamount[4] 	= 1;
    docinst 				= Plan3b;
};

INSTANCE Recipe_Plan3 (C_Recipe)
{	
    recipeitem 				= ItMw_2H_Sword_Light_04;
	mintalent 				= 0;
    recId 					= Recipe_Plan3Id;
    totalrequired 			= 5;
    requireditem 			= Pr_SztabkaCiemnejStali;
    requireditemamount 		= 1;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 5;
    requireditem[2] 		= Pr_Wegiel;
    requireditemamount[2] 	= 4;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 4;
    requireditem[4] 		= ItAt_Shadow_02;
    requireditemamount[4] 	= 1;
    docinst 				= Plan3;
};

INSTANCE Recipe_Plan5c (C_Recipe)
{	
	recipeitem 				= ItMw_2H_Axe_light_01;
	mintalent 				= 0;
    recId 					= Recipe_Plan5cId;
    totalrequired 			= 5;
    requireditem 			= Pr_SztabkaCiemnejStali;
    requireditemamount 		= 3;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 6;
    requireditem[2] 		= Pr_Wegiel;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 5;
    requireditem[4] 		= ItAt_Teeth_01;
    requireditemamount[4] 	= 5;
    docinst 				= Plan5c;
};

INSTANCE Recipe_2H_AxeHevay_100 (C_Recipe)
{	
	recipeitem 				= ItMw_2H_AxeHevay_100;
	mintalent 				= 0;
    recId 					= Recipe_2H_AxeHevay_100Id;
    totalrequired 			= 4;
    requireditem 			= Pr_SztabkaCiemnejStali;
    requireditemamount 		= 2;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 5;
    requireditem[2] 		= ItMi_IronNugget;
    requireditemamount[2] 	= 10;
    requireditem[3] 		= ItAt_Teeth_01;
    requireditemamount[3] 	= 5;
    docinst 				= ItRe_2H_AxeHevay_100;
};

INSTANCE Recipe_Plan4b (C_Recipe)
{	
	recipeitem 				= ItMw_2H_Sword_02;
	mintalent 				= 0;
    recId 					= Recipe_Plan4bId;
    totalrequired 			= 5;
    requireditem 			= Pr_SztabkaCiemnejStali;
    requireditemamount 		= 2;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 5;
    requireditem[2] 		= Pr_SztabkaZlota;
    requireditemamount[2] 	= 2;
    requireditem[3] 		= ItAt_Troll_02;
    requireditemamount[3] 	= 1;
    requireditem[4] 		= ItAt_Swampshark_02;
    requireditemamount[4] 	= 1;
    docinst 				= Plan4b;
};

INSTANCE Recipe_Miecz2H5 (C_Recipe)
{	
	recipeitem 				= Miecz2H5;
	mintalent 				= 0;
    recId 					= Recipe_Miecz2H5Id;
    totalrequired 			= 5;
    requireditem 			= Pr_SztabkaStali;
    requireditemamount 		= 5;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 4;
    requireditem[2] 		= Pr_SztabkaCiemnejStali;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItAt_Troll_02;
    requireditemamount[3] 	= 1;
    requireditem[4] 		= ItMi_IronNugget;
    requireditemamount[4] 	= 4;
    docinst 				= Plan_Miecz2H5;
};

INSTANCE Recipe_Plan7b (C_Recipe)
{	
	recipeitem 				= ItMw_2H_Axe_Heavy_01;
	mintalent 				= 0;
    recId 					= Recipe_Plan7bId;
    totalrequired 			= 6;
    requireditem 			= Pr_SztabkaCiemnejStali;
    requireditemamount 		= 4;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 8;
    requireditem[2] 		= Pr_SztabkaZlota;
    requireditemamount[2] 	= 2;
    requireditem[3] 		= ItAt_Troll_01;
    requireditemamount[3] 	= 1;
    requireditem[4] 		= ItMi_IronNugget;
    requireditemamount[4] 	= 5;
    requireditem[5] 		= ItAt_Swampshark_02;
    requireditemamount[5] 	= 2;
    docinst 				= Plan7b;
};

//ARMORS / BELTS

INSTANCE Recipe_LeatherBelt (C_Recipe)
{	
	recipeitem 				= ItBE_Addon_Leather_01;
	mintalent 				= 0;
    recId 					= Recipe_LeatherBeltId;
    totalrequired 			= 2;
    requireditem 			= ItAt_Wolf_01;
    requireditemamount 		= 4;
    requireditem[1] 		= ItMi_IronNugget;
    requireditemamount[1] 	= 4;
    docinst 				= ItRe_LeatherBelt;
};

INSTANCE Recipe_SldBelt (C_Recipe)
{	
	recipeitem 				= ItBE_Addon_SLD_01;
	mintalent 				= 0;
    recId 					= Recipe_SldBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Wolf_01;
    requireditemamount 		= 4;
    requireditem[1] 		= Pr_SztabkaStali;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItAt_Claws_01;
    requireditemamount[2] 	= 10;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 10;
    docinst 				= ItRe_SldBelt;
};

INSTANCE Recipe_FNovBelt (C_Recipe)
{	
	recipeitem 				= ItBE_Addon_NOV_01;
	mintalent 				= 0;
    recId 					= Recipe_FNovBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Wolf_01;
    requireditemamount 		= 3;
    requireditem[1] 		= ItMi_Alchemy_Sulphur_01;
    requireditemamount[1] 	= 5;
    requireditem[2] 		= ItAt_Teeth_01;
    requireditemamount[2] 	= 2;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 5;
    docinst 				= ItRe_FNovBelt;
};

INSTANCE Recipe_GrdBelt (C_Recipe)
{	
	recipeitem 				= ItBE_Addon_GRD_01;
	mintalent 				= 0;
    recId 					= Recipe_GrdBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Wolf_01;
    requireditemamount 		= 4;
    requireditem[1] 		= Pr_SztabkaStali;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItAt_Teeth_01;
    requireditemamount[2] 	= 10;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 10;
    docinst 				= ItRe_GrdBelt;
};

INSTANCE Recipe_KdfBelt (C_Recipe)
{	
	recipeitem 				= ItBE_Addon_KDF_01;
	mintalent 				= 0;
    recId 					= Recipe_KdfBeltId;
    totalrequired 			= 5;
    requireditem 			= ItAt_Bloodfly_01;
    requireditemamount 		= 5;
    requireditem[1] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_IronNugget;
    requireditemamount[2] 	= 15;
    requireditem[3] 		= ItMi_Alchemy_Sulphur_01;
    requireditemamount[3] 	= 10;
    requireditem[4] 		= ItAt_FireWaran_Skin;
    requireditemamount[4] 	= 2;
    docinst 				= ItRe_KdfBelt;
};

INSTANCE Recipe_CrawlerBelt (C_Recipe)
{	
	recipeitem 				= ItBE_Addon_MC;
	mintalent 				= 0;
    recId 					= Recipe_CrawlerBeltId;
    totalrequired 			= 5;
    requireditem 			= ItAt_Crawler_02;
    requireditemamount 		= 2;
    requireditem[1] 		= ItAt_Shadow_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= Pr_SztabkaCiemnejStali;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 20;
    requireditem[4] 		= ItAt_Warg;
    requireditemamount[4] 	= 2;
    docinst 				= ItRe_CrawlerBelt;
};

INSTANCE Recipe_StrengthBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_STR_5;
	mintalent 				= 0;
    recId 					= Recipe_StrengthBeltId;
    totalrequired 			= 5;
    requireditem 			= ItAt_Wolf_01;
    requireditemamount 		= 2;
    requireditem[1] 		= ItAt_Dzik_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItAt_Claws_01;
    requireditemamount[2] 	= 10;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 5;
    requireditem[4] 		= ItAt_Teeth_01;
    requireditemamount[4] 	= 5;
    docinst 				= ItRe_StrengthBelt;
};

INSTANCE Recipe_PowerBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_STR_10;
	mintalent 				= 0;
    recId 					= Recipe_PowerBeltId;
    totalrequired 			= 6;
    requireditem 			= Pr_SztabkaMagicznejStali;
    requireditemamount 		= 5;
    requireditem[1] 		= ItAt_Troll_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItAt_Shadow_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 25;
    requireditem[4] 		= ItAt_Teeth_01;
    requireditemamount[4] 	= 8;
    requireditem[5] 		= ItMi_Alchemy_Sulphur_01;
    requireditemamount[5] 	= 10;
    docinst 				= ItRe_PowerBelt;
};

INSTANCE Recipe_SkillBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_DEX_5;
	mintalent 				= 0;
    recId 					= Recipe_SkillBeltId;
    totalrequired 			= 6;
    requireditem 			= ItAt_Snapper_Skin;
    requireditemamount 		= 3;
    requireditem[1] 		= ItAt_Wolf_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItAt_Claws_01;
    requireditemamount[2] 	= 8;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 7;
    requireditem[4] 		= ItAt_Teeth_01;
    requireditemamount[4] 	= 12;
    requireditem[5] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[5] 	= 1;
    docinst 				= ItRe_SkillBelt;
};

INSTANCE Recipe_DexterityBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_DEX_10;
	mintalent 				= 0;
    recId 					= Recipe_DexterityBeltId;
    totalrequired 			= 6;
    requireditem 			= ItAt_Snapper_Skin;
    requireditemamount 		= 4;
    requireditem[1] 		= ItAt_Shadow_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= Pr_SztabkaZlota;
    requireditemamount[2] 	= 5;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 25;
    requireditem[4] 		= ItAt_Claws_01;
    requireditemamount[4] 	= 8;
    requireditem[5] 		= ItAt_Bloodfly_01;
    requireditemamount[5] 	= 8;
    docinst 				= ItRe_DexterityBelt;
};

INSTANCE Recipe_ArmorBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_Prot_EDGE;
	mintalent 				= 0;
    recId 					= Recipe_ArmorBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Waran_Skin;
    requireditemamount 		= 4;
    requireditem[1] 		= ItMi_IronNugget;
    requireditemamount[1] 	= 10;
    requireditem[2] 		= ItAt_Claws_01;
    requireditemamount[2] 	= 10;
    requireditem[3] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[3] 	= 3;
    docinst 				= ItRe_ArmorBelt;
};

INSTANCE Recipe_DefendBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_Prot_Point;
	mintalent 				= 0;
    recId 					= Recipe_DefendBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Dzik_01;
    requireditemamount 		= 4;
    requireditem[1] 		= ItMi_IronNugget;
    requireditemamount[1] 	= 10;
    requireditem[2] 		= ItAt_Teeth_01;
    requireditemamount[2] 	= 10;
    requireditem[3] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[3] 	= 3;
    docinst 				= ItRe_DefendBelt;
};

INSTANCE Recipe_MagicArmorBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_Prot_MAGIC;
	mintalent 				= 0;
    recId 					= Recipe_MagicArmorBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Warg;
    requireditemamount 		= 3;
    requireditem[1] 		= ItAt_Waran_Skin;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_IronNugget;
    requireditemamount[2] 	= 8;
    requireditem[3] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[3] 	= 4;
    docinst 				= ItRe_MagicArmorBelt;
};

INSTANCE Recipe_FireRunnerBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_Prot_FIRE;
	mintalent 				= 0;
    recId 					= Recipe_FireRunnerBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_FireWaran_Skin;
    requireditemamount 		= 2;
    requireditem[1] 		= ItAt_Teeth_01;
    requireditemamount[1] 	= 15;
    requireditem[2] 		= ItAt_Claws_01;
    requireditemamount[2] 	= 8;
    requireditem[3] 		= ItAt_Alligator_Skin;
    requireditemamount[3] 	= 2;
    docinst 				= ItRe_FireRunnerBelt;
};

INSTANCE Recipe_ProtectionBelt (C_Recipe)
{	
	recipeitem 				= ItBe_Addon_Prot_EdgPoi;
	mintalent 				= 0;
    recId 					= Recipe_ProtectionBeltId;
    totalrequired 			= 5;
    requireditem 			= Pr_SztabkaMagicznejStali;
    requireditemamount 		= 2;
    requireditem[1] 		= ItAt_Alligator_Skin;
    requireditemamount[1] 	= 4;
    requireditem[2] 		= ItAt_Warg;
    requireditemamount[2] 	= 2;
    requireditem[3] 		= ItAt_Claws_01;
    requireditemamount[3] 	= 10;
    requireditem[4] 		= ItMi_IronNugget;
    requireditemamount[4] 	= 8;
    docinst 				= ItRe_ProtectionBelt;
};

INSTANCE Recipe_TempleBelt (C_Recipe)
{	
	recipeitem 				= ItBE_TPL_01;
	mintalent 				= 0;
    recId 					= Recipe_TempleBeltId;
    totalrequired 			= 4;
    requireditem 			= ItAt_Swampshark_01;
    requireditemamount 		= 3;
    requireditem[1] 		= ItAt_Alligator_Skin;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItAt_Bloodfly_01;
    requireditemamount[2] 	= 4;
    requireditem[3] 		= ItMi_IronNugget;
    requireditemamount[3] 	= 15;
    docinst 				= ItRe_TempleBelt;
};

INSTANCE Recipe_OrcHunterBelt (C_Recipe)
{	
	recipeitem 				= ItBE_OrcHunter_01;
	mintalent 				= 0;
    recId 					= Recipe_OrcHunterBeltId;
    totalrequired 			= 5;
    requireditem 			= ItAt_Wolf_02;
    requireditemamount 		= 4;
    requireditem[1] 		= ItAt_Teeth_01;
    requireditemamount[1] 	= 12;
    requireditem[2] 		= ItAt_Crawler_02;
    requireditemamount[2] 	= 4;
    requireditem[3] 		= ItAt_Shadow_02;
    requireditemamount[3] 	= 1;
    requireditem[4] 		= Pr_SztabkaMagicznejStali;
    requireditemamount[4] 	= 6;
    docinst 				= ItRe_OrcHunterBelt;
};

// ALCHEMY

INSTANCE Recipe_Potion_Health_04 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Health_04;
    recId 					= Recipe_Potion_Health_04Id;
    totalrequired 			= 4;
    requireditem 			= ItFo_Plants_Velayis_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_Herb_03;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[3] 	= 1;
};

INSTANCE Recipe_Potion_Health_03 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Health_03;
    recId 					= Recipe_Potion_Health_03Id;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Herb_03;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Potion_Health_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Health_02;
    recId 					= Recipe_Potion_Health_02Id;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Herb_02;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Potion_Health_01v2 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Health_01;
    recId 					= Recipe_Potion_Health_01v2Id;
    totalrequired 			= 3;
    requireditem 			= ItFo_Plants_Seraphis_01;
    requireditemamount 		= 2;
    requireditem[1] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_Alchemy_Zucker_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Potion_Health_01 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Health_01;
    recId 					= Recipe_Potion_Health_01Id;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Herb_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Potion_Mana_04 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Mana_04;
    recId 					= Recipe_Potion_Mana_04Id;
    totalrequired 			= 4;
    requireditem 			= ItFo_Plants_Bloodwood_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_mountainmoos_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_Nightshadow_02;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[3] 	= 1;
};

INSTANCE Recipe_Potion_Mana_03 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Mana_03;
    recId 					= Recipe_Potion_Mana_03Id;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_mountainmoos_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Potion_Mana_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Mana_02;
    recId 					= Recipe_Potion_Mana_02Id;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Stoneroot_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Potion_Mana_01v2 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Mana_01;
    recId 					= Recipe_Potion_Mana_01v2Id;
    totalrequired 			= 3;
    requireditem 			= ItFo_Plants_Berrys_01;
    requireditemamount 		= 4;
    requireditem[1] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItMi_Alchemy_Salt_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Potion_Mana_01 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Mana_01;
    recId 					= Recipe_Potion_Mana_01Id;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Berrys_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Potion_Master_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Master_02;
    recId 					= Recipe_Potion_Master_02Id;
    totalrequired 			= 6;
    requireditem 			= ItFo_Plants_PapkaZziela;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_Plants_OrcHerb_02;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFo_Plants_Flameberry_01;
    requireditemamount[2] 	= 3;
    requireditem[3] 		= ItFo_Plants_Nightshadow_01;
    requireditemamount[3] 	= 3;
    requireditem[4] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[4] 	= 1;
    requireditem[5] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[5] 	= 1;
};

INSTANCE Recipe_Potion_Master_01 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Master_01;
    recId 					= Recipe_Potion_Master_01Id;
    totalrequired 			= 6;
    requireditem 			= ItFo_Plants_PapkaZziela;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_Flameberry_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFo_Plants_OrcHerb_02;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_Plants_Nightshadow_01;
    requireditemamount[3] 	= 3;
    requireditem[4] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[4] 	= 1;
    requireditem[5] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[5] 	= 1;
};

INSTANCE Recipe_Potion_HealthTime_01 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_HealthTime_01;
    recId 					= Recipe_Potion_HealthTime_01Id;
    totalrequired 			= 3;
    requireditem 			= ItMi_Alchemy_Alcohol_01;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_SeaHerb;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_PotionTime_Master_01 (C_Recipe)
{	
	recipeitem 				= ItFo_PotionTime_Master_01;
    recId 					= Recipe_PotionTime_Master_01Id;
    totalrequired 			= 4;
    requireditem 			= ItMi_Alchemy_Alcohol_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_FieldHerb;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_ForestHerb;
    requireditemamount[3] 	= 2;
};

INSTANCE Recipe_PotionTime_Mana_01 (C_Recipe)
{	
	recipeitem 				= ItFo_PotionTime_Mana_01;
    recId 					= Recipe_PotionTime_Mana_01Id;
    totalrequired 			= 3;
    requireditem 			= ItMi_Alchemy_Alcohol_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_MountainHerb;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_PotionTime_Dex_01 (C_Recipe)
{	
	recipeitem 				= ItFo_PotionTime_Dex_01;
    recId 					= Recipe_PotionTime_Dex_01Id;
    totalrequired 			= 3;
    requireditem 			= ItMi_Alchemy_Alcohol_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_FieldHerb;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_PotionTime_Strength_01 (C_Recipe)
{	
	recipeitem 				= ItFo_PotionTime_Strength_01;
    recId 					= Recipe_PotionTime_Strength_01Id;
    totalrequired 			= 3;
    requireditem 			= ItMi_Alchemy_Alcohol_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_ForestHerb;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_ItMis_Drug (C_Recipe)
{	
	recipeitem 				= ItMis_Drug;
    recId 					= Recipe_ItMis_DrugId;
    totalrequired 			= 3;
    requireditem 			= ItFo_Plants_OrcHerb_02;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_Nightshadow_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_mountainmoos_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Potion_Clear_Start (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Clear;
    recId 					= Recipe_Potion_Clear_StartId;
    totalrequired 			= 3;
    requireditem 			= ItFo_Mod_WolfBerrys;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Mod_Sage;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Mod_LightMushroom;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Potion_Mana_Perma_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Mana_Perma_02;
    recId 					= Recipe_Potion_Mana_Perma_02Id;
    totalrequired 			= 3;
    requireditem 			= ItFo_Plants_Stoneroot_02;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_Plants_RavenHerb_02;
    requireditemamount[1] 	= 5;
    requireditem[2] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Potion_Health_Perma_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Health_Perma_02;
    recId 					= Recipe_Potion_Health_Perma_02Id;
    totalrequired 			= 4;
    requireditem 			= ItFo_Plants_RavenHerb_01;
    requireditemamount 		= 8;
    requireditem[1] 		= ItFo_Plants_Herb_03;
    requireditemamount[1] 	= 3;
    requireditem[2] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItFo_Plants_Nightshadow_01;
    requireditemamount[3] 	= 2;
};

INSTANCE Recipe_Potion_Dex_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Dex_02;
    recId 					= Recipe_Potion_Dex_02Id;
    totalrequired 			= 4;
    requireditem 			= ItFo_Plants_OrcHerb_02;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_Nightshadow_02;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[3] 	= 1;
};

INSTANCE Recipe_Potion_Strength_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Strength_02;
    recId 					= Recipe_Potion_Strength_02Id;
    totalrequired 			= 4;
    requireditem 			= ItFo_Plants_Flameberry_01;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_Plants_Nightshadow_02;
    requireditemamount[1] 	= 3;
    requireditem[2] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[2] 	= 1;
    requireditem[3] 		= ItMi_Alchemy_Syrianoil_01;
    requireditemamount[3] 	= 1;
};

INSTANCE Recipe_Potion_Haste_03 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Haste_03;
    recId 					= Recipe_Potion_Haste_03Id;
    totalrequired 			= 3;
    requireditem 			= ItFo_Plants_OrcHerb_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Potion_Haste_02 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Haste_02;
    recId 					= Recipe_Potion_Haste_02Id;
    totalrequired 			= 3;
    requireditem 			= ItFo_GreenMushroom;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Potion_Haste_01 (C_Recipe)
{	
	recipeitem 				= ItFo_Potion_Haste_01;
    recId 					= Recipe_Potion_Haste_01Id;
    totalrequired 			= 3;
    requireditem 			= ItFo_Plants_Speed01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Potion_Water_01;
    requireditemamount[1] 	= 1;
    requireditem[2] 		= ItFo_Plants_Seraphis_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_CiosSztyletu (C_Recipe)
{	
	recipeitem 				= ItFoCiosSztyletu;
    recId 					= Recipe_CiosSztyletuId;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Trollberrys_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Bimber (C_Recipe)
{	
	recipeitem 				= ItFoBimber;
    recId 					= Recipe_BimberId;
    totalrequired 			= 2;
    requireditem 			= ItFo_Potion_Water_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 5;
};

INSTANCE Recipe_HoneyBeer (C_Recipe)
{	
	recipeitem 				= ItFoHoneyBeer;
    recId 					= Recipe_HoneyBeerId;
    totalrequired 			= 2;
    requireditem 			= ItFo_Honey;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFoBeer;
    requireditemamount[1] 	= 2;
};

INSTANCE Recipe_HoneyAlco (C_Recipe)
{	
	recipeitem 				= ItFoHoneyAlco;
    recId 					= Recipe_HoneyAlcoId;
    totalrequired 			= 2;
    requireditem 			= ItFo_Honey;
    requireditemamount 		= 3;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Absynt (C_Recipe)
{	
	recipeitem 				= ItFoAbsynt;
    recId 					= Recipe_AbsyntId;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Seraphis_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Plants_Swampherb_01;
    requireditemamount[1] 	= 5;
};

INSTANCE Recipe_NalewkaPlants (C_Recipe)
{	
	recipeitem 				= ItFoNalewkaPlants;
    recId 					= Recipe_NalewkaPlantsId;
    totalrequired 			= 3;
    requireditem 			= ItFo_ForestHerb;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 2;
    requireditem[2] 		= ItFo_MountainHerb;
    requireditemamount[2] 	= 2;
};

INSTANCE Recipe_NalewkaBerrys (C_Recipe)
{	
	recipeitem 				= ItFoNalewkaBerrys;
    recId 					= Recipe_NalewkaBerrysId;
    totalrequired 			= 2;
    requireditem 			= ItFo_Plants_Berrys_01;
    requireditemamount 		= 10;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 2;
};

INSTANCE Recipe_NalewkaApple (C_Recipe)
{	
	recipeitem 				= ItFoNalewkaApple;
    recId 					= Recipe_NalewkaAppleId;
    totalrequired 			= 2;
    requireditem 			= ItFoApple;
    requireditemamount 		= 5;
    requireditem[1] 		= ItMi_Alchemy_Alcohol_01;
    requireditemamount[1] 	= 2;
};

INSTANCE Recipe_Wine (C_Recipe)
{	
	recipeitem 				= ItFoWine;
    recId 					= Recipe_WineId;
    totalrequired 			= 3;
    requireditem 			= ItFo_Potion_Water_01;
    requireditemamount 		= 2;
    requireditem[1] 		= ItFo_wineberrys_01;
    requireditemamount[1] 	= 3;
    requireditem[2] 		= ItMi_Alchemy_Zucker_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Booze (C_Recipe)
{	
	recipeitem 				= ItFoBooze;
    recId 					= Recipe_BoozeId;
    totalrequired 			= 3;
    requireditem 			= ItFo_Potion_Water_01;
    requireditemamount 		= 4;
    requireditem[1] 		= ItFoRice;
    requireditemamount[1] 	= 3;
    requireditem[2] 		= ItMi_Alchemy_Zucker_01;
    requireditemamount[2] 	= 1;
};

INSTANCE Recipe_Alchemy_trucizna_03 (C_Recipe)
{	
	recipeitem 				= ItMi_Alchemy_trucizna_03;
    recId 					= Recipe_Alchemy_trucizna_03Id;
    totalrequired 			= 2;
    requireditem 			= ItMi_Alchemy_Sulphur_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_mushroom_03;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Alchemy_trucizna_02 (C_Recipe)
{	
	recipeitem 				= ItMi_Alchemy_trucizna_02;
    recId 					= Recipe_Alchemy_trucizna_02Id;
    totalrequired 			= 2;
    requireditem 			= ItMi_Alchemy_Alcohol_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_mushroom_03;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Alchemy_trucizna_01 (C_Recipe)
{	
	recipeitem 				= ItMi_Alchemy_trucizna_01;
    recId 					= Recipe_Alchemy_trucizna_01Id;
    totalrequired 			= 2;
    requireditem 			= ItFo_Potion_Water_01;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_mushroom_03;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Joint_Plant (C_Recipe)
{	
	recipeitem 				= ItMiJoint_Plant;
    recId 					= Recipe_Joint_PlantId;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton_3;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMiJoint_1;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Joint_Mush (C_Recipe)
{	
	recipeitem 				= ItMiJoint_Mush;
    recId 					= Recipe_Joint_MushId;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton_4;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMiJoint_1;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Joint_Honey (C_Recipe)
{	
	recipeitem 				= ItMiJoint_Honey;
    recId 					= Recipe_Joint_HoneyId;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton_2;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMiJoint_1;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Joint_Apple (C_Recipe)
{	
	recipeitem 				= ItMiJoint_Apple;
    recId 					= Recipe_Joint_AppleId;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton_1;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMiJoint_1;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Tuton_3 (C_Recipe)
{	
	recipeitem 				= ItMi_Tuton_3;
    recId 					= Recipe_Tuton_3Id;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_Herb_01;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Tuton_1 (C_Recipe)
{	
	recipeitem 				= ItMi_Tuton_1;
    recId 					= Recipe_Tuton_1Id;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFoApple;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Tuton_4 (C_Recipe)
{	
	recipeitem 				= ItMi_Tuton_4;
    recId 					= Recipe_Tuton_4Id;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Plants_mushroom_02;
    requireditemamount[1] 	= 1;
};

INSTANCE Recipe_Tuton_2 (C_Recipe)
{	
	recipeitem 				= ItMi_Tuton_2;
    recId 					= Recipe_Tuton_2Id;
    totalrequired 			= 2;
    requireditem 			= ItMi_Tuton;
    requireditemamount 		= 1;
    requireditem[1] 		= ItFo_Honey;
    requireditemamount[1] 	= 1;
};

// OTHER

// FRYING

INSTANCE Recipe_Mutton (C_Recipe)
{	
	recipeitem 				= ItFoMutton;
    recId 					= Recipe_MuttonId;
    totalrequired 			= 1;
    requireditem 			= ItFoMuttonRaw;
    requireditemamount 		= 1;
};

INSTANCE Recipe_Mutton5 (C_Recipe)
{	
	recipeitem 				= ItFoMutton;
    recId 					= Recipe_Mutton5Id;
    totalrequired 			= 1;
    requireditem 			= ItFoMuttonRaw;
    requireditemamount 		= 5;
};

INSTANCE Recipe_MuttonAll (C_Recipe)
{	
	recipeitem 				= ItFoMutton;
    recId 					= Recipe_MuttonAllId;
    totalrequired 			= 1;
    requireditem 			= ItFoMuttonRaw;
    requireditemamount 		= setRequiredItemAmount(ItFoMuttonRaw);
};

INSTANCE Recipe_MoleratWS (C_Recipe)
{	
	recipeitem 				= ItFo_MoleratWS;
    recId 					= Recipe_MoleratWSId;
    totalrequired 			= 1;
    requireditem 			= ItFo_MoleratW;
    requireditemamount 		= 1;
};

INSTANCE Recipe_MoleratWS5 (C_Recipe)
{	
	recipeitem 				= ItFo_MoleratWS;
    recId 					= Recipe_MoleratWS5Id;
    totalrequired 			= 1;
    requireditem 			= ItFo_MoleratW;
    requireditemamount 		= 5;
};

INSTANCE Recipe_MoleratWSAll (C_Recipe)
{	
	recipeitem 				= ItFo_MoleratWS;
    recId 					= Recipe_MoleratWSAllId;
    totalrequired 			= 1;
    requireditem 			= ItFo_MoleratW;
    requireditemamount 		= setRequiredItemAmount(ItFo_MoleratW);
};

INSTANCE Recipe_MuttonLurkerCooked (C_Recipe)
{	
	recipeitem 				= ItFo_MuttonLurkerCooked;
    recId 					= Recipe_MuttonLurkerCookedId;
    totalrequired 			= 1;
    requireditem 			= ItFo_muttonLurker;
    requireditemamount 		= 1;
};

INSTANCE Recipe_MuttonLurkerCooked5 (C_Recipe)
{	
	recipeitem 				= ItFo_MuttonLurkerCooked;
    recId 					= Recipe_MuttonLurkerCooked5Id;
    totalrequired 			= 1;
    requireditem 			= ItFo_muttonLurker;
    requireditemamount 		= 5;
};

INSTANCE Recipe_MuttonLurkerCookedAll (C_Recipe)
{	
	recipeitem 				= ItFo_MuttonLurkerCooked;
    recId 					= Recipe_MuttonLurkerCookedAllId;
    totalrequired 			= 1;
    requireditem 			= ItFo_muttonLurker;
    requireditemamount 		= setRequiredItemAmount(ItFo_muttonLurker);
};

// POUND

INSTANCE Recipe_Plants_utarteJagody_01 (C_Recipe)
{	
	recipeitem 				= ItFo_Plants_utarteJagody_01;
    recId 					= Recipe_Plants_utarteJagody_01Id;
    totalrequired 			= 1;
    requireditem 			= ItFo_Plants_Flameberry_01;
    requireditemamount 		= 1;
};

INSTANCE Recipe_Plants_PapkaZziela (C_Recipe)
{	
	recipeitem 				= ItFo_Plants_PapkaZziela;
    recId 					= Recipe_Plants_PapkaZzielaId;
    totalrequired 			= 1;
    requireditem 			= ItMi_Plants_Swampherb_01;
    requireditemamount 		= 1;
};

// SMELTING

INSTANCE Recipe_Pr_SztabkaStali (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaStali;
    recId 					= Recipe_Pr_SztabkaStaliId;
    totalrequired 			= 1;
    requireditem 			= ItMi_IronNugget;
    requireditemamount 		= 10;
};

INSTANCE Recipe_Pr_SztabkaStali5 (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaStali;
    recId 					= Recipe_Pr_SztabkaStali5Id;
    totalrequired 			= 1;
    requireditem 			= ItMi_IronNugget;
    requireditemamount 		= 50;
};

INSTANCE Recipe_Pr_SztabkaMagicznejStali (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaMagicznejStali;
    recId 					= Recipe_Pr_SztabkaMagicznejStaliId;
    totalrequired 			= 1;
    requireditem 			= ItMinugget;
    requireditemamount 		= 60;
};

INSTANCE Recipe_Pr_SztabkaMagicznejStali5 (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaMagicznejStali;
    recId 					= Recipe_Pr_SztabkaMagicznejStali5Id;
    totalrequired 			= 1;
    requireditem 			= ItMinugget;
    requireditemamount 		= 300;
};

INSTANCE Recipe_Pr_SztabkaCiemnejStali (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaCiemnejStali;
    recId 					= Recipe_Pr_SztabkaCiemnejStaliId;
    totalrequired 			= 2;
    requireditem 			= ItMinugget;
    requireditemamount 		= 60;
    requireditem[1] 		= ItMi_IronNugget;
    requireditemamount[1] 	= 10;
};

INSTANCE Recipe_Pr_SztabkaCiemnejStali5 (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaCiemnejStali;
    recId 					= Recipe_Pr_SztabkaCiemnejStali5Id;
    totalrequired 			= 2;
    requireditem 			= ItMinugget;
    requireditemamount 		= 300;
    requireditem[1] 		= ItMi_IronNugget;
    requireditemamount[1] 	= 50;
};

INSTANCE Recipe_Pr_SztabkaZlota (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaZlota;
    recId 					= Recipe_Pr_SztabkaZlotaId;
    totalrequired 			= 1;
    requireditem 			= Gold01;
    requireditemamount 		= 12;
};

INSTANCE Recipe_Pr_SztabkaZlota5 (C_Recipe)
{	
	recipeitem 				= Pr_SztabkaZlota;
    recId 					= Recipe_Pr_SztabkaZlota5Id;
    totalrequired 			= 1;
    requireditem 			= Gold01;
    requireditemamount 		= 60;
};

//Enchant

INSTANCE Recipe_Enchant_Miecz1H10 (C_Recipe)
{	
	recipeitem 				= Miecz1H10;
    recId 					= Recipe_Enchant_Miecz1H10Id;
    totalrequired 			= 2;
    requireditem 			= Miecz1H9;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Stuff_OldCoin_01;
    requireditemamount[1] 	= 250;
};

INSTANCE Recipe_Enchant_Miecz1H18 (C_Recipe)
{	
	recipeitem 				= Miecz1H18;
    recId 					= Recipe_Enchant_Miecz1H18Id;
    totalrequired 			= 2;
    requireditem 			= Miecz1H17;
    requireditemamount 		= 1;
    requireditem[1] 		= ItMi_Stuff_OldCoin_01;
    requireditemamount[1] 	= 250;
};