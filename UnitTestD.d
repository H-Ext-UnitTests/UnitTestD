module UnitTestD;

import core.sys.windows.windows;
import core.sys.windows.oaidl;
import core.stdc.config: c_long, c_ulong;
import core.stdc.time : time_t, time, gmtime, tm;
import core.stdc.stdlib : malloc, free;

public import global;
static public import Add_on_API;
pragma(lib, "Add_on_API_OMF.lib");

static public import UnitTestDh;
static public import exceptionAPI;

__gshared uint EAOhashID;


PlayerInfo plINull = PlayerInfo();
//This is not needed as it is already defined in util.d file.
/*static if (__traits(compiles, EXT_IUTIL)) {
__gshared IUtil* pIUtil = null;
}*/
static if (__traits(compiles, EXT_ITIMER)) {
__gshared ITimer* pITimer = null;
UINT[4] TimerID =  0;
DWORD TimerTickStart = 0;
DWORD[4] TimerTickSys = 0;
static if (__traits(compiles, ITIMER_LOOP_CHECK)) {
UINT TimerIDLoop = 0;
DWORD TimerTickLoop = 0;
}
}
static if (__traits(compiles, EXT_ICINIFILE)) {
__gshared ICIniFile* pICInifile = null;
}
 static if (__traits(compiles, EXT_ICOMMAND)) {
__gshared ICommand* pICommand = null;
extern(C) CMD_RETURN eao_testExecute(PlayerInfo plI, ArgContainer* arg, MSG_PROTOCOL protocolMsg, uint timerID, bool* showChat) {
    return CMD_RETURN.SUCCESS;
}
extern(C) CMD_RETURN eao_testExecuteOverride(PlayerInfo plI, ArgContainer* arg, MSG_PROTOCOL protocolMsg, uint timerID, bool* showChat) {
    return CMD_RETURN.SUCCESS;
}
extern(C) CMD_RETURN eao_testExecuteOverride2(PlayerInfo plI, ArgContainer* arg, MSG_PROTOCOL protocolMsg, uint timerID, bool* showChat) {
    return CMD_RETURN.SUCCESS;
}
}
static if (__traits(compiles, EXT_IPLAYER)) {
__gshared IPlayer* pIPlayer = null;
}
static if (__traits(compiles, EXT_IOBJECT)) {
__gshared IObject* pIObject = null;
}
static if (__traits(compiles, EXT_IADMIN)) {
__gshared IAdmin* pIAdmin = null;
}
static if (__traits(compiles, EXT_IHALOENGINE)) {
__gshared IHaloEngine* pIHaloEngine = null;
}

export extern(C) EAO_RETURN EXTOnEAOLoad(uint hash) {
    EAOhashID = hash;
    wchar[0x30] testStrW = "Master \\\\Chief `love` 'biofoam' \\canister."w;
    char[0x30] testStrA = "Master \\\\Chief `love` 'biofoam' \\canister."c;
    e_boolean boolean;
    uint retCode;
    wchar* strPtrW = null;
    try {
        static if (__traits(compiles, EXT_IUTIL)) {
            pIUtil = getIUtil(hash);
            if (!pIUtil)
                throw new ExceptionAPI(1);
            wchar* utilMemStrW = cast(wchar*)pIUtil.m_allocMem(testStrW.length * 2);
            char* utilMemStrA = cast(char*)pIUtil.m_allocMem(testStrW.length);
            if (!utilMemStrW)
                throw new ExceptionAPI(1);
            utilMemStrW[0] = 0;
            utilMemStrA[0] = 0;
            if (!pIUtil.m_strcatW(utilMemStrW, testStrW.length, testStrW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcmpW(testStrW.ptr, utilMemStrW))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcatA(utilMemStrA, testStrA.length, testStrA.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcmpA(testStrA.ptr, utilMemStrA))
                throw new ExceptionAPI(1);
            //#pragma region boolean values
            if (pIUtil.m_strToBooleanW(testStrW.ptr) != e_boolean.FAIL)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(testStrA.ptr) != e_boolean.FAIL)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(trueW.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(TRUEW.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(trUeW.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(trueNumW.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(trueA.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(TRUEA.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(trUeA.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(trueNumA.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(falseW.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(FALSEW.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(faLseW.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanW(falseNumW.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(falseA.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(FALSEA.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(faLseA.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToBooleanA(falseNumA.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(1);
            //#pragma endregion
            //#pragma region team values
            if (pIUtil.m_strToTeamW(testStrW.ptr) != e_color_team_index.NONE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamA(testStrA.ptr) != e_color_team_index.NONE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamW(blueW.ptr) != e_color_team_index.BLUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamW(BLUEW.ptr) != e_color_team_index.BLUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamW(btW.ptr) != e_color_team_index.BLUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamA(blueA.ptr) != e_color_team_index.BLUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamA(BLUEA.ptr) != e_color_team_index.BLUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamA(btA.ptr) != e_color_team_index.BLUE)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamW(redW.ptr) != e_color_team_index.RED)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamW(REDW.ptr) != e_color_team_index.RED)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamW(rtW.ptr) != e_color_team_index.RED)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamA(redA.ptr) != e_color_team_index.RED)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamA(REDA.ptr) != e_color_team_index.RED)
                throw new ExceptionAPI(1);
            if (pIUtil.m_strToTeamA(rtA.ptr) != e_color_team_index.RED)
                throw new ExceptionAPI(1);
            //#pragma endregion
            //#pragma region Strings values verification
            pIUtil.m_toCharA(utilMemStrW, testStrA.length, utilMemStrA);
            if (!pIUtil.m_strcmpA(utilMemStrA, testStrA.ptr))
                throw new ExceptionAPI(1);
            pIUtil.m_toCharW(utilMemStrA, testStrA.length, utilMemStrW);
            if (!pIUtil.m_strcmpW(utilMemStrW, testStrW.ptr))
                throw new ExceptionAPI(1);
            utilMemStrA[3] = 'T';
            utilMemStrW[3] = 'T';
            if (!pIUtil.m_stricmpA(utilMemStrA, testStrA.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_stricmpW(utilMemStrW, testStrW.ptr))
                throw new ExceptionAPI(1);
            utilMemStrA[3] = 't';
            utilMemStrW[3] = 't';
            if (!pIUtil.m_stricmpW(lettersW.ptr, lettersW2.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_stricmpA(lettersA.ptr, lettersA2.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_strcmpW(lettersW.ptr, lettersW2.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_strcmpA(lettersA.ptr, lettersA2.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_stricmpW(numbersW.ptr, numbersW2.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_stricmpA(numbersA.ptr, numbersA2.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_strcmpW(numbersW.ptr, numbersW2.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_strcmpA(numbersA.ptr, numbersA2.ptr))
                throw new ExceptionAPI(1);
            boolean = pIUtil.m_shiftStrW(utilMemStrW, 1, 3, 1, 0);
            if (boolean != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (!pIUtil.m_findSubStrFirstW(utilMemStrW, MatterW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_findSubStrFirstW(utilMemStrW, MattarW.ptr))
                throw new ExceptionAPI(1);
            boolean = pIUtil.m_shiftStrW(utilMemStrW, 1, 1, 3, 1);
            if (boolean != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (!pIUtil.m_findSubStrFirstW(utilMemStrW, MattarW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_findSubStrFirstW(utilMemStrW, MatterW.ptr))
                throw new ExceptionAPI(1);
            boolean = pIUtil.m_shiftStrA(utilMemStrA, 1, 3, 1, 0);
            if (boolean != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (!pIUtil.m_findSubStrFirstA(utilMemStrA, MatterA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_findSubStrFirstA(utilMemStrA, MattarA.ptr))
                throw new ExceptionAPI(1);
            boolean = pIUtil.m_shiftStrA(utilMemStrA, 1, 1, 3, 1);
            if (boolean != e_boolean.TRUE)
                throw new ExceptionAPI(1);
            if (!pIUtil.m_findSubStrFirstA(utilMemStrA, MattarA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_findSubStrFirstA(utilMemStrA, MatterA.ptr))
                throw new ExceptionAPI(1);

            utilMemStrW[0] = 0;
            utilMemStrA[0] = 0;
            retCode = pIUtil.m_strcatW(utilMemStrW, testStrA.length, MattarW.ptr);
            if (retCode != 6)
                throw new ExceptionAPI(1);
            retCode = pIUtil.m_strcatA(utilMemStrA, testStrA.length, MatterA.ptr);
            if (retCode != 6)
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcmpW(utilMemStrW, MattarW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcmpA(utilMemStrA, MatterA.ptr))
                throw new ExceptionAPI(1);
            retCode = pIUtil.m_strcatW(utilMemStrW, testStrA.length, replaceBeforeW.ptr);
            if (retCode != 13)
                throw new ExceptionAPI(1);
            retCode = pIUtil.m_strcatA(utilMemStrA, testStrA.length, replaceBeforeA.ptr);
            if (retCode != 13)
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcmpW(utilMemStrW, MattarReplaceBeforeW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcmpA(utilMemStrA, MatterReplaceBeforeA.ptr))
                throw new ExceptionAPI(1);
            //#pragma endregion
            //#pragma region isLetters, isFloat, isDouble, isNumbers, and isHash
            if (!pIUtil.m_isLettersW(lettersW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isLettersW(hashW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isLettersA(lettersA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isLettersA(hashA.ptr))
                throw new ExceptionAPI(1);

            if (!pIUtil.m_isNumbersW(numbersW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isNumbersW(hashW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isNumbersW(floatW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isNumbersA(numbersA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isNumbersA(hashA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isNumbersA(floatA.ptr))
                throw new ExceptionAPI(1);

            if (!pIUtil.m_isDoubleW(doubleW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isDoubleW(numbersW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isDoubleW(hashW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isDoubleA(doubleA.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isDoubleA(numbersA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isDoubleA(hashA.ptr))
                throw new ExceptionAPI(1);

            if (!pIUtil.m_isFloatW(floatW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isFloatW(doubleW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isFloatW(numbersW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isFloatW(hashW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isFloatA(floatA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isFloatA(doubleA.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isFloatA(numbersA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isFloatA(hashA.ptr))
                throw new ExceptionAPI(1);

            if (!pIUtil.m_isHashW(hashW.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isHashW(floatW.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isHashA(hashA.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_isHashA(floatA.ptr))
                throw new ExceptionAPI(1);
            //#pragma endregion
            //#pragma region file & directory check
            if (!pIUtil.m_isDirExist(dirExtension.ptr, &retCode))
                throw new ExceptionAPI(1);
            if (retCode)
                throw new ExceptionAPI(1);
            if (pIUtil.m_isDirExist(dirExtesion.ptr, &retCode))
                throw new ExceptionAPI(1);
            if (!retCode)
                throw new ExceptionAPI(1);
            if (pIUtil.m_isDirExist(fileHExt.ptr, &retCode))
                throw new ExceptionAPI(1);
            if (!retCode)
                throw new ExceptionAPI(1);
            if (!pIUtil.m_isFileExist(fileHExt.ptr, &retCode))
                throw new ExceptionAPI(1);
            if (retCode)
                throw new ExceptionAPI(1);
            if (pIUtil.m_isFileExist(fileHEt.ptr, &retCode))
                throw new ExceptionAPI(1);
            if (!retCode)
                throw new ExceptionAPI(1);
            if (pIUtil.m_isFileExist(dirExtension.ptr, &retCode))
                throw new ExceptionAPI(1);
            if (!retCode)
                throw new ExceptionAPI(1);
            //#pragma endregion 
            //#pragma region Replace & undo relative + database regex replace.
            pIUtil.m_replaceW(replaceTestW.ptr);
            if (!pIUtil.m_strcmpW(replaceTestW.ptr, replaceAfterW.ptr))
                throw new ExceptionAPI(1);
            pIUtil.m_replaceUndoW(replaceTestW.ptr);
            if (!pIUtil.m_strcmpW(replaceTestW.ptr, replaceBeforeW.ptr))
                throw new ExceptionAPI(1);
            pIUtil.m_replaceA(replaceTestA.ptr);
            if (!pIUtil.m_strcmpA(replaceTestA.ptr, replaceAfterA.ptr))
                throw new ExceptionAPI(1);
            pIUtil.m_replaceUndoA(replaceTestA.ptr);
            if (!pIUtil.m_strcmpA(replaceTestA.ptr, replaceBeforeA.ptr))
                throw new ExceptionAPI(1);

            pIUtil.m_regexReplaceW(regexTestNoDB.ptr, 0);
            if (!pIUtil.m_strcmpW(regexTestNoDB.ptr, regexTestNoDBAfter.ptr))
                throw new ExceptionAPI(1);
            pIUtil.m_regexReplaceW(regexTestDB.ptr, 1);
            if (!pIUtil.m_strcmpW(regexTestDB.ptr, regexTestDBAfter.ptr))
                throw new ExceptionAPI(1);

            //regex test
            if (!pIUtil.m_regexMatchW(Unit_Test.ptr, wildcard.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexMatchW(Unit_Test.ptr, wildcardBeginUnit.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexMatchW(Unit_Test.ptr, wildcardEndTest.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexMatchW(unit_test.ptr, wildcard.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_regexMatchW(unit_test.ptr, wildcardBeginUnit.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_regexMatchW(unit_test.ptr, wildcardEndTest.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_regexMatchW(unit_test.ptr, dotdotdot.ptr))
                throw new ExceptionAPI(1);

            if (!pIUtil.m_regexMatchW(hi_.ptr, dotdotdot.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexiMatchW(hi_.ptr, dotdotdot.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexiMatchW(Unit_Test.ptr, wildcard.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexiMatchW(Unit_Test.ptr, wildcardBeginUnit.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexiMatchW(Unit_Test.ptr, wildcardEndTest.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexiMatchW(unit_test.ptr, wildcardBeginUnit.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_regexiMatchW(unit_test.ptr, wildcardEndTest.ptr))
                throw new ExceptionAPI(1);
            if (pIUtil.m_regexiMatchW(unit_test.ptr, dotdotdot.ptr))
                throw new ExceptionAPI(1);
            //#pragma endregion
            //#pragma region formatVar___ functions
            VARIANT[11] testVariant;
            wchar[0x512] outputStr;
            VARIANTstr(&testVariant[0], cast(char*)"Aa"c);
            VARIANTwstr(&testVariant[1], cast(wchar*)"aA"w);
            VARIANTfloat(&testVariant[2], 1.0000f);
            VARIANTdouble(&testVariant[3], 2.000002);
            VARIANTbool(&testVariant[4], 1);
            VARIANTshort(&testVariant[5], 25);
            VARIANTushort(&testVariant[6], 50);
            VARIANTint(&testVariant[7], int.max);
            VARIANTuint(&testVariant[8], uint.max);
            VARIANTlong(&testVariant[9], c_long.max);
            VARIANTulong(&testVariant[10], c_ulong.max);
            if (!pIUtil.m_formatVariantW(outputStr.ptr, 0x512, variantFormat.ptr, 11, testVariant.ptr))
                throw new ExceptionAPI(1);
            if (!pIUtil.m_strcmpW(variantFormatExpected.ptr, outputStr.ptr))
                throw new ExceptionAPI(1);
            //#pragma endregion
            pIUtil.m_freeMem(utilMemStrW);
            pIUtil.m_freeMem(utilMemStrA);

            MessageBoxA(null, "IUtil API has passed unit test.", "PASSED - IUtil", MB_OK | MB_ICONINFORMATION);
        }
        static if (__traits(compiles, EXT_ICINIFILE)) {
            pICInifile = getICIniFile(hash);
            if (!pICInifile)
                throw new ExceptionAPI(3);
            if (pICInifile.m_open_file(pICInifile, iniFileStr.ptr)) {
                if (!pICInifile.m_delete_file(pICInifile, iniFileStr.ptr))
                    throw new ExceptionAPI(3);
                if (pICInifile.m_open_file(pICInifile, iniFileStr.ptr))
                    throw new ExceptionAPI(3);
            }
            if (!pICInifile.m_create_file(pICInifile, iniFileStr.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_open_file(pICInifile, iniFileStr.ptr))
                throw new ExceptionAPI(3);

            retCode = 0;
        recheckICIniFileDataExists:
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name2.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name4.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name5.ptr))
                throw new ExceptionAPI(3);

            if (pICInifile.m_key_exist(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_1.ptr, EXTPluginInfo.sectors.sect_name2.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_2.ptr, EXTPluginInfo.sectors.sect_name4.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_3.ptr, EXTPluginInfo.sectors.sect_name5.ptr))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_value_set(pICInifile, str1_0.ptr, firstUnitTestCStr.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_value_set(pICInifile, str1_1.ptr, firstUnitTestCStr.ptr, EXTPluginInfo.sectors.sect_name2.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_value_set(pICInifile, str1_0.ptr, firstUnitTestCStr.ptr, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_value_set(pICInifile, str1_2.ptr, firstUnitTestCStr.ptr, EXTPluginInfo.sectors.sect_name4.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_value_set(pICInifile, str1_3.ptr, firstUnitTestCStr.ptr, EXTPluginInfo.sectors.sect_name5.ptr))
                throw new ExceptionAPI(3);
            retCode++;
            switch (retCode) {
                case 1: {
                    if (!pICInifile.m_load(pICInifile))
                        throw new ExceptionAPI(3);
                    goto recheckICIniFileDataExists;
                }
                case 2: {
                    pICInifile.m_clear(pICInifile);
                    if (!pICInifile.m_save(pICInifile))
                        throw new ExceptionAPI(3);
                    if (!pICInifile.m_load(pICInifile))
                        throw new ExceptionAPI(3);
                    goto recheckICIniFileDataExists;
                }
                default: break;
            }

            if (!pICInifile.m_save(pICInifile))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_load(pICInifile))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name2.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name4.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name5.ptr))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_section_delete(pICInifile, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_section_add(pICInifile, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_section_exist(pICInifile, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);


            if (!pICInifile.m_key_exist(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_key_exist(pICInifile, str1_1.ptr, EXTPluginInfo.sectors.sect_name2.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name3.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_2.ptr, EXTPluginInfo.sectors.sect_name4.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_3.ptr, EXTPluginInfo.sectors.sect_name5.ptr))
                throw new ExceptionAPI(3);


            if (!pICInifile.m_value_set(pICInifile, str1_0.ptr, firstUnitTestCStr.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);
            if (!pICInifile.m_key_exist(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_save(pICInifile))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_key_delete(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);
            if (pICInifile.m_key_exist(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_load(pICInifile))
                throw new ExceptionAPI(3);

            if (!pICInifile.m_key_exist(pICInifile, str1_0.ptr, EXTPluginInfo.sectors.sect_name1.ptr))
                throw new ExceptionAPI(3);

            retCode = 0;
            if (!pICInifile.m_content(pICInifile, &strPtrW, &retCode))
                throw new ExceptionAPI(3);
            if (!(strPtrW && retCode))
                throw new ExceptionAPI(3);

            if (iniFileDataStr.length != retCode) //Does not required -1 after Length
                throw new ExceptionAPI(3);

            //D way.
            wchar[] dStrPtrW = strPtrW[0..retCode];
            if (dStrPtrW != iniFileDataStr)
                throw new ExceptionAPI(3);

            //C way
            //retCode++; //Is not required.
            do {
                retCode--;
                if (strPtrW[retCode] != iniFileDataStr[retCode])
                    throw new ExceptionAPI(3);
            } while (retCode);


            if (!pICInifile.m_delete_file(pICInifile, iniFileStr.ptr))
                throw new ExceptionAPI(3);

            MessageBoxA(null, "ICIniFile API has passed unit test.", "PASSED - ICIniFile", MB_OK | MB_ICONINFORMATION);
        }
        static if (__traits(compiles, EXT_ICOMMAND)) {
            pICommand = getICommand(hash);
            if (!pICommand)
                throw new ExceptionAPI(4);

            //TODO: need to re-review this function internally.
            if (pICommand.m_reload_level(hash))
                throw new ExceptionAPI(4);

            if (pICommand.m_delete(hash, &eao_testExecute, eaoTestExecuteStr.ptr))
                throw new ExceptionAPI(4);
            if (pICommand.m_alias_delete(eaoTestExecuteStr.ptr, eaoTestExecuteAliasStr.ptr))
                throw new ExceptionAPI(4);
            if (!pICommand.m_add(hash, eaoTestExecuteStr.ptr, &eao_testExecute, EXTPluginInfo.sectors.sect_name1.ptr, 1, 1, 0, modeAll))
                throw new ExceptionAPI(4);
            if (pICommand.m_add(hash, eaoTestExecuteStr.ptr, &eao_testExecute, EXTPluginInfo.sectors.sect_name1.ptr, 1, 1, 0, modeAll))
                throw new ExceptionAPI(4);
            if (!pICommand.m_delete(hash, &eao_testExecute, eaoTestExecuteStr.ptr))
                throw new ExceptionAPI(4);
            if (pICommand.m_delete(hash, &eao_testExecute, eaoTestExecuteStr.ptr))
                throw new ExceptionAPI(4);
            if (!pICommand.m_add(hash, eaoTestExecuteStr.ptr, &eao_testExecute, EXTPluginInfo.sectors.sect_name1.ptr, 1, 1, 1, modeAll))
                throw new ExceptionAPI(4);
            if (!pICommand.m_add(hash, eaoTestExecuteStr.ptr, &eao_testExecuteOverride, EXTPluginInfo.sectors.sect_name1.ptr, 1, 1, 1, modeAll))
                throw new ExceptionAPI(4);
            if (pICommand.m_add(hash, eaoTestExecuteStr.ptr, &eao_testExecuteOverride2, EXTPluginInfo.sectors.sect_name1.ptr, 1, 1, 1, modeAll))
                throw new ExceptionAPI(4);

            if (!pICommand.m_alias_add(eaoTestExecuteStr.ptr, eaoTestExecuteAliasStr.ptr))
                throw new ExceptionAPI(4);
            if (pICommand.m_alias_add(eaoTestExecuteStr.ptr, eaoTestExecuteAliasStr.ptr))
                throw new ExceptionAPI(4);
            if (!pICommand.m_alias_delete(eaoTestExecuteStr.ptr, eaoTestExecuteAliasStr.ptr))
                throw new ExceptionAPI(4);
            if (pICommand.m_alias_delete(eaoTestExecuteStr.ptr, eaoTestExecuteAliasStr.ptr))
                throw new ExceptionAPI(4);
            if (!pICommand.m_alias_add(eaoTestExecuteStr.ptr, eaoTestExecuteAliasStr.ptr))
                throw new ExceptionAPI(4);

            if (!pICommand.m_reload_level(hash))
                throw new ExceptionAPI(4);
            if (!pICommand.m_load_from_file(hash, eaoLoadFileStr.ptr, plINull, MSG_PROTOCOL.MP_RCON))
                throw new ExceptionAPI(4);

            MessageBoxA(null, "ICommand API has passed unit test.", "PASSED - ICommand", MB_OK | MB_ICONINFORMATION);
        }
        static if (__traits(compiles, EXT_IOBJECT)) {
            pIObject = getIObject(hash);
            if (!pIObject)
                throw new ExceptionAPI(5);
            objTagGroupList gtag_list;
            if (!pIObject.m_get_lookup_group_tag_list(e_tag_group.TAG_WEAP, &gtag_list))
                throw new ExceptionAPI(5);
            if (gtag_list.count == 0)
                throw new ExceptionAPI(5);
            if (gtag_list.tag_list[0].group_tag != e_tag_group.TAG_WEAP)
                throw new ExceptionAPI(5);
            hTagHeader* tag_header = pIObject.m_lookup_tag_type_name(e_tag_group.TAG_WEAP, gtag_list.tag_list[0].tag_name);
            if (!tag_header)
                throw new ExceptionAPI(5);
            if (tag_header != gtag_list.tag_list[0])
                throw new ExceptionAPI(5);
            s_ident object_id;
            s_ident parent_id = { -1 };
            objManaged move_object;
            move_object.world.x = 1.0f;
            move_object.world.y = 1.0f;
            move_object.world.z = 1.0f;
            if (!pIObject.m_create(tag_header.ident, parent_id, 1000, &object_id, &move_object.world))
                throw new ExceptionAPI(5);
            s_object* created_object = pIObject.m_get_address(object_id);
            if (!created_object)
                throw new ExceptionAPI(5);

            tag_header = pIObject.m_lookup_tag(created_object.ModelTag);
            if (!tag_header)
                throw new ExceptionAPI(5);
            if (tag_header != gtag_list.tag_list[0])
                throw new ExceptionAPI(5);

            if (created_object.World.x != 1.0f &&created_object.World.y != 1.0f &&created_object.World.z != 1.0f)
                throw new ExceptionAPI(5);
            move_object.world.x = 2.0f;
            move_object.world.y = 2.0f;
            move_object.world.z = 2.0f;
            pIObject.m_move(object_id, move_object);
            if (created_object.World.x != 2.0f &&created_object.World.y != 2.0f &&created_object.World.z != 2.0f)
                throw new ExceptionAPI(5);
            move_object.world.x = 5.0f;
            move_object.world.y = 5.0f;
            move_object.world.z = 5.0f;
            pIObject.m_move_and_reset(object_id, &move_object.world);
            if (created_object.World.x != 5.0f &&created_object.World.y != 5.0f &&created_object.World.z != 5.0f)
                throw new ExceptionAPI(5);
            pIObject.m_update(object_id);
            if (!pIObject.m_destroy(object_id))
                throw new ExceptionAPI(5);
            //This step is required to prevent memory leaking since C does not support deconstructor.
            if (GlobalFree(gtag_list.tag_list))
                throw new ExceptionAPI(5);
            MessageBoxA(null, "IObject API has passed unit test.", "PASSED - IObject", MB_OK | MB_ICONINFORMATION);
        }
        static if (__traits(compiles, EXT_IPLAYER)) {
            pIPlayer = getIPlayer(hash);
            if (!pIPlayer)
                throw new ExceptionAPI(6);

            PlayerInfoList plList;
            ushort totalPlayers = pIPlayer.m_get_str_to_player_list("*"w.ptr, &plList, null);
            if (totalPlayers == 0)
                throw new ExceptionAPI(6);

            PlayerInfo plITest, plITest2;
            if (pIPlayer.m_get_m_index(2, &plITest))
                throw new ExceptionAPI(6);
            if (pIPlayer.m_get_m_index(1, &plITest))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_m_index(0, &plITest))
                throw new ExceptionAPI(6);
            if (pIPlayer.m_get_id(200, &plITest2))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_id(plITest.plR.PlayerIndex, &plITest2))
                throw new ExceptionAPI(6);
            if (!(plITest.mS == plITest2.mS && plITest.plEx == plITest2.plEx && plITest.plS == plITest2.plS && plITest.plR == plITest2.plR))
                throw new ExceptionAPI(6);

            s_biped* plBiped = cast(s_biped*)pIObject.m_get_address(plITest.plS.CurrentBiped);
            if (!plBiped)
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_ident(plBiped.PlayerOwner,&plITest2))
                throw new ExceptionAPI(6);

            if (pIPlayer.m_get_by_unique_id(600, &plITest2))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_by_unique_id(plITest.mS.UniqueID, &plITest2))
                throw new ExceptionAPI(6);
            if (!(plITest.mS == plITest2.mS && plITest.plEx == plITest2.plEx && plITest.plS == plITest2.plS && plITest.plR == plITest2.plR))
                throw new ExceptionAPI(6);
            retCode = pIPlayer.m_get_id_full_name(plITest.plR.PlayerName.ptr);
            if (!retCode)
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_full_name_id(retCode, testStrW.ptr))
                throw new ExceptionAPI(6);
            retCode = pIPlayer.m_get_id_ip_address(plITest.plEx.IP_Address.ptr);
            if (!retCode)
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_ip_address_id(retCode, testStrW.ptr))
                throw new ExceptionAPI(6);
            retCode = pIPlayer.m_get_id_port(plITest.plEx.IP_Port.ptr);
            if (!retCode)
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_port_id(retCode, testStrW.ptr))
                throw new ExceptionAPI(6);

            if (pIPlayer.m_update(&plINull))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_update(&plITest))
                throw new ExceptionAPI(6);

            VARIANT[1] argVariant;
            VARIANTwstr(&argVariant[0], plITest.plR.PlayerName.ptr);
            if (!pIPlayer.m_send_custom_message(MSG_FORMAT.MF_BLANK, MSG_PROTOCOL.MP_CHAT, &plITest, "Simple blank prefix message for {0:s}"w.ptr, 1, argVariant.ptr))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_send_custom_message(MSG_FORMAT.MF_SERVER, MSG_PROTOCOL.MP_CHAT, &plITest, "Simple server prefix message for {0:s}"w.ptr, 1, argVariant.ptr))
                throw new ExceptionAPI(6);

            if (!pIPlayer.m_send_custom_message_broadcast(MSG_FORMAT.MF_BLANK, "Simple blank prefix message for everyone"w.ptr, 0, null))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_send_custom_message_broadcast(MSG_FORMAT.MF_SERVER, "Simple server prefix message for everyone"w.ptr, 0, null))
                throw new ExceptionAPI(6);

            //m_apply_camo test only required biped data to verify data is set to camoflauge.
            if (plBiped.isInvisible & 0x10)
                throw new ExceptionAPI(6);
            pIPlayer.m_apply_camo(&plITest, 10);
            if (!(plBiped.isInvisible & 0x10))
                throw new ExceptionAPI(6);

            e_color_team_index oldTeam = plITest.plR.Team;
            pIPlayer.m_change_team(&plITest, oldTeam==e_color_team_index.RED?e_color_team_index.BLUE:e_color_team_index.RED, 1);
            if (plITest.plR.Team == oldTeam)
                throw new ExceptionAPI(6);

            tm gmtm;
            time_t localTime = time(null);
            gmtm = *gmtime(&localTime);
            gmtm.tm_min += 5;
            if (!pIPlayer.m_ban_player(plITest.plEx, &gmtm))
                throw new ExceptionAPI(6);
            UINT banID, banID2;
            //Test CD hash key (un)ban verification
            if ((banID = pIPlayer.m_ban_CD_key_get_id(plITest.plEx.CDHashW.ptr)) == 0)
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_unban_id(banID))
                throw new ExceptionAPI(6);
            //TODO: Does not validate if CD hash is valid first before ban
            if (pIPlayer.m_ban_CD_key(plITest.plEx.CDHashW.ptr, &gmtm) != 1)
                throw new ExceptionAPI(6);
            if ((banID2 = pIPlayer.m_ban_CD_key_get_id(plITest.plEx.CDHashW.ptr)) == 0)
                throw new ExceptionAPI(6);
            if (banID != banID2)
                throw new ExceptionAPI(6);
            //Test IP Address (un)ban verification
            if ((banID = pIPlayer.m_ban_ip_get_id(plITest.plEx.IP_Address.ptr)) == 0)
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_unban_id(banID))
                throw new ExceptionAPI(6);
            //TODO: Does not validate if IP Address is valid first before ban
            if (pIPlayer.m_ban_ip(plITest.plEx.IP_Address.ptr, &gmtm) != 1)
                throw new ExceptionAPI(6);
            if ((banID2 = pIPlayer.m_ban_ip_get_id(plITest.plEx.IP_Address.ptr)) == 0)
                throw new ExceptionAPI(6);
            if (banID != banID2)
                throw new ExceptionAPI(6);

            IN_ADDR ipAddr;
            if (!pIPlayer.m_get_ip(plITest.mS, &ipAddr))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_port(plITest.mS, &totalPlayers))
                throw new ExceptionAPI(6);
            if (!pIPlayer.m_get_CD_hash(plITest.mS, cdHashKeyA.ptr))
                throw new ExceptionAPI(6);

            //Uncomment this part if need to verify function return correctly with/out an admin player.
            //if (!pIPlayer.m_is_admin(plITest.mS.machineIndex))
            //throw new ExceptionAPI(6);


            MessageBoxA(null, "IPlayer API has passed unit test.", "PASSED - IPlayer", MB_OK | MB_ICONINFORMATION);
        }
        static if (__traits(compiles, EXT_IADMIN)) {
            PlayerInfo plIMockUp;
            if (!pIPlayer.m_get_m_index(0, &plIMockUp))
                throw new ExceptionAPI(6);

            pIAdmin = getIAdmin(hash);
            if (!pIAdmin)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_is_username_exist(username.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(7);
            if (pIAdmin.m_delete(username.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(7);

            ArgContainer arg;
            CmdFunc func;
            short tmpLvl = plIMockUp.plEx.adminLvl;
            plIMockUp.plEx.adminLvl = 0;
            if (pIAdmin.m_is_authorized(&plIMockUp, cmdEaoLoad.ptr, &arg, &func) != CMD_AUTH.DENIED)
                throw new ExceptionAPI(7);
            plIMockUp.plEx.adminLvl = 9999;
            if (pIAdmin.m_is_authorized(&plIMockUp, cmdEaoLoad.ptr, &arg, &func) != CMD_AUTH.AUTHORIZED)
                throw new ExceptionAPI(7);
            if (pIAdmin.m_is_authorized(&plINull, cmdEaoLoadOutOfRange.ptr, &arg, &func) != CMD_AUTH.OUT_OF_RANGE)
                throw new ExceptionAPI(7);
            plIMockUp.plEx.adminLvl = tmpLvl;

            if (pIAdmin.m_add(plIMockUp.plEx.CDHashW.ptr, plIMockUp.plEx.IP_Address.ptr, "0"w.ptr, username.ptr, username.ptr, 9999, 0, 0) != e_boolean.TRUE)
                throw new ExceptionAPI(7);
            if (pIAdmin.m_add(plIMockUp.plEx.CDHashW.ptr, plIMockUp.plEx.IP_Address.ptr, "0"w.ptr, username.ptr, username.ptr, 9999, 0, 0) != e_boolean.FALSE)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_is_username_exist(username.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_is_authorized(&plIMockUp, cmdEaoLoad.ptr, &arg, &func) != CMD_AUTH.AUTHORIZED)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_login(&plIMockUp, MSG_PROTOCOL.MP_CHAT, usernamebad.ptr, username.ptr) != LOGIN_VALIDATION.FAIL)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_is_authorized(&plIMockUp, cmdEaoLoad.ptr, &arg, &func) != CMD_AUTH.DENIED)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_login(&plIMockUp, MSG_PROTOCOL.MP_CHAT, username.ptr, username.ptr) != LOGIN_VALIDATION.OK)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_is_authorized(&plIMockUp, cmdEaoLoad.ptr, &arg, &func) != CMD_AUTH.AUTHORIZED)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_delete(username.ptr) != e_boolean.TRUE)
                throw new ExceptionAPI(7);

            if (pIAdmin.m_delete(username.ptr) != e_boolean.FALSE)
                throw new ExceptionAPI(7);

            MessageBoxA(null, "IAdmin API has passed unit test.", "PASSED - IAdmin", MB_OK | MB_ICONINFORMATION);
        }
        static if (__traits(compiles, EXT_IHALOENGINE)) {pIHaloEngine = getIHaloEngine(hash);
            if (!pIHaloEngine)
                throw new ExceptionAPI(8);
            /*TODO: Need find better test for serverHeader.
            if (pIHaloEngine.serverHeader.totalPlayers != 1)
            throw new ExceptionAPI(8);
            */
            if (!(pIHaloEngine.playerReserved.MachineIndex == 0 && pIHaloEngine.playerReserved.PlayerIndex == 0))
                throw new ExceptionAPI(8);

            if (pIHaloEngine.isDedi && pIHaloEngine.haloGameVersion == HALO_VERSION.HV_CE) {
                if (pIHaloEngine.machineHeaderSize != 0xEC)
                    throw new ExceptionAPI(8);
            } else {
                if (pIHaloEngine.machineHeaderSize != 0x60)
                    throw new ExceptionAPI(8);
            }
            s_machine_slot* mSIndex = pIHaloEngine.machineHeader;
            if (!(mSIndex.machineIndex == 0 && !mSIndex.isAvailable && mSIndex.data1 && mSIndex.Unknown9 == 0x0007))
                throw new ExceptionAPI(8);
            mSIndex = cast(s_machine_slot*)(cast(BYTE*)pIHaloEngine.machineHeader + pIHaloEngine.machineHeaderSize);
            if (!(mSIndex.machineIndex == -1 && !mSIndex.data1 && mSIndex.Unknown9 == 0x0000))
                throw new ExceptionAPI(8);

            if (pIHaloEngine.mapCurrent.head != MAKE_ID!("head"))
                throw new ExceptionAPI(8);
            switch (pIHaloEngine.haloGameVersion) {
                case HALO_VERSION.HV_TRIAL: {
                    if (pIHaloEngine.mapCurrent.haloVersion != 0x00000006)
                        throw new ExceptionAPI(8);
                    break;
                }
                case HALO_VERSION.HV_CE: {
                    if (pIHaloEngine.mapCurrent.haloVersion != 0x00000261)
                        throw new ExceptionAPI(8);
                    break;
                }
                case HALO_VERSION.HV_PC: {
                    if (pIHaloEngine.mapCurrent.haloVersion != 0x00000007)
                        throw new ExceptionAPI(8);
                    break;
                }
                case HALO_VERSION.HV_UNKNOWN:
                default: {
                    throw new ExceptionAPI(8);
                }
            }
            if ((*pIHaloEngine.mapTimeLimitPermament) != -1)
                if ((*pIHaloEngine.mapTimeLimitLive) != (*pIHaloEngine.mapTimeLimitPermament))
                    throw new ExceptionAPI(8);
            if ((*pIHaloEngine.mapStatus).upTime != (*pIHaloEngine.mapUpTimeLive))
                throw new ExceptionAPI(8);

            /*
            * m_dispatch_rcon
            */
            rconData rcon = rconData(rconTestStr);
            /*rcon.unk = 0; //Always zero
            rcon.msg[0..rconTestStr.length] = rconTestStr[0..rconTestStr.length];
            rcon.msg[rconTestStr.length] = 0; //This is a requirement.
            rcon.msg_ptr = rcon.msg.ptr;*/
            PlayerInfo pl1;
            pl1.mS = pIHaloEngine.machineHeader;
            pIHaloEngine.m_dispatch_rcon(&rcon, &pl1);
            /*
            * m_dispatch_player
            */
            chatData d;
            d.msg_ptr = cast(wchar*)playerChatTest;
            d.player = 0;
            d.type = chatType.TEAM;
            // Gotta pass a pointer to the chatData struct
            uint d_ptr = cast(uint)&d;
            ubyte* packetBuffer = cast(ubyte*)malloc(4096 + 2 * playerChatTest.length);
            if (!packetBuffer)
                throw new ExceptionAPI(8);
            // Build the chat packet
            retCode = pIHaloEngine.m_build_packet(packetBuffer, 0, 0x0F, 0, &d_ptr, 0, 1, 0);
            pIHaloEngine.m_add_packet_to_player_queue(pl1.mS.machineIndex, packetBuffer, retCode, 1, 1, 0, 1, 3);
            free(packetBuffer);
            //
            pIHaloEngine.m_dispatch_player(&d, playerChatTest.length, &pl1);
            /*
            * m_dispatch_global
            */
            d.msg_ptr = cast(wchar*)globalChatTest.ptr;
            d.type = chatType.GLOBAL;
            d_ptr = cast(uint)&d;
            packetBuffer = cast(ubyte*)malloc(4096 + 2 * globalChatTest.length);
            if (!packetBuffer)
                throw new ExceptionAPI(8);
            // Build the chat packet
            retCode = pIHaloEngine.m_build_packet(packetBuffer, 0, 0x0F, 0, &d_ptr, 0, 1, 0);
            pIHaloEngine.m_add_packet_to_global_queue(packetBuffer, retCode, 1, 1, 0, 1, 3);
            free(packetBuffer);
            //
            pIHaloEngine.m_dispatch_global(&d, globalChatTest.length);
            //
            if (pIHaloEngine.isDedi) {
                if (!pIHaloEngine.m_map_next())
                    throw new ExceptionAPI(8);
                if (!pIHaloEngine.m_set_idling())
                    throw new ExceptionAPI(8);
            }
            if (!pIHaloEngine.m_send_reject_code(pIHaloEngine.machineHeader, REJECT_CODE.VIDEO_TEST))
                throw new ExceptionAPI(8);
            if (!pIHaloEngine.m_exec_command("sv_maplist"))
                throw new ExceptionAPI(8);
            wchar[8] passwordW = "unitest";
            char[8] passwordA = "unitest";
            pIHaloEngine.m_set_server_password(passwordW.ptr);
            pIHaloEngine.m_get_server_password(passwordWGet.ptr);
            wchar* testW1 = passwordW.ptr, testW2 = passwordWGet.ptr;
            do {
                if (testW1[0] != testW2[0])
                    throw new ExceptionAPI(8);
                testW1++;
                testW2++;
            } while (testW1[0] && testW2[0]);

            pIHaloEngine.m_set_rcon_password(passwordA.ptr);
            pIHaloEngine.m_get_rcon_password(passwordAGet.ptr);
            char* testA1 = passwordA.ptr, testA2 = passwordAGet.ptr;
            do {
                if (testA1[0] != testA2[0])
                    throw new ExceptionAPI(8);
                testA1++;
                testA2++;
            } while (testA1[0] && testA2[0]);


            //Addon test section
            /*TODO: Both functions will not work in middle of load process.
            addon_info eaoInfo;
            if (!pIHaloEngine.m_ext_add_on_get_info_index(0, &eaoInfo))
            throw new ExceptionAPI(8);
            eaoInfo.author[0] = 0;
            eaoInfo.config_folder[0] = 0;
            if (!pIHaloEngine.m_ext_add_on_get_info_by_name(eaoInfo.name, &eaoInfo))
            throw new ExceptionAPI(8);
            */
            //TODO: This function cannot be tested otherwise it will go in a loop plus is not fully implemented yet.
            //if (!pIHaloEngine.m_ext_add_on_reload(EXTPluginInfo.name))
            //    throw new ExceptionAPI(8);




            MessageBoxA(null, "IHaloEngine API has passed unit test.", "PASSED - IHaloEngine", MB_OK | MB_ICONINFORMATION);
        }
        /*static if (__traits(compiles, )) {
        }*/
        static if (__traits(compiles, EXT_ITIMER)) {
            pITimer = getITimer(hash);
            if (!pITimer)
                throw new ExceptionAPI(2);
            TimerID[0] = pITimer.m_add(hash, null, 0); //1/30 second
            if (!TimerID[0])
                throw new ExceptionAPI(2);
            TimerID[1] = pITimer.m_add(hash, null, 60); //2 seconds
            if (!TimerID[1])
                throw new ExceptionAPI(2);
            pITimer.m_delete(hash, TimerID[1]);
            static if (__traits(compiles, ITIMER_LOOP_CHECK)) {
                TimerIDLoop = pITimer.m_add(hash, null, 30);
                TimerTickLoop = GetTickCount();
            }
        }
    } catch(ExceptionAPI e) {
        MessageBoxA(null, e.msg.ptr, "ERROR", MB_OK | MB_ICONERROR);
        return EAO_RETURN.FAIL;
    }
    return EAO_RETURN.CONTINUE;
}

export extern(C) void EXTOnEAOUnload() {
    static if (__traits(compiles, EXT_ICINIFILE)) {
        if (pICInifile)
            pICInifile.m_release(pICInifile);
    }
}

static if (__traits(compiles, EXT_HKTIMER)) {
export extern(C) void EXTOnTimerExecute(uint id) {
    static if (__traits(compiles, ITIMER_LOOP_CHECK)) {
    if (TimerIDLoop == id) {
        DWORD tempTimerTickLoop = GetTickCount();
        VARIANT var = { 0 };
        VARIANTulong(&var, tempTimerTickLoop - TimerTickLoop);
        TimerTickLoop = tempTimerTickLoop;
        pIPlayer.m_send_custom_message(MF_INFO, MP_RCON, &plINull, "{0:d} millisecond(s).", 1, &var);
        TimerIDLoop = pITimer.m_add(EAOhashID, 0, 30); //1 second
        return; //This is needed to "mock up" else to avoid force failure below.
    } //else //Compiler complaint about incomplete statement.
    }
    if (TimerID[0] == id) {
        if (!TimerTickStart) {
            TimerTickStart = GetTickCount();
            TimerID[0] = pITimer.m_add(EAOhashID, null, 150); //5 seconds
            if (!TimerID[0])
                goto failedITimer;
            TimerID[2] = pITimer.m_add(EAOhashID, null, 30); //1 second
            if (!TimerID[2])
                goto failedITimer;
        } else {
            TimerTickSys[0] = GetTickCount();
            DWORD tmpTimerCheck = TimerTickSys[0] - TimerTickStart;
            if (!(4500 < tmpTimerCheck && tmpTimerCheck < 5033))
                goto failedITimer;
            if (TimerTickSys[1] != 0)
                goto failedITimer;
            tmpTimerCheck = TimerTickSys[2] - TimerTickStart;
            if (!(500< tmpTimerCheck && tmpTimerCheck < 1033))
                goto failedITimer;
            tmpTimerCheck = TimerTickSys[3] - TimerTickStart;
            if (!(2500 < tmpTimerCheck && tmpTimerCheck < 3033))
                goto failedITimer;
            MessageBoxA(NULL, "ITimer API has passed unit test.", "PASSED - ITimer", MB_OK | MB_ICONINFORMATION);
        }
    } else if (TimerID[1] == id) {
        TimerTickSys[1] = GetTickCount();
    } else if (TimerID[2] == id) {
        TimerTickSys[2] = GetTickCount();
        TimerID[3] = pITimer.m_add(EAOhashID, null, 60); //2 seconds
        if (!TimerID[3])
            goto failedITimer;
    } else if (TimerID[3] == id) {
        TimerTickSys[3] = GetTickCount();
    } else {
    failedITimer:
        MessageBoxA(NULL, "ITimer API has failed unit test.", "ERROR - ITimer", MB_OK | MB_ICONERROR);
    }
}
export extern(C) void EXTOnTimerCancel(uint id) {
    if (TimerID[0] == id) {
    } else if (TimerID[1] == id) {
    } else if (TimerID[2] == id) {
    } else if (TimerID[3] == id) {
    } else {
        MessageBoxA(NULL, "ITimer API has failed unit test.", "ERROR - ITimer", MB_OK | MB_ICONERROR);
    }
}
}
