FUNC VOID EVT_FORTRESS_OW_01_S1()
{
if (FortressEvt_01  == FALSE)
	{
	
		
		Snd_Play ("MFX_DESTROYUNDEAD_CAST");
	
		Wld_InsertNpc (SkeletonMage_Fortress,"WP_EVT_FORTRESS");
		FortressEvt_01 = TRUE;
	    
	
	};
    
};

