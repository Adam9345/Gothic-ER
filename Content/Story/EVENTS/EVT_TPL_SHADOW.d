
var int TPL_ChestShadow01;
var int TPL_ChestShadow02;

FUNC VOID EVT_TPL_SHADOW_01_S1()
{
    if (TPL_ChestShadow01 == FALSE)   
	{
    Wld_InsertNpc 	(Skeleton_Lord_TPL,          "TPL_ADD_01");
  	Wld_InsertNpc 	(Skeleton_Lord_TPL,          "TPL_ZENEK");
  	Wld_InsertNpc 	(Skeleton_Lord_TPL,          "TPL_ADD_02");
    TPL_ChestShadow01 = TRUE;
	};
};

FUNC VOID EVT_TPL_SHADOW_02_S1()
{
    if (TPL_ChestShadow02 == FALSE)   
	{
    Wld_InsertNpc 	(Skeleton_Lord_TPL,          "TPL_ADD_03");
  	Wld_InsertNpc 	(Skeleton_Lord_TPL,          "TPL_393");
  	Wld_InsertNpc 	(Skeleton_Lord_TPL,          "TPL_ADD_04");
	TPL_ChestShadow02 = TRUE;
    };
};

