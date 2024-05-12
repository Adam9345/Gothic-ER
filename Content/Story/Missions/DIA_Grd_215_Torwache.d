//poprawione i sprawdzone -  

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_215_Torwache_Exit (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 999;
	condition	= DIA_Grd_215_Torwache_Exit_Condition;
	information	= DIA_Grd_215_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Grd_215_Torwache_First (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 2;
	condition		= DIA_Grd_215_Torwache_First_Condition;
	information		= DIA_Grd_215_Torwache_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grd_215_Torwache_First_Condition()
{	
	if	(!Npc_KnowsInfo(hero,DIA_Grd_216_First))  //Wenn der SC nicht durchs Hintertor rein ist.
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Torwache_First_Info()
{
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_00"); //A ty dok¹d siê wybierasz?
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_15_01"); //Do Obozu.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_02"); //Chyba nie przyszed³eœ tu, ¿eby sprawiaæ k³opoty, co?
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"hs@FF0000 Jasne, zamierzam przej¹æ kontrolê nad ca³ym Obozem!"		,DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Chcia³em siê tylko trochê rozejrzeæ."		,DIA_Grd_215_Torwache_First_JustLooking);
	if (Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		Info_AddChoice		(DIA_Grd_215_Torwache_First,"Diego powiedzia³, ¿e mam siê z nim spotkaæ w Obozie."	,DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Jasne, zamierzam przej¹æ kontrolê nad ca³ym Obozem!
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //Hej, facet jest ca³kiem zabawny... Nie lubiê zabawnych facetów.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");	
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //Chcia³em siê tylko trochê rozejrzeæ.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //To ciê bêdzie kosztowaæ 10 bry³ek rudy.
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Niewa¿ne."					,DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"10 bry³ek..."	,DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego powiedzia³, ¿e mam siê z nim spotkaæ w Obozie.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //W takim razie - w³aŸ.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Niewa¿ne.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //W takim razie - spadaj.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if (Npc_HasItems(other, itminugget) >= 10)
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Dobrze, masz tu swoje 10 bry³ek.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Dobra. Zapraszam do œrodka.
		B_GiveInvItems 	(other,self, itminugget,10);CreateInvItems 		(self,  itminugget,10);
	}
	else
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //Nie mam tyle przy sobie.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //Có¿. Tym razem zrobiê wyj¹tek, bo jesteœ tu nowy.
		
	};
		
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						PERM
// **************************************************

INSTANCE DIA_Grd_215_Torwache_PERM (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 1;
	condition	= DIA_Grd_215_Torwache_PERM_Condition;
	information	= DIA_Grd_215_Torwache_PERM_Info;
	permanent	= 1;
	description = "Coœ nowego?";
};                       

FUNC INT DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_PERM_15_00"); //Coœ nowego?
	AI_Output (self, other,"DIA_Grd_215_Torwache_PERM_06_01"); //Nie. Wszystko po staremu.
};

//========================================
//-----------------> NORTH_BANDYTA
//========================================
//edit by  

INSTANCE DIA_Torwache_NORTH_BANDYTA (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 2;
	condition		= DIA_Torwache_NORTH_BANDYTA_Condition;
	information		= DIA_Torwache_NORTH_BANDYTA_Info;
	permanent		= 0;
	important		= 1;
};
FUNC INT DIA_Torwache_NORTH_BANDYTA_Condition()
{	
	var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	{
		return 1;
	};
};


FUNC VOID DIA_Torwache_NORTH_BANDYTA_Info()
{
	AI_Output (self, other,"DIA_Torwache_NORTH_BANDYTA_00"); //Hej! Co to za pancerz? Gadaj, sk¹d go masz? Chwila, poznajê! To pancerz Bandyty! Zmiesza³eœ siê z band¹ Quentina?!
	
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA );
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"hs@FF0000 Tak, nale¿ê do bandy Quentina. Masz jakiœ problem?"		,DIA_Torwache_NORTH_BANDYTA1);
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"Nie, pracujê sam."		,DIA_Torwache_NORTH_BANDYTA2);
};

func void DIA_Torwache_NORTH_BANDYTA1()
{
	AI_Output (other, self,"DIA_Torwache_NORTH_BANDYTA1_00"); //Tak, nale¿ê do bandy Quentina. Masz jakiœ problem?
	AI_Output (self, other,"DIA_Torwache_NORTH_BANDYTA1_01"); //I masz czelnoœæ tu przychodziæ? Braæ tego sukinsyna!
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA );
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Torwache_NORTH_BANDYTA2()
{
	AI_Output (other, self,"DIA_Torwache_NORTH_BANDYTA2_00"); //Nie, pracujê sam.
	AI_Output (self, other,"DIA_Torwache_NORTH_BANDYTA2_01"); //Doprawdy? Pracujesz na w³asn¹ rêkê? To sk¹d masz ten pancerz?
	
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA );
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"hs@FF0000 Uszy³ go dla mnie pewien myœliwy."					,DIA_Torwache_NORTH_BANDYTA2A);
	Info_AddChoice		(DIA_Torwache_NORTH_BANDYTA,"Zdj¹³em go z jednego martwego Bandyty. Napad³ na mnie w lesie. Musia³em siê broniæ. Akurat jego pancerz by³ niezniszczony i przypad³ mi do gustu."	,DIA_Torwache_NORTH_BANDYTA2B);
};


	func void DIA_Torwache_NORTH_BANDYTA2A()
	{
	AI_Output (other, self ,"DIA_Torwache_NORTH_BANDYTA2A_01"); //Uszy³ go dla mnie pewien myœliwy.
    AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_02"); //I zupe³nie przypadkowo przypomina on strój tych bandziorów? Nie rozœmieszaj mnie. 
	AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_03"); //Myœlê, ¿e dzia³asz sam, ale masz dostêp do Obozu Bandytów. Dogada³eœ siê z jakiœ bandyckim rzemieœlnikiem. 
	AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_04"); //Gadaj, gdzie to jest? Mów albo po¿a³ujesz.
    AI_Output (other, self ,"DIA_Torwache_NORTH_BANDYTA2A_05"); //Chwila. Jeœli mnie zabijesz, nigdy siê tego nie dowiesz!
    AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2A_06"); //Jeszcze znajdê na ciebie sposób!
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	};

	func void DIA_Torwache_NORTH_BANDYTA2B()
	{

    AI_Output (other, self ,"DIA_Torwache_NORTH_BANDYTA2B_01"); //Zdj¹³em go z jednego martwego Bandyty. Napad³ na mnie w lesie. Musia³em siê broniæ. Akurat jego pancerz by³ niezniszczony i przypad³ mi do gustu.
    AI_Output (self, other ,"DIA_Torwache_NORTH_BANDYTA2B_02"); //Tak trzymaj! Trzeba têpiæ tê plagê.
    B_GiveXP (150);
	Info_ClearChoices	(DIA_Torwache_NORTH_BANDYTA);
    AI_StopProcessInfos	(self);
	};
	
	
	
	//========================================
//-----------------> PP_ARMOR
//========================================

INSTANCE DIA_Torwache_PP_ARMOR (C_INFO)
{
   npc          = Grd_215_Torwache;
   nr           = 1;
   condition    = DIA_Torwache_PP_ARMOR_Condition;
   information  = DIA_Torwache_PP_ARMOR_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Torwache_PP_ARMOR_Condition()
{
 	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == Armor_Stt_pp)
{
    return TRUE;
};
};
FUNC VOID DIA_Torwache_PP_ARMOR_Info()
{
    AI_Output (self, other ,"DIA_Torwache_PP_ARMOR_03_01"); //Co to ma do diab³a byæ?
    AI_Output (other, self ,"DIA_Torwache_PP_ARMOR_15_02"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Torwache_PP_ARMOR_03_03"); //O twój pancerz, wygl¹da jak byœ zdj¹³ go z trupa jakiegoœ cienia!
    AI_Output (other, self ,"DIA_Torwache_PP_ARMOR_15_04"); //W lesie zaatakowa³a mnie wataha wilków, ledwo uszed³em z ¿yciem.
    AI_Output (self, other ,"DIA_Torwache_PP_ARMOR_03_05"); //Coœ mi tu œmierdzi ale w razie czego to nie ja siê bêdê t³umaczy³ Thorusowi. W³aŸ!
};

