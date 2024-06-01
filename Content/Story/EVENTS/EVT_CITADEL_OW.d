FUNC VOID EVT_CITADEL_OW_01_S1()
{
if (CitadelEvt_01  == FALSE)
	{
	
		
		Snd_Play ("MFX_DESTROYUNDEAD_CAST");
	
		Wld_InsertNpc (DarkGolem,"LOCATION_32_01");
		CitadelEvt_01 = TRUE;
	    
	
	};
    
};

