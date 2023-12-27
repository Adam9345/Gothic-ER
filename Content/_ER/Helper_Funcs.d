func int render_additemcenter(var int iteminst, var int x, var int y, var int w, var int h) {
    return render_additem(iteminst, x - w >> 1, y - h >> 1, x + (w + 1) >> 1, y + (h + 1) >> 1);
};

func int oCInfoManager_GetInfoUnimportant (var int slfinstance, var int othinstance, var int index) {
	//0x00665120 public: class oCInfo * __thiscall oCInfoManager::GetInfoUnimportant(class oCNpc *,class oCNpc *,int)
	const int oCInfoManager__GetInfoUnimportant_G1 = 6705440;

	//0x00703030 public: class oCInfo * __thiscall oCInfoManager::GetInfoUnimportant(class oCNPC *,class oCNPC *,int)
	const int oCInfoManager__GetInfoUnimportant_G2 = 7352368;

	if (!MEM_Game.infoman) { return 0; };
	var oCNPC slf; slf = Hlp_GetNPC (slfinstance);
	if (!Hlp_IsValidNPC (slf)) { return 0; };
	var oCNPC oth; oth = Hlp_GetNPC (othinstance);
	if (!Hlp_IsValidNPC (oth)) { return 0; };

	var int slfPtr; slfPtr = _@ (slf);
	var int othPtr; othPtr = _@ (oth);

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

func string i2s(var int integer) {
    return inttostring(integer);
};

func string cs2(var string s1, var string s2) {
    return concatstrings(s1, s2);
};

func string cs3(var string s1, var string s2, var string s3) {
    return cs2(cs2(s1, s2), s3);
};

func string cs4(var string s1, var string s2, var string s3, var string s4) {
    return cs2(cs3(s1, s2, s3), s4);
};

func int playerHasRequiredIngredients(var int recipe) {
	var int i; i = 0;

    var int ptr; ptr = create (recipe);
	var c_recipe rec; rec = _^(ptr);

    //while(i < rec.totalrequired);
    repeat(i, rec.totalrequired);
        if (Npc_HasItems(hero, mem_readintarray(_@(rec.requireditem), i)) >= mem_readintarray(_@(rec.requireditemamount), i)) {
            if (i == rec.totalrequired - 1) {
                return true;
            };
        } else {
            return false;
        };

        //i += 1;
    end;

    return false;
};

func void removeIngredientsFromPlayerInv(var int recipe) {
    var int i; i = 0;

    var int ptr; ptr = create (recipe);
	var c_recipe rec; rec = _^(ptr);

    //while(i < rec.totalrequired);
    repeat(i, rec.totalrequired);
        Npc_RemoveInvItems(hero, mem_readintarray(_@(rec.requireditem), i), mem_readintarray(_@(rec.requireditemamount), i));

        //i += 1;
    end;
};

func void printAllIngredients(var int recipe, var int nDocID) {
	var int i; i = 0;

    var int ptr; ptr = create (recipe);
	var c_recipe rec; rec = _^(ptr);

    //while(i < rec.totalrequired);
    repeat(i, rec.totalrequired);
		var c_item recIngr; recIngr = _^(itm_getptr(mem_readintarray(_@(rec.requireditem), i)));
        Doc_PrintLine	( nDocID,  0, cs4("- ", i2s(mem_readintarray(_@(rec.requireditemamount), i)), "x ", recIngr.name));		

        //i += 1;
    end;
};

func int setRequiredItemAmount(var int item) {
    if (Npc_HasItems(hero, item) >= 1) {
        return Npc_HasItems(hero, item);
    } else {
        return 1;
    };
};
