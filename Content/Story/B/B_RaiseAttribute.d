
func void B_RaiseAttribute_Gothic2(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		concatText = ConcatStrings(NAME_RaiseStrength,IntToString(points));
		//PrintS_Ext		(msg3, COL_Yellow);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		concatText = ConcatStrings(NAME_RaiseDexterity,IntToString(points));
	  //  PrintS_Ext		(msg3, COL_Olive);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		concatText = ConcatStrings(NAME_RaiseManaMax,IntToString(points));
	//	PrintS_Ext		(msg3, COL_Blue);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		concatText = ConcatStrings(NAME_RaiseHealthMax,IntToString(points));
	//	PrintS_Ext		(msg3, COL_Red);
	};
	//B_RaiseRealAttributeLearnCounter(oth,attrib,points);
};





func void B_RaiseAttribute (var int attribute,	var int value)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_RaiseAttribute");

	//-------- Anhebung --------
	Npc_ChangeAttribute	(self,	attribute,	value);

	//-------- Bildschirmausgabe --------
	var string msg;
	var string posiadane_pkt;
	var string msg2;
	var string msg3;
	if		(attribute == ATR_STRENGTH)			
	{	
	msg = ConcatStrings(NAME_RaiseStrength	, IntToString(value));
	posiadane_pkt =  IntToString(hero.attribute[ATR_STRENGTH]);
	}
	else if	(attribute == ATR_DEXTERITY)		{	msg = ConcatStrings(NAME_RaiseDexterity , IntToString(value));	posiadane_pkt =  IntToString(hero.attribute[ATR_DEXTERITY]); }
	else if	(attribute == ATR_MANA_MAX)			{	msg = ConcatStrings(NAME_RaiseManaMax	, IntToString(value)); posiadane_pkt =  IntToString(hero.attribute[ATR_MANA_MAX]); }
	else if	(attribute == ATR_HITPOINTS_MAX)	{	msg = ConcatStrings(NAME_RaiseHealthMax , IntToString(value)); posiadane_pkt =  IntToString(hero.attribute[ATR_HITPOINTS_MAX]); 	};

	
	PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
	//PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
	msg2 = ConcatStrings(msg, " = ");
	msg3 = ConcatStrings(msg2, posiadane_pkt);
	if (attribute == ATR_STRENGTH)
	{
	PrintS_Ext		(msg3, COL_Yellow);
	}
	else if (attribute == ATR_DEXTERITY)
	{
	PrintS_Ext		(msg3, COL_Olive);
	}
	else if (attribute == ATR_MANA_MAX)
	{
	PrintS_Ext		(msg3, COL_Blue);
	}
	else if (attribute == ATR_HITPOINTS_MAX)
	{
	PrintS_Ext		(msg3, COL_Red);
	};
};










