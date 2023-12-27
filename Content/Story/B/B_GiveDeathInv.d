func void B_GiveDeathInv ()
{
	//-------- Abfragen, ob die Trophy schon mal verteilt wurde --------
	if	(self.aivar[AIV_MM_DEATHINVGIVEN])
	{
		return;
	};

	//-------- Trophy ins Inventory packen --------
	if (Knows_GetTeeth == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_WOLF)				{	CreateInvItems(self,ItAt_Teeth_01,2);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLACKWOLF)  			{	CreateInvItems(self,ItAt_Teeth_01,2);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SNAPPER)     		{	CreateInvItems(self,ItAt_Teeth_01,4);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_ORCBITER)   			{	CreateInvItems(self,ItAt_Teeth_01,2);	};	
		if (self.aivar[AIV_MM_REAL_ID]==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_Teeth_01,4);	};	
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLOODHOUND)			{	CreateInvItems(self,ItAt_Teeth_01,4);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_DZIK)				{	CreateInvItems(self,ItAt_Teeth_01,2);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_ALLIGATOR)			{	CreateInvItems(self,ItAt_Teeth_01,3);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_WARG)			    {	CreateInvItems(self,ItAt_Teeth_01,3);	};
	};

	if (Knows_GetClaws == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_WARAN)				{	CreateInvItems(self,ItAt_Claws_01,4);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_Claws_01,4);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SNAPPER)   			{	CreateInvItems(self,ItAt_Claws_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_RAZOR)				{	CreateInvItems(self,ItAt_Claws_01,3);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_ORCBITER)    		{	CreateInvItems(self,ItAt_Claws_01,2);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_LURKER)				{	CreateInvItems(self,ItAt_Lurker_01,2);	};		
		if (self.aivar[AIV_MM_REAL_ID]==ID_BEAR)				{	CreateInvItems(self,ItAt_Claws_01,4);	};		
	};

	if (Knows_GetFur == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_WOLF)				{	CreateInvItems(self,ItAt_Wolf_01,1     );	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLACKWOLF)			{	CreateInvItems(self,ItAt_Wolf_02,1     );	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_Shadow_01,1   );	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_TROLL)				{	CreateInvItems(self,ItAt_Troll_01,1    );	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_DZIK)				{	CreateInvItems(self,ItAt_Dzik_01,1     );	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_WHITEWOLF)			{	CreateInvItems(self,ItAt_WolfWhite_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_WARG)			    {	CreateInvItems(self,ItAt_Warg,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_TROLLGROUND)			{	CreateInvItems(self,ItAt_TrollFur,1);};
		if (self.aivar[AIV_MM_REAL_ID]==ID_TROLLGROUND)			{	CreateInvItems(self,ItAt_TrollFur,1);};
		if (self.aivar[AIV_MM_REAL_ID]==ID_TROLLBLACK)			{	CreateInvItems(self,ItAt_BlackTrollFur,1);};
		if (self.aivar[AIV_MM_REAL_ID]==ID_BEAR)		    	{	CreateInvItems(self,ItAt_BearFur,1);};
	};

	if (Knows_GetHide == TRUE) //Skórowanie gadów
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_LURKER)				{	CreateInvItems(self,ItAt_Lurker_02,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SWAMPSHARK)			{	CreateInvItems(self,ItAt_Swampshark_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_ALLIGATOR)			{	CreateInvItems(self,ItAt_Alligator_Skin,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_WARAN)				{	CreateInvItems(self,ItAt_Waran_Skin,1  );	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SNAPPER)   			{	CreateInvItems(self,ItAt_Snapper_Skin,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_FIREWARAN)   		{	CreateInvItems(self,ItAt_FireWaran_Skin,1);	};
	};
	
	if (Knows_GetMCMandibles == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_MINECRAWLER)			{	CreateInvItems(self,ItAt_Crawler_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_MINECRAWLERWARRIOR)	{	CreateInvItems(self,ItAt_Crawler_01,1);	};
	};
	
	if (Knows_GetMCPlates == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_MINECRAWLERWARRIOR)	{	CreateInvItems(self,ItAt_Crawler_02,2);	};
	};
	
	if (Knows_GetBFSting == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLOODFLY)			{	CreateInvItems(self,ItAt_Bloodfly_02,1);};
	};
	
	if (Knows_GetUluMulu == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_Waran_01,		1);	};	//Zunge eines Feuerwarans
		if (self.aivar[AIV_MM_REAL_ID]==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_Shadow_02,		1); };	//Horn eines Shadowbeasts
		if (self.aivar[AIV_MM_REAL_ID]==ID_SWAMPSHARK)			{	CreateInvItems(self,ItAt_Swampshark_02,	3); };	//Zähne eines Sumpfhais
		if (self.aivar[AIV_MM_REAL_ID]==ID_TROLL)				{	CreateInvItems(self,ItAt_Troll_02,		2);	};	//Hauer eines Trolls
	};
	if (Knows_GetLurkerMeat == TRUE)
	{
	if (self.aivar[AIV_MM_REAL_ID]==ID_LURKER)			{	CreateInvItems(self,ItFo_muttonLurker,4);};
	};
	
	if (Knows_GetMoleratW == TRUE)
	{
	if (self.aivar[AIV_MM_REAL_ID]==ID_MOLERAT)			{	CreateInvItems(self,ItFo_MoleratW,1);};
	};
	if (Knows_GetMoleratT == TRUE)
	{
	if (self.aivar[AIV_MM_REAL_ID]==ID_MOLERAT)			{	CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);};
	if (self.aivar[AIV_MM_REAL_ID]==ID_BEAR)			{	CreateInvItems(self,ItAt_BearLubric,1);};
	};
	
	if (Knows_GetTrutkaJaszczura == TRUE)
	{
	if (self.aivar[AIV_MM_REAL_ID]==ID_WARAN)			{	CreateInvItems(self,ItMi_Alchemy_trucizna_02,1);};
	};	
	
	if (Knows_GetTrollGroundClaws == TRUE)
	{
	if (self.aivar[AIV_MM_REAL_ID]==ID_TROLLGROUND)			{	CreateInvItems(self,ItAt_Claws_02,2);};
	};
	
	if (self.aivar[AIV_MM_REAL_ID]==ID_BLACKGOBBO) || (self.aivar[AIV_MM_REAL_ID]==ID_GOBBO)
	{
	var int random_drop_gobbo;
	random_drop_gobbo = Hlp_Random (5);
	if (random_drop_gobbo == 0)
	{
	CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if (random_drop_gobbo == 1)
	{
	CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	CreateInvItems(self,ItMiNugget,3);
	}
	else if (random_drop_gobbo == 2)
	{
	CreateInvItems(self,ItFo_MoleratW,1);
	CreateInvItems(self,ItMiNugget,5);
	}
	else if (random_drop_gobbo == 3)
	{
	CreateInvItems(self,ItKeLockpick,1);
	}
	else if (random_drop_gobbo == 4)
	{
	CreateInvItems(self,ItKeLockpick,2);
	CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
	}
	else if (random_drop_gobbo == 5)
	{
	CreateInvItems(self,ItMi_Stuff_OldCoin_01,2);
	CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	CreateInvItems(self,ItMiNugget,3);
	};
	};
	//-------- Merken --------
	self.aivar[AIV_MM_DEATHINVGIVEN] = TRUE;
};