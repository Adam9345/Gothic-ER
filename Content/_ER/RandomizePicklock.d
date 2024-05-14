func string SetPicklockStr (var int length) {
    var int index;
	var int loopstart;
	var int rnd;
    var string s;

    s = "";
    index = 0;
    loopstart = mem_stackpos.position;
    if (index < length) {
        rnd = Hlp_Random(100);
        if (rnd <= 50) {
            s = cs2 (s, "L");
        }
        else {
            s = cs2 (s, "R");
        };
        index += 1;
        mem_stackpos.position = loopstart;
    };

    return s;
};

func void  Init_RandomizePicklocks() {
	var int listPtr;

	listPtr = MEM_World.voblist;

	var int ptr; ptr = 0;

	var zCListSort list;

	var string s;
	var int lengthPickLockStr;

	while (listPtr);
		list = _^ (listPtr);

		if (list.data) {
			if (Hlp_Is_oCMobLockable(list.data)) {
				var oCMobLockable mob; mob = _^ (list.data);

				lengthPickLockStr = STR_Len (mob.pickLockStr);

				if (lengthPickLockStr <= 20) {
					mob.pickLockStr = SetPicklockStr (lengthPickLockStr);
				};
			};
		};

		listPtr = list.next;
	end;
};