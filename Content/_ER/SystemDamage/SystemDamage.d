func int DMG_OnDmg_Easy(var int victimPtr, var int attackerPtr, var int dmg, var int dmgDescriptorPtr) {
	var oSDamageDescriptor dmgDesc; dmgDesc = _^(dmgDescriptorPtr);

	var C_NPC attInst;
	var C_NPC victimInst; 

	if (attackerPtr) {
		attInst = _^(attackerPtr);
	};

	if (victimInst) {
		victimInst = _^(victimPtr);
	};

	if (Hlp_IsValidNpc (attInst)) {
		var C_ITEM weapon; weapon = Npc_GetReadiedWeapon(attInst);

		var int scaleDexDmg; scaleDexDmg = 0;

		var int randomNumber; randomNumber = r_MinMax(1, 100);

		var int chanceCrit; chanceCrit = 0;

		if (Hlp_GetInstanceID(attInst) == Hlp_GetInstanceID(hero)
		&& Hlp_IsValidItem(weapon)) {
			if (weapon.flags & ITEM_BOW) {

				var int bowTalent; bowTalent = Npc_GetTalentValue(attInst, NPC_TALENT_BOW);

				if (bowTalent < 30) {
					chanceCrit = 10;
				} else if (bowTalent < 60) {
					chanceCrit = 30;
				} else if (bowTalent < 90) {
					chanceCrit = 60;
				} else {
					chanceCrit = 75;
				};
				
				if (weapon.damagetype & DAM_POINT) {
					if (randomNumber <= chanceCrit) {

						if (bowTalent >= 30) {
							scaleDexDmg = 2 * weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_POINT];
						} else {
							scaleDexDmg = 2 * (weapon.damageTotal / 2 + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_POINT]) - 1;
						};

						// if (scaleDexDmg < 5) {
						// 	scaleDexDmg = 5 * 2;
						// };
						
					} else {
						if (bowTalent >= 30) {
							scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_POINT];
						} else {
							scaleDexDmg = weapon.damageTotal / 2 + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_POINT] - 3;
						};
					};

				} else if(weapon.damagetype & DAM_BLUNT) {
					if (randomNumber <= chanceCrit) {

						if (bowTalent >= 30) {
							scaleDexDmg = 2 * weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_BLUNT];
						} else {
							scaleDexDmg = 2 * (weapon.damageTotal / 2 + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_BLUNT]) - 1;
						};

						// if (scaleDexDmg < 5) {
						// 	scaleDexDmg = 5 * 2;
						// };

					} else {

						if (bowTalent >= 30) {
							scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_BLUNT];
						} else {
							scaleDexDmg = weapon.damageTotal / 2 + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_BLUNT] - 3;
						};

						//scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_BLUNT];
					};
				};

				if (scaleDexDmg < 0) {
					scaleDexDmg = 0;
				};

				if (dmgDesc.SpellID > 0)
				{
					return dmg;
				};

				return scaleDexDmg;
			} else if (weapon.flags & ITEM_CROSSBOW) {

				var int crossBowTalent; crossBowTalent = Npc_GetTalentValue(attInst, NPC_TALENT_CROSSBOW);

				if (crossBowTalent < 30) {
					chanceCrit = 10;
				} else if (crossBowTalent < 60) {
					chanceCrit = 30;
				} else if (crossBowTalent < 90) {
					chanceCrit = 60;
				} else {
					chanceCrit = 75;
				};

				if (randomNumber <= chanceCrit) {
					if (crossBowTalent >= 30) {
						scaleDexDmg = 2 * weapon.damageTotal + attInst.attribute[ATR_STRENGTH] - victimInst.protection[PROT_POINT];
					} else {
						scaleDexDmg = 2 * (weapon.damageTotal / 2 + attInst.attribute[ATR_STRENGTH] - victimInst.protection[PROT_POINT]) - 1;
					};

					if (scaleDexDmg < 0) {
						scaleDexDmg = 0;
					};

				} else {
					if (crossBowTalent >= 30) {
						scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_STRENGTH] - victimInst.protection[PROT_POINT];
					} else {
						scaleDexDmg = weapon.damageTotal / 2 + attInst.attribute[ATR_STRENGTH] - victimInst.protection[PROT_POINT]- 3;
					};
					//scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_STRENGTH] / 2 - victimInst.protection[PROT_POINT];
				};

				if (scaleDexDmg < 0) {
					scaleDexDmg = 0;
				};

				if (dmgDesc.SpellID > 0)
				{
					return dmg;
				};

				return scaleDexDmg;
			} else if (weapon.flags & ITEM_SWD && (weapon.cond_atr[2] == ATR_DEXTERITY || weapon.cond_atr[1] == ATR_DEXTERITY)) {	
					
				var int oneHandedTalent; oneHandedTalent = Npc_GetTalentValue(attInst, NPC_TALENT_1H);

				if (oneHandedTalent < 30) {
					chanceCrit = 10;
				} else if (oneHandedTalent < 60) {
					chanceCrit = 30;
				} else if(oneHandedTalent < 90) {
					chanceCrit = 60;
				} else {
					chanceCrit = 75;
				};

				if (randomNumber <= chanceCrit) {
					
					if (oneHandedTalent >= 30) {
						scaleDexDmg = 2 * weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_EDGE];
					} else {
						scaleDexDmg = 2 * (weapon.damageTotal / 2 + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_EDGE]) - 1;
					};

					//scaleDexDmg = 2 * (weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_EDGE]);

					if (scaleDexDmg < 0) {
						scaleDexDmg = 0;
					};

				} else {
					if (oneHandedTalent >= 30) {
						scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_EDGE];
					} else {
						scaleDexDmg = weapon.damageTotal / 2 + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_EDGE] - 3;
					};
				};

				if (scaleDexDmg < 0) {
					scaleDexDmg = 0;
				};

				if (dmgDesc.SpellID > 0)
				{
					return dmg;
				};

				return scaleDexDmg;
			};

			// if (dmg < 5) {
			// 	dmg = 5;
			// };

		} else if (C_NpcIsHuman(attInst) && Hlp_GetInstanceID(attInst) != Hlp_GetInstanceID(hero) 
		&& attInst.guild != GIL_BDT 
		&& attInst.guild != GIL_ORCSCOUT
		&& Hlp_IsValidItem(weapon)) {
			if (weapon.flags & ITEM_BOW) {

				scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_POINT];

				
				if (scaleDexDmg < 0) {
					scaleDexDmg = 0;
				};

				return scaleDexDmg;

			} else if (weapon.flags & ITEM_CROSSBOW) {
				scaleDexDmg = weapon.damageTotal + attInst.attribute[ATR_STRENGTH] - victimInst.protection[PROT_POINT];

				
				if (scaleDexDmg < 0) {
					scaleDexDmg = 0;
				};

				return scaleDexDmg;
			} else if (weapon.flags & ITEM_SWD && (weapon.cond_atr[2] == ATR_DEXTERITY || weapon.cond_atr[1] == ATR_DEXTERITY)) {		

				scaleDexDmg = weapon.damageTotal / 2 + attInst.attribute[ATR_DEXTERITY] - victimInst.protection[PROT_EDGE] - 4;

				if (scaleDexDmg < 0) {
					return 0;
				};

				return scaleDexDmg;
			};
		};
	};

	return dmg;
};

var int _DMG_DmgDesc;
    
func void _DMG_OnDmg_Post() {
	// if (Str_ToInt(MEM_GetGothOpt("EdycjaRozszerzona", "easyDexGame"))) {
	// 	EAX = DMG_OnDmg_Easy(ECX, MEM_ReadInt(MEM_ReadInt(ESP+548)+4), EAX, _DMG_DmgDesc);
	// } else {
	// 	EAX = DMG_OnDmg(ECX, MEM_ReadInt(MEM_ReadInt(ESP+548)+4), EAX, _DMG_DmgDesc);
	// };

	EAX = DMG_OnDmg_Easy(ECX, MEM_ReadInt(MEM_ReadInt(ESP+548)+4), EAX, _DMG_DmgDesc);
	//print ("_DMG_OnDmg");
};

func void _DMG_OnDmg_Pre() {
    _DMG_DmgDesc = ESI;
	//print ("_DMG_OnDmg");
};

func void InitDamage() {
	const int once = 0;
	if (!once) {
		//if (dmg) { return; };
		HookEngineF(7567329/*0x66CAC7*/, 6, _DMG_OnDmg_Post);
		const int oCNpc__OnDamage_Hit = 7541776;
		HookEngineF(oCNpc__OnDamage_Hit, 7, _DMG_OnDmg_Pre);
		once = 1;
	};
};