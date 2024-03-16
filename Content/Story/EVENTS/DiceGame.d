func void b_dicegamedialog_s1() {
    ai_stopprocessinfos(self);
    hero.aivar[4] = true;
    player_mobsi_production = mobsi_dicegame;
    isindialog = 1;
    ai_processinfos(hero);
};

instance pc_playdicegame_end(c_info) {
    npc = pc_hero /*7728*/;
    nr = 998;
    condition = pc_playdicegame_end_condition;
    information = pc_playdicegame_end_info;
    permanent = true;
    description = "(Poddajê siê)";
};

func int pc_playdicegame_end_condition() {
    if (((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 3)) && (madestavka == false)) {
        return true;
    };
};

func void pc_playdicegame_end_info() {
    playerlost();
};

instance pc_playdicegame_stop(c_info) {
    npc = pc_hero /*7728*/;
    nr = 999;
    condition = pc_playdicegame_stop_condition;
    information = pc_playdicegame_stop_info;
    permanent = true;
    description = "(Koniec gry)";
};

func int pc_playdicegame_stop_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == false))) {
        return true;
    };
};

func void pc_playdicegame_stop_info() {
    enddicegame();
};

instance pc_playdicegame_back(c_info) {
    npc = pc_hero /*7728*/;
    nr = 999;
    condition = pc_playdicegame_back_condition;
    information = pc_playdicegame_back_info;
    permanent = true;
    description = "(Powrót)";
};

func int pc_playdicegame_back_condition() {
    if (((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) || ((player_mobsi_production == mobsi_dicegame) && (canrethrow == true))) || ((player_mobsi_production == mobsi_dicegame) && (addstavka == true))) {
        return true;
    };
};

func void pc_playdicegame_back_info() {
    if (canmadestavka == true) {
        canmadestavka = false;
    };
    if (canrethrow == true) {
        canrethrow = false;
        rethrowfirstbone = false;
        rethrowsecondbone = false;
        rethrowthirdbone = false;
        rethrowfourbone = false;
        rethrowfivebone = false;
    };
    if (addstavka == true) {
        addstavka = false;
    };
};

instance pc_playdicegame_makestavka(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_makestavka_condition;
    information = pc_playdicegame_makestavka_info;
    permanent = true;
    description = "(Obstawiam)";
};

func int pc_playdicegame_makestavka_condition() {
    if (((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == false)) && (stavka <= 4)) && (stavka != (-1))) {
        return true;
    };
};

func void pc_playdicegame_makestavka_info() {
    canmadestavka = true;
};

instance pc_playdicegame_lowstavka_1(c_info) {
    npc = pc_hero /*7728*/;
    nr = 3;
    condition = pc_playdicegame_lowstavka_1_condition;
    information = pc_playdicegame_lowstavka_info;
    permanent = true;
    description = "(Stawiam 5 bry³ek rudy)";
};

func int pc_playdicegame_lowstavka_1_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 1)) {
        return true;
    };
};

instance pc_playdicegame_lowstavka_2(c_info) {
    npc = pc_hero /*7728*/;
    nr = 3;
    condition = pc_playdicegame_lowstavka_2_condition;
    information = pc_playdicegame_lowstavka_info;
    permanent = true;
    description = "(Stawiam 35 bry³ek rudy)";
};

func int pc_playdicegame_lowstavka_2_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 2)) {
        return true;
    };
};

instance pc_playdicegame_lowstavka_3(c_info) {
    npc = pc_hero /*7728*/;
    nr = 3;
    condition = pc_playdicegame_lowstavka_3_condition;
    information = pc_playdicegame_lowstavka_info;
    permanent = true;
    description = "(Stawiam 65 bry³ek rudy)";
};

func int pc_playdicegame_lowstavka_3_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 3)) {
        return true;
    };
};

instance pc_playdicegame_lowstavka_4(c_info) {
    npc = pc_hero /*7728*/;
    nr = 3;
    condition = pc_playdicegame_lowstavka_4_condition;
    information = pc_playdicegame_lowstavka_info;
    permanent = true;
    description = "(Stawiam 95 bry³ek rudy)";
};

func int pc_playdicegame_lowstavka_4_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 4)) {
        return true;
    };
};

instance pc_playdicegame_midstavka_1(c_info) {
    npc = pc_hero /*7728*/;
    nr = 4;
    condition = pc_playdicegame_midstavka_1_condition;
    information = pc_playdicegame_midstavka_info;
    permanent = true;
    description = "(Stawiam 15 bry³ek rudy)";
};

func int pc_playdicegame_midstavka_1_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 1)) {
        return true;
    };
};

instance pc_playdicegame_midstavka_2(c_info) {
    npc = pc_hero /*7728*/;
    nr = 4;
    condition = pc_playdicegame_midstavka_2_condition;
    information = pc_playdicegame_midstavka_info;
    permanent = true;
    description = "(Stawiam 45 bry³ek rudy)";
};

func int pc_playdicegame_midstavka_2_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 2)) {
        return true;
    };
};

instance pc_playdicegame_midstavka_3(c_info) {
    npc = pc_hero /*7728*/;
    nr = 4;
    condition = pc_playdicegame_midstavka_3_condition;
    information = pc_playdicegame_midstavka_info;
    permanent = true;
    description = "(Stawiam 75 bry³ek rudy)";
};

func int pc_playdicegame_midstavka_3_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 3)) {
        return true;
    };
};

instance pc_playdicegame_midstavka_4(c_info) {
    npc = pc_hero /*7728*/;
    nr = 4;
    condition = pc_playdicegame_midstavka_4_condition;
    information = pc_playdicegame_midstavka_info;
    permanent = true;
    description = "(Stawiam 105 bry³ek rudy)";
};

func int pc_playdicegame_midstavka_4_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 4)) {
        return true;
    };
};

instance pc_playdicegame_highstavka_1(c_info) {
    npc = pc_hero /*7728*/;
    nr = 5;
    condition = pc_playdicegame_highstavka_1_condition;
    information = pc_playdicegame_highstavka_info;
    permanent = true;
    description = "(Stawiam 25 bry³ek rudy)";
};

func int pc_playdicegame_highstavka_1_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 1)) {
        return true;
    };
};

instance pc_playdicegame_highstavka_2(c_info) {
    npc = pc_hero /*7728*/;
    nr = 5;
    condition = pc_playdicegame_highstavka_2_condition;
    information = pc_playdicegame_highstavka_info;
    permanent = true;
    description = "(Stawiam 55 bry³ek rudy)";
};

func int pc_playdicegame_highstavka_2_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 2)) {
        return true;
    };
};

instance pc_playdicegame_highstavka_3(c_info) {
    npc = pc_hero /*7728*/;
    nr = 5;
    condition = pc_playdicegame_highstavka_3_condition;
    information = pc_playdicegame_highstavka_info;
    permanent = true;
    description = "(Stawiam 85 bry³ek rudy)";
};

func int pc_playdicegame_highstavka_3_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 3)) {
        return true;
    };
};

instance pc_playdicegame_highstavka_4(c_info) {
    npc = pc_hero /*7728*/;
    nr = 5;
    condition = pc_playdicegame_highstavka_4_condition;
    information = pc_playdicegame_highstavka_info;
    permanent = true;
    description = "(Stawiam 115 bry³ek rudy)";
};

func int pc_playdicegame_highstavka_4_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (canmadestavka == true)) && (stavka == 4)) {
        return true;
    };
};

func void pc_playdicegame_lowstavka_info() {
    if (stavka == 1) {
        if (npc_hasitems(other, ItmiNugget) >= 5) {
            stavka = 5;
        };
    }
    else if (stavka == 2) {
        if (npc_hasitems(other, ItmiNugget) >= 35) {
            stavka = 35;
        };
    }
    else if (stavka == 3) {
        if (npc_hasitems(other, ItmiNugget) >= 65) {
            stavka = 65;
        };
    }
    else {
        if (stavka == 4) {
            if (npc_hasitems(other, ItmiNugget) >= 95) {
                stavka = 95;
            };
        };
    };
    if (stavka > 4) {
        b_giveinvitems(other, self, itminugget, stavka);
        npc_removeinvitems(self, itminugget, stavka);
        canmadestavka = false;
        madestavka = true;
    }
    else {
        print(notenoughgold);
    };
};

func void pc_playdicegame_midstavka_info() {
    if (stavka == 1) {
        if (npc_hasitems(other, ItmiNugget) >= 15) {
            stavka = 15;
        };
    }
    else if (stavka == 2) {
        if (npc_hasitems(other, ItmiNugget) >= 45) {
            stavka = 45;
        };
    }
    else if (stavka == 3) {
        if (npc_hasitems(other, ItmiNugget) >= 75) {
            stavka = 75;
        };
    }
    else {
        if (stavka == 4) {
            if (npc_hasitems(other, ItmiNugget) >= 105) {
                stavka = 105;
            };
        };
    };
    if (stavka > 4) {
        b_giveinvitems(other, self, itminugget, stavka);
        npc_removeinvitems(self, itminugget, stavka);
        canmadestavka = false;
        madestavka = true;
    }
    else {
        print(notenoughgold);
    };
};

func void pc_playdicegame_highstavka_info() {
    if (stavka == 1) {
        if (npc_hasitems(other, ItmiNugget) >= 25) {
            stavka = 25;
        };
    }
    else if (stavka == 2) {
        if (npc_hasitems(other, ItmiNugget) >= 55) {
            stavka = 55;
        };
    }
    else if (stavka == 3) {
        if (npc_hasitems(other, ItmiNugget) >= 85) {
            stavka = 85;
        };
    }
    else {
        if (stavka == 4) {
            if (npc_hasitems(other, ItmiNugget) >= 115) {
                stavka = 115;
            };
        };
    };
    if (stavka > 4) {
        b_giveinvitems(other, self, itminugget, stavka);
        npc_removeinvitems(self, itminugget, stavka);
        canmadestavka = false;
        madestavka = true;
    }
    else {
        print(notenoughgold);
    };
};

instance pc_playdicegame_throwbones(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_throwbones_condition;
    information = pc_playdicegame_throwbones_info;
    permanent = true;
    description = "(Rzuæ koœci)";
};

func int pc_playdicegame_throwbones_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (madestavka == true)) || (((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 2)) && (stavka == (-1)))) {
        return true;
    };
};

func void throwDicesWithDelay() {
    playerturn = true;
    throwbones();
    playerturn = false;
    throwbones();
};

func void pc_playdicegame_throwbones_info() {
    snd_play("ThrowDices");
    onecount = 0;
    twocount = 0;
    threecount = 0;
    fourcount = 0;
    fivecount = 0;
    sixcount = 0;
    npconecount = 0;
    npctwocount = 0;
    npcthreecount = 0;
    npcfourcount = 0;
    npcfivecount = 0;
    npcsixcount = 0;
    FF_ApplyOnceExtGT(throwDicesWithDelay, 1000, 1);
    startdicegamematch = 3;
};

instance pc_playdicegame_continue(c_info) {
    npc = pc_hero /*7728*/;
    nr = 2;
    condition = pc_playdicegame_continue_condition;
    information = pc_playdicegame_continue_info;
    permanent = true;
    description = "(Kontynuuj grê)";
};

func int pc_playdicegame_continue_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 3)) && (canrethrow == false)) && (addstavka == false)) {
        return true;
    };
};

func void pc_playdicegame_continue_info() {
    npcrethrow();
    npcdorethrow();
    countcombination();
    startdicegamematch = 4;
};

instance pc_playdicegame_addstavka(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_addstavka_condition;
    information = pc_playdicegame_addstavka_info;
    permanent = true;
    description = "(Podnieœ stawkê)";
};

func int pc_playdicegame_addstavka_condition() {
    if ((((((((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 3)) && (canrethrow == false)) && (addstavka == false)) && (stavka != 25)) && (stavka != 55)) && (stavka != 85)) && (stavka != 115)) && (madeaddstavka == false)) && (stavka != (-1))) {
        return true;
    };
};

func void pc_playdicegame_addstavka_info() {
    addstavka = true;
};

instance pc_playdicegame_addstavka10(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_addstavka10_condition;
    information = pc_playdicegame_addstavka10_info;
    permanent = true;
    description = "(Podnieœ o 10 bry³ek rudy)";
};

func int pc_playdicegame_addstavka10_condition() {
    if (((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 3)) && (canrethrow == false)) && (addstavka == true)) && (madeaddstavka == false)) {
        return true;
    };
};

func void pc_playdicegame_addstavka10_info() {
    stavka += 10;
    b_giveinvitems(other, self, itminugget, 10);
    npc_removeinvitems(self, itminugget, 10);
    addstavka = false;
    madeaddstavka = true;
};

instance pc_playdicegame_addstavka20(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_addstavka20_condition;
    information = pc_playdicegame_addstavka20_info;
    permanent = true;
    description = "(Podnieœ o 20 bry³ek rudy";
};

func int pc_playdicegame_addstavka20_condition() {
    if (((((((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 3)) && (canrethrow == false)) && (addstavka == true)) && (stavka != 15)) && (stavka != 45)) && (stavka != 75)) && (stavka != 115)) && (madeaddstavka == false)) {
        return true;
    };
};

func void pc_playdicegame_addstavka20_info() {
    stavka += 20;
    b_giveinvitems(other, self, itminugget, 20);
    npc_removeinvitems(self, itminugget, 20);
    addstavka = false;
    madeaddstavka = true;
};

instance pc_playdicegame_rethrowbones(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_rethrowbones_condition;
    information = pc_playdicegame_rethrowbones_info;
    permanent = true;
    description = "(Pomieszaj koœci)";
};

func int pc_playdicegame_rethrowbones_condition() {
    if ((((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 3)) && (canrethrow == false)) && (addstavka == false)) {
        return true;
    };
};

func void pc_playdicegame_rethrowbones_info() {
    rethrowfirstbone = false;
    rethrowsecondbone = false;
    rethrowthirdbone = false;
    rethrowfourbone = false;
    rethrowfivebone = false;
    canrethrow = true;
};

instance pc_playdicegame_rethrowbones_first(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_rethrowbones_first_condition;
    information = pc_playdicegame_rethrowbones_first_info;
    permanent = true;
    description = "(Wybierz pierwsz¹ koœæ)";
};

func int pc_playdicegame_rethrowbones_first_condition() {
    if ((player_mobsi_production == mobsi_dicegame) && (canrethrow == true)) {
        return true;
    };
};

func void pc_playdicegame_rethrowbones_first_info() {
    rethrowfirstbone = true;
};

instance pc_playdicegame_rethrowbones_second(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_rethrowbones_second_condition;
    information = pc_playdicegame_rethrowbones_second_info;
    permanent = true;
    description = "(Wybierz drug¹ koœæ)";
};

func int pc_playdicegame_rethrowbones_second_condition() {
    if ((player_mobsi_production == mobsi_dicegame) && (canrethrow == true)) {
        return true;
    };
};

func void pc_playdicegame_rethrowbones_second_info() {
    rethrowsecondbone = true;
};

instance pc_playdicegame_rethrowbones_third(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_rethrowbones_third_condition;
    information = pc_playdicegame_rethrowbones_third_info;
    permanent = true;
    description = "(Wybierz trzeci¹ koœæ)";
};

func int pc_playdicegame_rethrowbones_third_condition() {
    if ((player_mobsi_production == mobsi_dicegame) && (canrethrow == true)) {
        return true;
    };
};

func void pc_playdicegame_rethrowbones_third_info() {
    rethrowthirdbone = true;
};

instance pc_playdicegame_rethrowbones_four(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_rethrowbones_four_condition;
    information = pc_playdicegame_rethrowbones_four_info;
    permanent = true;
    description = "(Wybierz czwart¹ koœæ)";
};

func int pc_playdicegame_rethrowbones_four_condition() {
    if ((player_mobsi_production == mobsi_dicegame) && (canrethrow == true)) {
        return true;
    };
};

func void pc_playdicegame_rethrowbones_four_info() {
    rethrowfourbone = true;
};

instance pc_playdicegame_rethrowbones_five(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_rethrowbones_five_condition;
    information = pc_playdicegame_rethrowbones_five_info;
    permanent = true;
    description = "(Wybierz pi¹t¹ koœæ)";
};

func int pc_playdicegame_rethrowbones_five_condition() {
    if ((player_mobsi_production == mobsi_dicegame) && (canrethrow == true)) {
        return true;
    };
};

func void pc_playdicegame_rethrowbones_five_info() {
    rethrowfivebone = true;
};

instance pc_playdicegame_rethrowbones_dorethrow(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_rethrowbones_dorethrow_condition;
    information = pc_playdicegame_rethrowbones_dorethrow_info;
    permanent = true;
    description = "(PotwierdŸ powtórny rzut)";
};

func int pc_playdicegame_rethrowbones_dorethrow_condition() {
    if ((player_mobsi_production == mobsi_dicegame) && (canrethrow == true)) {
        return true;
    };
};

func void rethrowDicePlayerWithDelay() {
    playerturn = true;
    if (rethrowfirstbone == true) {
        if (playerbone1 == 1) {
            onecount -= 1;
        };
        if (playerbone1 == 2) {
            twocount -= 1;
        };
        if (playerbone1 == 3) {
            threecount -= 1;
        };
        if (playerbone1 == 4) {
            fourcount -= 1;
        };
        if (playerbone1 == 5) {
            fivecount -= 1;
        };
        if (playerbone1 == 6) {
            sixcount -= 1;
        };
        throw1bone();
    };
    if (rethrowsecondbone == true) {
        if (playerbone2 == 1) {
            onecount -= 1;
        };
        if (playerbone2 == 2) {
            twocount -= 1;
        };
        if (playerbone2 == 3) {
            threecount -= 1;
        };
        if (playerbone2 == 4) {
            fourcount -= 1;
        };
        if (playerbone2 == 5) {
            fivecount -= 1;
        };
        if (playerbone2 == 6) {
            sixcount -= 1;
        };
        throw2bone();
    };
    if (rethrowthirdbone == true) {
        if (playerbone3 == 1) {
            onecount -= 1;
        };
        if (playerbone3 == 2) {
            twocount -= 1;
        };
        if (playerbone3 == 3) {
            threecount -= 1;
        };
        if (playerbone3 == 4) {
            fourcount -= 1;
        };
        if (playerbone3 == 5) {
            fivecount -= 1;
        };
        if (playerbone3 == 6) {
            sixcount -= 1;
        };
        throw3bone();
    };
    if (rethrowfourbone == true) {
        if (playerbone4 == 1) {
            onecount -= 1;
        };
        if (playerbone4 == 2) {
            twocount -= 1;
        };
        if (playerbone4 == 3) {
            threecount -= 1;
        };
        if (playerbone4 == 4) {
            fourcount -= 1;
        };
        if (playerbone4 == 5) {
            fivecount -= 1;
        };
        if (playerbone4 == 6) {
            sixcount -= 1;
        };
        throw4bone();
    };
    if (rethrowfivebone == true) {
        if (playerbone5 == 1) {
            onecount -= 1;
        };
        if (playerbone5 == 2) {
            twocount -= 1;
        };
        if (playerbone5 == 3) {
            threecount -= 1;
        };
        if (playerbone5 == 4) {
            fourcount -= 1;
        };
        if (playerbone5 == 5) {
            fivecount -= 1;
        };
        if (playerbone5 == 6) {
            sixcount -= 1;
        };
        throw5bone();
    };
    countcombination();
    playerturn = false;
};

func void rethrowDiceNPCWithDelay() {
    npcrethrow();
    npcdorethrow();
    countcombination();
};

func void pc_playdicegame_rethrowbones_dorethrow_info() {
    snd_play("ThrowDices");
    FF_ApplyOnceExtGT(rethrowDicePlayerWithDelay, 0, 1);
    FF_ApplyOnceExtGT(rethrowDiceNPCWithDelay, 0, 1);
    canrethrow = false;
    startdicegamematch = 4;
};

instance pc_playdicegame_endgame(c_info) {
    npc = pc_hero /*7728*/;
    nr = 1;
    condition = pc_playdicegame_endgame_condition;
    information = pc_playdicegame_endgame_info;
    permanent = true;
    description = "(Zakoñcz grê)";
};

func int pc_playdicegame_endgame_condition() {
    if ((player_mobsi_production == mobsi_dicegame) && (startdicegamematch == 4)) {
        return true;
    };
};

func void pc_playdicegame_endgame_info() {
    if (playercomb > npccomb) {
        playerwon();
    }
    else if (playercomb < npccomb) {
        playerlost();
    }
    else {
        playerequial();
    };
};