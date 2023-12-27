
/*
 *    Damage calculation
 */
func void _hook_OnDmg_Event () {
    var int victimPtr;    //victim
    var int ddPtr;        //damage descriptor
    var int dmg;
    if (MEMINT_SwitchG1G2 (1, 0)) {
        victimPtr = EDI;
        ddPtr = MEM_ReadInt (ESP + 548);
        dmg = EAX;
    } else {
        victimPtr = EBP;
        ddPtr = MEM_ReadInt (ESP + 644);
        dmg = EDI;
    };

    //Update damage
    if (MEMINT_SwitchG1G2 (1, 0)) {
        EAX = dmg;
    } else {
        EDI = dmg;
    };
    var oSDamageDescriptor dd; dd = _^ (ddPtr);

    var c_npc attackerNpc; attackerNpc = _^(dd.attackerNpc);
    var c_npc victimNpc; victimNpc = _^(victimPtr);

    if (attackerNpc.guild == GIL_BLOODFLY && victimNpc.id == hero.id)
    {
        Print("trucizna");
    };
};

func void G12_OnDmg_Event_Init () {
    const int once = 0;

    if (!once) {


        if (MEMINT_SwitchG1G2 (1, 0)) {
            HookEngine (7567329, 6, "_hook_OnDmg_Event");    //G1
        } else {
            HookEngine(6736583, 5, "_hook_OnDmg_Event");    //G2A
        };

        once = 1;
    };
};