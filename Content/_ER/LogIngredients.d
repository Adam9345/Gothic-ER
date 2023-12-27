func void LogIngredients(var string title, var int recipe) {
	var int i; i = 0;

    var int ptr; ptr = create (recipe);
	var c_recipe rec; rec = _^(ptr);

    var c_item recItem; recItem = _^(itm_getptr(rec.recipeitem));

    var int s; s = SB_New();

    SB(recItem.name);
    SB(" - ");

    //while(i < rec.totalrequired);
    repeat(i, rec.totalrequired);
        var c_item recIngr; recIngr = _^(itm_getptr(mem_readintarray(_@(rec.requireditem), i)));
        SBi(mem_readintarray(_@(rec.requireditemamount), i));
        SB("x ");
        SB(recIngr.name);
        if (i == rec.totalrequired - 1) {
            SB(".");
        } else {
            SB(", ");
        };
        //i += 1;
    end;

    Log_CreateTopic	(title,	LOG_NOTE);
	B_LogEntry(title,SB_ToString()); 

    SB_Destroy();
};