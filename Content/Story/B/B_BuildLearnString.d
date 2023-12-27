// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "Einhandkampf Stufe 2"
//	- lp: 20
//	- Rückgabestring: "Einhandkampf Stufe 2 (20 Lernpunkte)"
//
// oder
//
//	- text: "Zweihandkampf Stufe 1"
//	- lp: 30
//  - ore: 200
//	- Rückgabestring: "Zweihandkampf Stufe 1 (200 Erz, 20 Lernpunkte)"
func string B_BuildLearnString (var string text, var int lp, var int ore)
{
	var string msg;
	
	msg	= ConcatStrings(text,	NAME_LearnPrefix);		// Bsp: "Zweihandkampf Stufe 1 ("

	if	(ore > 0)
	{
		msg = ConcatStrings(msg, IntToString(ore));		// Bsp: "Zweihandkampf Stufe 1 (200"
		msg = ConcatStrings(msg, NAME_LearnMidfix);		// Bsp: "Zweihandkampf Stufe 1 (200 Erz, "
	};
	//str
	if Hlp_StrCmp(text, NAME_LearnStrength_5)                 
	{
	msg = ConcatStrings(msg,	IntToString(public_str_cost*5));	
	}
	else if Hlp_StrCmp(text, NAME_LearnStrength_1)  
	{
	msg = ConcatStrings(msg,	IntToString(public_str_cost));
	}
	else if Hlp_StrCmp(text, NAME_LearnStrength_10)  
	{
	msg = ConcatStrings(msg,	IntToString(public_str_cost*10));
	}
	else if Hlp_StrCmp(text, NAME_LearnStrength_20)  
	{
	msg = ConcatStrings(msg,	IntToString(public_str_cost*20));
	}
	//dex
	else if Hlp_StrCmp(text, NAME_LearnDexterity_5)                   
	{
	msg = ConcatStrings(msg,	IntToString(public_dex_cost*5));	
	}
	else if Hlp_StrCmp(text, NAME_LearnDexterity_1)  
	{
	msg = ConcatStrings(msg,	IntToString(public_dex_cost));
	}
	else if Hlp_StrCmp(text, NAME_LearnDexterity_10)  
	{
	msg = ConcatStrings(msg,	IntToString(public_dex_cost*10));
	}
	else if Hlp_StrCmp(text, NAME_LearnDexterity_20)  
	{
	msg = ConcatStrings(msg,	IntToString(public_dex_cost*20));
	}
	//mana
	else if Hlp_StrCmp(text, NAME_LearnMana_5)                   
	{
	msg = ConcatStrings(msg,	IntToString(public_man_cost*5));	
	}
	else if Hlp_StrCmp(text, NAME_LearnMana_1)  
	{
	msg = ConcatStrings(msg,	IntToString(public_man_cost));
	}
	else if Hlp_StrCmp(text, NAME_LearnMana_10)  
	{
	msg = ConcatStrings(msg,	IntToString(public_man_cost*10));
	}
	else if Hlp_StrCmp(text, NAME_LearnMana_20)  
	{
	msg = ConcatStrings(msg,	IntToString(public_man_cost*20));
	}
	//other skills
	else if Hlp_StrCmp(text, NAME_LearnPickpocket_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_PICKPOCKET_2));
	}
	else if Hlp_StrCmp(text, NAME_LearnPickpocket_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_PICKPOCKET_1));
	}
	else if Hlp_StrCmp(text, NAME_LearnPicklock_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_PICKLOCK_2));
	}
	else if Hlp_StrCmp(text, NAME_LearnPicklock_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_PICKLOCK_1));
	}
	else if Hlp_StrCmp(text, NAME_LearnAcrobat)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_ACROBAT));
	}
	else if Hlp_StrCmp(text, NAME_LearnSneak)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_SNEAK));
	}
	else if Hlp_StrCmp(text, NAME_LearnAlchemy_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_ALCHEMY_1));
	}
	else if Hlp_StrCmp(text, NAME_LearnAlchemy_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_ALCHEMY_2));
	}
	else if Hlp_StrCmp(text, NAME_LearnMage_6)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_MAGE_6));
	}
	else if Hlp_StrCmp(text, NAME_LearnMage_5)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_MAGE_5));
	}
	else if Hlp_StrCmp(text, NAME_LearnMage_4)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_MAGE_4));
	}
	else if Hlp_StrCmp(text, NAME_LearnMage_3)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_MAGE_3));
	}
	else if Hlp_StrCmp(text, NAME_LearnMage_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_MAGE_2));
	}
	else if Hlp_StrCmp(text, NAME_LearnMage_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_MAGE_1));
	}
	else if Hlp_StrCmp(text, NAME_LearnCrossbow_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_CROSSBOW_2));
	}
	else if Hlp_StrCmp(text, NAME_LearnCrossbow_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_CROSSBOW_1));
	}
	else if Hlp_StrCmp(text, NAME_LearnBow_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_BOW_2));
	}
	else if Hlp_StrCmp(text, NAME_LearnBow_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_BOW_1));
	}
	else if Hlp_StrCmp(text, NAME_Learn2h_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_2H_2));
	}
	else if Hlp_StrCmp(text, NAME_Learn2h_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_2H_1));
	}
	else if Hlp_StrCmp(text, NAME_Learn1h_2)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_1H_2));
	}
	else if Hlp_StrCmp(text, NAME_Learn1h_1)
	{
	msg = ConcatStrings(msg,	IntToString(LPCOST_TALENT_1H_1));
	};
	//end

	if (lp == 1)
	{
		//msg = ConcatStrings(msg,NAME_LearnPostfixS);	
		msg = ConcatStrings(msg,NAME_LearnPostfixP);
		
	}
	else
	{
		msg = ConcatStrings(msg,NAME_LearnPostfixP);	// Bsp: "Zweihandkampf Stufe 1 (200 Erz, 20 Lernpunkte)"
	};

	return msg;
};




