
var int JoinOC;
var int JoinNC;
var int JoinPC;
var int JoinBA;


func void HeroJoinToNC ()
{
if (MIS_OreInOM == LOG_RUNNING)
{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda³o mi siê ukoñczyæ tego zadania. Jestem teraz cz³owiekiem Laresa i sprawy Bandytów mnie nie interesuj¹.");
};


};

func void HeroJoinToBAN ()
{
	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie bêdê móg³ teraz udowodniæ swojej lojalnoœci wobec Starego Obozu. Wybra³em inn¹ œcie¿kê.");
	};
};

func void HeroJoinToPSI ()
{

	if (MIS_OreInOM == LOG_RUNNING)
	{
	MIS_OreInOM = LOG_FAILED;
	Log_SetTopicStatus	(CH1_OreInOM,LOG_FAILED);
    B_LogEntry    			(CH1_OreInOM,"Nie uda³o mi siê ukoñczyæ tego zadania. Nale¿ê do Bractwa, wiec nie mogê pracowaæ dla Bandytów.");
	};

	if (Diego_BringList == LOG_RUNNING)
	{
	Diego_BringList = LOG_FAILED;
	Log_SetTopicStatus      (CH1_BringList, LOG_FAILED);
	B_LogEntry    			(CH1_BringList,"Raczej nie bêdê móg³ teraz udowodniæ swojej lojalnoœci wobec Starego Obozu. Wybra³em inn¹ œcie¿kê.");
	};
};

func void HeroJoinToOC ()
{
	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,	"Nie mogê zostaæ przyjêty do gangu Laresa, gdy¿ jestem jednym z ludzi Gomeza!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,	"Stary Obóz bêdzie od dziœ moim domem. Bractwo Œni¹cego bêdzie musia³o obejœæ siê jakoœ beze mnie.");
	
	//Log_CreateTopic		(CH1_BANDITOS_CAMP,	LOG_MISSION);
	//Log_SetTopicStatus	(CH1_BANDITOS_CAMP,	LOG_FAILED);
	//B_LogEntry			(CH1_BANDITOS_CAMP,	"Banda Quentina bêdzie musia³a siê beze mnie obejœæ. Postanowi³em przy³¹czyæ siê do Gomeza.");
};