const int MOUSE_WHEEL_UP = 2057;
const int MOUSE_WHEEL_DOWN = 2058;
const int zCViewDialogChoice__HandleEvent = 7703136;
const int oCInformationManager__CollectChoices = 7524288;
const int oCInformationManager__CollectInfos = 7523728;

func string STR_TrimL(var string str, var string tok) {
    var int lenS; lenS = STR_Len(str);
    var int lenT; lenT = STR_Len(tok);

    var string ss;
    var string ts;
    var int cont;
    var int t;

    // Start from the beginning
    var int startP; startP = 0;

    while(startP < lenS);
        ss = STR_Substr(str, startP, 1);
        cont = FALSE;

        t = 0;
        while(t < lenT);
            ts = STR_Substr(tok, t, 1);

            if (Hlp_StrCmp(ss, ts)) {
                cont = TRUE;
                break;
            };

            t += 1;
        end;

        if (!cont) {
            break;
        };

        startP += 1;
    end;

    if (startP >= lenS) {
        return "";
    } else {
        return STR_Substr(str, startP, lenS-startP);
    };
};

func string byte2hex(var int byte) {
    const int ASCII_0 = 48;
    const int ASCII_A = 65;
    byte = byte & 255;

    // Fix ASCII characters (A to F)
    var int c1; c1 = (byte >> 4);
    if (c1 >= 10) {
        c1 += ASCII_A-ASCII_0-10;
    };
    var int c2; c2 = (byte & 15);
    if (c2 >= 10) {
        c2 += ASCII_A-ASCII_0-10;
    };

    const int mem = 0;
    if (!mem) { mem = MEM_Alloc(3); };

    MEM_WriteByte(mem    , c1 + ASCII_0);
    MEM_WriteByte(mem + 1, c2 + ASCII_0);
    return STR_FromChar(mem);
};

func string dec2hex(var int dec) {
    var string hex; hex = "";
    hex = ConcatStrings(hex, byte2hex(dec >> 24));
    hex = ConcatStrings(hex, byte2hex(dec >> 16));
    hex = ConcatStrings(hex, byte2hex(dec >> 8));
    hex = ConcatStrings(hex, byte2hex(dec));
    return hex;
};

func void zCView_SetPos (var int viewPtr, var int vposx, var int vposy) {
	//0x006FDA10 public: void __thiscall zCView::SetPos(int,int)
	const int zCView__SetPos_G1 = 7330320;

	//0x007A75B0 public: void __thiscall zCView::SetPos(int,int)
	const int zCView__SetPos_G2 = 8025520;

	if (!viewPtr) { return; };

	const int call = 0;
	if (CALL_Begin (call)) {
		CALL_IntParam (_@ (vposy));
		CALL_IntParam (_@ (vposx));
		CALL__thiscall (_@ (viewPtr), MEMINT_SwitchG1G2 (zCView__SetPos_G1, zCView__SetPos_G2));
		call = CALL_End ();
	};
};

func void oCItemContainer_OpenPassive (var int ptr, var int x, var int y, var int mode) {
	//0x00668050 public: virtual void __thiscall oCItemContainer::OpenPassive(int,int,enum oCItemContainer::oTItemListMode)
	const int oCItemContainer__OpenPassive_G1 = 6717520;

	//0x007086D0 public: virtual void __thiscall oCItemContainer::OpenPassive(int,int,int)
	const int oCItemContainer__OpenPassive_G2 = 7374544;

	if (!ptr) { return; };

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_PtrParam (_@ (mode));
		CALL_PtrParam (_@ (y));
		CALL_PtrParam (_@ (x));
		CALL__thiscall (_@ (ptr), MEMINT_SwitchG1G2 (oCItemContainer__OpenPassive_G1, oCItemContainer__OpenPassive_G2));
		call = CALL_End();
	};
};

func int Npc_GetItemSlot (var int slfInstance, var int invCat, var int searchItemInstanceID) {
	var C_NPC slf; slf = Hlp_GetNPC (slfInstance);
	if (!Hlp_IsValidNPC (slf)) { return -1; };

	var int itmSlot; itmSlot = 0;
	var int amount; amount = NPC_GetInvItemBySlot (slf, invCat, itmSlot);

	var int itemInstanceID;

	while (amount > 0);
		itemInstanceID = Hlp_GetInstanceID (item);

		if (itemInstanceID == searchItemInstanceID) {
			return + itmSlot;
		};

		itmSlot += 1;
		amount = NPC_GetInvItemBySlot (slf, invCat, itmSlot);
	end;

	return -1;
};

func int oCNpcInventory_SwitchToCategory (var int npcInventoryPtr, var int invCat) {
	//0x0066DE60 public: int __thiscall oCNpcInventory::SwitchToCategory(int)
	const int oCNpcInventory__SwitchToCategory_G1 = 6741600;

	//There is no G2A function
	const int oCNpcInventory__SwitchToCategory_G2 = 0;

	if (!npcInventoryPtr) { return 0; };

	//return 0 in G2A
	if (MEMINT_SwitchG1G2 (0, 1)) { return 0; };

	var int retVal;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_PutRetValTo(_@ (retVal));
		CALL_IntParam (_@ (invCat));
		CALL__thiscall (_@ (npcInventoryPtr), oCNpcInventory__SwitchToCategory_G1);
		call = CALL_End();
	};

	return +retVal;
};

func int oCNpcInventory_GetCategory (var int ptr, var int itemPtr) {
	//0x0066C430 public: int __thiscall oCNpcInventory::GetCategory(class oCItem *)
	const int oCNpcInventory__GetCategory_G1 = 6734896;

	//0x0070C690 public: int __thiscall oCNpcInventory::GetCategory(class oCItem *)
	const int oCNpcInventory__GetCategory_G2 = 7390864;

	if (!itemPtr) { return 0; };
	if (!ptr) { return 0; };

	var int retVal;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_PutRetValTo(_@ (retVal));
		CALL_PtrParam (_@ (itemPtr));
		CALL__thiscall (_@ (ptr), MEMINT_SwitchG1G2 (oCNpcInventory__GetCategory_G1, oCNpcInventory__GetCategory_G2));
		call = CALL_End();
	};

	return +retVal;
};

func int Npc_GetNpcInventoryPtr (var int slfInstance) {
	var oCNpc slf; slf = Hlp_GetNPC (slfInstance);
	if (!Hlp_IsValidNPC (slf)) { return 0; };

	var int npcInventoryPtr; npcInventoryPtr = _@ (slf.inventory2_vtbl);
	return + npcInventoryPtr;
};

func void Npc_InvSelectItem (var int slfInstance, var int itemInstanceID) {
	var oCNPC slf; slf = Hlp_GetNpc (slfInstance);
	if (!Hlp_IsValidNPC (slf)) { return; };

	if (Npc_GetInvItem (slf, itemInstanceID)) {
		var int npcInventoryPtr; npcInventoryPtr = Npc_GetNpcInventoryPtr (slfInstance);
		var int invCat; invCat = oCNpcInventory_GetCategory (npcInventoryPtr, _@ (item));
		oCNpcInventory_SwitchToCategory (npcInventoryPtr, invCat);

		var int itmSlot; itmSlot = Npc_GetItemSlot (slf, invCat, itemInstanceID);

		slf.inventory2_oCItemContainer_offset = itmSlot;
		slf.inventory2_oCItemContainer_selectedItem = itmSlot;
	};
};

func void oCNpc_UnpackInventory (var int slfInstance) {
	//0x00670400 public: void __thiscall oCNpcInventory::UnpackAllItems(void)
	const int oCNpcInventory__UnpackAllItems_G1 = 6751232;

	//0x00710030 public: void __thiscall oCNpcInventory::UnpackAllItems(void)
	const int oCNpcInventory__UnpackAllItems_G2 = 7405616;

	var int npcInventoryPtr; npcInventoryPtr = Npc_GetNpcInventoryPtr (slfInstance);
	if (!npcInventoryPtr) { return; };

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL__thiscall (_@ (npcInventoryPtr), MEMINT_SwitchG1G2 (oCNpcInventory__UnpackAllItems_G1, oCNpcInventory__UnpackAllItems_G2));
		call = CALL_End();
	};
};

func void Npc_InvOpenPassive (var int slfInstance, var int itemInstanceID, var int hasInvFocus) {
	var oCNpc slf; slf = Hlp_GetNpc (slfInstance);
	if (!Hlp_IsValidNPC (slf)) { return; };

	//Unpack inventory
	oCNpc_UnpackInventory (slfInstance);

	//Select inventory item
	Npc_InvSelectItem (slfInstance, itemInstanceID);

	//Get Npc inventory ptr
	var int npcInventoryPtr; npcInventoryPtr = Npc_GetNpcInventoryPtr (slfInstance);
	if (!npcInventoryPtr) { return; };

	//In G1 invMode 2 means only a single item will be rendered on screen
	//enum oTItemListMode { FULLSCREEN, HALFSCREEN, ONE };

	//In G2A inv mode represents something else
	//INV_MODE_DEFAULT, INV_MODE_CONTAINER, INV_MODE_PLUNDER, INV_MODE_STEAL, INV_MODE_BUY, INV_MODE_SELL
	var int invMode; invMode = 0;
	if (MEMINT_SwitchG1G2 (1, 0)) {
		invMode = 2;
	};

	if (Npc_IsPlayer (slf)) {
		oCItemContainer_OpenPassive (npcInventoryPtr, 8192, 0, invMode);
		slf.inventory2_oCItemContainer_right = TRUE;
	} else {
		oCItemContainer_OpenPassive (npcInventoryPtr, 0, 0, invMode);
		slf.inventory2_oCItemContainer_right = FALSE;
	};

	slf.inventory2_oCItemContainer_frame = hasInvFocus;
};

func int zCFont_GetFontY (var int fontPtr) {
	//0x006E0200 public: int __thiscall zCFont::GetFontY(void)
	const int zCFont__GetFontY_G1 = 7209472;

	//0x007894E0 public: int __thiscall zCFont::GetFontY(void)
	const int zCFont__GetFontY_G2 = 7902432;

	if (!fontPtr) { return 0; };

	var int retVal;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_PutRetValTo (_@ (retVal));
		CALL__thiscall (_@ (fontPtr), MEMINT_SwitchG1G2 (zCFont__GetFontY_G1, zCFont__GetFontY_G2));
		call = CALL_End();
	};

	return + retVal;
};

func string STR_Postfix(var string str, var int off) {
    return STR_SubStr(str, off, STR_Len(str)-off);
};

func string STR_ReplaceOnce(var string haystack, var string needle, var string replace) {
    var zString zSh; zSh = _^(_@s(haystack));
    var zString zSn; zSn = _^(_@s(needle));
    if (!zSh.len) || (!zSn.len) {
        return haystack;
    };

    var int startPos; startPos = STR_IndexOf(haystack, needle);
    if (startPos == -1) {
        return haystack;
    };

    var string destStr; destStr = "";

    destStr = STR_Prefix(haystack, startPos);
    destStr = ConcatStrings(destStr, replace);
    destStr = ConcatStrings(destStr, STR_Substr(haystack, startPos+zSn.len, zSh.len-(startPos+zSn.len)));

    return destStr;
};

func string STR_ReplaceAll(var string haystack, var string needle, var string replace) {
    var string before; before = "";
    while(!Hlp_StrCmp(haystack, before));
        before = haystack;
        haystack = STR_ReplaceOnce(before, needle, replace);
    end;
    return haystack;
};

func int hex2dec(var string hex) {
    var zString zStr; zStr = _^(_@s(hex));
    if (!zStr.len) {
        return 0;
    };

    // Remove 0x prefix and h postfix
    hex = STR_Lower(hex);
    if (Hlp_StrCmp(STR_Prefix(hex, 2), "0x")) {
        hex = STR_SubStr(hex, 2, zStr.len-2);
    } else if (MEM_ReadByte(zStr.ptr+zStr.len-1) == /*h*/ 104) {
        hex = STR_Prefix(hex, zStr.len-1);
    };

    // Remove any spaces
    hex = STR_ReplaceAll(hex, " ", "");

    // Check length
    if (zStr.len > 8) {
        MEM_Error("hex2dec: Hexadecimal number too big. Considering the last 4 bytes only.");
        hex = STR_Postfix(hex, zStr.len-8);
    };

    // Iterate over all characters (from back to front)
    var int dec; dec = 0;
    repeat(i, zStr.len); var int i;
        dec += MEMINT_HexCharToInt(MEM_ReadByte(zStr.ptr+(zStr.len-1)-i)) << 4*i;
    end;

    return dec;
};

func string mySTR_SubStr (var string str, var int start, var int count) {
    if (start < 0) || (count < 0) {
        //MEM_Error ("STR_SubStr: start and count may not be negative.");
        return "";
    };

    /* Hole Adressen von zwei Strings, Source und Destination (für Kopieroperation) */
    var zString zStrSrc;
    var zString zStrDst; var string dstStr; dstStr = "";

    zStrSrc = _^(_@s(str));
    zStrDst = _^(_@s(dstStr));

    if (zStrSrc.len < start + count) {
        if (zStrSrc.len < start) {
            //MEM_Warn ("STR_SubStr: The desired start of the substring lies beyond the end of the string.");
            return "";

        } else {
            /* The start is in valid bounds. The End is shitty. */
            /* Careful! MEM_Warn will use STR_SubStr (but will never use it in a way that would produce a warning) */
            var string saveStr; var int saveStart; var int saveCount;
            saveStr = str; saveStart = start; saveCount = count;
            //MEM_Warn ("STR_SubStr: The end of the desired substring exceeds the end of the string.");
            str = saveStr; start = saveStart; count = saveCount;
            count = zStrSrc.len - start;
        };
    };

    zStrDst.ptr = MEM_Alloc (count+2)+1; /* +1 for reference counter byte, +1 for null byte */
    zStrDst.res = count;

    MEM_CopyBytes (zStrSrc.ptr + start, zStrDst.ptr, count);

    zStrDst.len = count;

    return dstStr;
};

func string STR_Left (var string s, var int count) {
	if (STR_Len (s) < count) {
		return s;
	};

	return mySTR_SubStr (s, 0, count);
};

func int HEX2RGBA (var string hex) {
	var int R; R = 255;
	var int G; G = 255;
	var int B; B = 255;
	var int A; A = 255;

	if (STR_Len(hex) > 1) { R = hex2dec (mySTR_SubStr (hex, 0, 2)); };
	if (STR_Len(hex) > 3) { G = hex2dec (mySTR_SubStr (hex, 2, 2)); };
	if (STR_Len(hex) > 5) { B = hex2dec (mySTR_SubStr (hex, 4, 2)); };
	if (STR_Len(hex) > 7) { A = hex2dec (mySTR_SubStr (hex, 6, 2)); };

	return RGBA (R, G, B, A);
};
/*
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
*/
/*
func int API_GetSymbolIntValue (var string symbolName, var int defaultValue) {
	var int symbID; symbID = MEM_GetSymbolIndex (symbolName);

	if (symbID == -1) {
		MEM_Info (ConcatStrings ("API_GetSymbolIntValue symbol not found: ", symbolName));
		return defaultValue;
	};

	return + GetSymbolIntValue (symbID);
};
*/

func string GetSymbolStringValue (var int symbolIndex) {
	var int symbPtr; symbPtr = MEM_GetSymbolByIndex (symbolIndex);

	if (symbPtr) {
		var zCPar_symbol symb; symb = _^ (symbPtr);

		if ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_STRING) {
			var string s; s = MEM_ReadString(symb.content);
			return s;
		};
	};

	return "";
};

func string API_GetSymbolStringValue (var string symbolName, var string defaultValue) {
	var int symbID; symbID = MEM_GetSymbolIndex (symbolName);

	if (symbID == -1) {
		MEM_Info (ConcatStrings ("API_GetSymbolStringValue symbol not found: ", symbolName));
		return defaultValue;
	};

	var string s; s = GetSymbolStringValue (symbID);
	return s;
};

func int API_GetSymbolHEX2RGBAValue (var string symbolName, var string defaultValue) {
	var int symbID; symbID = MEM_GetSymbolIndex (symbolName);

	if (symbID == -1) {
		MEM_Info (ConcatStrings ("API_GetSymbolHEX2RGBAValue symbol not found: ", symbolName));
		return + HEX2RGBA (defaultValue);
	};

	var string s; s = GetSymbolStringValue (symbID);
	return + HEX2RGBA (s);
};

func string STR_Trim(var string str, var string tok) {
    var int lenS; lenS = STR_Len(str);
    var int lenT; lenT = STR_Len(tok);
    
    var string ss;
    var string ts;
    var int cont;
    var int t;

    // Start from the beginning
    var int startP; startP = 0;
    var int endP; endP = lenS-1;

    while(startP < lenS);
        ss = STR_Substr(str, startP, 1);
        cont = FALSE;

        t = 0;
        while(t < lenT);
            ts = STR_Substr(tok, t, 1);

            if (Hlp_StrCmp(ss, ts)) {
                cont = TRUE;
                break;
            };

            t += 1;
        end;

        if (!cont) {
            break;
        };

        startP += 1;
    end;

    // Start from the end
    while(endP >= startP);
        ss = STR_Substr(str, endP, 1);
        cont = FALSE;

        t = 0;
        while(t < lenT);
            ts = STR_Substr(tok, t, 1);

            if (Hlp_StrCmp(ss, ts)) {
                cont = TRUE;
                break;
            };

            t += 1;
        end;

        if (!cont) {
            break;
        };

        endP -= 1;
    end;

    // Convert offset to length (0 -> 1, 1 -> 2, ...)
    endP += 1;

    if (startP >= endP) {
        return "";
    } else {
        return STR_Substr(str, startP, endP-startP);
    };
};
/*
func int NPC_HasItemInstanceName (var int slfInstance, var string instanceName) {
	var C_NPC slf; slf = Hlp_GetNPC (slfInstance);
	if (!Hlp_IsValidNPC (slf)) { return 0; };

	var int symbID; symbID = MEM_GetSymbolIndex (instanceName);
	if (symbID > 0) && (symbID < currSymbolTableLength) {
		//if (NPC_GetInventoryItem (slf, symbID))
		if (NPC_GetInvItem (slf, symbID)) {
			return (NPC_HasItems (slf, Hlp_GetInstanceID (item)));
		};
	};

	return 0;
};
*/

func void zCViewDialogChoice_ShowSelected () {
	//0x00759000 protected: void __fastcall zCViewDialogChoice::ShowSelected(void)
	const int zCViewDialogChoice__ShowSelected_G1 = 7704576;

	//0x0068F180 protected: void __fastcall zCViewDialogChoice::ShowSelected(void)
	const int zCViewDialogChoice__ShowSelected_G2 = 6877568;

	const int null = 0;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL__fastcall (_@ (MEM_InformationMan.DlgChoice), _@ (null), MEMINT_SwitchG1G2 (zCViewDialogChoice__ShowSelected_G1, zCViewDialogChoice__ShowSelected_G2));
		call = CALL_End();
	};
};

func int oCInfoManager_GetInfoUnimportant_ByPtr (var int slfPtr, var int othPtr, var int index) {
	//0x00665120 public: class oCInfo * __thiscall oCInfoManager::GetInfoUnimportant(class oCNpc *,class oCNpc *,int)
	const int oCInfoManager__GetInfoUnimportant_G1 = 6705440;

	//0x00703030 public: class oCInfo * __thiscall oCInfoManager::GetInfoUnimportant(class oCNPC *,class oCNPC *,int)
	const int oCInfoManager__GetInfoUnimportant_G2 = 7352368;

	if (!MEM_Game.infoman) { return 0; };
	if (!Hlp_Is_oCNpc (slfPtr)) { return 0; };
	if (!Hlp_Is_oCNpc (othPtr)) { return 0; };

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_IntParam (_@ (index));
		CALL_PtrParam (_@ (slfPtr));
		CALL_PtrParam (_@ (othPtr));
		CALL__thiscall (_@ (MEM_Game.infoman), MEMINT_SwitchG1G2(oCInfoManager__GetInfoUnimportant_G1, oCInfoManager__GetInfoUnimportant_G2));
		call = CALL_End();
	};

	return CALL_RetValAsPtr();
};

func void oCNpcInventory_Close (var int npcInventoryPtr) {
	//0x0066C1E0 public: virtual void __thiscall oCNpcInventory::Close(void)
	const int oCNpcInventory__Close_G1 = 6734304;

	//0x0070C2F0 public: virtual void __thiscall oCNpcInventory::Close(void)
	const int oCNpcInventory__Close_G2 = 7389936;

	if (!npcInventoryPtr) { return; };

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL__thiscall (_@ (npcInventoryPtr), MEMINT_SwitchG1G2 (oCNpcInventory__Close_G1, oCNpcInventory__Close_G2));
		call = CALL_End();
	};
};

func void Npc_CloseInventory (var int slfInstance) {
	var int npcInventoryPtr; npcInventoryPtr = Npc_GetNpcInventoryPtr (slfInstance);
	oCNpcInventory_Close (npcInventoryPtr);
};

func void zCViewDialogChoice_SelectPrevious () {
	//0x007590A0 protected: void __fastcall zCViewDialogChoice::SelectPrevious(void)
	const int zCViewDialogChoice__SelectPrevious_G1		= 7704736;
	//0x0068F220 protected: void __fastcall zCViewDialogChoice::SelectPrevious(void)
	const int zCViewDialogChoice__SelectPrevious_G2		= 6877728;

	const int null = 0;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL__fastcall (_@ (MEM_InformationMan.DlgChoice), _@ (null), MEMINT_SwitchG1G2 (zCViewDialogChoice__SelectPrevious_G1, zCViewDialogChoice__SelectPrevious_G2));
		call = CALL_End();
	};
};

func void zCViewDialogChoice_SelectNext () {
	//0x007591B0 protected: void __fastcall zCViewDialogChoice::SelectNext(void)
	const int zCViewDialogChoice__SelectNext_G1 = 7705008;
	//0x0068F330 protected: void __fastcall zCViewDialogChoice::SelectNext(void)
	const int zCViewDialogChoice__SelectNext_G2 = 6878000;

	const int null = 0;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL__fastcall (_@ (MEM_InformationMan.DlgChoice), _@ (null), MEMINT_SwitchG1G2 (zCViewDialogChoice__SelectNext_G1, zCViewDialogChoice__SelectNext_G2));
		call = CALL_End();
	};
};

func void zCViewDialogChoice_Select (var int index) {
	//0x007592C0 protected: void __fastcall zCViewDialogChoice::Select(int)
	const int zCViewDialogChoice__Select_G1 = 7705280;

	//0x0068F440 protected: void __fastcall zCViewDialogChoice::Select(int)
	const int zCViewDialogChoice__Select_G2 = 6878272;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL__fastcall (_@ (MEM_InformationMan.DlgChoice), _@ (index), MEMINT_SwitchG1G2 (zCViewDialogChoice__Select_G1, zCViewDialogChoice__Select_G2));
		call = CALL_End();
	};
};

func int STR_IndexOfFrom (var string str, var string tok, var int startFrom) {
    var zString zStr; zStr = _^(_@s(str));
    var zString zTok; zTok = _^(_@s(tok));

    if(zTok.len == 0) {
        return 0;
    };
    if (zStr.len == 0) {
        return -1;
    };

    var int startPos; startPos = zStr.ptr + startFrom;
    var int startMax; startMax = zStr.ptr + zStr.len - zTok.len;

    var int loopPos; loopPos = MEM_StackPos.position;
    if (startPos <= startMax) {
        if (MEM_CompareBytes(startPos, zTok.ptr, zTok.len)) {
            return startPos - zStr.ptr;
        };
        startPos += 1;
        MEM_StackPos.position = loopPos;
    };
    return -1;
};

func string mySTR_Prefix (var string str, var int len) {
    return mySTR_SubStr(str, 0, len);
};

func int CtoB (var string s) {
	var int buf; buf = STR_toChar (s);
	var int chr; chr = MEM_ReadInt (buf) & 255;
	return chr;
};

func int zCFont_GetWidth (var int fontPtr, var int c) {
	//0x006E0240 public: int __thiscall zCFont::GetWidth(char)
	const int zCFont__GetWidth_G1 = 7209536;

	//0x00789520 public: int __thiscall zCFont::GetWidth(char)
	const int zCFont__GetWidth_G2 = 7902496;

	if (!fontPtr) { return 0; };

	var int retVal;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_PutRetValTo (_@ (retVal));
		CALL_IntParam (_@ (c));
		CALL__thiscall (_@ (fontPtr), MEMINT_SwitchG1G2 (zCFont__GetWidth_G1, zCFont__GetWidth_G2));
		call = CALL_End();
	};

	return + retVal;
};

func int zCFont_GetLetterDistance (var int fontPtr) {
	//0x006E0250 public: int __thiscall zCFont::GetLetterDistance(void)
	const int zCFont__GetLetterDistance_G1 = 7209552;

	//0x00789530 public: int __thiscall zCFont::GetLetterDistance(void)
	const int zCFont__GetLetterDistance_G2 = 7902512;

	if (!fontPtr) { return 0; };

	var int retVal;

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_PutRetValTo (_@ (retVal));
		CALL__thiscall(_@ (fontPtr), MEMINT_SwitchG1G2 (zCFont__GetLetterDistance_G1, zCFont__GetLetterDistance_G2));
		call = CALL_End();
	};

	return + retVal;
};

func int Font_GetStringWidthPtr (var string s, var int fontPtr) {
	if (!fontPtr) { return 0; };

	var int len; len = STR_Len (s);
	if (!len) { return 0; };

	var int letterDist; letterDist = zCFont_GetLetterDistance (fontPtr);
	var int spaceWidth; spaceWidth = zCFont_GetWidth (fontPtr, CtoB (" "));

	//Recalc width
	var int buf; buf = STR_toChar (s);

	var int c;
	var int charWidth;
	var int width; width = 0;

	repeat (i, len); var int i;
		c = MEM_ReadInt(buf + i) & 255;

		if (c > 32) {
			charWidth = zCFont_GetWidth (fontPtr, c);
			width += (charWidth + letterDist);
		} else {
			width += spaceWidth;
		};
	end;

	return width;
};