FUNC VOID EVT_PAL_OW_01_S1()
{
if (LordSkeleton  == FALSE)
	{
	
		
		Snd_Play ("MFX_DESTROYUNDEAD_CAST");
		B_LogEntry(UkrytaSiarka,"Uda�o mi si� znaj�� skrzynie z siark�, jednak po jej otwarciu, za moimi plecami pojawi� si� uzbrojony nieumar�y. Mam wra�enie �e na obecn� chwil� lepiej da� z t�d nog�, kto wie co jeszcze si� tu czai...");
		Wld_InsertNpc (Skeleton_Lord,"WP_US_UNDEAD");
		LordSkeleton = TRUE;
	    
	
	};
    
};

