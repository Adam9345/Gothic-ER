func void SetGhost(var int newGhost, var int transparency) {
	//var oCNpc slf; slf = _^(MEM_InstGetOffset(newGhost)); // get ghost instance
        var oCNpc slf; slf = Hlp_GetNpc(newGhost); // version suggested by Avallach
		slf.bloodEnabled = false; // disable blood emitter
		slf.bloodTexture = "";
		slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] | zCVob_bitfield0_visualAlphaEnabled; // enable visual alpha
		slf._zCVob_visualAlpha = divf(mkf(100-transparency), mkf(100)); // set transparency, if transparency = 100, then player is fully invisible!
		slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] & ~zCVob_bitfield0_castDynShadow; // destroy casting shadows
};




//==================================================
// Trade_ChangeSellMultiplier
// ----
// - mul have to be zfloat value
// - function should be refreshed atleast every trade 
//   for simplify you can add it in ZS_TALK
//==================================================
func void Trade_ChangeSellMultiplier(var int mul)
{
	var int ptr;
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.dlgTrade
	ptr = MEM_ReadInt(ptr+260);	//dlgTrade.oCViewDialogItemContainer
	MEM_WriteInt(ptr+268,mul);//oCViewDialogItemContainer.Multiplier = mul
};

//==================================================
// by SPLASH
// usuwanie ekwipunku handlarzy
// wyłączone z powodu problemów
//==================================================
class C_TradesmanData
{
    var int data[200];
};
 
instance TradesmanData@ (C_TradesmanData);
 
func void SetTradesmanItemsData (var c_npc slf, var int offset, var int item, var int amount)
{
    if (!Hlp_IsValidHandle (MEM_ReadStatArr (slf.aivar, AIV_TradesmanData)))
    {
    slf.aivar[AIV_TradesmanData] = new (TradesmanData@);
    };
 
    MEM_WriteIntArray (getPtr (MEM_ReadStatArr (slf.aivar, AIV_TradesmanData)), offset, item);
    MEM_WriteIntArray (getPtr (MEM_ReadStatArr (slf.aivar, AIV_TradesmanData)), offset+100, amount);
};
 
func void ClearTradesmanItemsData (var c_npc slf)
{  
    if (Hlp_IsValidHandle (MEM_ReadStatArr (slf.aivar, AIV_TradesmanData)))
    {
    var int i; i = 0;
    var int pos; pos = MEM_StackPos.position;
   
        if (i < 100)
        {  
        SetTradesmanItemsData (slf, i, 0, 0);
        i += 1;
        MEM_StackPos.position = pos;
        };     
    };
};
 
func int GetTradesmanItemsData (var c_npc slf, var int offset)
{
    if (Hlp_IsValidHandle (MEM_ReadStatArr (slf.aivar, AIV_TradesmanData)))
    {
    return MEM_ReadIntArray (getPtr (MEM_ReadStatArr (slf.aivar, AIV_TradesmanData)), offset);
    }; 
};
 
func void RemoveTradesmanItems (var c_npc slf)
{
    var int npcPtr; npcPtr = MEM_InstToPtr (slf);
    var zCArray arr; arr = _^ (List_ToArrayS (MEM_ReadInt (npcPtr+1364)));
    var int i; i = 0;
    var int pos; pos = MEM_StackPos.position;
 
    if (i < arr.numInArray)
    {
    var oCItem itm; itm = _^ (MEM_ReadIntArray (arr.array, i));
       
        if (itm.value >= 100 || itm.instanz == ItMiNugget)
        {
        var int offset; offset += 1;
        SetTradesmanItemsData (slf, offset, itm.instanz, itm.amount);
        Npc_RemoveInvItem (slf, itm.instanz);
        };
           
    i += 1;
    MEM_StackPos.position = pos;
    };
};
 
func void ReturnTradesmanItems (var c_npc slf)
{
    var int i; i = 0;
    var int pos; pos = MEM_StackPos.position;
   
    if (i < 100)
    {
        if (GetTradesmanItemsData (slf, i) > 0)
        {
        var int itm; itm = GetTradesmanItemsData (slf, i);
        var int amount; amount = GetTradesmanItemsData (slf, i+100);
        CreateInvItems (slf, itm, amount);
        };
       
    i += 1;
    MEM_StackPos.position = pos;  
    };
 
    ClearTradesmanItemsData (slf);
};