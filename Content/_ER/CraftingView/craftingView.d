func int render_additemcenterpxl(var int iteminst, var int x1, var int y1, var int w, var int h) {
    return render_additemcenter(iteminst, print_tovirtual(x1, ps_x), print_tovirtual(y1, ps_y), print_tovirtual(w, ps_x), print_tovirtual(h, ps_y));
};
func void render_top(var int ptr) {
    var renderitem itm;

    itm = get(ptr);
    if(itm.itmptr) {
        viewptr_top(getPtr(itm.view));
    };
};

func void craftingview_hide() {
    var int i;
    var int hnd;

    if(craftingview_renderdlg != 0) {
        render_remove(craftingview_renderdlg);
        craftingview_renderdlg = 0;
    };
    if(craftingview_renderitem != 0) {
        render_remove(craftingview_renderitem);
        craftingview_renderitem = 0;
    };
    repeat(i, 8);
    hnd = mem_readintarray(_@(craftingviewtext), i);
    if(hlp_isvalidhandle(hnd)) {
        print_deletetext(hnd);
    };
    end;

    craftingview_isopen = false;
};

func int recipe_getrequirediteminstance(var c_recipe rec, var int id) {
    return mem_readintarray(_@(rec.requireditem), id);
};

func int hlp_isitemgroup(var int inst) {
    if((inst == hlp_getinstanceid(itgr_meat)) || (inst == hlp_getinstanceid(itgr_meatraw)) || (inst == hlp_getinstanceid(itgr_meatfried)) || (inst == hlp_getinstanceid(itgr_vegetable))) {
        return true;
    }
    else {
        return false;
    };
};

func int npc_hasitemgroup(var c_npc npc, var int groupinstance) {
    var int itm_counter;
    var c_item itemgroup;
    var int i;

    itm_counter = 0;
    itemgroup = _^(itm_getptr(groupinstance));
    repeat(i, itemgroup.value);
    if((groupinstance == hlp_getinstanceid(itgr_meat)) && (mem_readintarray(_@(itemgroup_meat_ignoremask), i) == false)) {
        //printd(cs2("ignore meat", i2s(i)));
    }
    else if((groupinstance == hlp_getinstanceid(itgr_vegetable)) && (mem_readintarray(_@(itemgroup_vegetable_ignoremask), i) == false)) {
        //printd(cs2("ignore vege", i2s(i)));
    }
    else {
        itm_counter += npc_hasitems(npc, mem_readintarray(itemgroup.hp, i));
    };
    end;
    return itm_counter;
};

func int recipe_isrequireditemmultiuse(var c_recipe rec, var int id) {
    return mem_readintarray(_@(rec.reqitem_ismultiuse), id);
};

func int recipe_getrequireditemamount(var c_recipe rec, var int id) {
    return mem_readintarray(_@(rec.requireditemamount), id);
};

func void craftingview_show(var int recinst, var int mode, var int amount) {
    var int yquartsize;
    var int fh;
    var int scalef;
    var int textyposh;
    var int textypos;
    var int textxpos;
    var int textcenter;
    var int windowwidth;
    var int windowheight;
    var c_item recitem;
    var int ptr;
    var c_recipe rec;
    var int cv_tabptr;
    var int s;
    var c_item currentitem;
    var int offset;
    var int i;
    var int invitems;
    var int color;
    var int textarrayptr;
    var int countarrayptr;
    var int j;
    var int count;
    var string armor_text;

    cv_currentitem = recinst;
    cv_currentmode = mode;
    cv_currentamount = amount;
    print_getscreensize();
    yquartsize = print_screen[1] / 4;
    craftingview_hide();
    fh = print_getfontheight(text_font_default);
    scalef = bar_getinterfacescaling();
    textyposh = (print_screen[1] / 2) + (yquartsize / 2) - roundf(mulf(mkf(90), scalef-1));
    textypos = (print_screen[1] / 2) + (yquartsize / 2) - 90;
    textxpos = (print_screen / 2) - roundf(mulf(mkf(200), scalef-1));
    textcenter = print_screen / 2;
    windowwidth = roundf(mulf(mkf(800), scalef));
    windowheight = roundf(mulf(mkf(200), scalef));
    craftingview_dlg = view_createcenterpxl(print_screen / 2, (print_screen[1] / 2) + (yquartsize / 2), windowwidth, windowheight);
    view_settexture(craftingview_dlg, "DLG_CHOICE.TGA");
    craftingview_renderdlg = render_addview(craftingview_dlg);
    render_top(craftingview_renderdlg);

    if (windowwidth > 1000) {
        textypos = (print_screen[1] / 2) + (yquartsize / 2) - 90;
    } else {
        textypos = (print_screen[1] / 2) + (yquartsize / 2) - 60;
    };

    if(mode != 2) {
        ptr = create (recinst);

        rec = _^ (ptr);
        if (windowwidth > 1000) {

            craftingview_renderitem = render_additemcenterpxl(rec.recipeitem, (print_screen / 2) - roundf(mulf(mkf(-100), scalef)), (print_screen[1] / 2) + (yquartsize / 2 +  + roundf(mulf(mkf(470), scalef))), windowheight-30, windowheight-30);

        } else {
            craftingview_renderitem = render_additemcenterpxl(rec.recipeitem, (print_screen / 2) - roundf(mulf(mkf(-400), scalef)), (print_screen[1] / 2) + (yquartsize / 2 +  + roundf(mulf(mkf(650), scalef))), windowheight-30, windowheight-30);
        };
        render_top(craftingview_renderitem);

        render_openview(craftingview_renderitem);
        recitem = _^(itm_getptr(rec.recipeitem));
        cv_tabptr = _@s(txt_craftingviewtab);
        if(craftingview_selectedtab == cv_ingredientstab) {
            craftingviewtext = print_extpxl(textcenter - print_getstringwidth(mem_readstringarray(cv_tabptr, 0), text_font_default) - 10, textyposh, mem_readstringarray(cv_tabptr, 0), text_font_default, col_white, -1);
            craftingviewtext[1] = print_extpxl(textcenter + 10, textyposh, mem_readstringarray(cv_tabptr, 1), text_font_default, col_gray, -1);
            offset = 6 - rec.totalrequired / 2;

            repeat(i, rec.totalrequired);
            s = sb_new();
            currentitem = _^(itm_getptr(recipe_getrequirediteminstance(rec, i)));
            if(hlp_isitemgroup(recipe_getrequirediteminstance(rec, i)) == true) {
                invitems = npc_hasitemgroup(hero, recipe_getrequirediteminstance(rec, i));
            }
            else {
                invitems = npc_hasitems(hero, recipe_getrequirediteminstance(rec, i));
            };
            sb(currentitem.name);
            sb(": ");
            sbi(invitems);
            sb("/");
            if(recipe_isrequireditemmultiuse(rec, i) || !recipe_isrequireditemmultiuse(rec, i)) {
                sbi(recipe_getrequireditemamount(rec, i));
                if(invitems > recipe_getrequireditemamount(rec, i)) {
                    //color = rgba(100, 200, 255, 255);
                    color = rgba(50, 255, 50, 255);
                } else if(invitems < recipe_getrequireditemamount(rec, i)) {
                    color = rgba(255, 50, 50, 255);
                }
                else {
                    color = rgba(50, 255, 50, 255);
                };
            } else
            if(invitems >= (recipe_getrequireditemamount(rec, i) * amount)) {
                sbi(recipe_getrequireditemamount(rec, i) * amount);
                color = rgba(50, 255, 50, 255);
            }
            else {
                color = rgba(255, 50, 50, 255);
            };
            //mem_writeintarray(_@(craftingviewtext), i + 2 + offset, print_extpxl(textxpos, textypos + (fh * i + 1 + offset), sb_tostring(), text_font_default, color, -1));
            mem_writeintarray(_@(craftingviewtext), i + 2, print_extpxl(textxpos, textypos + (fh * i + 1), sb_tostring(), text_font_default, color, -1));
            sb_destroy();
            end;
        }
        else 
        if(craftingview_selectedtab == cv_propertiestab) {
            craftingviewtext = print_extpxl(textcenter - print_getstringwidth(mem_readstringarray(cv_tabptr, 0), text_font_default) - 10, textyposh, mem_readstringarray(cv_tabptr, 0), text_font_default, col_gray, -1);
            craftingviewtext[1] = print_extpxl(textcenter + 10, textyposh, mem_readstringarray(cv_tabptr, 1), text_font_default, col_white, -1);
            textarrayptr = _@s(recitem.text);
            countarrayptr = _@(recitem.count);
            repeat(j, itm_text_max);
            count = mem_readintarray(countarrayptr, j);
            s = sb_new();
            sb(mem_readstringarray(textarrayptr, j));
            if(count != 0) {
                sb(" ");
                sbi(count);
            };
            mem_writeintarray(_@(craftingviewtext), j + 2, print_extpxl(textxpos, textypos + (fh * j + 1), sb_tostring(), text_font_default, col_white, -1));
            sb_destroy();
            end;
        };
    }
    else {
        recitem = _^(itm_getptr(recinst));
        craftingview_renderitem = render_additemcenterpxl(recinst, (print_screen / 2) - roundf(mulf(mkf(300), scalef)), (print_screen[1] / 2) + (yquartsize / 2), windowheight, windowheight);
        render_top(craftingview_renderitem);
        render_openview(craftingview_renderitem);
        armor_text = i2s(mem_readintarray(_@(recitem.protection), prot_blunt));
        craftingviewtext[1] = print_extpxl(textxpos, textypos + (fh * 1), cs3(name_prot_blunt, " ", armor_text), text_font_default, col_white, -1);
        armor_text = i2s(mem_readintarray(_@(recitem.protection), prot_edge));
        craftingviewtext[2] = print_extpxl(textxpos, textypos + (fh * 2), cs3(name_prot_edge, " ", armor_text), text_font_default, col_white, -1);
        armor_text = i2s(mem_readintarray(_@(recitem.protection), prot_point));
        craftingviewtext[3] = print_extpxl(textxpos, textypos + (fh * 3), cs3(name_prot_point, " ", armor_text), text_font_default, col_white, -1);
        armor_text = i2s(mem_readintarray(_@(recitem.protection), prot_fire));
        craftingviewtext[4] = print_extpxl(textxpos, textypos + (fh * 4), cs3(name_prot_fire, " ", armor_text), text_font_default, col_white, -1);
        armor_text = i2s(mem_readintarray(_@(recitem.protection), prot_magic));
        craftingviewtext[5] = print_extpxl(textxpos, textypos + (fh * 5), cs3(name_prot_magic, " ", armor_text), text_font_default, col_white, -1);
    };

    craftingview_isopen = true;
};

func void craftingview_tabswitcher() {
    var int key; key = esi;

    if(craftingview_isopen == true) {
        if(cv_currentmode != 2) {
            if((key == mem_getkey("keyLeft")) || (key == mem_getkey("keyRight")) || (key == mem_getsecondarykey("keyLeft")) || (key == mem_getsecondarykey("keyRight")) || (key == mem_getkey("keyStrafeLeft")) || (key == mem_getkey("keyStrafeRight")) || (key == mem_getsecondarykey("keyStrafeLeft")) || (key == mem_getsecondarykey("keyStrafeRight"))) {
                if(craftingview_selectedtab == 0) {
                    craftingview_selectedtab = 1;
                }
                else {
                    craftingview_selectedtab = 0;
                };
                craftingview_show(cv_currentitem, cv_currentmode, cv_currentamount);
            };
        };
    };
};

func int pc_craftrecipeitem_max(var int recipeinst) {
    var int ptr;
    var c_recipe rec;
    var int check;
    var int max;
    var int i;
    var int invitems;

    ptr = create(recipeinst);
    rec = _^(ptr);
    check = 0;
    max = 99999;
    repeat(i, rec.totalrequired);
    if(hlp_isitemgroup(recipe_getrequirediteminstance(rec, i)) == true) {
        invitems = npc_hasitemgroup(hero, recipe_getrequirediteminstance(rec, i));
    }
    else {
        invitems = npc_hasitems(hero, recipe_getrequirediteminstance(rec, i));
    };
    if(recipe_isrequireditemmultiuse(rec, i)) {
        if(invitems < recipe_getrequireditemamount(rec, i)) {
            check = 0;
        }
        else {
            check = max;
        };
    }
    else {
        check = invitems / recipe_getrequireditemamount(rec, i);
    };
    if(check < max) {
        max = check;
    };
    end;
    return max;
};

func void craftingview_update() {
    var zcviewdialogchoice dlg;
    var int choiceview;
    var zcarray arr;
    var int nextposy;
    var int i;
    var int p;
    var string dlgfont;
    var c_npc slf;
    var c_npc her;
    var int infoptr;
    var ocinfo dlginstance;
    const int cinfo_mgr_mode_important = 0;
    const int cinfo_mgr_mode_info = 1;
    const int cinfo_mgr_mode_choice = 2;
    const int cinfo_mgr_mode_trade = 3;
    var int len;
    var int index;
    var string dlgdescription;
    var int dlgnr;
    var int j;
    var zclist l;
    var int list;
    var ocinfochoice dlgchoice;
    var int armor_check;
    var int choiceiteminstance;
    var int max;
    var string dlg_all;

    dlg = _^(mem_informationman.dlgchoice);
    choiceview = mem_informationman.dlgchoice;
    if(dlg.isactivated == 1) {
        if(craftingviewlastchoice != dlg.choiceselected) {
            arr = _^(choiceview + 172);
            if(arr.array) {
                nextposy = 0;
                i = 0;
                p = mem_stackpos.position;
                if(i < dlg.choices) {
                    slf = _^(mem_informationman.npc);
                    her = _^(mem_informationman.player);
                    infoptr = 0;
                    if(mem_informationman.mode == cinfo_mgr_mode_info) {
                        infoptr = ocinfomanager_getinfounimportant(slf, her, i);
                    }
                    else if(mem_informationman.mode == cinfo_mgr_mode_choice) {
                        infoptr = mem_informationman.info;
                    };
                    if(infoptr) {
                        dlginstance = _^(infoptr);
                        dlgdescription = dlginstance.description;
                        if(mem_informationman.mode == cinfo_mgr_mode_choice) {
                            if(dlginstance.listchoices_next) {
                                j = 0;
                                list = dlginstance.listchoices_next;
                                while(list);
                                l = _^(list);
                                dlgchoice = _^(l.data);
                                if(i == j) {
                                    dlgdescription = dlgchoice.text;
                                };
                                list = l.next;
                                j += 1;
                                end;
                            };
                        };
                        dlgnr = dlginstance.nr;
                        if(i == dlg.choiceselected) {
                            //armor_check = craftingview_checkarmors(dlgdescription);
                            if(mem_informationman.mode == cinfo_mgr_mode_choice) {
                                choiceiteminstance = -1;
                                if(potionalchemy_instance != (-1)) {
                                    choiceiteminstance = potionalchemy_instance;
                                }
                                else if(scroll_writing_instance != (-1)) {
                                    choiceiteminstance = scroll_writing_instance;
                                }
                                else if(cookingmeals_instance != (-1)) {
                                    choiceiteminstance = cookingmeals_instance;
                                };
                                if(choiceiteminstance != (-1)) {
                                    max = pc_craftrecipeitem_max(choiceiteminstance);
                                    dlg_all = cs4(dialog_all, " (", i2s(max), ")");
                                    if(str_toint(dlgdescription) > 0) {
                                        craftingview_show(choiceiteminstance, 1, str_toint(dlgdescription));
                                    }
                                    else if(str_toint(str_split(dlgdescription, ".", 0)) > 0) {
                                        craftingview_show(choiceiteminstance, 1, str_toint(str_split(dlgdescription, ".", 0)));
                                    }
                                    else if(hlp_strcmp(dlgdescription, dlg_all)) {
                                        craftingview_show(choiceiteminstance, 1, max);
                                    }
                                    else {
                                        craftingview_hide();
                                    };
                                }
                                /*
                                else if(armor_check != (-1)) {
                                    craftingview_show(armor_check, 2, 1);
                                }
                                */
                                else {
                                    craftingview_hide();
                                };
                            }
                            else if((dlgnr >= start_weapon_dlg_nr) && (dlgnr < start_weapon_dlg_nr + 100)) {
                                craftingview_show(mem_readintarray(_@(weaponrecipeinstance), dlgnr - start_weapon_dlg_nr), 0, 1);
                            }
                            else if((dlgnr >= start_potion_dlg_nr) && (dlgnr < start_potion_dlg_nr + 100)) {
                                craftingview_show(mem_readintarray(_@(potionrecipeinstance), dlgnr - start_potion_dlg_nr), 1, 1);
                            }
                            else if((dlgnr >= start_meal_dlg_nr) && (dlgnr < start_meal_dlg_nr + 100)) {
                                craftingview_show(mem_readintarray(_@(mealrecipeinstance), dlgnr - start_meal_dlg_nr), 1, 1);
                            }
                            else if((dlgnr >= start_scroll_dlg_nr) && (dlgnr < start_scroll_dlg_nr + 100)) {
                                craftingview_show(mem_readintarray(_@(scrollrecipeinstance), dlgnr - start_scroll_dlg_nr), 1, 1);
                            }
                            else if((dlgnr >= start_armor_dlg_nr) && (dlgnr < start_armor_dlg_nr + 100)) {
                                craftingview_show(mem_readintarray(_@(armorrecipeinstance), dlgnr - start_armor_dlg_nr), 1, 1);
                            }
                            else if((dlgnr >= start_other_dlg_nr) && (dlgnr < start_other_dlg_nr + 100)) {
                                craftingview_show(mem_readintarray(_@(otherrecipeinstance), dlgnr - start_other_dlg_nr), 1, 1);
                            }
                            /*
                            else if(armor_check != (-1)) {
                                craftingview_show(armor_check, 2, 1);
                            }
                            */
                            else if(craftingview_isopen == true) {
                                craftingview_hide();
                            };
                        };
                    };
                    i += 1;
                    mem_stackpos.position = p;
                };
            };
        };
        craftingviewlastchoice = dlg.choiceselected;
    }
    else if(craftingview_isopen == true) {
        craftingview_hide();
    };
};

func void Init_CraftingSystem() {
    const int once = 0;

    if (!once) {
        hookenginef(ocgame__handleevent_dfltcase, 6, craftingview_tabswitcher);

        hookenginef(ocinformationmanager__update, 5, craftingview_update);

        craftingview_setuprecipesarray();

        once = 1;
    };
};