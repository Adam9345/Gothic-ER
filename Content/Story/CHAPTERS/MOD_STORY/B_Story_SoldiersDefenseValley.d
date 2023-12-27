func void B_Story_SoldiersValleyDefense ()
{
	Npc_ExchangeRoutine (SLD_702_Soeldner,"obrona"); 
	Npc_ExchangeRoutine (SLD_703_Soeldner,"obrona"); 
	Npc_ExchangeRoutine (SLD_706_Soeldner ,"obrona"); 
	//Npc_ExchangeRoutine (SLD_707_Soeldner,"obrona"); 
	Npc_ExchangeRoutine (SLD_737_Torlof,"obrona"); 
	Npc_ExchangeRoutine (SLD_732_Soeldner,"obrona"); 
	
	Wld_InsertNpc				(GRD_3355_Gardist,"OC1"); 
	Wld_InsertNpc				(GRD_3358_Gardist ,"OC1"); 
	Wld_InsertNpc				(GRD_3357_Gardist ,"OC1"); 
	Wld_InsertNpc				(GRD_3359_Gardist ,"OC1"); 
	Wld_InsertNpc				(GRD_3356_Gardist ,"OC1"); 
};

func void B_Story_SoldiersFollowPlayer ()
{

};