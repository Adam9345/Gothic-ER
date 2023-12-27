
func void B_Give_ZerronChapter1Books ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Sld_40130_Zerron);
	
	//-------- Runen --------
   CreateInvItems (npc,BookExp250,2);
   CreateInvItems (npc,BookExp500,1);
   CreateInvItems (npc,Booklp1,1);
};
func void B_Give_ZerronChapter2Books ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Sld_40130_Zerron);
	
	
	
   CreateInvItems (npc,ItMiNugget,100);
   CreateInvItems (npc,BookExp250,3);
   CreateInvItems (npc,BookExp500,2);
   //CreateInvItems (npc,ItMiNugget,140);
};

func void B_Give_ZerronChapter3Books ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Sld_40130_Zerron);
	
	//-------- Runen --------
	CreateInvItems (npc,BookExp250,4);
	CreateInvItems (npc,BookExp500,3);
	CreateInvItems (npc,BookExp1000,1);
	CreateInvItems (npc,ItMiNugget,140);
	CreateInvItems (npc,Booklp1,1);
	//CreateInvItems (npc,ItMiNugget,140);
};


func void B_Give_ZerronChapter4Books ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Sld_40130_Zerron);
	
	//-------- Runen --------
    //CreateInvItems (npc,BookExp250,140);
      CreateInvItems (npc,BookExp250,6);
      CreateInvItems (npc,BookExp500,4);
      CreateInvItems (npc,BookExp1000,2);
      CreateInvItems (npc,ItMiNugget,140);
};


func void B_Give_ZerronChapter5Books ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Sld_40130_Zerron);
	
	//-------- Runen --------
	CreateInvItems (npc,BookExp250,6);
	CreateInvItems (npc,BookExp500,4);
	CreateInvItems (npc,BookExp1000,2);
	CreateInvItems (npc,Booklp1,3);
	CreateInvItems (npc,ItMiNugget,140);
};


