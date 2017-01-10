module UnitTestDh;

import UnitTestD;

public {
static if (__traits(compiles, EXT_IUTIL)) {
//boolean test section
static const wchar[] trueW = "true";
static const wchar[] TRUEW = "TRUE";
static const wchar[] trUeW = "trUe";
static const wchar[] trueNumW = "1";
static const char[] trueA = "true";
static const char[] TRUEA = "TRUE";
static const char[] trUeA = "trUe";
static const char[] trueNumA = "1";
static const wchar[] falseW = "false";
static const wchar[] FALSEW = "FALSE";
static const wchar[] faLseW = "faLse";
static const wchar[] falseNumW = "0";
static const char[] falseA = "false";
static const char[] FALSEA = "FALSE";
static const char[] faLseA = "faLse";
static const char[] falseNumA = "0";

//team test section
static const wchar[] blueW = "blue";
static const wchar[] BLUEW = "BLUE";
static const wchar[] btW = "bt";
static const char[] blueA = "blue";
static const char[] BLUEA = "BLUE";
static const char[] btA = "bt";
static const wchar[] redW = "red";
static const wchar[] REDW = "RED";
static const wchar[] rtW = "rt";
static const char[] redA = "red";
static const char[] REDA = "RED";
static const char[] rtA = "rt";

//detect string test section
static const wchar[] lettersW = "lEtteRs";
static const wchar[] lettersW2 = "LeTterS";
static const char[] lettersA = "lEtTeRs";
static const char[] lettersA2 = "LeTtErS";
static const wchar[] numbersW = "12348765";
static const wchar[] numbersW2 = "87651234";
static const char[] numbersA = "12348765";
static const char[] numbersA2 = "87651234";
static const wchar[] floatW = "1234.8765";
static const char[] floatA = "1234.8765";
static const wchar[] doubleW = "1.2348765";
static const char[] doubleA = "1.2348765";
static const wchar[] hashW = "87a651234";
static const char[] hashA = "876512z34";

static const wchar[] MatterW = "Matter";
static const char[] MatterA = "Matter";
static const wchar[] MattarW = "Mattar";
static const char[] MattarA = "Mattar";
static const wchar[] MattarReplaceBeforeW = "MattarTest 'Foobar'";
static const char[] MatterReplaceBeforeA = "MatterTest 'Foobar'";

//directory and file test section
static const wchar[] dirExtension = "extension";
static const wchar[] fileHExt = "H-Ext.dll";
static const wchar[] dirExtesion = "extesion";
static const wchar[] fileHEt = "H-Et.dll";

static wchar[0x20] replaceTestW = "Test 'Foobar'";
static const wchar[] replaceBeforeW = "Test 'Foobar'";
static const wchar[] replaceAfterW = "Test ''Foobar''";
static char[0x20] replaceTestA = "Test 'Foobar'";
static const char[] replaceBeforeA = "Test 'Foobar'";
static const char[] replaceAfterA = "Test ''Foobar''";

//regex test section
static wchar[40] regexTestNoDB = "? *? {test} )(string]here[there";
static const wchar[] regexTestNoDBAfter = ". .*. \\{test\\} \\)\\(string\\]here\\[there";
static wchar[40] regexTestDB = "? *? {test} )(string]here[there";
static const wchar[] regexTestDBAfter = "_ %_ \\{test\\} \\)\\(string\\]here\\[there";
static const wchar[] wildcard = ".*";
static const wchar[] wildcardEndTest = ".*Test";
static const wchar[] wildcardBeginUnit = "Unit .*";
static const wchar[] dotdotdot = "...";
static const wchar[] hi_ = "Hi!";
static const wchar[] Unit_Test = "Unit Test";
static const wchar[] unit_test = "unit test";

//variant test section
static const wchar[] variantFormatExpected = "慁 1.000000 2.000002 1 25 50 4294967295 2147483647 2147483647 4294967295 aA";
static const wchar[] variantFormat = "{0:s} {2:f} {3:f} {4:hhd} {5:hd} {6:hu} {8:u} {7:d} {9:ld} {10:lu} {1:s}";
}
//ICIniFile test section
static if (__traits(compiles, EXT_ICINIFILE)) {
static const wchar[] iniFileStr = "UnitTestC.ini";
static const wchar[] firstUnitTestCStr = "First Unit Test C";
static const wchar[] str1_0 = "1.0";
static const wchar[] str1_1 = "1.1";
static const wchar[] str1_2 = "1.2";
static const wchar[] str1_3 = "1.3";
static const wchar[] iniFileDataStr = " [unit_test]\r\n 1.0=First Unit Test C\r\n [test_unit]\r\n 1.1=First Unit Test C\r\n [unit test]";
}

//ICommand test section
static if (__traits(compiles, EXT_ICOMMAND)) {
static const wchar[] eaoTestExecuteStr = "eao_test_execute";
static const wchar[] eaoTestExecuteAliasStr = "testexec";
static const wchar[] eaoLoadFileStr = "unit_test.txt";
}

//IPlayer test section
static if (__traits(compiles, EXT_IPLAYER)) {
static char[0x60] cdHashKeyA = "";
}

//IAdmin test section
static if (__traits(compiles, EXT_IADMIN)) {
static const wchar[] username = "unittest";
static const wchar[] usernamebad = "unittes";
static const wchar[] cmdEaoLoad = "ext_addon_load unittest";
static const wchar[] cmdEaoLoadOutOfRange = "ext_addon_load";
}

//IHaloEngine test section
static if (__traits(compiles, EXT_IHALOENGINE)) {
static const char[] rconTestStr = "Rcon Test";
static const wchar[] playerChatTest = "Player Chat Test";
static const wchar[] globalChatTest = "Global Chat Test";
static wchar[8] passwordWGet = "deadbed";
static char[8] passwordAGet = "deadbed";
}
}
