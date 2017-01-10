module exceptionAPI;

class ExceptionAPI : Throwable {
    /**
    * Creates a new instance of Exception. The next parameter is used
    * internally and should always be $(D null) when passed by user code.
    * This constructor does not automatically throw the newly-created
    * Exception; the $(D throw) statement should be used for that purpose.
    */
    @nogc @safe pure nothrow this(uint i, string file = __FILE__, size_t line = __LINE__, Throwable next = null)
    {
        string msg;
        switch(i) {
            case 1:
                msg = "IUtil API has failed unit test.";
                break;
            case 2:
                msg = "ITimer API has failed unit test.";
                break;
            case 3:
                msg = "ICIniFile API has failed unit test.";
                static if (__traits(compiles, EXT_ICINIFILE)) {
                    if (pICInifile)
                        pICInifile.m_release(pICInifile);
                    pICInifile = null;
                }
                break;
            case 4:
                msg = "ICommand API has failed unit test.";
                break;
            case 5:
                msg = "IObject API has failed unit test.";
                break;
            case 6:
                msg = "IPlayer API has failed unit test.";
                break;
            case 7:
                msg = "IAdmin API has failed unit test.";
                break;
            case 8:
                msg = "IHaloEngine API has failed unit test.";
                break;
            case 9:
            default:
                msg = "Unknown API has failed unit test.";
                break;
        }
        super(msg, file, line, next);
    }

    @nogc @safe pure nothrow this(uint i, Throwable next, string file = __FILE__, size_t line = __LINE__)
    {
        super("", file, line, next);
    }
    @nogc @safe pure nothrow this(uint i, Throwable next)
    {
        super("", next);
    }
}