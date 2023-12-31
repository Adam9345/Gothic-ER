const string torch_text_cannotputaway = "Nie mo¿esz teraz od³o¿yæ pochodni!";

const string torch_text_lefthandoccupied = "Trzymasz ju¿ coœ innego w lewej d³oni!";

const string torch_text_fightmode = "Nie mo¿esz trzymaæ pochodni podczas walki!";

const string torch_text_cannotweartorch = "Nie mo¿esz teraz trzymaæ pochodni!";

const string torch_text_notorch = "Nie masz pochodni!";

const string torch_text_dialogue = "Nie mo¿esz trzymaæ pochodni w trakcie rozmowy!";

func int torch_getslotitem() {
    call_zstringptrparam("ZS_LEFTHAND");
    call__thiscall(_@(hero), 6878448); //GetSlotItem
    return call_retvalasptr();
};

func void torch_use() {
	createinvitem(hero, itlstorchburning);
	call_ptrparam(_@(itlstorchburning));
	call__thiscall(_@(hero), 6916112); //UseItem
};

func void torch_keyevent(var int key) {
    var int ptr;
    var c_item itm;
	
	if (key == mem_getkey("keyTorch")) {
		if (infomanager_hasfinished()) {
			ptr = torch_getslotitem();
			
			if (ptr) {
				itm = _^(ptr);
				
				if (hlp_getinstanceid(itm) == itlstorchburning) {
					if((!c_bodystatecontains(hero, bs_stand)) && (!c_bodystatecontains(hero, bs_run)) && (!c_bodystatecontains(hero, bs_walk)) && (!c_bodystatecontains(hero, bs_sneak))) {
                        print(torch_text_cannotputaway);
                    } else {		
						torch_use();
						npc_removeinvitems(hero, itlstorchburning, 2);
						npc_removeinvitems(hero, itlstorch, 1);
					};
					
					if (c_bodystatecontains(hero, bs_run) || c_bodystatecontains(hero, bs_walk)) {
						B_FullStop(hero);
						AI_PlayAniBS( hero, "T_RUNL_2_RUN", BS_STAND );
					};
				};
			} else {
				if (npc_hasitems(hero, itlstorch) || npc_hasitems(hero, itlstorchburned)) {
					if(!npc_isinfightmode(hero, fmode_none)) {
						print(torch_text_fightmode);
					}
					else if((!c_bodystatecontains(hero, bs_stand)) && (!c_bodystatecontains(hero, bs_run)) && (!c_bodystatecontains(hero, bs_walk)) && (!c_bodystatecontains(hero, bs_sneak))) {
						print(torch_text_cannotweartorch);
					} else {
						var int burnedtorchesamount; burnedtorchesamount = npc_hasitems(hero, itlstorchburned);
						npc_removeinvitems(hero, itlstorchburned, burnedtorchesamount);
						createinvitems(hero, itlstorch, burnedtorchesamount);
						
						B_FullStop(hero);
						torch_use();
						
						npc_removeinvitems(hero, itlstorchburning, 2);
						npc_removeinvitems(hero, itlstorch, 2);
					};
				} else {
					print(torch_text_notorch);
				};
			};
		} else {
            print(torch_text_dialogue);
        };
	};  
};

func void init_torchkey() {
    if(!mem_gothoptexists("KEYS", "keyTorch")) {
        mem_setkeys("keyTorch", key_t, key_comma);
    };
};

var int torchloadfix_givetorch;

func void torchloadfix_checkandgivetorch() {
    var int ptr;

    if(!hlp_isvalidnpc(hero)) {
        return;
    };
    ptr = torch_getslotitem();
    if(torchloadfix_givetorch && (!ptr)) {
        torch_use();
        if(npc_hasitems(hero, itlstorch) > 0) {
            npc_removeinvitem(hero, itlstorch);
        };
    };
};

func void torchloadfix_checktorch() {
    var int ptr;
    var c_item itm;

    if(!hlp_isvalidnpc(hero)) {
        return;
    };
    ptr = torch_getslotitem();
    if(ptr) {
        itm = _^(ptr);
        if(hlp_getinstanceid(itm) == itlstorchburning) {
            torchloadfix_givetorch = true;
        };
    }
    else if((!ptr) || (hlp_getinstanceid(itm) != itlstorchburning)) {
        torchloadfix_givetorch = false;
    };
};

func int function(var func f) {
    return save_getfuncid(f);
};

func void callafterworldloaded(var func function) {
    ff_applyonceextgt(function, 500, 1);
};

func void init_fixtorchesafterload_always() {
    callafterworldloaded(torchloadfix_checkandgivetorch);
};

func void init_fixtorchesafterload_gamestart() {
    hookenginef(6532480, 6, torchloadfix_checktorch); //WriteSaveGame
};

func void game_keyevent_t(var int key) {
    torch_keyevent(key);
};

func void game_keyevent_for_torches() {
    game_keyevent_t(esi);
};

func void TorchHotKey_Init() {
    const int init = 0;
    if (!init) {
        hookenginef(6684404, 6, game_keyevent_for_torches); //oCGame::HandleEvent (switch)
        init_torchkey();
        init_fixtorchesafterload_always();
        init_fixtorchesafterload_gamestart();
        //4743104
    };
};