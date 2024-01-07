const int PC_PickLockSkillRequired = 0;	//Set to true if player should not be able to open chests with no skill

//Custom output units - feel free to translate to your own language :)
func void Subtitles_EnhancedPickLocking () {
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_01");		//Muszê znaleŸæ odpowiedni klucz ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_02");		//Bez odpowiedniego klucza to nie zadzia³a ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_03");		//Sezamie, otwórz siê! Nic z tego ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_04");		//Klucz na pewno gdzieœ musi byæ ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_05");		//Nie otworzy siê tak po prostu ...

	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_01");		//Potrzebujê wytrycha ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_02");		//Nie otworzê tego bez wytrycha ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_03");		//Naprawdê nie otworzê tego bez wytrycha ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_04");		//Powinienem zaopatrzyæ siê w wytrychy ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_05");		//Mo¿e któryœ z handlarzy bêdzie w stanie sprzedaæ mi trochê wytrychów ...

	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_01");	//Potrzebujê wytrycha albo odpowiedniego klucza ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_02");	//Niewa¿ne jak bardzo siê staram, zamek ani drgnie ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_03");	//Nie mogê nic zrobiæ ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_04");	//Powinienem zdobyæ wytrych, albo odpowiedni klucz ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_05");	//Kto wie, gdzie mo¿e byæ ten klucz ...

	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_01");		//Nie znam siê na otwieraniu zamków ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_02");		//Powinienem nauczyæ siê otwierania zamków ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_03");		//Na prawdê nie wiem jak to otworzyæ ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_04");		//Mo¿e ... Nie bez odpowiednich umiejêtnoœci, nie otworzê tego ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_05");		//Sezamie, otwórz siê! Nic z tego ...
};

func void EnhancedPickLocking_MissingKey (var C_NPC slf) {
	if (PC_PickLockOutputVariation > 5) { PC_PickLockOutputVariation = 1; };

	//G1 vanilla output
	//EN: I need a key for that
	if (PC_PickLockOutputVariation == 1) {
		AI_OutputSVM_Overlay (slf, NULL, "$NEEDKEY");
	} else
	if (PC_PickLockOutputVariation == 2) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_02"); //Bez odpowiedniego klucza to nie zadzia³a ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_03"); //Sezamie, otwórz siê! Nic z tego ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_04"); //Klucz na pewno gdzieœ musi byæ ...
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_05"); //Nie otworzy siê tak po prostu ...
	};

	if (!Npc_HasAni (slf, "T_DONTKNOW")) {
		AI_PlayAni (slf, "T_DONTKNOW");
	};
};

func void EnhancedPickLocking_MissingLockPick (var C_NPC slf) {
	if (PC_PickLockOutputVariation > 5) { PC_PickLockOutputVariation = 1; };

	//G1 vanilla output
	//EN: No more skeleton keys
	if (PC_PickLockOutputVariation == 1) {
		AI_OutputSVM_Overlay (slf, NULL, "$NOMOREPICKS");
	} else
	if (PC_PickLockOutputVariation == 2) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_02"); //Potrzebujê wytrycha ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_03"); //Nie otworzê tego bez wytrycha ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_04"); //Powinienem zaopatrzyæ siê w wytrychy ...
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_05"); //Mo¿e któryœ z handlarzy bêdzie w stanie sprzedaæ mi trochê wytrychów ...
	};

	if (!Npc_HasAni (slf, "T_DONTKNOW")) {
		AI_PlayAni (slf, "T_DONTKNOW");
	};
};

func void EnhancedPickLocking_MissingLockPickOrKey (var C_NPC slf) {
	if (PC_PickLockOutputVariation > 5) { PC_PickLockOutputVariation = 1; };

	if (PC_PickLockOutputVariation == 1) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_01"); //Potrzebujê wytrycha albo odpowiedniego klucza ...
	} else
	if (PC_PickLockOutputVariation == 2) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_02"); //Niewa¿ne jak bardzo siê staram, zamek ani drgnie ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_03"); //Nie mogê nic zrobiæ ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_04"); //Powinienem zdobyæ wytrych, albo odpowiedni klucz ...
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_05"); //Kto wie, gdzie mo¿e byæ ten klucz ...
	};
};

func void EnhancedPickLocking_MissingSkill (var C_NPC slf) {
	if (PC_PickLockOutputVariation > 5) { PC_PickLockOutputVariation = 1; };

	if (PC_PickLockOutputVariation == 1) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_01"); //Nie znam siê na otwieraniu zamków ...
	} else
	if (PC_PickLockOutputVariation == 2) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_02"); //Powinienem nauczyæ siê otwierania zamków ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_03"); //Naprawdê nie wiem jak to otworzyæ ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_04"); //Mo¿e ... Nie bez odpowiednich umiejêtnoœci, nie otworzê 
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_05"); //Sezamie, otwórz siê! Nic z tego ...
	};

	if (!Npc_HasAni (slf, "T_DONTKNOW")) {
		AI_PlayAni (slf, "T_DONTKNOW");
	};
};