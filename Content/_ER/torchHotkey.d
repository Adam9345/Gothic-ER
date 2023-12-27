var int isincamera;

const string torch_text_cannotputaway = "Nie mo¿esz teraz od³o¿yæ pochodni!";

const string torch_text_lefthandoccupied = "Trzymasz ju¿ coœ innego w lewej d³oni!";

const string torch_text_fightmode = "Nie mo¿esz trzymaæ pochodni podczas walki!";

const string torch_text_cannotweartorch = "Nie mo¿esz teraz trzymaæ pochodni!";

const string torch_text_notorch = "Nie masz pochodni!";

const string torch_text_dialogue = "Nie mo¿esz trzymaæ pochodni w trakcie rozmowy!";

func int torch_getslotitem() {
    B_FullStop(hero);
    call_zstringptrparam("ZS_LEFTHAND");
    call__thiscall(_@(hero), 6878448); //GetSlotItem
    return call_retvalasptr();
};

func int torch_heroholdingtorch() {
    var int ptr;
    var c_item itm;

    B_FullStop(hero);

    ptr = torch_getslotitem();
    if(ptr) {
        itm = _^(ptr);
        if(hlp_getinstanceid(itm) == itlstorchburning) {
            return true;
        };
    };
    return false;
};

func void torch_equip() {
    B_FullStop(hero);
    createinvitem(hero, itlstorchburning);
    call_ptrparam(_@(itlstorchburning));
    call__thiscall(_@(hero), 6908144); //Equip
};

func void torch_unequip() {
    ocnpc_removefromslot(hero, "ZS_LEFTHAND", 0, 10);
    createinvitem(hero, itlstorch);
};

func void torch_keyevent(var int key) {
    var int ptr;
    var c_item itm;

    if((key == mem_getkey("keyTorch")) || (key == mem_getsecondarykey("keyTorch"))) {
        if(infomanager_hasfinished() && (!isincamera)) {
            ptr = torch_getslotitem();
            if(ptr) {
                itm = _^(ptr);
                if(hlp_getinstanceid(itm) == itlstorchburning) {
                    if((!c_bodystatecontains(hero, bs_stand)) && (!c_bodystatecontains(hero, bs_run)) && (!c_bodystatecontains(hero, bs_walk)) && (!c_bodystatecontains(hero, bs_sneak))) {
                        print(torch_text_cannotputaway);
                    }
                    else {
                        torch_equip();
                        npc_removeinvitem(hero, itlstorchburning);
                        npc_removeinvitem(hero, itlstorch);
                    };
                }
                else if(hlp_getinstanceid(itm) != itlstorchburning) {
                    print(torch_text_lefthandoccupied);
                };
            }
            else if(npc_hasitems(hero, itlstorch) >= 1) {
                if(!npc_isinfightmode(hero, fmode_none)) {
                    print(torch_text_fightmode);
                }
                else if((!c_bodystatecontains(hero, bs_stand)) && (!c_bodystatecontains(hero, bs_run)) && (!c_bodystatecontains(hero, bs_walk)) && (!c_bodystatecontains(hero, bs_sneak))) {
                    print(torch_text_cannotweartorch);
                } 
				/*else if (c_bodystatecontains(hero, bs_run) || c_bodystatecontains(hero, bs_walk)) {
					print("Musisz siê zatrzymaæ, aby za³o¿yæ pochodniê");
				}*/
                else {
                    torch_equip();
                    npc_removeinvitems(hero, itlstorch, 2);
                };
            }
            else {
                print(torch_text_notorch);
            };
        }
        else {
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
        torch_equip();
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