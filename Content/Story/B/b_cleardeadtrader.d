func void Npc_ClearInventoryLoop (var c_npc npc, var int category)
{
		var c_Item armor; armor = Npc_GetEquippedArmor(npc);      
        var c_Item weapon; weapon = Npc_GetEquippedMeleeWeapon(npc);
        var c_Item rangedweapon; rangedweapon = Npc_GetEquippedRangedWeapon(npc);

        //print(ConcatStrings("Czyszczenie eq: ", npc.name));
        var int amount;
        amount = Npc_GetInvItemBySlot (npc, category, 0);
        //print(ConcatStrings(item.name, IntToString(amount)));
        if (amount>0)
		&& (Hlp_GetInstanceID(item) != Hlp_GetInstanceID(armor))
		&& (Hlp_GetInstanceID(item) != Hlp_GetInstanceID(weapon))
		&& (Hlp_GetInstanceID(item) != Hlp_GetInstanceID(rangedweapon))
        {
                NPC_RemoveInvItems (npc, Hlp_GetInstanceID (item), amount);
                Npc_ClearInventoryLoop(npc, category);
        }
        else if (category < INV_CAT_MAX-1)
        {
                //print(ConcatStrings("Zmiana kategorii na: ", IntToString(category+1)));
                Npc_ClearInventoryLoop(npc, category+1);
        };
};

func void Npc_ClearInventory (var c_npc npc)
{
        Npc_ClearInventoryLoop(npc, 0);
};


func void b_cleardeadtrader(var C_NPC trader)
{
	Npc_ClearInventory(trader);
	// if(trader.aivar[AIV_VICTORYXPGIVEN] == FALSE)
	// {
	// 	b_createambientinv(trader);
	// };
	//trader.aivar[AIV_CHAPTERINV] = KAPITEL - 1;
};

