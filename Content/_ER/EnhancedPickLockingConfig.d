const int PC_PickLockSkillRequired = 0;	//Set to true if player should not be able to open chests with no skill

//Custom output units - feel free to translate to your own language :)
func void Subtitles_EnhancedPickLocking () {
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_01");		//Musz� znale�� odpowiedni klucz ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_02");		//Bez odpowiedniego klucza to nie zadzia�a ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_03");		//Sezamie, otw�rz si�! Nic z tego ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_04");		//Klucz na pewno gdzie� musi by� ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingKey_15_05");		//Nie otworzy si� tak po prostu ...

	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_01");		//Potrzebuj� wytrycha ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_02");		//Nie otworz� tego bez wytrycha ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_03");		//Naprawd� nie otworz� tego bez wytrycha ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_04");		//Powinienem zaopatrzy� si� w wytrychy ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPick_15_05");		//Mo�e kt�ry� z handlarzy b�dzie w stanie sprzeda� mi troch� wytrych�w ...

	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_01");	//Potrzebuj� wytrycha albo odpowiedniego klucza ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_02");	//Niewa�ne jak bardzo si� staram, zamek ani drgnie ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_03");	//Nie mog� nic zrobi� ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_04");	//Powinienem zdoby� wytrych, albo odpowiedni klucz ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_05");	//Kto wie, gdzie mo�e by� ten klucz ...

	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_01");		//Nie znam si� na otwieraniu zamk�w ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_02");		//Powinienem nauczy� si� otwierania zamk�w ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_03");		//Na prawd� nie wiem jak to otworzy� ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_04");		//Mo�e ... Nie bez odpowiednich umiej�tno�ci, nie otworz� tego ...
	AI_Output (self, self, "DIA_EnhancedPickLocking_MissingSkill_15_05");		//Sezamie, otw�rz si�! Nic z tego ...
};

func void EnhancedPickLocking_MissingKey (var C_NPC slf) {
	if (PC_PickLockOutputVariation > 5) { PC_PickLockOutputVariation = 1; };

	//G1 vanilla output
	//EN: I need a key for that
	if (PC_PickLockOutputVariation == 1) {
		AI_OutputSVM_Overlay (slf, NULL, "$NEEDKEY");
	} else
	if (PC_PickLockOutputVariation == 2) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_02"); //Bez odpowiedniego klucza to nie zadzia�a ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_03"); //Sezamie, otw�rz si�! Nic z tego ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_04"); //Klucz na pewno gdzie� musi by� ...
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingKey_15_05"); //Nie otworzy si� tak po prostu ...
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
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_02"); //Potrzebuj� wytrycha ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_03"); //Nie otworz� tego bez wytrycha ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_04"); //Powinienem zaopatrzy� si� w wytrychy ...
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPick_15_05"); //Mo�e kt�ry� z handlarzy b�dzie w stanie sprzeda� mi troch� wytrych�w ...
	};

	if (!Npc_HasAni (slf, "T_DONTKNOW")) {
		AI_PlayAni (slf, "T_DONTKNOW");
	};
};

func void EnhancedPickLocking_MissingLockPickOrKey (var C_NPC slf) {
	if (PC_PickLockOutputVariation > 5) { PC_PickLockOutputVariation = 1; };

	if (PC_PickLockOutputVariation == 1) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_01"); //Potrzebuj� wytrycha albo odpowiedniego klucza ...
	} else
	if (PC_PickLockOutputVariation == 2) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_02"); //Niewa�ne jak bardzo si� staram, zamek ani drgnie ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_03"); //Nie mog� nic zrobi� ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_04"); //Powinienem zdoby� wytrych, albo odpowiedni klucz ...
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingLockPickOrKey_15_05"); //Kto wie, gdzie mo�e by� ten klucz ...
	};
};

func void EnhancedPickLocking_MissingSkill (var C_NPC slf) {
	if (PC_PickLockOutputVariation > 5) { PC_PickLockOutputVariation = 1; };

	if (PC_PickLockOutputVariation == 1) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_01"); //Nie znam si� na otwieraniu zamk�w ...
	} else
	if (PC_PickLockOutputVariation == 2) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_02"); //Powinienem nauczy� si� otwierania zamk�w ...
	} else
	if (PC_PickLockOutputVariation == 3) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_03"); //Naprawd� nie wiem jak to otworzy� ...
	} else
	if (PC_PickLockOutputVariation == 4) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_04"); //Mo�e ... Nie bez odpowiednich umiej�tno�ci, nie otworz� 
	} else
	if (PC_PickLockOutputVariation == 5) {
		AI_OutputSVM_Overlay (slf, NULL, "DIA_EnhancedPickLocking_MissingSkill_15_05"); //Sezamie, otw�rz si�! Nic z tego ...
	};

	if (!Npc_HasAni (slf, "T_DONTKNOW")) {
		AI_PlayAni (slf, "T_DONTKNOW");
	};
};