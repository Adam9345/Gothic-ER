func void dicegametable_hide() {
    var int i;
    var int hnd;

    if(dicegameTable_renderview != 0) {
        render_remove(dicegameTable_renderview);
        dicegameTable_renderview = 0;
    };
};

func void enddicegame() {

	dicegametable_hide();

    ai_stopprocessinfos(self);
    hero.aivar[4] = false;

    player_mobsi_production = mobsi_none;

    startdicegamematch = 0;
    isindialog = 0;
    madeaddstavka = 0;
    madestavka = 0;
    addstavka = 0;
    musttellresult = true;
    playercombination = "";
    npccombination = "";
    printscreen(playercombination, 41, 68, font_screensmall, showprintscreentime);
    printscreen(npccombination, 41, 29, font_screensmall, showprintscreentime);

	printscreen("", 30, 71, font_symbols, showprintscreentime);
    printscreen("", 39, 71, font_symbols, showprintscreentime);
    printscreen("", 48, 71, font_symbols, showprintscreentime);
    printscreen("", 57, 71, font_symbols, showprintscreentime);
    printscreen("", 66, 71, font_symbols, showprintscreentime);
    printscreen("", 30, 21, font_symbols, showprintscreentime);
    printscreen("", 39, 21, font_symbols, showprintscreentime);
    printscreen("", 48, 21, font_symbols, showprintscreentime);
    printscreen("", 57, 21, font_symbols, showprintscreentime);
    printscreen("", 66, 21, font_symbols, showprintscreentime);

    playercomb = 0;
    npccomb = 0;
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
};

func void playerwon() {
    gameresult = -1;
    snd_play("Geldbeutel");
    print("Wygra³eœ!");
    if (stavka != (-1)) {
        createinvitems(dicegameenemy, itminugget, stavka * 2);
        b_giveinvitems(dicegameenemy, other, itminugget, stavka * 2);
    };

    /*
    if ((hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(draal)) && (playeddraalstart < 1)) {
        playeddraalstart = 1;
        npc_exchangeroutine(pal_261_gerold, "TALK");
        log_settopicstatus(topic_dicegameagainstbored, log_success);
        b_logentry(topic_dicegameagainstbored, "Ogra³em Draala!");
        mis_dicegameagainstbored = log_success;
        checkquestach();
    };
    if ((hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(vlk_4109_kristofer)) && (playerwonkristofer == 0)) {
        playerwonkristofer = 1;
    }
    else if (hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(gorvij)) {
        gorvijwonmoney += stavka;
    }
    else if (hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(parlaf)) {
        parlafwonmoney += stavka;
    }
    else {
        if (hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(brutus)) {
            brutuswonmoney += stavka;
        };
    };
    ach_dicegamelack += 1;
    if ((ach_dicegamelack > 9) && (ach_dicegamelack_received == false)) {
        givexpbonus(200, dicegamelack_name, dicegamelack_desc);
        ach_dicegamelack_received = true;
    };
    */
    enddicegame();
};

func void playerlost() {
    gameresult = 1;
    print("Przegra³eœ!");
    /*
    if ((hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(draal)) && (playeddraalstart < 1)) {
        playeddraalstart = 2;
        npc_exchangeroutine(pal_261_gerold, "TALK");
        log_settopicstatus(topic_dicegameagainstbored, log_success);
        b_logentry(topic_dicegameagainstbored, "Niestety, przegra³em z Draalem.");
        mis_dicegameagainstbored = log_success;
        checkquestach();
    };
    if ((hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(kristofer)) && (playerwonkristofer == 0)) {
        playerwonkristofer = 2;
    };
    if (hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(gorvij)) {
        gorvijlostmoney += stavka;
    };
    if (hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(parlaf)) {
        parlaflostmoney += stavka;
    };
    if (hlp_getinstanceid(dicegameenemy) == hlp_getinstanceid(brutus)) {
        brutuslostmoney += stavka;
    };
    ach_dicegamelack = 0;
    */

    enddicegame();
};

func void playerequial() {
    print("Remis!");
    if (stavka != (-1)) {
        createinvitems(dicegameenemy, itminugget, stavka);
        b_giveinvitems(dicegameenemy, other, itminugget, stavka);
    };
    startdicegamematch = 2;
};

func void countcombination() {
    if (playerturn == true) {
        playercomb = 0;
        playercombination = "U ciebie ";
        if (playercomb == 0) {
            if ((((((onecount == 3) || (twocount == 3)) || (threecount == 3)) || (fourcount == 3)) || (fivecount == 3)) || (sixcount == 3)) {
                if (onecount == 3) {
                    if (twocount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '1' i '2'");
                        playercomb = 24;
                    }
                    else if (threecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '1' i '3'");
                        playercomb = 21;
                    }
                    else if (fourcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '1' i '4'");
                        playercomb = 26;
                    }
                    else if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '1' i '5'");
                        playercomb = 27;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '1' i '6'");
                        playercomb = 28;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Trójka z '1'");
                        playercomb = 16;
                    };
                }
                else if (twocount == 3) {
                    if (onecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '2' i '1'");
                        playercomb = 24;
                    }
                    else if (threecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '2' i '3'");
                        playercomb = 26;
                    }
                    else if (fourcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '2' i '4'");
                        playercomb = 27;
                    }
                    else if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '2' i '5'");
                        playercomb = 28;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '2' i '6'");
                        playercomb = 29;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Trójka z '2'");
                        playercomb = 17;
                    };
                }
                else if (threecount == 3) {
                    if (onecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '3' i '1'");
                        playercomb = 21;
                    }
                    else if (twocount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '3' i '2'");
                        playercomb = 26;
                    }
                    else if (fourcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '3' i '4'");
                        playercomb = 28;
                    }
                    else if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '3' i '5'");
                        playercomb = 29;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '3' i '6'");
                        playercomb = 30;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Trójka z '3'");
                        playercomb = 18;
                    };
                }
                else if (fourcount == 3) {
                    if (onecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '4' i '1'");
                        playercomb = 26;
                    }
                    else if (twocount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '4' i '2'");
                        playercomb = 27;
                    }
                    else if (threecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '4' i '3'");
                        playercomb = 28;
                    }
                    else if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '4' i '5'");
                        playercomb = 30;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '4' i '6'");
                        playercomb = 31;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Trójka z '4'");
                        playercomb = 19;
                    };
                }
                else if (fivecount == 3) {
                    if (onecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '5' i '1'");
                        playercomb = 27;
                    }
                    else if (twocount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '5' i '2'");
                        playercomb = 28;
                    }
                    else if (threecount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '5' i '3'");
                        playercomb = 29;
                    }
                    else if (fourcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '5' i '4'");
                        playercomb = 30;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Full z '5' i '6'");
                        playercomb = 32;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Trójka z '5'");
                        playercomb = 20;
                    };
                }
                else if (onecount == 2) {
                    playercombination = concatstrings(playercombination, "Full z '6' i '1'");
                    playercomb = 28;
                }
                else if (twocount == 2) {
                    playercombination = concatstrings(playercombination, "Full z '6' i '2'");
                    playercomb = 29;
                }
                else if (threecount == 2) {
                    playercombination = concatstrings(playercombination, "Full z '6' i '3'");
                    playercomb = 30;
                }
                else if (fourcount == 2) {
                    playercombination = concatstrings(playercombination, "Full z '6' i '4'");
                    playercomb = 31;
                }
                else if (fivecount == 2) {
                    playercombination = concatstrings(playercombination, "Full z '6' i '5'");
                    playercomb = 32;
                }
                else {
                    playercombination = concatstrings(playercombination, "Trójka z '6'");
                    playercomb = 21;
                };
            };
        };
        if (playercomb == 0) {
            if ((((((onecount == 2) || (twocount == 2)) || (threecount == 2)) || (fourcount == 2)) || (fivecount == 2)) || (sixcount == 2)) {
                if (onecount == 2) {
                    if (twocount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '1' i '2'");
                        playercomb = 7;
                    }
                    else if (threecount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '1' i '3'");
                        playercomb = 8;
                    }
                    else if (fourcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '1' i '4'");
                        playercomb = 9;
                    }
                    else if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '1' i '5'");
                        playercomb = 10;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '1' i '6'");
                        playercomb = 11;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Para z '1'");
                        playercomb = 1;
                    };
                }
                else if (twocount == 2) {
                    if (threecount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '2' i '3'");
                        playercomb = 9;
                    }
                    else if (fourcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '2' i '4'");
                        playercomb = 10;
                    }
                    else if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '2' i '5'");
                        playercomb = 11;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '2' i '6'");
                        playercomb = 12;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Para z '2'");
                        playercomb = 2;
                    };
                }
                else if (threecount == 2) {
                    if (fourcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '3' i '4'");
                        playercomb = 11;
                    }
                    else if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '3' i '5'");
                        playercomb = 12;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '3' i '6'");
                        playercomb = 13;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Para z '3'");
                        playercomb = 3;
                    };
                }
                else if (fourcount == 2) {
                    if (fivecount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '4' i '5'");
                        playercomb = 13;
                    }
                    else if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '4' i '6'");
                        playercomb = 14;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Para z '4'");
                        playercomb = 4;
                    };
                }
                else if (fivecount == 2) {
                    if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Dwie pary z '5' i '6'");
                        playercomb = 15;
                    }
                    else {
                        playercombination = concatstrings(playercombination, "Para z '5'");
                        playercomb = 5;
                    };
                }
                else {
                    if (sixcount == 2) {
                        playercombination = concatstrings(playercombination, "Para z '6'");
                        playercomb = 6;
                    };
                };
            };
        };
        if (playercomb == 0) {
            if (((((onecount == 1) && (twocount == 1)) && (threecount == 1)) && (fourcount == 1)) && (fivecount == 1)) {
                playercombination = concatstrings(playercombination, "Ma³y Street");
                playercomb = 22;
            };
        };
        if (playercomb == 0) {
            if (((((twocount == 1) && (threecount == 1)) && (fourcount == 1)) && (fivecount == 1)) && (sixcount == 1)) {
                playercombination = concatstrings(playercombination, "Du¿y Street");
                playercomb = 23;
            };
        };
        if (playercomb == 0) {
            if ((((((onecount == 4) || (twocount == 4)) || (threecount == 4)) || (fourcount == 4)) || (fivecount == 4)) || (sixcount == 4)) {
                playercombination = concatstrings(playercombination, "Kareta z ");
                if (onecount == 4) {
                    playercombination = concatstrings(playercombination, "'1'");
                    playercomb = 33;
                }
                else if (twocount == 4) {
                    playercombination = concatstrings(playercombination, "'2'");
                    playercomb = 34;
                }
                else if (threecount == 4) {
                    playercombination = concatstrings(playercombination, "'3'");
                    playercomb = 35;
                }
                else if (fourcount == 4) {
                    playercombination = concatstrings(playercombination, "'4'");
                    playercomb = 36;
                }
                else if (fivecount == 4) {
                    playercombination = concatstrings(playercombination, "'5'");
                    playercomb = 37;
                }
                else {
                    playercombination = concatstrings(playercombination, "'6'");
                    playercomb = 38;
                };
            };
        };
        if (playercomb == 0) {
            if ((((((onecount == 5) || (twocount == 5)) || (threecount == 5)) || (fourcount == 5)) || (fivecount == 5)) || (sixcount == 5)) {
                playercombination = concatstrings(playercombination, "Poker z ");
                if (onecount == 5) {
                    playercombination = concatstrings(playercombination, "'1'");
                    playercomb = 39;
                }
                else if (twocount == 5) {
                    playercombination = concatstrings(playercombination, "'2'");
                    playercomb = 40;
                }
                else if (threecount == 5) {
                    playercombination = concatstrings(playercombination, "'3'");
                    playercomb = 41;
                }
                else if (fourcount == 5) {
                    playercombination = concatstrings(playercombination, "'4'");
                    playercomb = 42;
                }
                else if (fivecount == 5) {
                    playercombination = concatstrings(playercombination, "'5'");
                    playercomb = 43;
                }
                else {
                    playercombination = concatstrings(playercombination, "'6'");
                    playercomb = 44;
                };
            };
        };
        if (playercomb == 0) {
            playercombination = concatstrings(playercombination, "Nic");
        };
        printscreen(playercombination, 41, 68, font_screensmall, showprintscreentime);
    }
    else {
        npccomb = 0;
        npccombination = "Przeciwnik ma ";
        if (npccomb == 0) {
            if ((((((npconecount == 3) || (npctwocount == 3)) || (npcthreecount == 3)) || (npcfourcount == 3)) || (npcfivecount == 3)) || (npcsixcount == 3)) {
                if (npconecount == 3) {
                    if (npctwocount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '1' i '2'");
                        npccomb = 24;
                    }
                    else if (npcthreecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '1' i '3'");
                        npccomb = 21;
                    }
                    else if (npcfourcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '1' i '4'");
                        npccomb = 26;
                    }
                    else if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '1' i '5'");
                        npccomb = 27;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '1' i '6'");
                        npccomb = 28;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Trójka z '1'");
                        npccomb = 16;
                    };
                }
                else if (npctwocount == 3) {
                    if (npconecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '2' i '1'");
                        npccomb = 24;
                    }
                    else if (npcthreecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '2' i '3'");
                        npccomb = 26;
                    }
                    else if (npcfourcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '2' i '4'");
                        npccomb = 27;
                    }
                    else if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '2' i '5'");
                        npccomb = 28;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '2' i '6'");
                        npccomb = 29;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Trójka z '2'");
                        npccomb = 17;
                    };
                }
                else if (npcthreecount == 3) {
                    if (npconecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '3' i '1'");
                        npccomb = 21;
                    }
                    else if (npctwocount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '3' i '2'");
                        npccomb = 26;
                    }
                    else if (npcfourcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '3' i '4'");
                        npccomb = 28;
                    }
                    else if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '3' i '5'");
                        npccomb = 29;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '3' i '6'");
                        npccomb = 30;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Trójka z '3'");
                        npccomb = 18;
                    };
                }
                else if (npcfourcount == 3) {
                    if (npconecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '4' i '1'");
                        npccomb = 26;
                    }
                    else if (npctwocount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '4' i '2'");
                        npccomb = 27;
                    }
                    else if (npcthreecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '4' i '3'");
                        npccomb = 28;
                    }
                    else if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '4' i '5'");
                        npccomb = 30;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '4' i '6'");
                        npccomb = 31;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Trójka z '4'");
                        npccomb = 19;
                    };
                }
                else if (npcfivecount == 3) {
                    if (npconecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '5' i '1'");
                        npccomb = 27;
                    }
                    else if (npctwocount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '5' i '2'");
                        npccomb = 28;
                    }
                    else if (npcthreecount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '5' i '3'");
                        npccomb = 29;
                    }
                    else if (npcfourcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '5' i '4'");
                        npccomb = 30;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Full z '5' i '6'");
                        npccomb = 32;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Trójka z '5'");
                        npccomb = 20;
                    };
                }
                else if (npconecount == 2) {
                    npccombination = concatstrings(npccombination, "Full z '6' i '1'");
                    npccomb = 28;
                }
                else if (npctwocount == 2) {
                    npccombination = concatstrings(npccombination, "Full z '6' i '2'");
                    npccomb = 29;
                }
                else if (npcthreecount == 2) {
                    npccombination = concatstrings(npccombination, "Full z '6' i '3'");
                    npccomb = 30;
                }
                else if (npcfourcount == 2) {
                    npccombination = concatstrings(npccombination, "Full z '6' i '4'");
                    npccomb = 31;
                }
                else if (npcfivecount == 2) {
                    npccombination = concatstrings(npccombination, "Full z '6' i '5'");
                    npccomb = 32;
                }
                else {
                    npccombination = concatstrings(npccombination, "Trójka z '6'");
                    npccomb = 21;
                };
            };
        };
        if (npccomb == 0) {
            if ((((((npconecount == 2) || (npctwocount == 2)) || (npcthreecount == 2)) || (npcfourcount == 2)) || (npcfivecount == 2)) || (npcsixcount == 2)) {
                if (npconecount == 2) {
                    if (npctwocount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '1' i '2'");
                        npccomb = 7;
                    }
                    else if (npcthreecount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '1' i '3'");
                        npccomb = 8;
                    }
                    else if (npcfourcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '1' i '4'");
                        npccomb = 9;
                    }
                    else if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '1' i '5'");
                        npccomb = 10;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '1' i '6'");
                        npccomb = 11;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Para z '1'");
                        npccomb = 1;
                    };
                }
                else if (npctwocount == 2) {
                    if (npcthreecount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '2' i '3'");
                        npccomb = 9;
                    }
                    else if (npcfourcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '2' i '4'");
                        npccomb = 10;
                    }
                    else if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '2' i '5'");
                        npccomb = 11;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '2' i '6'");
                        npccomb = 12;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Para z '2'");
                        npccomb = 2;
                    };
                }
                else if (npcthreecount == 2) {
                    if (npcfourcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '3' i '4'");
                        npccomb = 11;
                    }
                    else if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '3' i '5'");
                        npccomb = 12;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '3' i '6'");
                        npccomb = 13;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Para z '3'");
                        npccomb = 3;
                    };
                }
                else if (npcfourcount == 2) {
                    if (npcfivecount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '4' i '5'");
                        npccomb = 13;
                    }
                    else if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '4' i '6'");
                        npccomb = 14;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Para z '4'");
                        npccomb = 4;
                    };
                }
                else if (npcfivecount == 2) {
                    if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Dwie pary z '5' i '6'");
                        npccomb = 15;
                    }
                    else {
                        npccombination = concatstrings(npccombination, "Para z '5'");
                        npccomb = 5;
                    };
                }
                else {
                    if (npcsixcount == 2) {
                        npccombination = concatstrings(npccombination, "Para z '6'");
                        npccomb = 6;
                    };
                };
            };
        };
        if (npccomb == 0) {
            if (((((npconecount == 1) && (npctwocount == 1)) && (npcthreecount == 1)) && (npcfourcount == 1)) && (npcfivecount == 1)) {
                npccombination = concatstrings(npccombination, "Ma³y Street");
                npccomb = 22;
            };
        };
        if (npccomb == 0) {
            if (((((npctwocount == 1) && (npcthreecount == 1)) && (npcfourcount == 1)) && (npcfivecount == 1)) && (npcsixcount == 1)) {
                npccombination = concatstrings(npccombination, "Du¿y Street");
                npccomb = 23;
            };
        };
        if (npccomb == 0) {
            if ((((((npconecount == 4) || (npctwocount == 4)) || (npcthreecount == 4)) || (npcfourcount == 4)) || (npcfivecount == 4)) || (npcsixcount == 4)) {
                npccombination = concatstrings(npccombination, "Kareta z ");
                if (npconecount == 4) {
                    npccombination = concatstrings(npccombination, "'1'");
                    npccomb = 33;
                }
                else if (npctwocount == 4) {
                    npccombination = concatstrings(npccombination, "'2'");
                    npccomb = 34;
                }
                else if (npcthreecount == 4) {
                    npccombination = concatstrings(npccombination, "'3'");
                    npccomb = 35;
                }
                else if (npcfourcount == 4) {
                    npccombination = concatstrings(npccombination, "'4'");
                    npccomb = 36;
                }
                else if (npcfivecount == 4) {
                    npccombination = concatstrings(npccombination, "'5'");
                    npccomb = 37;
                }
                else {
                    npccombination = concatstrings(npccombination, "'6'");
                    npccomb = 38;
                };
            };
        };
        if (npccomb == 0) {
            if ((((((npconecount == 5) || (npctwocount == 5)) || (npcthreecount == 5)) || (npcfourcount == 5)) || (npcfivecount == 5)) || (npcsixcount == 5)) {
                npccombination = concatstrings(npccombination, "Poker z ");
                if (npconecount == 5) {
                    npccombination = concatstrings(npccombination, "'1'");
                    npccomb = 39;
                }
                else if (npctwocount == 5) {
                    npccombination = concatstrings(npccombination, "'2'");
                    npccomb = 40;
                }
                else if (npcthreecount == 5) {
                    npccombination = concatstrings(npccombination, "'3'");
                    npccomb = 41;
                }
                else if (npcfourcount == 5) {
                    npccombination = concatstrings(npccombination, "'4'");
                    npccomb = 42;
                }
                else if (npcfivecount == 5) {
                    npccombination = concatstrings(npccombination, "'5'");
                    npccomb = 43;
                }
                else {
                    npccombination = concatstrings(npccombination, "'6'");
                    npccomb = 44;
                };
            };
        };
        if (npccomb == 0) {
            npccombination = concatstrings(npccombination, "nic");
        };
        printscreen(npccombination, 41, 29, font_screensmall, showprintscreentime);
    };
};

func void npcrethrow() {
    npcbone1rethrow = false;
    npcbone2rethrow = false;
    npcbone3rethrow = false;
    npcbone4rethrow = false;
    npcbone5rethrow = false;
    if ((((((((((((npccomb < 39) && (npccomb != 22)) && (npccomb != 23)) && (npccomb != 24)) && (npccomb != 21)) && (npccomb != 26)) && (npccomb != 27)) && (npccomb != 28)) && (npccomb != 29)) && (npccomb != 30)) && (npccomb != 31)) && (npccomb != 32)) {
        if (npccomb >= 33) {
            if (npccomb == 33) {
                if (npcbone1 != 1) {
                    npcbone1rethrow = true;
                }
                else if (npcbone2 != 1) {
                    npcbone2rethrow = true;
                }
                else if (npcbone3 != 1) {
                    npcbone3rethrow = true;
                }
                else if (npcbone4 != 1) {
                    npcbone4rethrow = true;
                }
                else {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 34) {
                if (npcbone1 != 2) {
                    npcbone1rethrow = true;
                }
                else if (npcbone2 != 2) {
                    npcbone2rethrow = true;
                }
                else if (npcbone3 != 2) {
                    npcbone3rethrow = true;
                }
                else if (npcbone4 != 2) {
                    npcbone4rethrow = true;
                }
                else {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 35) {
                if (npcbone1 != 3) {
                    npcbone1rethrow = true;
                }
                else if (npcbone2 != 3) {
                    npcbone2rethrow = true;
                }
                else if (npcbone3 != 3) {
                    npcbone3rethrow = true;
                }
                else if (npcbone4 != 3) {
                    npcbone4rethrow = true;
                }
                else {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 36) {
                if (npcbone1 != 4) {
                    npcbone1rethrow = true;
                }
                else if (npcbone2 != 4) {
                    npcbone2rethrow = true;
                }
                else if (npcbone3 != 4) {
                    npcbone3rethrow = true;
                }
                else if (npcbone4 != 4) {
                    npcbone4rethrow = true;
                }
                else {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 37) {
                if (npcbone1 != 5) {
                    npcbone1rethrow = true;
                }
                else if (npcbone2 != 5) {
                    npcbone2rethrow = true;
                }
                else if (npcbone3 != 5) {
                    npcbone3rethrow = true;
                }
                else if (npcbone4 != 5) {
                    npcbone4rethrow = true;
                }
                else {
                    npcbone5rethrow = true;
                };
            }
            else if (npcbone1 != 6) {
                npcbone1rethrow = true;
            }
            else if (npcbone2 != 6) {
                npcbone2rethrow = true;
            }
            else if (npcbone3 != 6) {
                npcbone3rethrow = true;
            }
            else if (npcbone4 != 6) {
                npcbone4rethrow = true;
            }
            else {
                npcbone5rethrow = true;
            };
        }
        else if ((npccomb <= 21) && (npccomb >= 16)) {
            if (npccomb == 16) {
                if (npcbone1 != 1) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 1) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 1) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 1) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 1) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 17) {
                if (npcbone1 != 2) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 2) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 2) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 2) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 2) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 18) {
                if (npcbone1 != 3) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 3) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 3) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 3) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 3) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 19) {
                if (npcbone1 != 4) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 4) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 4) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 4) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 4) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 20) {
                if (npcbone1 != 5) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 5) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 5) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 5) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 5) {
                    npcbone5rethrow = true;
                };
            }
            else {
                if (npcbone1 != 6) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 6) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 6) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 6) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 6) {
                    npcbone5rethrow = true;
                };
            };
        }
        else if ((npccomb >= 7) && (npccomb <= 15)) {
            if (npccomb == 7) {
                if ((npconecount == 2) && (npctwocount == 2)) {
                    if ((npcbone1 != 1) && (npcbone1 != 2)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 1) && (npcbone2 != 2)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 1) && (npcbone3 != 2)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 1) && (npcbone4 != 2)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 1) && (npcbone5 != 2)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else if (npccomb == 8) {
                if ((npconecount == 2) && (npcthreecount == 2)) {
                    if ((npcbone1 != 1) && (npcbone1 != 3)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 1) && (npcbone2 != 3)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 1) && (npcbone3 != 3)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 1) && (npcbone4 != 3)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 1) && (npcbone5 != 3)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else if (npccomb == 9) {
                if ((npconecount == 2) && (npcfourcount == 2)) {
                    if ((npcbone1 != 1) && (npcbone1 != 4)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 1) && (npcbone2 != 4)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 1) && (npcbone3 != 4)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 1) && (npcbone4 != 4)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 1) && (npcbone5 != 4)) {
                        npcbone5rethrow = true;
                    };
                };
                if ((npctwocount == 2) && (npcthreecount == 2)) {
                    if ((npcbone1 != 2) && (npcbone1 != 3)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 2) && (npcbone2 != 3)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 2) && (npcbone3 != 3)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 2) && (npcbone4 != 3)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 2) && (npcbone5 != 3)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else if (npccomb == 10) {
                if ((npconecount == 2) && (npcfivecount == 2)) {
                    if ((npcbone1 != 1) && (npcbone1 != 5)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 1) && (npcbone2 != 5)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 1) && (npcbone3 != 5)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 1) && (npcbone4 != 5)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 1) && (npcbone5 != 5)) {
                        npcbone5rethrow = true;
                    };
                };
                if ((npctwocount == 2) && (npcfourcount == 2)) {
                    if ((npcbone1 != 2) && (npcbone1 != 4)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 2) && (npcbone2 != 4)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 2) && (npcbone3 != 4)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 2) && (npcbone4 != 4)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 2) && (npcbone5 != 4)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else if (npccomb == 11) {
                if ((npconecount == 2) && (npcsixcount == 2)) {
                    if ((npcbone1 != 1) && (npcbone1 != 6)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 1) && (npcbone2 != 6)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 1) && (npcbone3 != 6)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 1) && (npcbone4 != 6)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 1) && (npcbone5 != 6)) {
                        npcbone5rethrow = true;
                    };
                };
                if ((npctwocount == 2) && (npcfivecount == 2)) {
                    if ((npcbone1 != 2) && (npcbone1 != 5)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 2) && (npcbone2 != 5)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 2) && (npcbone3 != 5)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 2) && (npcbone4 != 5)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 2) && (npcbone5 != 5)) {
                        npcbone5rethrow = true;
                    };
                };
                if ((npcthreecount == 2) && (npcfourcount == 2)) {
                    if ((npcbone1 != 3) && (npcbone1 != 4)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 3) && (npcbone2 != 4)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 3) && (npcbone3 != 4)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 3) && (npcbone4 != 4)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 3) && (npcbone5 != 4)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else if (npccomb == 12) {
                if ((npctwocount == 2) && (npcsixcount == 2)) {
                    if ((npcbone1 != 2) && (npcbone1 != 6)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 2) && (npcbone2 != 6)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 2) && (npcbone3 != 6)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 2) && (npcbone4 != 6)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 2) && (npcbone5 != 6)) {
                        npcbone5rethrow = true;
                    };
                };
                if ((npcthreecount == 2) && (npcfivecount == 2)) {
                    if ((npcbone1 != 3) && (npcbone1 != 5)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 3) && (npcbone2 != 5)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 3) && (npcbone3 != 5)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 3) && (npcbone4 != 5)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 3) && (npcbone5 != 5)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else if (npccomb == 13) {
                if ((npcfourcount == 2) && (npcfivecount == 2)) {
                    if ((npcbone1 != 4) && (npcbone1 != 5)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 4) && (npcbone2 != 5)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 4) && (npcbone3 != 5)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 4) && (npcbone4 != 5)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 4) && (npcbone5 != 5)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else if (npccomb == 14) {
                if ((npcfourcount == 2) && (npcsixcount == 2)) {
                    if ((npcbone1 != 4) && (npcbone1 != 6)) {
                        npcbone1rethrow = true;
                    };
                    if ((npcbone2 != 4) && (npcbone2 != 6)) {
                        npcbone2rethrow = true;
                    };
                    if ((npcbone3 != 4) && (npcbone3 != 6)) {
                        npcbone3rethrow = true;
                    };
                    if ((npcbone4 != 4) && (npcbone4 != 6)) {
                        npcbone4rethrow = true;
                    };
                    if ((npcbone5 != 4) && (npcbone5 != 6)) {
                        npcbone5rethrow = true;
                    };
                };
            }
            else {
                if (npccomb == 15) {
                    if ((npcfivecount == 2) && (npcsixcount == 2)) {
                        if ((npcbone1 != 5) && (npcbone1 != 6)) {
                            npcbone1rethrow = true;
                        };
                        if ((npcbone2 != 5) && (npcbone2 != 6)) {
                            npcbone2rethrow = true;
                        };
                        if ((npcbone3 != 5) && (npcbone3 != 6)) {
                            npcbone3rethrow = true;
                        };
                        if ((npcbone4 != 5) && (npcbone4 != 6)) {
                            npcbone4rethrow = true;
                        };
                        if ((npcbone5 != 5) && (npcbone5 != 6)) {
                            npcbone5rethrow = true;
                        };
                    };
                };
            };
        }
        else if ((npccomb > 0) && (npccomb <= 6)) {
            if (npccomb == 1) {
                if (npcbone1 != 1) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 1) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 1) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 1) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 1) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 2) {
                if (npcbone1 != 2) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 2) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 2) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 2) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 2) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 3) {
                if (npcbone1 != 3) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 3) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 3) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 3) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 3) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 4) {
                if (npcbone1 != 4) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 4) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 4) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 4) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 4) {
                    npcbone5rethrow = true;
                };
            }
            else if (npccomb == 5) {
                if (npcbone1 != 5) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 5) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 5) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 5) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 5) {
                    npcbone5rethrow = true;
                };
            }
            else {
                if (npcbone1 != 6) {
                    npcbone1rethrow = true;
                };
                if (npcbone2 != 6) {
                    npcbone2rethrow = true;
                };
                if (npcbone3 != 6) {
                    npcbone3rethrow = true;
                };
                if (npcbone4 != 6) {
                    npcbone4rethrow = true;
                };
                if (npcbone5 != 6) {
                    npcbone5rethrow = true;
                };
            };
        };
    }
    else {
    };
};

func void throw1bone() {
    if (playerturn == true) {
        playerbone1 = hlp_random(5);
        playerbone1 += 1;
        if (playerbone1 == 1) {
            onecount += 1;
        };
        if (playerbone1 == 2) {
            twocount += 1;
        };
        if (playerbone1 == 3) {
            threecount += 1;
        };
        if (playerbone1 == 4) {
            fourcount += 1;
        };
        if (playerbone1 == 5) {
            fivecount += 1;
        };
        if (playerbone1 == 6) {
            sixcount += 1;
        };
        printscreen(inttostring(playerbone1), 30, 71, font_symbols, showprintscreentime);
    }
    else {
        npcbone1 = hlp_random(5);
        npcbone1 += 1;
        if (npcbone1 == 1) {
            npconecount += 1;
        };
        if (npcbone1 == 2) {
            npctwocount += 1;
        };
        if (npcbone1 == 3) {
            npcthreecount += 1;
        };
        if (npcbone1 == 4) {
            npcfourcount += 1;
        };
        if (npcbone1 == 5) {
            npcfivecount += 1;
        };
        if (npcbone1 == 6) {
            npcsixcount += 1;
        };
        printscreen(inttostring(npcbone1), 30, 21, font_symbols, showprintscreentime);
    };
};

func void throw2bone() {
    if (playerturn == true) {
        playerbone2 = hlp_random(5);
        playerbone2 += 1;
        if (playerbone2 == 1) {
            onecount += 1;
        };
        if (playerbone2 == 2) {
            twocount += 1;
        };
        if (playerbone2 == 3) {
            threecount += 1;
        };
        if (playerbone2 == 4) {
            fourcount += 1;
        };
        if (playerbone2 == 5) {
            fivecount += 1;
        };
        if (playerbone2 == 6) {
            sixcount += 1;
        };
        printscreen(inttostring(playerbone2), 39, 71, font_symbols, showprintscreentime);
    }
    else {
        npcbone2 = hlp_random(5);
        npcbone2 += 1;
        if (npcbone2 == 1) {
            npconecount += 1;
        };
        if (npcbone2 == 2) {
            npctwocount += 1;
        };
        if (npcbone2 == 3) {
            npcthreecount += 1;
        };
        if (npcbone2 == 4) {
            npcfourcount += 1;
        };
        if (npcbone2 == 5) {
            npcfivecount += 1;
        };
        if (npcbone2 == 6) {
            npcsixcount += 1;
        };
        printscreen(inttostring(npcbone2), 39, 21, font_symbols, showprintscreentime);
    };
};

func void throw3bone() {
    if (playerturn == true) {
        playerbone3 = hlp_random(5);
        playerbone3 += 1;
        if (playerbone3 == 1) {
            onecount += 1;
        };
        if (playerbone3 == 2) {
            twocount += 1;
        };
        if (playerbone3 == 3) {
            threecount += 1;
        };
        if (playerbone3 == 4) {
            fourcount += 1;
        };
        if (playerbone3 == 5) {
            fivecount += 1;
        };
        if (playerbone3 == 6) {
            sixcount += 1;
        };
        printscreen(inttostring(playerbone3), 48, 71, font_symbols, showprintscreentime);
    }
    else {
        npcbone3 = hlp_random(5);
        npcbone3 += 1;
        if (npcbone3 == 1) {
            npconecount += 1;
        };
        if (npcbone3 == 2) {
            npctwocount += 1;
        };
        if (npcbone3 == 3) {
            npcthreecount += 1;
        };
        if (npcbone3 == 4) {
            npcfourcount += 1;
        };
        if (npcbone3 == 5) {
            npcfivecount += 1;
        };
        if (npcbone3 == 6) {
            npcsixcount += 1;
        };
        printscreen(inttostring(npcbone3), 48, 21, font_symbols, showprintscreentime);
    };
};

func void throw4bone() {
    if (playerturn == true) {
        playerbone4 = hlp_random(5);
        playerbone4 += 1;
        if (playerbone4 == 1) {
            onecount += 1;
        };
        if (playerbone4 == 2) {
            twocount += 1;
        };
        if (playerbone4 == 3) {
            threecount += 1;
        };
        if (playerbone4 == 4) {
            fourcount += 1;
        };
        if (playerbone4 == 5) {
            fivecount += 1;
        };
        if (playerbone4 == 6) {
            sixcount += 1;
        };
        printscreen(inttostring(playerbone4), 57, 71, font_symbols, showprintscreentime);
    }
    else {
        npcbone4 = hlp_random(5);
        npcbone4 += 1;
        if (npcbone4 == 1) {
            npconecount += 1;
        };
        if (npcbone4 == 2) {
            npctwocount += 1;
        };
        if (npcbone4 == 3) {
            npcthreecount += 1;
        };
        if (npcbone4 == 4) {
            npcfourcount += 1;
        };
        if (npcbone4 == 5) {
            npcfivecount += 1;
        };
        if (npcbone4 == 6) {
            npcsixcount += 1;
        };
        printscreen(inttostring(npcbone4), 57, 21, font_symbols, showprintscreentime);
    };
};

func void throw5bone() {
    if (playerturn == true) {
        playerbone5 = hlp_random(5);
        playerbone5 += 1;
        if (playerbone5 == 1) {
            onecount += 1;
        };
        if (playerbone5 == 2) {
            twocount += 1;
        };
        if (playerbone5 == 3) {
            threecount += 1;
        };
        if (playerbone5 == 4) {
            fourcount += 1;
        };
        if (playerbone5 == 5) {
            fivecount += 1;
        };
        if (playerbone5 == 6) {
            sixcount += 1;
        };
        printscreen(inttostring(playerbone5), 66, 71, font_symbols, showprintscreentime);
    }
    else {
        npcbone5 = hlp_random(5);
        npcbone5 += 1;
        if (npcbone5 == 1) {
            npconecount += 1;
        };
        if (npcbone5 == 2) {
            npctwocount += 1;
        };
        if (npcbone5 == 3) {
            npcthreecount += 1;
        };
        if (npcbone5 == 4) {
            npcfourcount += 1;
        };
        if (npcbone5 == 5) {
            npcfivecount += 1;
        };
        if (npcbone5 == 6) {
            npcsixcount += 1;
        };
        printscreen(inttostring(npcbone5), 66, 21, font_symbols, showprintscreentime);
    };
};

func void throwbones() {
    throw1bone();
    throw2bone();
    throw3bone();
    throw4bone();
    throw5bone();
    countcombination();
};

func void npcdorethrow() {
    if (npcbone1rethrow == true) {
        if (npcbone1 == 1) {
            npconecount -= 1;
        };
        if (npcbone1 == 2) {
            npctwocount -= 1;
        };
        if (npcbone1 == 3) {
            npcthreecount -= 1;
        };
        if (npcbone1 == 4) {
            npcfourcount -= 1;
        };
        if (npcbone1 == 5) {
            npcfivecount -= 1;
        };
        if (npcbone1 == 6) {
            npcsixcount -= 1;
        };
        throw1bone();
    };
    if (npcbone2rethrow == true) {
        if (npcbone2 == 1) {
            npconecount -= 1;
        };
        if (npcbone2 == 2) {
            npctwocount -= 1;
        };
        if (npcbone2 == 3) {
            npcthreecount -= 1;
        };
        if (npcbone2 == 4) {
            npcfourcount -= 1;
        };
        if (npcbone2 == 5) {
            npcfivecount -= 1;
        };
        if (npcbone2 == 6) {
            npcsixcount -= 1;
        };
        throw2bone();
    };
    if (npcbone3rethrow == true) {
        if (npcbone3 == 1) {
            npconecount -= 1;
        };
        if (npcbone3 == 2) {
            npctwocount -= 1;
        };
        if (npcbone3 == 3) {
            npcthreecount -= 1;
        };
        if (npcbone3 == 4) {
            npcfourcount -= 1;
        };
        if (npcbone3 == 5) {
            npcfivecount -= 1;
        };
        if (npcbone3 == 6) {
            npcsixcount -= 1;
        };
        throw3bone();
    };
    if (npcbone4rethrow == true) {
        if (npcbone4 == 1) {
            npconecount -= 1;
        };
        if (npcbone4 == 2) {
            npctwocount -= 1;
        };
        if (npcbone4 == 3) {
            npcthreecount -= 1;
        };
        if (npcbone4 == 4) {
            npcfourcount -= 1;
        };
        if (npcbone4 == 5) {
            npcfivecount -= 1;
        };
        if (npcbone4 == 6) {
            npcsixcount -= 1;
        };
        throw4bone();
    };
    if (npcbone5rethrow == true) {
        if (npcbone5 == 1) {
            npconecount -= 1;
        };
        if (npcbone5 == 2) {
            npctwocount -= 1;
        };
        if (npcbone5 == 3) {
            npcthreecount -= 1;
        };
        if (npcbone5 == 4) {
            npcfourcount -= 1;
        };
        if (npcbone5 == 5) {
            npcfivecount -= 1;
        };
        if (npcbone5 == 6) {
            npcsixcount -= 1;
        };
        throw5bone();
    };
};