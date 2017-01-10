module global;

import Add_on_API;

//enum EXT_IHALOENGINE;
//enum EXT_IOBJECT;
//enum EXT_IPLAYER;
//enum EXT_IADMIN;
//enum EXT_ICOMMAND;

//enum EXT_IDATABASE;           //Not included in this UnitTest.
//enum EXT_IDATABASESTATEMENT;  //Not included in this UnitTest.
//enum EXT_HKDATABASE;          //Not included in this UnitTest.

//enum EXT_ICINIFILE;

//enum EXT_ITIMER;
//enum EXT_HKTIMER;

//enum EXT_IUTIL;

//Future API support
//enum EXT_INETWORK;
//enum EXT_ISOUND;
//enum EXT_IDIRECTX9;
//enum EXT_HKEXTERNAL;


addon_info EXTPluginInfo = { "UnitTestD", "1.0.0.0",
"DZS|All-In-One, founder of DZS",
"Used for verifying each API are working right in D language under C99 standard.",
"UnitTest",
sectors: {"unit_test",
    "test_unit",
    "unit test",
    "[unit]test",
    "test[unit]"} };

/*
 * Verification list as of 0.5.3.3
 *
 * EXT_IHALOENGINE          - Passed (except a few functions are not included in test.)
 * EXT_IOBJECT              - Passed (except a few functions are not included in test.)
 * EXT_IPLAYER              - Passed (except a few functions are not included in test.)
 * EXT_IADMIN               - Passed
 * EXT_ICOMMAND             - Passed
 * EXT_IDATABASE            - Not included in this UnitTest.
 * EXT_IDATABASESTATEMENT   - Not included in this UnitTest.
 * EXT_HKDATABASE           - Not included in this UnitTest.
 * EXT_ICINIFILE            - Passed
 * EXT_ITIMER               - Passed (Expect imbalance tick synchronize for 1/30 ticks per second after first load time.)
 * EXT_HKTIMER              - Passed
 * EXT_IUTIL                - Passed (except a few functions are not included in test.)
 * Future API support
 * EXT_INETWORK
 * EXT_ISOUND
 * EXT_IDIRECTX9
 * EXT_HKEXTERNAL
 */