//const int oCAIHuman__PC_ActionMove = 6371936;

//const int oCMobLockable__CanOpen = 6825920;

//-- Internal variables
var int PC_PickLockOutputVariation;

var int _PC_PickLockSkillRequired;

var int PC_ActionKeyPressed;
var int PC_ActionKeyPressedLast;
var int PC_ActionKeyHeld;

var int _PlayerActionKeyHeld_Event;
var int _PlayerActionKeyReleased_Event;

// func int zCVob_GetEM (var int vobPtr) {
// 	//0x005D49B0 public: class zCEventManager * __fastcall zCVob::GetEM(int)
// 	const int zCVob__GetEM_G1 = 6113712;

// 	//0x005FFE10 public: class zCEventManager * __fastcall zCVob::GetEM(int)
// 	const int zCVob__GetEM_G2 = 6290960;

// 	if (!vobPtr) { return 0; };

// 	var int f; f = false;

// 	const int call = 0;
// 	if (CALL_Begin(call)) {
// 		CALL__fastcall(_@(vobPtr), _@(f), MEMINT_SwitchG1G2 (zCVob__GetEM_G1, zCVob__GetEM_G2));
// 		call = CALL_End();
// 	};

// 	return CALL_RetValAsPtr ();
// };

// func int Hlp_Is_zCEventManager (var int ptr) {
// 	//0x008DC690 private: static class zCClassDef zCEventManager::classDef
// 	const int zCEventManager__classDef_G1 = 9291408;

// 	//0x00AB3948 private: static class zCClassDef zCEventManager::classDef
// 	const int zCEventManager__classDef_G2 = 11221320;

// 	return MEM_CheckInheritance (ptr, MEMINT_SwitchG1G2 (zCEventManager__classDef_G1, zCEventManager__classDef_G2));
// };

// func int zCEventManager_GetNumMessages (var int eMgr) {
// 	//0x00452600 public: virtual int __thiscall zCEventManager::GetNumMessages(void)
// 	const int zCEventManager__GetNumMessages_G1 = 4531712;

// 	//0x00457430 public: virtual int __thiscall zCEventManager::GetNumMessages(void)
// 	const int zCEventManager__GetNumMessages_G2 = 4551728;

// 	if (!Hlp_Is_zCEventManager (eMgr)) { return 0; };

// 	const int call = 0;
// 	if (CALL_Begin(call)) {
// 		CALL__thiscall (_@ (eMgr), MEMINT_SwitchG1G2 (zCEventManager__GetNumMessages_G1, zCEventManager__GetNumMessages_G2));
// 		call = CALL_End();
// 	};

// 	return CALL_RetValAsInt ();
// };

// func int zCEventManager_GetEventMessage (var int eMgr, var int index) {
// 	//0x006DE9B0 public: virtual class zCEventMessage * __thiscall zCEventManager::GetEventMessage(int)
// 	const int zCEventManager__GetEventMessage_G1 = 7203248;

// 	//0x00787C40 public: virtual class zCEventMessage * __thiscall zCEventManager::GetEventMessage(int)
// 	const int zCEventManager__GetEventMessage_G2 = 7896128;

// 	if (!Hlp_Is_zCEventManager (eMgr)) { return 0; };

// 	const int call = 0;
// 	if (CALL_Begin(call)) {
// 		CALL_IntParam (_@ (index));
// 		CALL__thiscall (_@ (eMgr), MEMINT_SwitchG1G2 (zCEventManager__GetEventMessage_G1, zCEventManager__GetEventMessage_G2));
// 		call = CALL_End();
// 	};

// 	return CALL_RetValAsPtr ();
// };

// func int Hlp_Is_oCMsgConversation (var int ptr) {
// 	//0x008DBD38 private: static class zCClassDef oCMsgConversation::classDef
// 	const int oCMsgConversation__classDef_G1 = 9289016;

// 	//0x00AB2980 private: static class zCClassDef oCMsgConversation::classDef
// 	const int oCMsgConversation__classDef_G2 = 11217280;

// 	return MEM_CheckInheritance (ptr, MEMINT_SwitchG1G2 (oCMsgConversation__classDef_G1, oCMsgConversation__classDef_G2));
// };

// func int Hlp_Is_zCEventMessage (var int ptr) {
// 	//0x008D7498 private: static class zCClassDef zCEventMessage::classDef
// 	const int zCEventMessage__classDef_G1 = 9270424;

// 	//0x009A3698 private: static class zCClassDef zCEventMessage::classDef
// 	const int zCEventMessage__classDef_G2 = 10106520;

// 	return MEM_CheckInheritance (ptr, MEMINT_SwitchG1G2 (zCEventMessage__classDef_G1, zCEventMessage__classDef_G2));
// };

// func int zCEventMessage_GetSubType (var int eMsg) {
// 	//0x0073F4C0 public: unsigned short __thiscall zCEventMessage::GetSubType(void)const
// 	const int zCEventMessage__GetSubType_G1 = 7599296;

// 	//0x00674290 public: unsigned short __thiscall zCEventMessage::GetSubType(void)const
// 	const int zCEventMessage__GetSubType_G2 = 6767248;

// 	if (!Hlp_Is_zCEventMessage (eMsg)) { return -1; };

// 	const int call = 0;
// 	if (CALL_Begin(call)) {
// 		CALL__thiscall (_@ (eMsg), MEMINT_SwitchG1G2 (zCEventMessage__GetSubType_G1, zCEventMessage__GetSubType_G2));
// 		call = CALL_End();
// 	};

// 	return CALL_RetValAsInt ();
// };

func int Npc_HasAni (var int slfInstance, var string aniName) {
	var oCNpc slf; slf = Hlp_GetNPC (slfInstance);
	if (!Hlp_IsValidNPC (slf)) { return FALSE; };

	aniName = STR_Upper (aniName);

	var int eMgr; eMgr = zCVob_GetEM (_@ (slf));
	if (!Hlp_Is_zCEventManager (eMgr)) { return FALSE; };

	var int eventTotal; eventTotal = zCEventManager_GetNumMessages (eMgr);

	//Loop through Event Messages
	repeat (i, eventTotal); var int i;
		var int eMsg; eMsg = zCEventManager_GetEventMessage (eMgr, i);

		if (Hlp_Is_oCMsgConversation (eMsg)) {
			if (zCEventMessage_GetSubType (eMsg) == EV_PLAYANI_NOOVERLAY) {
				var oCMsgConversation msg; msg = _^ (eMsg);

				if (Hlp_StrCmp (msg.name, aniName)) {
					return TRUE;
				};
			};
		};
	end;

	return FALSE;
};

// func void oCNpc_SetFocusVob (var int slfInstance, var int focusPtr) {
// 	//0x0068FF70 public: void __thiscall oCNpc::SetFocusVob(class zCVob *)
// 	const int oCNpc__SetFocusVob_G1 = 6881136;

// 	//0x00732B60 public: void __thiscall oCNpc::SetFocusVob(class zCVob *)
// 	const int oCNpc__SetFocusVob_G2 = 7547744;

// 	var oCNpc slf; slf = Hlp_GetNPC (slfInstance);

// 	if (!Hlp_IsValidNPC (slf)) { return; };

// 	var int slfPtr; slfPtr = _@ (slf);

// 	// Update the focus vob (properly, mind the reference counter)
// 	if (focusPtr != slf.focus_vob) {
// 		const int call = 0;

// 		if (CALL_Begin(call)) {
// 			CALL_PtrParam(_@(focusPtr));
// 			CALL__thiscall(_@(slfPtr), MEMINT_SwitchG1G2 (oCNpc__SetFocusVob_G1, oCNpc__SetFocusVob_G2));
// 			call = CALL_End();
// 		};
// 	};
// };

// func int NPC_HasItemInstanceName (var int slfInstance, var string instanceName) {
// 	var C_NPC slf; slf = Hlp_GetNPC (slfInstance);
// 	if (!Hlp_IsValidNPC (slf)) { return 0; };

// 	var int symbID; symbID = MEM_GetSymbolIndex (instanceName);
// 	if (symbID > 0) && (symbID < currSymbolTableLength) {
// 		//if (NPC_GetInventoryItem (slf, symbID))
// 		if (NPC_GetInvItem (slf, symbID)) {
// 			return (NPC_HasItems (slf, Hlp_GetInstanceID (item)));
// 		};
// 	};

// 	return 0;
// };

func void _hook_oCMobLockable_CanOpen () {
	//Initial value
	EAX = FALSE;

	if (!Hlp_Is_oCMobLockable (ECX)) { return; };

	//NPC is first parameter
	var int slfPtr; slfPtr = MEM_ReadInt (ESP + 4);
	if (!Hlp_Is_oCNpc (slfPtr)) { return; };

	var oCNPC slf; slf = _^ (slfPtr);

	//NPC can open any chest
	if (!NPC_IsPlayer (slf)) {
		EAX = TRUE;
		return;
	};

	const int lastMobPtr = 0;
	if (ECX == lastMobPtr) {
		PC_PickLockOutputVariation += 1;
	} else {
		PC_PickLockOutputVariation = 1;
		lastMobPtr = ECX;
	};

	//If mob is not locked - we can open it
	var oCMobLockable mob; mob = _^ (ECX);
	if (!(mob.bitfield & oCMobLockable_bitfield_locked)) {
		EAX = TRUE;
		return;
	};

	//We need one more C_NPC type variable for NPC_GetTalentSkil & Npc_SetTalentValue :-/
	var C_NPC npc; npc = Hlp_GetNPC (slf);

	var int lockType; lockType = 0;

	const int requiresPickLock = 1;
	const int requiresSpecialKey = 2;
	const int requiresBothSpecialKeyAndPickLock = 4;

	var int playerHasKey; playerHasKey = TRUE;
	var int playerHasPickLock; playerHasPickLock = TRUE;

	//Do we have picklocks?
	if (STR_Len (mob.pickLockStr)) {
		lockType = lockType | requiresPickLock;
		playerHasPickLock = NPC_HasItems (slf, ItKeLockPick);
	};

	//Do we have key?
	if (STR_Len (mob.keyInstance)) {
		playerHasKey = NPC_HasItemInstanceName (slf, mob.keyInstance);
		lockType = lockType | requiresSpecialKey;
	};

	//Recalculate skill level - based on dexterity
	var int failRate; failRate = 100 - npc.attribute [ATR_DEXTERITY];

	//Default 10% chance to break PickLock (even if dexterity > 90)
	if (failRate < 10) {
		failRate = 10;
	};

	//Npc_SetTalentValue (npc, NPC_TALENT_PICKLOCK, failRate);

	//Generate output

	//We need a lockpick
	if (lockType == requiresPickLock) {
		//If player does not have skill - and if skill is **required**
		if ((NPC_GetTalentSkill (npc, NPC_TALENT_PICKLOCK) == 0) && (_PC_PickLockSkillRequired)) {
			const int symbID = 0;

			if (!symbID) {
				symbID = MEM_FindParserSymbol ("ENHANCEDPICKLOCKING_MISSINGSKILL");
			};

			if (symbID != -1) {
				MEM_PushInstParam (slf);
				MEM_CallByID (symbID);
			};

			oCNpc_SetFocusVob (slf, 0);
			
			if (!Npc_HasAni (slf, "T_DONTKNOW")) {
				AI_PlayAni (slf, "T_DONTKNOW");
			};
			return;
		};

		if (!playerHasPickLock) {
			const int symbID2 = 0;

			if (!symbID2) {
				symbID2 = MEM_FindParserSymbol ("ENHANCEDPICKLOCKING_MISSINGLOCKPICK");
			};

			if (symbID2 != -1) {
				MEM_PushInstParam (slf);
				MEM_CallByID (symbID2);
			};

			oCNpc_SetFocusVob (slf, 0);
			if (!Npc_HasAni (slf, "T_DONTKNOW")) {
				AI_PlayAni (slf, "T_DONTKNOW");
			};
			return;
		};
	} else
	//We need a key
	if (lockType == requiresSpecialKey) {
		if (!playerHasKey) {
			const int symbID3 = 0;

			if (!symbID3) {
				symbID3 = MEM_FindParserSymbol ("ENHANCEDPICKLOCKING_MISSINGKEY");
			};

			if (symbID3 != -1) {
				MEM_PushInstParam (slf);
				MEM_CallByID (symbID3);
			};

			oCNpc_SetFocusVob (slf, 0);
			if (!Npc_HasAni (slf, "T_DONTKNOW")) {
				AI_PlayAni (slf, "T_DONTKNOW");
			};
			return;
		};
	} else
	//We either need a lockpick or a key
	if ((lockType & requiresPickLock) || (lockType & requiresSpecialKey)) {
		if ((!playerHasPickLock) && (!playerHasKey)) {
			//Do we need to learn anything ?
			if ((NPC_GetTalentSkill (npc, NPC_TALENT_PICKLOCK) == 0) && (_PC_PickLockSkillRequired)) {
				const int symbID4 = 0;

				if (!symbID4) {
					symbID4 = MEM_FindParserSymbol ("ENHANCEDPICKLOCKING_MISSINGSKILL");
				};

				if (symbID4 != -1) {
					MEM_PushInstParam (slf);
					MEM_CallByID (symbID4);
				};
			} else {
				const int symbID5 = 0;

				if (!symbID5) {
					symbID5 = MEM_FindParserSymbol ("ENHANCEDPICKLOCKING_MISSINGLOCKPICKORKEY");
				};

				if (symbID5 != -1) {
					MEM_PushInstParam (slf);
					MEM_CallByID (symbID5);
				};
			};

			oCNpc_SetFocusVob (slf, 0);
			if (!Npc_HasAni (slf, "T_DONTKNOW")) {
				AI_PlayAni (slf, "T_DONTKNOW");
			};
			return;
		};
	};

	EAX = TRUE;
};

func int GetSymbolIntValue (var int symbolIndex) {
	var int symbPtr; symbPtr = MEM_GetSymbolByIndex (symbolIndex);

	if (symbPtr) {
		var zCPar_symbol symb; symb = _^ (symbPtr);

		if ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_INT)
		|| ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FLOAT) {
			return symb.content;
		};
	};

	return 0;
};

func int API_GetSymbolIntValue (var string symbolName, var int defaultValue) {
	var int symbID; symbID = MEM_GetSymbolIndex (symbolName);

	if (symbID == -1) {
		MEM_Info (ConcatStrings ("API_GetSymbolIntValue symbol not found: ", symbolName));
		return defaultValue;
	};

	return + GetSymbolIntValue (symbID);
};

func void FF_CheckActionKey () {
	var int actionKey; actionKey = MEM_GetKey ("keyAction"); actionKey = MEM_KeyState (actionKey);
	var int secondaryActionKey; secondaryActionKey = MEM_GetSecondaryKey ("keyAction"); secondaryActionKey = MEM_KeyState (secondaryActionKey);

	PC_ActionKeyPressed = FALSE;

	if (((actionKey == KEY_PRESSED) || (actionKey == KEY_HOLD)) || ((secondaryActionKey == KEY_PRESSED) || (secondaryActionKey == KEY_HOLD))) {
		PC_ActionKeyPressed = TRUE;
	};

	if (PC_ActionKeyPressed != PC_ActionKeyPressedLast) {
		if (!PC_ActionKeyPressed) {
			if (_PlayerActionKeyReleased_Event) {
				Event_Execute (_PlayerActionKeyReleased_Event, 0);
			};
		};
	} else {
		if (PC_ActionKeyPressed) {
			PC_ActionKeyHeld = TRUE;
			if (_PlayerActionKeyHeld_Event) {
				Event_Execute (_PlayerActionKeyHeld_Event, 0);
			};
		};
	};

	PC_ActionKeyPressedLast = PC_ActionKeyPressed;

	if (!PC_ActionKeyPressed) {
		FF_Remove (FF_CheckActionKey);
	};
};

func void _hook_oCAIHuman_PC_ActionMove () {
	PC_ActionKeyPressed = MEM_ReadInt (ESP + 4);

	//If actionKey is pressed together with other keys ... then this function no longer register actionKey as pressed :-/
	//So we will add frame function that will check if keyAction is pressed / held there
	if (PC_ActionKeyPressed) {
		if (PC_ActionKeyPressed != PC_ActionKeyPressedLast) {
			FF_ApplyOnceExtGT (FF_CheckActionKey, 0, -1);
		};
	};
};

func void G12_GetActionKey_Init () {
	PC_ActionKeyPressed = 0;
	PC_ActionKeyPressedLast = PC_ActionKeyPressed;

	if (!_PlayerActionKeyHeld_Event) {
		_PlayerActionKeyHeld_Event = Event_Create ();
	};

	if (!_PlayerActionKeyReleased_Event) {
		_PlayerActionKeyReleased_Event = Event_Create ();
	};

	const int once = 0;
	if (!once) {
		//G1 hook len 13, G2A hook len = 9
		HookEngine (oCAIHuman__PC_ActionMove, MEMINT_SwitchG1G2 (13, 9), "_hook_oCAIHuman_PC_ActionMove");
		once = 1;
	};
};

func void G1_EnhancedPickLocking_Init () {
	G12_GetActionKey_Init ();

	_PC_PickLockSkillRequired = API_GetSymbolIntValue ("PC_PICKLOCKSKILLREQUIRED", FALSE);

	const int once = 0;
	if (!once) {
		//HookEngine (oCMobLockable__CanOpen, 6, "_hook_oCMobLockable_CanOpen");
		ReplaceEngineFunc (oCMobLockable__CanOpen, 1, "_hook_oCMobLockable_CanOpen");

		once = 1;
	};
};