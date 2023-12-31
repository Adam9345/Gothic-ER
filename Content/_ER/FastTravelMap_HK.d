func void fastTravelMap_OnKey() {
	var int key; key = esi;
	
	if (InfoManager_hasFinished() && NPC_HasItems(hero, FastTravelMap) >= 1) {
		if (key == mem_getkey("keyFastTravelMap")) {
			if (C_BodyStateContains(hero,BS_STAND)){
				AI_UseItem(hero, FastTravelMap);
			};
		};
	};
};

func void init_fasttravelkey() {
	if (!mem_gothoptexists("KEYS", "keyFastTravelMap")) {
		mem_setkey("keyFastTravelMap", KEY_U);
	};
};

func void Init_FastTravelMap_HK() 
{
    const int once = 0;

    if (!once) {
		init_fasttravelkey();
		
        hookenginef(MEMINT_SwitchG1G2(6684404, 7328820), 6, fastTravelMap_OnKey);

        once = 1;
    };
};