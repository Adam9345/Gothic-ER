//poprawione i sprawdzone - Reflide

// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Kim jesteœ?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Nazywam siê Nefarius. Mag Krêgu Wody.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Gdzie mogê znaleŸæ Saturasa?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Gdzie mogê znaleŸæ Saturasa?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Poszukaj za t¹ wielk¹, okr¹g³¹ bram¹.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"Chcia³bym zostaæ Magiem Krêgu Wody.";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo)) && (Npc_GetTrueGuild (hero) != GIL_KDW)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Chcia³bym zostaæ Magiem Krêgu Wody.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //Nie tak szybko, mój ch³opcze!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Nie przyjmujemy do naszego grona byle kogo. Najpierw musisz siê wykazaæ czymœ niezwyk³ym.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //Potem czeka ciê okres próbny.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Je¿eli powa¿nie myœlisz o zostaniu Magiem Wody, do³¹cz najpierw do Najemników. W ten sposób bêdziesz móg³ nam udowodniæ swoj¹ wartoœæ.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //Kto wie, mo¿e pewnego dnia uda ci siê nas przekonaæ...
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Czy jestem ju¿ gotów, by zostaæ Magiem Wody?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Czy jestem ju¿ gotów, by zostaæ Magiem Wody?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Najpierw zaci¹gnij siê do Najemników, potem - zobaczymy...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Jak widzê, zosta³eœ jednym z Najemników. Dobrze, bardzo dobrze!
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Czekaj teraz cierpliwie na swoj¹ szansê...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 2				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			Staff 
// ****************************

instance  Info_Nefarius_Staff (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Staff_Condition;
	information	=	Info_Nefarius_Staff_Info;
	permanent	=	0;
	description =	"Saturas kaza³ mi od ciebie odebraæ kostur.";
};                       

FUNC int  Info_Nefarius_Staff_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
	return 1;
	};
};

FUNC VOID  Info_Nefarius_Staff_Info()
{
	AI_Output (other, self,"Info_Nefarius_Staff_15_00"); //Saturas kaza³ mi od ciebie odebraæ kostur.
	AI_Output (self, other,"Info_Nefarius_Staff_04_01"); //A wiêc nale¿ysz ju¿ do krêgu Wody. To wspaniale. Oto twój pierwszy kostur. Za drobn¹ op³at¹ pomogê ci w jego konsekracji.
	AI_Output (self, other,"Info_Nefarius_Staff_04_02"); //Lepszy kostur bêdê móg³ ci sprzedaæ dopiero, gdy przyst¹pisz do trzeciego krêgu. 
	
	CreateInvItems (self, ItMw_2H_Staff_WaterMage_01,1);
	B_GiveInvItems (self,other, ItMw_2H_Staff_WaterMage_01,1);
};

//***********************************************
//				Give me Staff 2
//***********************************************

instance  DIA_Nefarius_SecondStaff (C_INFO)
{
	npc			=  KDW_603_Nefarius;
	nr			=  1;
	condition	=  DIA_Nefarius_SecondStaff_Condition;
	information	=  DIA_Nefarius_SecondStaff_Info;
	permanent	=  0;
	description =  "Potrzebujê lepszego kostura.";
};                       

FUNC int  DIA_Nefarius_SecondStaff_Condition()
{
	if	(Npc_GetTrueGuild (hero) == GIL_KDW) && (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Nefarius_SecondStaff_Info()
{
	AI_Output (other, self,"DIA_Nefarius_SecondStaff_15_00"); //Potrzebujê lepszego kostura. Arcymag Saturas wprowadzi³ mnie w trzeci kr¹g. 
	AI_Output (self, other,"DIA_Nefarius_SecondStaff_12_01"); //Zas³u¿y³eœ, aby nosiæ ten kostur. Jeœli chcesz, mo¿emy go póŸniej ulepszyæ i konsekrowaæ. 
	AI_Output (self, other,"DIA_Nefarius_SecondStaff_12_02"); //Pamiêtaj, ¿e wiêksza moc, to tak¿e wiêksze wymagania wobec ciebie. Musisz siê ci¹gle doskonaliæ. 
	
	CreateInvItems (self, ItMw_2H_Staff_WaterMage_03,1);
	B_GiveInvItems (self,other, ItMw_2H_Staff_WaterMage_03,1);
};

//***********************************************
//				Konsekracja
//***********************************************

instance  DIA_Nefarius_Konsekracja (C_INFO)
{
	npc			=  KDW_603_Nefarius;
	nr			=  1;
	condition	=  DIA_Nefarius_Konsekracja_Condition;
	information	=  DIA_Nefarius_Konsekracja_Info;
	permanent	=  1;
	description =  "Konsekrujmy mój kostur.";
};                       

FUNC int  DIA_Nefarius_Konsekracja_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo (hero, Info_Nefarius_Staff)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Nefarius_Konsekracja_Info()
{
	AI_Output (other, self,"DIA_Nefarius_Konsekracja_15_00"); //Konsekrujmy mój kostur.
	AI_Output (self, other,"DIA_Nefarius_Konsekracja_12_01"); //Pamiêtaj, ¿e po konsekracji wzrosn¹ wymagania kostura. Bêdziesz musia³ posiadaæ wiêksz¹ moc magiczn¹ i si³ê.
	Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	Info_AddChoice		(DIA_Nefarius_Konsekracja, DIALOG_BACK, DIA_Nefarius_Konsekracja_01_Back); 
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_01, ItMw_2H_Staff_WaterMage_02); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_02, ItMw_2H_Staff_WaterMage_04);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od magii)", DIA_Nefarius_Konsekracja_03);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_03, ItMw_2H_Staff_WaterMage_04);
	};
};

func void DIA_Nefarius_Konsekracja_01_Back ()
{
	Info_ClearChoices	(DIA_Nefarius_Konsekracja);
};

func void DIA_Nefarius_Konsekracja_01 ()
{
	var int AFIP_ShowItem;
if (Npc_HasItems(other,itminugget) >= 500)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_WaterMage_01,1);
B_GiveInvItems (hero, self, itminugget,500);
CreateInvItems (self, ItMw_2H_Staff_WaterMage_02,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_WaterMage_02,1);
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon1"); //Adanosie, przelej czêœæ swej boskiej mocy do tego magicznego kryszta³u. Niech twoja magia równowagi zasieje pogrom w szeregach tych, którzy chc¹ byæ ponad ni¹.
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon2"); //Niech ten Mag kroczy œcie¿k¹ twojego œwiat³a i niechaj spogl¹daj¹c na twój œwiêty kostur zawsze wie, jak¹ decyzjê podj¹æ. 
}
else
{
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z³o¿enia datku na rzecz naszego Krêgu.
};
Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_01, ItMw_2H_Staff_WaterMage_02);  
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_02, ItMw_2H_Staff_WaterMage_04);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od magii)", ItMw_2H_Staff_WaterMage_05);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_03, ItMw_2H_Staff_WaterMage_05);
	};
};

func void DIA_Nefarius_Konsekracja_02 ()
{
	var int AFIP_ShowItem;
if (Npc_HasItems(other,itminugget) >= 750)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_WaterMage_03,1);
B_GiveInvItems (hero, self, itminugget,750);
CreateInvItems (self, ItMw_2H_Staff_WaterMage_04,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_WaterMage_04,1);
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon1"); //Adanosie, przelej czêœæ swej boskiej mocy do tego magicznego kryszta³u. Niech twoja magia równowagi zasieje pogrom w szeregach tych, którzy chc¹ byæ ponad ni¹.
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon2"); //Niech ten Mag kroczy œcie¿k¹ twojego œwiat³a i niechaj spogl¹daj¹c na twój œwiêty kostur zawsze wie, jak¹ decyzjê podj¹æ. 
}
else
{
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z³o¿enia datku na rzecz naszego Krêgu.
};
Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_01, ItMw_2H_Staff_WaterMage_02); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_02, ItMw_2H_Staff_WaterMage_04);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od magii)", DIA_Nefarius_Konsekracja_03);
	};
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_03, ItMw_2H_Staff_WaterMage_05);
};

func void DIA_Nefarius_Konsekracja_03 ()
{
	var int AFIP_ShowItem;
if (Npc_HasItems(other,itminugget) >= 1500)
{
B_GiveInvItems (hero, self, ItMw_2H_Staff_WaterMage_04,1);
B_GiveInvItems (hero, self, itminugget,1500);
CreateInvItems (self, ItMw_2H_Staff_WaterMage_05,1);
B_GiveInvItems (self, hero, ItMw_2H_Staff_WaterMage_05,1);
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon1"); //Adanosie, przelej czêœæ swej boskiej mocy do tego magicznego kryszta³u. Niech twoja magia równowagi zasieje pogrom w szeregach tych, którzy chc¹ byæ ponad ni¹.
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon2"); //Niech ten Mag kroczy œcie¿k¹ twojego œwiat³a i niechaj spogl¹daj¹c na twój œwiêty kostur zawsze wie, jak¹ decyzjê podj¹æ. 
}
else
{
AI_Output (self, other,"DIA_Nefarius_Konsekracja_Kon_NoOre"); //Konsekracja wymaga z³o¿enia datku na rzecz naszego Krêgu.
};
Info_ClearChoices	(DIA_Nefarius_Konsekracja);
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_01)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj podstawowy kostur (500 bry³ek rudy, wzrost wym. mana: 35, obra¿enia: 45 + 3 od magii)", DIA_Nefarius_Konsekracja_01); 
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_01, ItMw_2H_Staff_WaterMage_02); 
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_03)
	{
    Info_AddChoice		(DIA_Nefarius_Konsekracja, "Wzmocnij kostur Maga Wody(750 bry³ek rudy, wzrost wym. mana: 50, si³a: 35 obra¿enia: 55 + 5 od magii)", DIA_Nefarius_Konsekracja_02);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_02, ItMw_2H_Staff_WaterMage_04);
	};
	if Npc_HasItems (hero, ItMw_2H_Staff_WaterMage_04)
	{
	Info_AddChoice		(DIA_Nefarius_Konsekracja, "Konsekruj kostur Maga Wody(1500 bry³ek rudy, wzrost wym. mana: 60, si³a: 45 obra¿enia: 60 + 8 od magii)", DIA_Nefarius_Konsekracja_03);
	AFIP_SetChoiceItem(DIA_Nefarius_Konsekracja_03, ItMw_2H_Staff_WaterMage_05);
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //S¹ jakieœ wieœci od naszych przyjació³ ze Starego Obozu?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez kaza³ wymordowaæ wszystkich Magów Ognia!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //Nie! Durny barbarzyñca! Uprzedza³em Corristo - Gomezowi od pocz¹tku nie mo¿na by³o ufaæ! Musisz donieœæ o tym Saturasowi!
	if (Npc_GetTrueGuild(hero)==GIL_SLD) && (player_can_SLD_to_WaterMage == true)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Czekaj! 
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Narazi³eœ siê dla nas na nie lada niebezpieczeñstwa.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Jesteœ ju¿ chyba godzien, by nosiæ szaty Maga Wody. Oczywiœcie wybór nale¿y do ciebie...
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //A teraz spiesz do Saturasa! Nie traæ czasu!
	};
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> GWM
//========================================
Func void GWM_SHA_RESP()
{
Wld_InsertNpc				(Shaman_GWM_01,"WP_GWM_06");

Wld_InsertNpc				(OrcSkeleton,"OW_FOGDUNGEON_09");
Wld_InsertNpc				(OrcSkeleton,"OW_FOGDUNGEON_08");

};

INSTANCE DIA_Nefarius_GWM (C_INFO)
{
   npc          = KDW_603_Nefarius;
   nr           = 1;
   condition    = DIA_Nefarius_GWM_Condition;
   information  = DIA_Nefarius_GWM_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Nefarius_GWM_Condition()
{
if (Kapitel == 4) && (Npc_GetTrueGuild(hero) == GIL_KDW) //&& !(Npc_IsDead (SLD_40064_Fritz))
{
    return TRUE;
};
};
FUNC VOID DIA_Nefarius_GWM_Info()
{
    AI_Output (self, other ,"DIA_Nefarius_GWM_03_01"); //Jest pewien problem.
    AI_Output (other, self ,"DIA_Nefarius_GWM_15_02"); //Jaki?
    AI_Output (self, other ,"DIA_Nefarius_GWM_03_03"); //Wyczuwam duchow¹ obecnoœæ orkowego szamana gdzieœ w okolicy Wie¿y Mgie³. £aduje on za pomoc¹ zaklêcia jakiœ potê¿ny artefakt.
    AI_Output (self, other ,"DIA_Nefarius_GWM_03_04"); //Obawiam siê, ¿e niezw³ocznie wykorzysta go przeciwko ludziom.
    AI_Output (other, self ,"DIA_Nefarius_GWM_15_05"); //Co zamierzasz?
    AI_Output (self, other ,"DIA_Nefarius_GWM_03_06"); //Musimy zg³adziæ tego szamana a nastêpnie przej¹æ artefakt. Muszê go potem dok³adnie przebadaæ.
    AI_Output (self, other ,"DIA_Nefarius_GWM_03_07"); //Proponuje byœ poszed³ do wie¿y mgie³ i zaj¹³ siê t¹ spraw¹.
    AI_Output (other, self ,"DIA_Nefarius_GWM_15_08"); //Mam tam iœæ sam?
    AI_Output (self, other ,"DIA_Nefarius_GWM_03_09"); //Fritz uda siê z Tob¹ na tê misjê. Ju¿ z nim o tym rozmawia³em.
	if (Npc_IsDead(SLD_40064_Fritz))
    {
	AI_Output (other, self ,"DIA_Nefarius_GWM_15_10"); //Có¿... Fritz jest ju¿ na tamtym œwiecie.
	AI_Output (self, other ,"DIA_Nefarius_GWM_03_11"); //Jak to? Wiêc niestety musisz isæ sam... Powodzenia.
	Fritz_Dead = TRUE;
	Wld_InsertNpc				(GRD_40058_Gardist,"WP_GWM_02");	
	Wld_InsertNpc				(GRD_40059_Gardist,"WP_GWM_03");	
	Wld_InsertNpc				(GRD_40060_Gardist,"WP_GWM_04");	
	Wld_InsertNpc				(GRD_40061_Gardist,"WP_GWM_05");	
	
    }
    else
    {
	AI_Output (other, self ,"DIA_Nefarius_GWM_15_12"); //W porz¹dku. 
    AI_Output (self, other ,"DIA_Nefarius_GWM_03_13"); //Powodzenia w misji, przyjacielu.
    };

	Log_CreateTopic		(GoscWWiezyMgiel,	LOG_MISSION);
	Log_SetTopicStatus	(GoscWWiezyMgiel,	LOG_RUNNING);
	GWM_SHA_RESP();
	//HP_GWM_SHA();
	B_LogEntry               (GoscWWiezyMgiel,"Nefarius powiadomi³ mnie, ¿e w okolicy Wie¿y Mgie³ zaszy³ siê orkowy szaman. £aduje on tam jakiœ magiczny artefakt. Nefarius wyczuwa jego magiczn¹ moc. Poleci³ mi bym pokona³ szmana i zdoby³ dla niego artefakt. Fritz mo¿e mi pomóc, muszê z nim pogadaæ.");
	
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> GWM_END
//========================================

INSTANCE DIA_Nefarius_GWM_END_D (C_INFO)
{
   npc          = KDW_603_Nefarius;
   nr           = 1;
   condition    = DIA_Nefarius_GWM_END_D_Condition;
   information  = DIA_Nefarius_GWM_END_D_Info;
   permanent	= FALSE;
   description	= "Orkowy szaman w Wie¿y Mgie³ przeszed³ do historii. ";
};

FUNC INT DIA_Nefarius_GWM_END_D_Condition()
{
 if (Npc_HasItems (other, ITRI_GWM) >=1) 
 && (Npc_IsDead (Shaman_GWM_01)) 
 && (Npc_IsDead (SLD_40064_Fritz))
 && (Npc_IsDead (GRD_40058_Gardist))  
 && (Fritz_Dead == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Nefarius_GWM_END_D_Info()
{
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_D_15_01"); //Orkowy szaman w Wie¿y Mgie³ przeszed³ do historii. 
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_D_03_02"); //Zatem dobrze wywi¹za³eœ siê z powierzonego ci zadania.
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_D_15_03"); //Po drodze natrafi³em na ludzi Gomeza.
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_D_03_04"); //LudŸi Gomeza?
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_D_15_05"); //Ich patrol stacjonowa³ w rejonie Wie¿y Mgie³.
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_D_03_06"); //Rozumiem. A co z groŸnym artefaktem szamana.
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_D_15_07"); //Oto mroczny artefakt. Trzymaj.
	B_GiveInvItems (other,self, ITRI_GWM,1);
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_D_03_08"); //Zbadam jego moc bez zbêdnej zw³oki. Mroczna si³a, któr¹ wyczuwam mo¿e czyniæ tak dobro jak i z³o.
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_D_03_09"); //Wszystko zale¿y od tego kto j¹ posiada.
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_D_03_10"); //Dobrze siê spisa³eœ. WeŸ tê rudê. 
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_D_15_11"); //Dziêkuje. W razie czego s³u¿ê pomoc¹. 
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_D_03_12"); //Bêdê o tym pamiêta³. A teraz wracam do swoich badañ.
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_D_15_13"); //Zatem, do zobaczenia.
	
	B_LogEntry               (GoscWWiezyMgiel,"Rozmawia³em z Nefariusem. By³ zadowolony z powodu zg³adzenia szamana Orków w Wie¿y Mgie³. Odda³em mu magiczny artefakt a on wyp³aci³ mi nale¿n¹ gratyfikacjê.");
	Log_SetTopicStatus	(GoscWWiezyMgiel,	LOG_SUCCESS);
	B_GiveXP(600);
};

//========================================
//-----------------> GWM_END
//========================================

INSTANCE DIA_Nefarius_GWM_END (C_INFO)
{
   npc          = KDW_603_Nefarius;
   nr           = 1;
   condition    = DIA_Nefarius_GWM_END_Condition;
   information  = DIA_Nefarius_GWM_END_Info;
   permanent	= FALSE;
   description	= "Orkowy szaman w Wie¿y Mgie³ przeszed³ do historii. ";
};

FUNC INT DIA_Nefarius_GWM_END_Condition()
{
 if (Npc_HasItems (other, ITRI_GWM) >=1) && (Npc_IsDead (Shaman_GWM_01)) && !(Npc_IsDead (SLD_40064_Fritz))
{
    return TRUE;
};
};
FUNC VOID DIA_Nefarius_GWM_END_Info()
{
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_15_01"); //Orkowy szaman w Wie¿y Mgie³ przeszed³ do historii. 
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_03_02"); //Zatem dobrze wywi¹za³eœ siê z powierzonego ci zadania.
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_15_03"); //Fritz równie¿. Œwietnie walczy³ z ludŸmi Gomeza...
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_03_04"); //LudŸmi Gomeza?
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_15_05"); //Natrafiliœmy na ich patrol w rejonie Wie¿y Mgie³.
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_03_06"); //Rozumiem. A co z groŸnym artefaktem szamana.
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_15_07"); //Oto mroczny artefakt. Trzymaj.
	B_GiveInvItems (other,self, ITRI_GWM,1);
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_03_08"); //Zbadam jego moc bez zbêdnej zw³oki. Mroczna si³a, któr¹ wyczuwam mo¿e czyniæ tak dobro jak i z³o.
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_03_09"); //Wszystko zale¿y od tego kto j¹ posiada.
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_03_10"); //Dobrze siê spisa³eœ. WeŸ tê rudê. PóŸniej pomówiê jeszcze z Fritzem bo i on siê wykaza³.
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_15_11"); //Dziêkuje. W razie czego s³u¿ê pomoc¹. 
    AI_Output (self, other ,"DIA_Nefarius_GWM_END_03_12"); //Bêdê o tym pamiêta³. A teraz wracam do swoich badañ.
    AI_Output (other, self ,"DIA_Nefarius_GWM_END_15_13"); //Zatem, do zobaczenia.
	
	B_LogEntry               (GoscWWiezyMgiel,"Rozmawia³em z Nefariusem. By³ zadowolony z powodu zg³adzenia szamana Orków w Wie¿y Mgie³. Odda³em mu magiczny artefakt a on wyp³aci³ mi nale¿n¹ gratyfikacjê.");
	Log_SetTopicStatus	(GoscWWiezyMgiel,	LOG_SUCCESS);
	B_GiveXP(800);
};



