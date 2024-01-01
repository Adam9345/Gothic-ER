func void dicegametable_show() {
	var int yquartsize;
	var int windowwidth;
    var int windowheight;

	dicegametable_hide();

	dicegameTable_view = view_createcenterpxl(print_screen / 2, (print_screen[1] / 2) + (yquartsize / 2), print_screen, print_screen[1]);
    view_settexture(dicegameTable_view, "POCKERTABLE.TGA");
    dicegameTable_renderview = render_addview(dicegameTable_view);
    render_top(dicegameTable_renderview);
};

func void playdicegame(var int chosenstavka, var c_npc enemy) {
    //wld_playeffect("dicegameTABLE", hero, hero, 0, 0, 0, false)

	dicegametable_show();

    printscreen("7", 30, 71, font_symbols, showprintscreentime);
    printscreen("7", 39, 71, font_symbols, showprintscreentime);
    printscreen("7", 48, 71, font_symbols, showprintscreentime);
    printscreen("7", 57, 71, font_symbols, showprintscreentime);
    printscreen("7", 66, 71, font_symbols, showprintscreentime);
    printscreen("7", 30, 21, font_symbols, showprintscreentime);
    printscreen("7", 39, 21, font_symbols, showprintscreentime);
    printscreen("7", 48, 21, font_symbols, showprintscreentime);
    printscreen("7", 57, 21, font_symbols, showprintscreentime);
    printscreen("7", 66, 21, font_symbols, showprintscreentime);
    stavka = chosenstavka;
    dicegameenemy = hlp_getnpc(enemy);
    startdicegamematch = 1;

	AI_StopProcessInfos(self);
};