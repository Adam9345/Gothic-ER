var int theftdexglob;
var int theftnuggetglob;

var int countOfSteals;

var int countOfStealsForDex;

var int stealChance;

var int bonusChance;

func string b_steal_message() {
		var string steal_chance_msg;
		steal_chance_msg = "Masz ";
		steal_chance_msg = ConcatStrings(steal_chance_msg, inttostring(theftdexglob));
		steal_chance_msg = ConcatStrings(steal_chance_msg, "%");
		steal_chance_msg = ConcatStrings(steal_chance_msg, " szansy na kradzie¿");
	
		print(steal_chance_msg);
};

func void setStealChance(var C_NPC npc) {

	var C_NPC her; her = hlp_getnpc(hero);

	if(npc.guild == gil_none) {
		stealChance = her.attribute[5] / 2;
    };
    if(npc.guild == gil_ebr) {
		stealChance = her.attribute[5] / 6;
    };
    if(npc.guild == gil_grd) {
        stealChance = her.attribute[5] / 4;
    };
    if(npc.guild == gil_stt) {
        stealChance = her.attribute[5] / 3;
    };
    if(npc.guild == gil_kdf) {
        stealChance = her.attribute[5] / 6;
    };
    if(npc.guild == gil_vlk) {
        stealChance = her.attribute[5] / 2;
    };
    if(npc.guild == gil_kdw) {
        stealChance = her.attribute[5] / 6;
    };
    if(npc.guild == gil_sld) {
        stealChance = her.attribute[5] / 5;
    };
    if(npc.guild == gil_org) {
        stealChance = her.attribute[5] / 3;
    };
    if(npc.guild == gil_bau) {
        stealChance = her.attribute[5] / 2;
    };
    if(npc.guild == gil_sfb) {
        stealChance = her.attribute[5] / 2;
    };
    if(npc.guild == gil_gur) {
        stealChance = her.attribute[5] / 6;
    };
    if(npc.guild == gil_nov) {
        stealChance = her.attribute[5] / 3;
    };
    if(npc.guild == gil_tpl) {
        stealChance = her.attribute[5] / 5;
    };
    if(npc.guild == gil_dmb) {
        stealChance = her.attribute[5] / 6;
    };
    /*
    if(npc.guild == gil_bab) {
        stealChance = her.attribute[5];
    };
    */
	
	if (stealChance <= 0) {
		stealChance = 1;
	};
};

func void setStealNuggets(var int maxNuggets) {
	var int randomNuggets; 
	randomNuggets = r_MinMax(maxNuggets / 2, maxNuggets);
	
	theftnuggetglob = randomNuggets;
};

func int e_beklauen(var int theftdex, var int theftnugget) {
    if((npc_gettalentskill(other, npc_talent_pickpocket) >= 1) && (GetAdditionalAivar(self, NpcWasPickPocket) == false)) {
		
        if(npc_isinstate(self, zs_talk)) {
			setStealChance(self);

			if (npc_gettalentskill(other, npc_talent_pickpocket) == 1) {
				theftdexglob = theftdex;
			} else if (npc_gettalentskill(other, npc_talent_pickpocket) == 2) {
				theftdexglob = theftdex + stealChance + bonusChance;
			};
			
			if (theftdexglob >= 100) {
				theftdexglob = 100;
			};
			
			setStealNuggets(theftnugget);
		
        };
        return true;
    };
};

func void b_givethiefxp() {
	b_givexp(thiefxp * kapitel);
};

func void d_beklauen() {

	var int randomNumber; randomNumber = r_MinMax(1, 100);

    if(randomNumber <= theftdexglob) {
		prints_ext("Kradzie¿ udana", col_lime);
        snd_play("Geldbeutel");
        b_giveinvitems(self, other, itminugget, theftnuggetglob);
        SetAdditionalAivar(self, NpcWasPickPocket, true);
        b_givethiefxp();
		
		if (npc_gettalentskill(other, npc_talent_pickpocket) == 2) {
		
			countOfSteals += 1;
			countOfStealsForDex += 1;
		
			if (countOfStealsForDex >= 20 && other.attribute[5] < 100) {
				other.attribute[5] = other.attribute[5] + 1;
				b_raiseattribute(atr_dexterity, 1);
				countOfStealsForDex = 0;
			};
		
			if (countOfSteals >= 10) {
				bonusChance += 1;
				PrintScreen("Szansa kradzie¿y wzros³a",-1,20,"font_old_20_white.tga",4);
				countOfSteals = 0;
			};
		};
    }
    else {
		prints_ext("Kradzie¿ siê nie powiod³a", col_red);

		
        ai_stopprocessinfos(self);
		B_Say(self,other,"$DIRTYTHIEF");
	
		Npc_SetTarget(self,other);
	
		AI_StartState(self,ZS_Attack,0,"");
    };
};