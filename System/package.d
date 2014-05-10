module System;


public import System._Interface.IObserver;
public import System._Interface.IProgress;
public import System._Interface.IEquatable;
public import System._Interface.ICloneable;
public import System._Interface.IObservable;
public import System._Interface.IDisposable;
public import System._Interface.IComparable;
public import System._Interface.IFormattable;
public import System._Interface.IAsyncResult;
public import System._Interface.IConvertible;
public import System._Interface.IFormatProvider;
public import System._Interface.IAppDomainSetup;
public import System._Interface.ICustomFormatter;
public import System._Interface.IServiceProvider;


public import System._Class.GC;
public import System._Class.Type;
public import System._Class.EventArgs;
public import System._Class.AppDomain;
public import System._Class.ConsoleCancelEventArgs;
public import System._Class.Convert;
public import System._Class.GenericUriParser;
public import System._Class.LoaderOptimizationAttribute;


public import System._Struct.DateTime;


public import System._Enum.TypeCode;
public import System._Enum.ConsoleSpecialKey;
public import System._Enum.AttributeTargets;
public import System._Enum.ConsoleColor;
public import System._Enum.ConsoleKey;
public import System._Enum.ConsoleModifiers;
public import System._Enum.DateTimeKind;
public import System._Enum.DayOfWeek;
public import System._Enum.MidpointRounding;
public import System._Enum.PlatformID;
public import System._Enum.StringComparison;


public import System._Delegate.Action;
public import System._Delegate.AsyncCallback;
public import System._Delegate.EventHandler;
public import System._Delegate.UnhandledExceptionEventHandler;



//Public or wat
class UnhandledExceptionEventArgs : EventArgs {}
class AssemblyLoadEventArgs : EventArgs {}
class ResolveEventArgs {}
class Assembly {}