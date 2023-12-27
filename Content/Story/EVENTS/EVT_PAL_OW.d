FUNC VOID EVT_PAL_OW_01_S1()
{
if (LordSkeleton  == FALSE)
	{
	
		
		Snd_Play ("MFX_DESTROYUNDEAD_CAST");
		B_LogEntry(UkrytaSiarka,"Uda³o mi siê znajœæ skrzynie z siark¹, jednak po jej otwarciu, za moimi plecami pojawi³ siê uzbrojony nieumar³y. Mam wra¿enie ¿e na obecn¹ chwilê lepiej daæ z t¹d nogê, kto wie co jeszcze siê tu czai...");
		Wld_InsertNpc (Skeleton_Lord,"WP_US_UNDEAD");
		LordSkeleton = TRUE;
	    
	
	};
    
};

