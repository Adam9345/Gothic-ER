func void oCMobLockablePicklock() {
	if (!Hlp_Is_oCMobLockable (ECX)) { return; };
	var oCMobLockable mob; mob = _^ (ECX);

	var int npcPtr; npcPtr = MEM_ReadInt (ESP + 4);

	if (!Hlp_Is_oCNpc (npcPtr)) { return; };

	var oCNpc slf; slf = _^ (npcPtr);

	if (!NPC_IsPlayer (slf)) { return; };

	var int c; c = MEM_ReadInt (ESP + 8);

	var int currCharCount; currCharCount = (mob.bitfield & oCMobLockable_bitfield_pickLockNr) >> 2;

	var string pickLockChar; pickLockChar = "";

	var string pickLockString; pickLockString = "";


	currCharCount += 1;

	if (currCharCount > STR_Len (mob.pickLockStr)) {
		currCharCount = STR_Len (mob.pickLockStr);
	};

	if (currCharCount > 0) {
		pickLockString = STR_Prefix (mob.pickLockStr, currCharCount);
	};

	if (currCharCount > 0) {
		pickLockChar = STR_SubStr (mob.pickLockStr, currCharCount - 1, 1);
	};

	if (MEM_ReadInt(STR_ToChar(pickLockChar)) == c) {
		if (currCharCount >= STR_Len (mob.pickLockStr)) {
			B_GiveXP (5 * STR_Len (mob.pickLockStr));
			Prints_Ext("Zamek otworzony", rgba(144, 238, 50, 144));

			currCharCount = 0;
		};
	};
};

func void Init_XPForPicklocking() {
    const int once = 0;

    if (!once) {

        HookEngineF(6826384, 7, oCMobLockablePicklock); //oCMobLockable::PickLock
		//HookEngineF(7478304, 6, StopInteractChest); //oCMobInter::StopInteraction

        once = 1;
    };
};