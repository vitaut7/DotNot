module System;
/*
    Constant Fields
    Fields
    Constructors
    Finalizers (Destructors)
    Delegates
    Events
    Enums
    Interfaces
    Properties
    Indexers
    Methods
    Structs
    Classes

    public
    internal
    protected internal
    protected
    private

    static
    non-static

    readonly
    non-readonly
*/

public import System._Delegate.Action;
public import System._Delegate.AsyncCallback;
public import System._Delegate.EventHandler;
public import System._Delegate.UnhandledExceptionEventHandler;

public import System._Enum.TypeCode;
public import System._Enum.DayOfWeek;
public import System._Enum.ConsoleKey;
public import System._Enum.PlatformID;
public import System._Enum.ConsoleColor;
public import System._Enum.DateTimeKind;
public import System._Enum.UriEnumTypes;
public import System._Enum.AttributeTargets;
public import System._Enum.ConsoleModifiers;
public import System._Enum.MidpointRounding;
public import System._Enum.StringComparison;
public import System._Enum.ConsoleSpecialKey;

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

public import System._Struct.ArgIterator;
public import System._Struct.TypedReference;
public import System._Struct.RuntimeArgumentHandle;

public import System._Class.GC;
public import System._Class.Type;
public import System._Class.Byte;
public import System._Class.UByte;
public import System._Class.Int16;
public import System._Class.Int32;
public import System._Class.Int64;
public import System._Class.Event;
public import System._Class.IntPtr;
public import System._Class.UInt16;
public import System._Class.UInt32;
public import System._Class.UInt64;
public import System._Class.String;
public import System._Class.Boolean;
public import System._Class.Convert;
public import System._Class.DateTime;
public import System._Class.EventArgs;
public import System._Class.AppDomain;
public import System._Class.Exception;
public import System._Class.__HResults;
public import System._Class.RuntimeType;
public import System._Class.RankException;
public import System._Class.RuntimeHandles;
public import System._Class.FormatException;
public import System._Class.SystemException;
public import System._Class.TimeoutException;
public import System._Class.GenericUriParser;
public import System._Class.OverflowException;
public import System._Class.ArgumentException;
public import System._Class.ArithmeticException;
public import System._Class.InvalidCastException;
public import System._Class.OutOfMemoryException;
public import System._Class.NotSupportedException;
public import System._Class.TypeUnloadedException;
public import System._Class.ArgumentNullException;
public import System._Class.DivideByZeroException;
public import System._Class.MemberAccessException;
public import System._Class.ConsoleCancelEventArgs;
public import System._Class.NullReferenceException;
public import System._Class.StackOverflowException;
public import System._Class.ContextMarshalException;
public import System._Class.DataMisalignedException;
public import System._Class.InvalidProgramException;
public import System._Class.NotImplementedException;
public import System._Class.NotFiniteNumberException;
public import System._Class.AccessViolationException;
public import System._Class.ExecutionEngineException;
public import System._Class.IndexOutOfRangeException;
public import System._Class.InvalidOperationException;
public import System._Class.OperationCanceledException;
public import System._Class.AppDomainUnloadedException;
public import System._Class.ArrayTypeMismatchException;
public import System._Class.UnauthorizedAccessException;
public import System._Class.ArgumentOutOfRangeException;
public import System._Class.LoaderOptimizationAttribute;
public import System._Class.UnhandledExceptionEventArgs;
public import System._Class.CannotUnloadAppDomainException;
public import System._Class.MulticastNotSupportedException;
public import System._Class.InsufficientExecutionStackException;

public import System._Class.ValueType;
public import System._Class.Environment;
public import System._Class.UnitySerializationHolder;


interface IDictionary {};//(TKey, TValue) {}

abstract class CultureInfo : IFormatProvider
{
	@property public static CultureInfo InvariantCulture() { assert(0); }
}

class Contract
{
	public static void EndContractBlock() { }

	public static void Assert(bool condition, string userMessage) { assert(condition, userMessage); }
}


class Double
{
	static Double opCall(double value) { return new Double(); }
	char ToChar(IFormatProvider p = null) { return 'a'; }
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
}

class Float
{
	static Float opCall(float value) { return new Float(); }
		char ToChar(IFormatProvider p = null) { return 'a'; }
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
}

class Real
{
	static Real opCall(real value) { return new Real(); }
		char ToChar(IFormatProvider p = null) { return 'a'; }
	DateTime ToDateTime(IFormatProvider p = null) { return null; }
}

class Char
{
	public static const MaxValue = 123;
	public static const MinValue = 0;

	static Char opCall(char value) { return new Char(); }
	float ToFloat(IFormatProvider p = null) { return 123.123; }
	double ToDouble(IFormatProvider p = null) { return 123.123; }
	real ToReal(IFormatProvider p = null) { return 123.123; }

	DateTime ToDateTime(IFormatProvider p = null) { return null; }

	public static bool IsWhiteSpace(char c) { return false; }
}


@property
{
	public int Length(byte[] b) { return cast(int)b.length; }
	public int Length(string b) { return cast(int)b.length; }
	public string Trim(string str) { return str; }
}




//UDA
public const enum internal = "Internal";