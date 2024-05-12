//poprawione i sprawdzone -  

// ***************************** 
//				EXIT 
// *****************************

instance DIA_TPL_1402_GorNaToth_Exit (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 999;
	condition	= DIA_TPL_1402_GorNaToth_Exit_Condition;
	information	= DIA_TPL_1402_GorNaToth_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_TPL_1402_GorNaToth_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TPL_1402_GorNaToth_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ***************************** 
//			IdonDebt 
// *****************************
instance DIA_GorNaToth_IdonDebt (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_IdonDebt_Condition;
	information	= DIA_GorNaToth_IdonDebt_Info;
	permanent	= 0;
	description = "Przychodzê w sprawie d³ugów, które zaci¹gn¹³ jeden z twoich Stra¿ników. ";
};                       

FUNC int DIA_GorNaToth_IdonDebt_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_GorNaIdon_LOAN)
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_IdonDebt_Info()
{
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_00"); //Przychodzê w sprawie d³ugów, które zaci¹gn¹³ jeden z twoich Stra¿ników.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_01"); //Zwierzchnikiem Stra¿ników Œwi¹tynnych jest Cor Angar. A o co chodzi i czemu mielibyœmy ci pomóc? 
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_02"); //Gor Na Idon ma d³ug za gorza³kê u handlarza Starkada. Dok³adnie 150 bry³ek rudy. Nie chce mi ich zwróciæ.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_03"); //Widzê, ¿e by³a tu niez³a popijawa podczas mojej nieobecnoœci. WeŸ tê rudê. Stra¿ników spotka zas³u¿ona kara podczas treningów. 
	CreateInvItems (self,itminugget, 150);
	B_GiveinvItems (self,other,itminugget,150);
	B_LogEntry (CH1_CheatedMerchant,"Gor Na Toth zwróci³ mi rudê i obieca³, ¿e ukarze Gor Na Idona. ");
	AI_StopProcessInfos	(self);
};

// ***************************** 
//			Abweisend 
// *****************************
instance DIA_GorNaToth_Abweisend (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_Abweisend_Condition;
	information	= DIA_GorNaToth_Abweisend_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC int DIA_GorNaToth_Abweisend_Condition()
{
	if	!Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked)
	&&	!C_NpcBelongsToPsiCamp(hero)  
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_Abweisend_Info()
{
	AI_Output			(other, self,"DIA_GorNaToth_AngarTalked_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output			(self, other,"DIA_GorNaToth_AngarTalked_11_01"); //ZejdŸ mi z oczu, niegodny robaku! Uczê wy³¹cznie Stra¿ników Œwi¹tyni Œni¹cego.
	AI_StopProcessInfos	(self);
	

};

// ***************************** 
//			AngarTalked 
// *****************************

instance DIA_GorNaToth_AngarTalked (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_AngarTalked_Condition;
	information	= DIA_GorNaToth_AngarTalked_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_GorNaToth_AngarTalked_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer))
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_AngarTalked_Info()
{
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_11_00"); //Rozmawia³eœ z Cor Angarem? I co powiedzia³?
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"hs@FF0000 Powiedzia³, ¿e jesteœ niegodny, by nosiæ zbrojê Œwi¹tynnego Stra¿nika.",DIA_GorNaToth_AngarTalked_Unworthy);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Powiedzia³, ¿e nigdy nie lubi³ b³otnych wê¿y.",DIA_GorNaToth_AngarTalked_Shark);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Kaza³ mi zg³osiæ siê do niego, gdy ju¿ zostanê Œwi¹tynnym Stra¿nikiem.",DIA_GorNaToth_AngarTalked_Normal);	
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //Kaza³ mi zg³osiæ siê do niego, gdy ju¿ zostanê Œwi¹tynnym Stra¿nikiem.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //NajwyraŸniej ma o tobie wysokie mniemanie. Inaczej nie odezwa³by siê do ciebie.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //To wielki zaszczyt zostaæ przez niego choæby zauwa¿onym. Do mnie odezwa³ siê po raz ostatni ca³e dwa miesi¹ce temu!
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //Powiedzia³, ¿e nigdy nie lubi³ b³otnych wê¿y.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //Co...? (zdecydowanie) Czeka mnie œwiêta misja!
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //¯yczenie mojego mistrza jest dla mnie rozkazem.
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //Powiedzia³, ¿e jesteœ niegodny, by nosiæ zbrojê Œwi¹tynnego Stra¿nika.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Nigdy! Nie móg³ tak powiedzieæ! Nie o mnie!
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

//-------------------------------------------------------
// AUFNAHME BEI DEN TEMPLERN
//-------------------------------------------------------
instance  TPL_1402_GorNaToth_GETSTUFF (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_GETSTUFF_Condition;
	information		= TPL_1402_GorNaToth_GETSTUFF_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia³bym odebraæ moj¹ zbrojê Œwi¹tynnego Stra¿nika."; 
};

FUNC int  TPL_1402_GorNaToth_GETSTUFF_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_GETSTUFF_Info()
{
	AI_Output			(other, self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //Chcia³bym odebraæ moj¹ zbrojê Œwi¹tynnego Stra¿nika.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //To prawdziwy zaszczyt wrêczyæ zbrojê cz³owiekowi, który zdoby³ dla nas jaja pe³zaczy.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //Niech ta zbroja chroni ciê równie dobrze jak Œni¹cy chroni nasze Bractwo!
	
	B_LogEntry			(GE_BecomeTemplar,	"Gor Na Toth da³ mi moj¹ pierwsz¹ zbrojê Œwi¹tynnej Stra¿y. Teraz jestem pe³noprawnym cz³onkiem tej spo³ecznoœci!");

	Log_CreateTopic		(GE_TraderPSI,		LOG_NOTE);
	B_LogEntry			(GE_TraderPSI,		"Gor Na Toth ma na sk³adzie lepsze zbroje Œwi¹tynnej Stra¿y. Niestety, ¿eby je otrzymaæ, muszê najpierw z³o¿yæ pokaŸny datek na rzecz Bractwa. W ci¹gu dnia Toth przebywa zwykle na placu treningowym.");
	
	CreateInvItem		(hero, TPL_ARMOR_L);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_EquipBestArmor	(hero);
};  

/*------------------------------------------------------------------------
//							ARMOR
------------------------------------------------------------------------*/
instance  TPL_1402_GorNaToth_ARMOR (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_ARMOR_Condition;
	information		= TPL_1402_GorNaToth_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebujê lepszej zbroi."; 
};

FUNC int  TPL_1402_GorNaToth_ARMOR_Condition()
{	
	if	(Npc_KnowsInfo(hero,TPL_1402_GorNaToth_GETSTUFF))
	&& (Npc_GetTrueGuild (hero) == GIL_TPL) || (Npc_GetTrueGuild (hero) == GIL_GUR)
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_ARMOR_Info()
{
	AI_Output				(other, self,"Info_GorNaToth_ARMOR_15_01"); //Potrzebujê lepszej zbroi.
	AI_Output				(self, other,"Info_GorNaToth_ARMOR_11_02"); //Có¿, móg³bym ci daæ lepsz¹ zbrojê, ale musia³byœ najpierw przekazaæ spory datek na rzecz Bractwa.

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	DIALOG_BACK	,	TPL_1402_GorNaToth_ARMOR_BACK);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,VALUE_TPL_ARMOR_H) ,TPL_1402_GorNaToth_ARMOR_H);
	AFIP_SetChoiceItem(TPL_1402_GorNaToth_ARMOR_H, TPL_ARMOR_H);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothTpl,VALUE_TPL_ARMOR_M),	TPL_1402_GorNaToth_ARMOR_M);
	AFIP_SetChoiceItem(TPL_1402_GorNaToth_ARMOR_M, TPL_ARMOR_M);	


};

func void TPL_1402_GorNaToth_ARMOR_M ()
{
	var int AFIP_ShowItem;
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_M_15_01"); //Potrzebujê wzmocnionej zbroi Stra¿ników Œwi¹tynnych.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_02"); //Nie jesteœ wystarczaj¹co doœwiadczony. Udowodnij swoj¹ przydatnoœæ w Stra¿y, a zas³u¿ysz sobie na lepszy pancerz!
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_M)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_03"); //Gdy tylko wesprzesz nasz¹ spo³ecznoœæ odpowiednim datkiem, zbroja bêdzie twoja!
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_04"); //Teraz, gdy jesteœ gotów wesprzeæ nas swoim hojnym datkiem, mo¿esz odebraæ swoj¹ zbrojê.
		B_GiveInvItems	    (hero, self, ItMiNugget,	VALUE_TPL_ARMOR_M);
		
		CreateInvItem		(hero, TPL_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_H ()
{
	var int AFIP_ShowItem;
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_H_15_01"); //Chcia³bym otrzymaæ ciê¿k¹ zbrojê Stra¿y Œwi¹tynnej.

	if (Kapitel < 4)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_02"); //Nie jesteœ jeszcze wystarczaj¹co doœwiadczony. Udowodnij swoj¹ przydatnoœæ dla naszej spo³ecznoœci, a dost¹pisz zaszczytu noszenia tak wspania³ego pancerza.
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_H)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_03"); //Widzê, ¿e jesteœ ju¿ gotów, by nosiæ tê wspania³¹ zbrojê. Gdybyœ tylko mia³ doœæ rudy, by wspomóc nasz¹ ma³¹ spo³ecznoœæ jakimœ hojnym datkiem...
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_04"); //Od tej pory ten wspania³y pancerz bêdzie dawa³ œwiadectwo twego mêstwa i poœwiêcenia.

		B_GiveInvItems  	(hero, self, ItMiNugget,VALUE_TPL_ARMOR_H);

		CreateInvItem		(self, ItAmArrow);				//SN: Kronkelgegenstand, damit die Bildschrimausgabe "1 Gegenstand erhalten" stimmt (Rüstung geht nicht, da dann immer Gor Na Toth seine eigene erst auszieht, und eine Sekunde nackt dasteht)
		B_GiveInvItems  	(self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero,	ItAmArrow);

		CreateInvItem		(hero, TPL_ARMOR_H);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_BACK_15_01"); //Chyba siê jednak rozmyœlê.
	AI_Output				(self, hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Jak sobie ¿yczysz. Wiesz, gdzie mnie szukaæ.

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};


//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE TPL_1402_GorNaToth_Teach(C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 10;
	condition	= TPL_1402_GorNaToth_Teach_Condition;
	information	= TPL_1402_GorNaToth_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT TPL_1402_GorNaToth_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};
//si³a mana zrêcznoœæ
FUNC VOID TPL_1402_GorNaToth_Teach_Info()
{
	AI_Output			(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output			(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Si³a i zrêcznoœæ s¹ równie istotne jak potêga umys³u.
	
	if	(log_gornatothfight == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo¿e mnie nauczyæ walki jednorêcznym orê¿em, a tak¿e poka¿e mi jak zwiêkszyæ si³ê, zrêcznoœæ i manê, jeœli do³¹czê do Bractwa.");
		log_gornatothfight = TRUE;
	};
	
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);

	if (log_gornatothtrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo¿e mi pomóc zwiêkszyæ moj¹ si³ê, zrêcznoœæ i manê.");
		log_gornatothtrain = TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_BACK()
{
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
};

func void TPL_1402_GorNaToth_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};
func void TPL_1402_GorNaToth_Teach_MAN_1()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 1);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_5()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 5);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_GorNaToth_START_TRAIN (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 10;
	condition	= DIA_GorNaToth_START_TRAIN_Condition;
	information	= DIA_GorNaToth_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_GorNaToth_START_TRAIN_Condition()
{
	if  ((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_GorNaToth_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_GorNaToth_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,"Wróæ",DIA_GorNaToth_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_GorNaToth_START_TRAIN_1H_1);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_GorNaToth_START_TRAIN_1H_5);
	
	
};

func void DIA_GorNaToth_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,Dialog_Back,DIA_GorNaToth_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_GorNaToth_START_TRAIN_1H_1);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_GorNaToth_START_TRAIN_1H_5);

};



func void DIA_GorNaToth_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,Dialog_Back,DIA_GorNaToth_START_TRAIN_BACK);

	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_GorNaToth_START_TRAIN_1H_1);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_GorNaToth_START_TRAIN_1H_5);


};

func void DIA_GorNaToth_START_TRAIN_BACK()
{
	Info_ClearChoices(DIA_GorNaToth_START_TRAIN);
};

//--------------------------------------1.6.1-------------------------------

//========================================
//-----------------> BlokadaS
//========================================

INSTANCE DIA_GorNaToth_BlokadaS (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_BlokadaS_Condition;
   information  = DIA_GorNaToth_BlokadaS_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Cor Angar...";
};

FUNC INT DIA_GorNaToth_BlokadaS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_CorAngar_Blokada_02))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaToth_BlokadaS_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaS_15_01"); //Przysy³a mnie Cor Angar. Mamy rozbiæ blokadê Stra¿ników przed obozem.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaS_03_02"); //Najpierw musimy ostrzec Gor Na Draka. Wys³a³em go z misj¹ zwiadowcz¹ nim sytuacja wydawa³a siê tak powa¿na.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaS_03_03"); //Biegnij przed obóz. Poœpiesz siê nim Stra¿nicy go zaszlachtuj¹.
	    B_LogEntry               (Blokada,"Gor Na Toth powiedzia³, ¿e nale¿y pokonaæ si³y Gomeza lecz najpierw muszê ostrzec Gor Na Draka, który uda³ siê na zwiady przed obóz gdy sytuacja nie wydawa³a siê tak powa¿na. Muszê dzia³aæ niezwykle szybko!");
	TPL_1439_GorNaDrak.attribute[ATR_HITPOINTS]     = 1800;
	TPL_1439_GorNaDrak.attribute[ATR_HITPOINTS_MAX] = 1800;
	Npc_ExchangeRoutine(TPL_1439_GorNaDrak,"Blokada");
    AI_StopProcessInfos	(self);
};


func void Psi_Defend()
{
//------------------Temple Guard
	Wld_InsertNpc				(TPL_40079_TempleGuard,"WP_BLO_TPL4");
	Wld_InsertNpc				(TPL_40080_TempleGuard,"WP_BLO_TPL4");
	Wld_InsertNpc				(TPL_40081_TempleGuard,"WP_BLO_TPL4");
	Wld_InsertNpc				(TPL_40082_TempleGuard,"WP_BLO_TPL4");

//------------------Gardists
	Wld_InsertNpc				(GRD_40094_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40095_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40096_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40097_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40098_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40099_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40100_Gardist,"WP_ATTACK_PSI1");
 	Wld_InsertNpc				(GRD_40101_Szef,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40102_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40103_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40104_Gardist,"WP_ATTACK_PSI1");
	Wld_InsertNpc				(GRD_40105_Gardist,"WP_ATTACK_PSI1");
 	Wld_InsertNpc				(GRD_40106_Gardist,"WP_ATTACK_PSI1"); 
	
	
     B_LogEntry               (Blokada,"Gor Na Toth da³ mi swoich uczniów. Czekaj¹ na mnie na placu œwi¹tynnym,	musimy wspólnie uderzyæ na si³y Gomeza i rozbiæ ca³kowicie ich blokadê.");
   

};


//========================================
//-----------------> BlokadaDrak
//========================================

INSTANCE DIA_GorNaToth_BlokadaDrak (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_BlokadaDrak_Condition;
   information  = DIA_GorNaToth_BlokadaDrak_Info;
   permanent	= FALSE;
   description	= "Gor Na Drak twierdzi ¿e s¹ 3 grupy stra¿ników.";
};

FUNC INT DIA_GorNaToth_BlokadaDrak_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaDrak_BlokadaL))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaToth_BlokadaDrak_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaDrak_15_01"); //Gor Na Drak twierdzi ¿e s¹ 3 grupy stra¿ników. 
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaDrak_03_02"); //Czyli uda³o ci siê dotrzeæ na czas...
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaDrak_03_03"); //Có¿ weŸ kilku moich ludzi i pokazcie im kto tu rz¹dzi. Ju¿ na ciebie czekaj¹ na placu œwi¹tynnym.
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaDrak_15_04"); //Jasne.

	Psi_Defend();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BlokadaDrakDead
//========================================

INSTANCE DIA_GorNaToth_BlokadaDrakDead (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 1;
   condition    = DIA_GorNaToth_BlokadaDrakDead_Condition;
   information  = DIA_GorNaToth_BlokadaDrakDead_Info;
   permanent	= FALSE;
   description	= "Niestety, spóŸni³em siê I zawiod³em. Gor Na Drak poleg³.";
};

FUNC INT DIA_GorNaToth_BlokadaDrakDead_Condition()
{
if (Npc_IsDead (Tpl_1439_GorNaDrak))
&& (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaS))
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaToth_BlokadaDrakDead_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaDrakDead_15_01"); //Niestety, spóŸni³em siê I zawiod³em. Gor Na Drak poleg³.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaDrakDead_03_02"); //Zatem ponieœliœmy du¿¹ stratê. Ale robi³eœ co mog³eœ. To nie twoja wina.
	    B_LogEntry               (Blokada,"Niestety spóŸni³em siê. Gor Na Drak poleg³ w walce z ludŸmi Gomeza.");
};

//========================================
//-----------------> BlokadaICo
//========================================

INSTANCE DIA_GorNaToth_BlokadaICo (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 2;
   condition    = DIA_GorNaToth_BlokadaICo_Condition;
   information  = DIA_GorNaToth_BlokadaICo_Info;
   permanent	= FALSE;
   description	= "Co teraz?";
};

FUNC INT DIA_GorNaToth_BlokadaICo_Condition()
{
if (Npc_KnowsInfo(hero,DIA_GorNaToth_BlokadaDrakDead)) 

{
    return TRUE;
};
};
FUNC VOID DIA_GorNaToth_BlokadaICo_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaICo_15_01"); //Co teraz?
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaICo_03_02"); //Daje ci moich uczniów I razem pokonajcie wszystkie odzia³y Stra¿y w okolicy.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaICo_03_03"); //Czekaj¹ ju¿ na ciebie na placu Œwi¹tynnym.
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaICo_15_04"); //Jasne.
	Psi_Defend();
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BlokadaWon
//========================================

INSTANCE DIA_GorNaToth_BlokadaWon (C_INFO)
{
   npc          = TPL_1402_GorNaToth;
   nr           = 3;
   condition    = DIA_GorNaToth_BlokadaWon_Condition;
   information  = DIA_GorNaToth_BlokadaWon_Info;
   permanent	= FALSE;
   description	= "Blokada stra¿ników zosta³a zlikwidowana.";
};

FUNC INT DIA_GorNaToth_BlokadaWon_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_BaalNamib_GIT))
    if (Npc_HasItems (other, ItWr_Blokada) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaToth_BlokadaWon_Info()
{
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaWon_15_01"); //Blokada stra¿ników zosta³a zlikwidowana.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaWon_03_02"); //Znakomicie siê spisaliœcie.
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaWon_15_03"); //Przy dowódcy Stra¿ników znalaz³em to...
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaWon_03_04"); //Hmmm popatrzmy...
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaWon_03_05"); //Pomów z Cor Angarem. Niezw³ocznie.
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaWon_15_06"); //Niech bêdzie.
    B_LogEntry               (Blokada,"Gor Na Toth by³ zadowolony z naszej postawy. Po przeczytaniu rozkazów dowódcy Stra¿ników poleci³ mi pomówiæ z Cor Angarem.");
    AI_StopProcessInfos	(self);
};









/*
//========================================
//-----------------> OPCJA KRADZIE¯Y
//========================================

INSTANCE DIA_GorNaToth_PICKPOCKET(C_INFO)
{
	npc          = TPL_1402_GorNaToth;
	nr           = 900;
	condition    = DIA_GorNaToth_PICKPOCKET_Condition;
	information  = DIA_GorNaToth_PICKPOCKET_Info;
	permanent    = TRUE;
	description  = Pickpocket_80;
};

FUNC INT DIA_GorNaToth_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};

FUNC VOID DIA_GorNaToth_PICKPOCKET_Info()
{
	Info_ClearChoices	(DIA_GorNaToth_PICKPOCKET);
	Info_AddChoice		(DIA_GorNaToth_PICKPOCKET, DIALOG_BACK 	,DIA_GorNaToth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_GorNaToth_PICKPOCKET, DIALOG_PICKPOCKET 	,DIA_GorNaToth_PICKPOCKET_DoIt);
};

FUNC VOID DIA_GorNaToth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices	(DIA_GorNaToth_PICKPOCKET);
};

FUNC VOID DIA_GorNaToth_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_GorNaToth_PICKPOCKET);
};
*/

instance dia_gornatoth_pickpocket(c_info) {
    npc = tpl_1402_gornatoth;
    nr = 900;
    condition = dia_gornatoth_pickpocket_condition;
    information = dia_gornatoth_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gornatoth_pickpocket_condition() {
	e_beklauen(baseThfChanceTPL, 30);
};

func void dia_gornatoth_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gornatoth_pickpocket);
	info_addchoice(dia_gornatoth_pickpocket, dialog_back, dia_gornatoth_pickpocket_back);
	info_addchoice(dia_gornatoth_pickpocket, dialog_pickpocket, dia_gornatoth_pickpocket_doit);
};

func void dia_gornatoth_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_gornatoth_pickpocket);
};

func void dia_gornatoth_pickpocket_back() {
    info_clearchoices(dia_gornatoth_pickpocket);
};