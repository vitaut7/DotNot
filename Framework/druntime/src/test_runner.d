import core.runtime, core.time : TickDuration;
import core.stdc.stdio;

ModuleInfo* getModuleInfo(string name)
{
    foreach (m; ModuleInfo)
        if (m.name == name) return m;
    assert(0, "module '"~name~"' not found");
}

bool tester()
{
    assert(Runtime.args.length == 2);
    auto name = Runtime.args[1];
    immutable pkg = ".package";
    immutable pkgLen = pkg.length;

    if(name.length > pkgLen && name[$ - pkgLen .. $] == pkg)
        name = name[0 .. $ - pkgLen];

    if (auto fp = getModuleInfo(name).unitTest)
    {
        try
        {
            immutable t0 = TickDuration.currSystemTick;
            fp();
            immutable t1 = TickDuration.currSystemTick;
            printf("%.3fs PASS %.*s\n", (t1 - t0).msecs / 1000.,
                cast(int)name.length, name.ptr);
        }
        catch (Throwable e)
        {
            auto msg = e.toString();
            printf("****** FAIL %.*s\n%.*s\n", cast(int)name.length, name.ptr,
                cast(int)msg.length, msg.ptr);
            return false;
        }
    }
    return true;
}

shared static this()
{
    Runtime.moduleUnitTester = &tester;
}

void main()
{
}
