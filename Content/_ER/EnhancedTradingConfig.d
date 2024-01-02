//Enhanced Trading system
//This package improves trading system in G1. It takes care of ore exchange - you don't have care about ore anymore.
//It also allows you to:
// - control what items will trader buy from you
// - selling price / buying prace

const string ENHANCEDTRADING_FONT = "FONT_OLD_20_WHITE.TGA";

func void EnhancedTrading_NotEnoughOre () {
	PrintScreen ("Nie masz odpowiedniej ilo�ci rudy!", -1, 45, ENHANCEDTRADING_FONT, _TIME_MESSAGE_LOGENTRY);
};

func void EnhancedTrading_Trader_NotEnoughOre () {
	PrintScreen ("Handlarz nie ma odpowiedniej ilo�ci rudy!", -1, 45, ENHANCEDTRADING_FONT, _TIME_MESSAGE_LOGENTRY);
};

func void EnhancedTrading_Trader_NotEnoughOre_Confirm () {
	PrintScreen ("Stracisz bry�ki przy tej transakcji. Na pewno chcesz zaakceptowa�?", -1, 45, ENHANCEDTRADING_FONT, _TIME_MESSAGE_LOGENTRY);
};

func void Subtitles_ForTrading () {
	AI_Output (self, self, "DIA_Trade_NotInterrested");	//Nie jestem zainteresowany
};

func int C_Npc_WantsToBuyItems (var C_NPC slf, var int itemPtr) {
	if (!Hlp_Is_oCItem (itemPtr)) { return FALSE; };
	var oCItem itm; itm = _^ (itemPtr);

// -->	YOU CAN DEFINE NPC-SPECIFIC RULES HERE

	var string npcInstName; npcInstName = GetSymbolName (Hlp_GetInstanceID (slf));
	var string itmInstName; itmInstName = GetSymbolName (Hlp_GetInstanceID (itm));
	/*
	if (Hlp_StrCmp (npcInstName, "ORG_873_CIPHER")) {
		if (!Hlp_StrCmp (itmInstName, "ITMI_PLANTS_SWAMPHERB_01")) {

			//Check how many EV_PLAYANI_NOOVERLAY events we have in AI queue. If none - then play T_NO animation and say that we are not interrested.
			//This will add to Event Manager event: EV_PLAYANI_NOOVERLAY.
			if (NPC_EM_GetEventCountByEventName (slf, "EV_PLAYANI_NOOVERLAY") == 0)
			{
				MEM_PushInstParam (slf);
				MEM_PushInstParam (hero);
				MEM_PushStringParam ("DIA_Trade_NotInterrested");
				MEM_Call (B_SayOverlay);

				AI_PlayAni (slf, "T_NO");
			};

			return FALSE;
		};
	};
	*/

// <--

	return TRUE;
};

func int C_Npc_GetSellMultiplierF (var C_NPC slf, var int itemPtr) {
	var int multiplier;

	//Set by default to 30%
	multiplier = (divf (mkf (3), mkf (10)));

	if (!Hlp_Is_oCItem (itemPtr)) { return multiplier; };

	var oCItem itm; itm = _^ (itemPtr);

// -->	YOU CAN DEFINE NPC-SPECIFIC TRADE SELLING MULTIPLIER RULES HERE

	var string npcInstName; npcInstName = GetSymbolName (Hlp_GetInstanceID (slf));
	var string itmInstName; itmInstName = GetSymbolName (Hlp_GetInstanceID (itm));

	//Wolf will trade furs and skins in 1 x 1 ratio
	if (Hlp_StrCmp (npcInstName, "ORG_855_WOLF")) {
		if ((Hlp_StrCmp (itmInstName, "ITAT_WOLF_01"))
		|| (Hlp_StrCmp (itmInstName, "ITAT_WOLF_02"))
		|| (Hlp_StrCmp (itmInstName, "ITAT_SHADOW_01"))
		|| (Hlp_StrCmp (itmInstName, "ITAT_TROLL_01"))
		|| (Hlp_StrCmp (itmInstName, "ITAT_BLACKTROLL_01"))
		|| (Hlp_StrCmp (itmInstName, "ITAT_LURKER_02"))
		|| (Hlp_StrCmp (itmInstName, "ITAT_SWAMPSHARK_01")))
		{
			multiplier = FLOATONE;
		};
	};

	//Cipher will buy swamp weed in 1 x 1 ratio
	/*
	if (Hlp_StrCmp (npcInstName, "ORG_873_CIPHER")) {
		if (Hlp_StrCmp (itmInstName, "ITMI_PLANTS_SWAMPHERB_01"))
		{
			multiplier = FLOATONE;
		};
	};
	*/

	//
	if (Hlp_StrCmp (npcInstName, "NOV_1357_FORTUNO")) {
	};

	//ARMOR - set to 100%
	if (itm.mainflag & ITEM_KAT_ARMOR)
	{
		multiplier = (divf (mkf (5), mkf (10)));
	};

	//WEAPONS - set to 10%
	if (itm.mainflag & ITEM_KAT_NF)
	|| (itm.mainflag & ITEM_KAT_FF)
	{
		multiplier = (divf (mkf (3), mkf (10)));
	};

	if (itm.value == 1) {
		multiplier = FLOATONE;
	};

// <--

	return multiplier;
};

func int C_Npc_GetBuyMultiplierF (var C_NPC slf, var int itemPtr) {
	var int multiplier;

	//Set by default to 100%
	multiplier = FLOATONE;

	if (!Hlp_Is_oCItem (itemPtr)) { return multiplier; };

	var oCItem itm; itm = _^ (itemPtr);

// -->	YOU CAN DEFINE NPC-SPECIFIC TRADE BUYING MULTIPLIER RULES HERE

// <--

	return multiplier;
};
