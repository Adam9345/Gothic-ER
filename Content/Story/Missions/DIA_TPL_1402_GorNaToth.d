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
	description = "Przychodz� w sprawie d�ug�w, kt�re zaci�gn�� jeden z twoich Stra�nik�w. ";
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
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_00"); //Przychodz� w sprawie d�ug�w, kt�re zaci�gn�� jeden z twoich Stra�nik�w.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_01"); //Zwierzchnikiem Stra�nik�w �wi�tynnych jest Cor Angar. A o co chodzi i czemu mieliby�my ci pom�c? 
	AI_Output			(other, self,"DIA_GorNaToth_IdonDebt_15_02"); //Gor Na Idon ma d�ug za gorza�k� u handlarza Starkada. Dok�adnie 150 bry�ek rudy. Nie chce mi ich zwr�ci�.
	AI_Output			(self, other,"DIA_GorNaToth_IdonDebt_11_03"); //Widz�, �e by�a tu niez�a popijawa podczas mojej nieobecno�ci. We� t� rud�. Stra�nik�w spotka zas�u�ona kara podczas trening�w. 
	CreateInvItems (self,itminugget, 150);
	B_GiveinvItems (self,other,itminugget,150);
	B_LogEntry (CH1_CheatedMerchant,"Gor Na Toth zwr�ci� mi rud� i obieca�, �e ukarze Gor Na Idona. ");
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output			(other, self,"DIA_GorNaToth_AngarTalked_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output			(self, other,"DIA_GorNaToth_AngarTalked_11_01"); //Zejd� mi z oczu, niegodny robaku! Ucz� wy��cznie Stra�nik�w �wi�tyni �ni�cego.
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
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_11_00"); //Rozmawia�e� z Cor Angarem? I co powiedzia�?
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"hs@FF0000 Powiedzia�, �e jeste� niegodny, by nosi� zbroj� �wi�tynnego Stra�nika.",DIA_GorNaToth_AngarTalked_Unworthy);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Powiedzia�, �e nigdy nie lubi� b�otnych w�y.",DIA_GorNaToth_AngarTalked_Shark);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,	"Kaza� mi zg�osi� si� do niego, gdy ju� zostan� �wi�tynnym Stra�nikiem.",DIA_GorNaToth_AngarTalked_Normal);	
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //Kaza� mi zg�osi� si� do niego, gdy ju� zostan� �wi�tynnym Stra�nikiem.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //Najwyra�niej ma o tobie wysokie mniemanie. Inaczej nie odezwa�by si� do ciebie.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //To wielki zaszczyt zosta� przez niego cho�by zauwa�onym. Do mnie odezwa� si� po raz ostatni ca�e dwa miesi�ce temu!
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //Powiedzia�, �e nigdy nie lubi� b�otnych w�y.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //Co...? (zdecydowanie) Czeka mnie �wi�ta misja!
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //�yczenie mojego mistrza jest dla mnie rozkazem.
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //Powiedzia�, �e jeste� niegodny, by nosi� zbroj� �wi�tynnego Stra�nika.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Nigdy! Nie m�g� tak powiedzie�! Nie o mnie!
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
	description		= "Chcia�bym odebra� moj� zbroj� �wi�tynnego Stra�nika."; 
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
	AI_Output			(other, self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //Chcia�bym odebra� moj� zbroj� �wi�tynnego Stra�nika.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //To prawdziwy zaszczyt wr�czy� zbroj� cz�owiekowi, kt�ry zdoby� dla nas jaja pe�zaczy.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //Niech ta zbroja chroni ci� r�wnie dobrze jak �ni�cy chroni nasze Bractwo!
	
	B_LogEntry			(GE_BecomeTemplar,	"Gor Na Toth da� mi moj� pierwsz� zbroj� �wi�tynnej Stra�y. Teraz jestem pe�noprawnym cz�onkiem tej spo�eczno�ci!");

	Log_CreateTopic		(GE_TraderPSI,		LOG_NOTE);
	B_LogEntry			(GE_TraderPSI,		"Gor Na Toth ma na sk�adzie lepsze zbroje �wi�tynnej Stra�y. Niestety, �eby je otrzyma�, musz� najpierw z�o�y� poka�ny datek na rzecz Bractwa. W ci�gu dnia Toth przebywa zwykle na placu treningowym.");
	
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
	description		= "Potrzebuj� lepszej zbroi."; 
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
	AI_Output				(other, self,"Info_GorNaToth_ARMOR_15_01"); //Potrzebuj� lepszej zbroi.
	AI_Output				(self, other,"Info_GorNaToth_ARMOR_11_02"); //C�, m�g�bym ci da� lepsz� zbroj�, ale musia�by� najpierw przekaza� spory datek na rzecz Bractwa.

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
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_M_15_01"); //Potrzebuj� wzmocnionej zbroi Stra�nik�w �wi�tynnych.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_02"); //Nie jeste� wystarczaj�co do�wiadczony. Udowodnij swoj� przydatno�� w Stra�y, a zas�u�ysz sobie na lepszy pancerz!
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_M)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_03"); //Gdy tylko wesprzesz nasz� spo�eczno�� odpowiednim datkiem, zbroja b�dzie twoja!
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_04"); //Teraz, gdy jeste� got�w wesprze� nas swoim hojnym datkiem, mo�esz odebra� swoj� zbroj�.
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
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_H_15_01"); //Chcia�bym otrzyma� ci�k� zbroj� Stra�y �wi�tynnej.

	if (Kapitel < 4)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_02"); //Nie jeste� jeszcze wystarczaj�co do�wiadczony. Udowodnij swoj� przydatno�� dla naszej spo�eczno�ci, a dost�pisz zaszczytu noszenia tak wspania�ego pancerza.
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_H)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_03"); //Widz�, �e jeste� ju� got�w, by nosi� t� wspania�� zbroj�. Gdyby� tylko mia� do�� rudy, by wspom�c nasz� ma�� spo�eczno�� jakim� hojnym datkiem...
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_04"); //Od tej pory ten wspania�y pancerz b�dzie dawa� �wiadectwo twego m�stwa i po�wi�cenia.

		B_GiveInvItems  	(hero, self, ItMiNugget,VALUE_TPL_ARMOR_H);

		CreateInvItem		(self, ItAmArrow);				//SN: Kronkelgegenstand, damit die Bildschrimausgabe "1 Gegenstand erhalten" stimmt (R�stung geht nicht, da dann immer Gor Na Toth seine eigene erst auszieht, und eine Sekunde nackt dasteht)
		B_GiveInvItems  	(self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero,	ItAmArrow);

		CreateInvItem		(hero, TPL_ARMOR_H);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_BACK_15_01"); //Chyba si� jednak rozmy�l�.
	AI_Output				(self, hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Jak sobie �yczysz. Wiesz, gdzie mnie szuka�.

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
	description = "Mo�esz mnie czego� nauczy�?";
};                       

FUNC INT TPL_1402_GorNaToth_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};
//si�a mana zr�czno��
FUNC VOID TPL_1402_GorNaToth_Teach_Info()
{
	AI_Output			(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output			(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Si�a i zr�czno�� s� r�wnie istotne jak pot�ga umys�u.
	
	if	(log_gornatothfight == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo�e mnie nauczy� walki jednor�cznym or�em, a tak�e poka�e mi jak zwi�kszy� si��, zr�czno�� i man�, je�li do��cz� do Bractwa.");
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
		B_LogEntry			(GE_TeacherPSI,"Gor Na Toth mo�e mi pom�c zwi�kszy� moj� si��, zr�czno�� i man�.");
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
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,"Wr��",DIA_GorNaToth_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_GorNaToth_START_TRAIN_1H_1);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_GorNaToth_START_TRAIN_1H_5);
	
	
};

func void DIA_GorNaToth_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,Dialog_Back,DIA_GorNaToth_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_GorNaToth_START_TRAIN_1H_1);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_GorNaToth_START_TRAIN_1H_5);

};



func void DIA_GorNaToth_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_GorNaToth_START_TRAIN);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,Dialog_Back,DIA_GorNaToth_START_TRAIN_BACK);

	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_GorNaToth_START_TRAIN_1H_1);
	Info_AddChoice(DIA_GorNaToth_START_TRAIN,B_BuildLearnString("Bro� jednor�czna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_GorNaToth_START_TRAIN_1H_5);


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
   description	= "Przysy�a mnie Cor Angar...";
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
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaS_15_01"); //Przysy�a mnie Cor Angar. Mamy rozbi� blokad� Stra�nik�w przed obozem.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaS_03_02"); //Najpierw musimy ostrzec Gor Na Draka. Wys�a�em go z misj� zwiadowcz� nim sytuacja wydawa�a si� tak powa�na.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaS_03_03"); //Biegnij przed ob�z. Po�piesz si� nim Stra�nicy go zaszlachtuj�.
	    B_LogEntry               (Blokada,"Gor Na Toth powiedzia�, �e nale�y pokona� si�y Gomeza lecz najpierw musz� ostrzec Gor Na Draka, kt�ry uda� si� na zwiady przed ob�z gdy sytuacja nie wydawa�a si� tak powa�na. Musz� dzia�a� niezwykle szybko!");
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
	
	
     B_LogEntry               (Blokada,"Gor Na Toth da� mi swoich uczni�w. Czekaj� na mnie na placu �wi�tynnym,	musimy wsp�lnie uderzy� na si�y Gomeza i rozbi� ca�kowicie ich blokad�.");
   

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
   description	= "Gor Na Drak twierdzi �e s� 3 grupy stra�nik�w.";
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
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaDrak_15_01"); //Gor Na Drak twierdzi �e s� 3 grupy stra�nik�w. 
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaDrak_03_02"); //Czyli uda�o ci si� dotrze� na czas...
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaDrak_03_03"); //C� we� kilku moich ludzi i pokazcie im kto tu rz�dzi. Ju� na ciebie czekaj� na placu �wi�tynnym.
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
   description	= "Niestety, sp�ni�em si� I zawiod�em. Gor Na Drak poleg�.";
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
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaDrakDead_15_01"); //Niestety, sp�ni�em si� I zawiod�em. Gor Na Drak poleg�.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaDrakDead_03_02"); //Zatem ponie�li�my du�� strat�. Ale robi�e� co mog�e�. To nie twoja wina.
	    B_LogEntry               (Blokada,"Niestety sp�ni�em si�. Gor Na Drak poleg� w walce z lud�mi Gomeza.");
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
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaICo_03_02"); //Daje ci moich uczni�w I razem pokonajcie wszystkie odzia�y Stra�y w okolicy.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaICo_03_03"); //Czekaj� ju� na ciebie na placu �wi�tynnym.
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
   description	= "Blokada stra�nik�w zosta�a zlikwidowana.";
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
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaWon_15_01"); //Blokada stra�nik�w zosta�a zlikwidowana.
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaWon_03_02"); //Znakomicie si� spisali�cie.
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaWon_15_03"); //Przy dow�dcy Stra�nik�w znalaz�em to...
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaWon_03_04"); //Hmmm popatrzmy...
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_GorNaToth_BlokadaWon_03_05"); //Pom�w z Cor Angarem. Niezw�ocznie.
    AI_Output (other, self ,"DIA_GorNaToth_BlokadaWon_15_06"); //Niech b�dzie.
    B_LogEntry               (Blokada,"Gor Na Toth by� zadowolony z naszej postawy. Po przeczytaniu rozkaz�w dow�dcy Stra�nik�w poleci� mi pom�wi� z Cor Angarem.");
    AI_StopProcessInfos	(self);
};









/*
//========================================
//-----------------> OPCJA KRADZIE�Y
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