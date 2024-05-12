const int AIV_MoreAivars = 3; //indeks aivara, w którym bêdzie przechowywany handle
const int MAX_ADDITIONAL_AIVARS = 1; //iloœæ dodatkowych aivarów

const int NpcWasPickPocket = 0;

class AdditionalAivars {
    var int aivar[MAX_ADDITIONAL_AIVARS];
};

instance AdditionalAivar@(AdditionalAivars);

func void SetAdditionalAivar(var c_npc slf, var int index, var int value) {
    var int hndl; hndl = MEM_ReadStatArr(slf.aivar, AIV_MoreAivars);

    if (!Hlp_IsValidHandle(hndl)) {
        slf.aivar[AIV_MoreAivars] = new(AdditionalAivar@);
    };

    MEM_WriteIntArray(getPtr(MEM_ReadStatArr(slf.aivar, AIV_MoreAivars)), index, value);
};

func int GetAdditionalAivar(var c_npc slf, var int index) {
    var int hndl; hndl = MEM_ReadStatArr(slf.aivar, AIV_MoreAivars);

    if (Hlp_IsValidHandle(hndl)) {
        return MEM_ReadIntArray(getPtr(MEM_ReadStatArr(slf.aivar, AIV_MoreAivars)), index);
    } else {
        return 0;
    };
};

func void ClearAdditionalAivars(var c_npc slf) {	
    var int hndl; hndl = MEM_ReadStatArr(slf.aivar, AIV_MoreAivars);

    if (Hlp_IsValidHandle(hndl)) {
        var int i;

        repeat(i, MAX_ADDITIONAL_AIVARS);
            SetAdditionalAivar(slf, i, 0);
        end;
    };
};

func void DeleteAdditionalAivars(var c_npc slf) {
    var int hndl; hndl = MEM_ReadStatArr(slf.aivar, AIV_MoreAivars);

    if (Hlp_IsValidHandle(hndl)) {
        delete(hndl);
    };
};

