 func void B_Story_Aidan_Quest_CH3 ()
 {
	MIS_Aidan_Quest = LOG_RUNNING;
    Log_CreateTopic            (CH3_Aidan_Quest, LOG_MISSION);
    Log_SetTopicStatus       (CH3_Aidan_Quest, LOG_RUNNING);
    B_LogEntry                     (CH3_Aidan_Quest,"Aidan poprosi³ mnie, bym odzyska³ jego sprzêt ³owiecki, który niegdyœ po¿yczy³ jego zaginiony towarzysz. Podobno ukry³ te rzeczy w jaskini, któr¹ znajdê w w¹wozie prowadz¹cym do starych orkowych ruin. ");
	Wld_InsertNpc				(Snapper,"OW_CAVE2_SNAPPER_MOVEMENT2");
	Wld_InsertNpc				(Snapper,"OW_CAVE2_SNAPPER_MOVEMENT2");
	Wld_InsertNpc				(Snapper,"OW_CAVE2_SNAPPER_MOVEMENT");
};