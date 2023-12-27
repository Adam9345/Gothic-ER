// ******************************************************
// B_ClearJunkTradeInv
// --------------------
// Löscht alle slftems aus dem Inventory der Händler
// bei einem Kapitelwechsel wird in B_GiveTradeInv_<slf> 
// aufgerufen
// ******************************************************
var int ArrowTreaderAmount;
var int BoltTreaderAmount;


func void B_ClearTreaderAmmo (var C_NPC slf) 

{
    Npc_RemoveInvItems(slf, ItAmArrow, Npc_HasItems(slf, ItAmArrow));
    Npc_RemoveInvItems(slf, ItAmBolt, Npc_HasItems(slf, ItAmBolt));
};
/*
{
//if 
 ArrowTreaderAmount = Npc_hasitems (self, ItAmArrow);
 BoltTreaderAmount  = Npc_hasitems (self, ItAmBolt);
//
    

	    if (Npc_HasItems (self, ItAmArrow) >=1)
	    {
		ArrowTreaderAmount = Npc_hasitems (self, ItAmArrow);
		if (ArrowTreaderAmount >0)
		{
			Npc_RemoveInvItems (self, ItAmArrow,ArrowTreaderAmount);
			
		};
	    }
		
		else if (Npc_HasItems (self, ItAmBolt) >=1)
	    {
		BoltTreaderAmount = Npc_hasitems (self, ItAmBolt);
		if (BoltTreaderAmount >0)
		{
			Npc_RemoveInvItems (self, ItAmBolt,BoltTreaderAmount);
			
		};
	    };

//};
	
};	
*/