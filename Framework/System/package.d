module System;

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
public import System._Class.Real;
public import System._Class.Char;
public import System._Class.Guid;
public import System._Class.UByte;
public import System._Class.Float;
public import System._Class.Int16;
public import System._Class.Int32;
public import System._Class.Int64;
public import System._Class.Event;
public import System._Class.Double;
public import System._Class.IntPtr;
public import System._Class.UInt16;
public import System._Class.UInt32;
public import System._Class.UInt64;
public import System._Class.String;
public import System._Class.Boolean;
public import System._Class.Convert;
public import System._Class.Delegate;
public import System._Class.DateTime;
public import System._Class.EventArgs;
public import System._Class.AppDomain;
public import System._Class.Exception;
public import System._Class.ValueType;
public import System._Class.__HResults;
public import System._Class.RuntimeType;
public import System._Class.Environment;
public import System._Class.RankException;
public import System._Class.RuntimeHandles;
public import System._Class.FormatException;
public import System._Class.SystemException;
public import System._Class.TimeoutException;
public import System._Class.GenericUriParser;
public import System._Class.OverflowException;
public import System._Class.ArgumentException;
public import System._Class.MarshalByRefObject;
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
public import System._Class.UnitySerializationHolder;
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

public import System._Class.AppDomainManager;
public import System._Class.Version;
public import System._Class.DBNull;

@property public int Length(T)(T value)
{
	return cast(int)value.length;
}


interface IDictionary {};//(TKey, TValue) {}

abstract class CultureInfo : IFormatProvider
{
	@property public static CultureInfo InvariantCulture() { assert(0); }
	@property public static CultureInfo CurrentCulture() { assert(0); }
}

class Contract
{
	public static void EndContractBlock() { }
	public static void Ensures(bool condition) { assert(0); }
	public static T Result(T)() { assert(0); }
	public static void Requires(bool condition, string userMessage) {}

	public static void Assert(bool condition, string userMessage) { assert(condition, userMessage); }
}

string ToString(T)(T value)
{
	return value.stringof; //TODO
}

@property
{
	public string Trim(string str) { return str; }
}

abstract public class RealProxy {
	public IntPtr GetCOMIUnknown(bool fIsMarshalled) { assert(0); }

	import System.Runtime.Remoting;
	@property Identity IdentityObject() { assert(0); }
}
public static class RemotingServices
{
	public static RealProxy GetRealProxy(Object proxy) { assert(0); }
	static bool ProxyCheckCast(RealProxy rp, RuntimeType castType) { assert(0); }
	public static bool IsTransparentProxy(Object proxy) { assert(0); }
}

class Interlocked
{
	public static Object CompareExchange(ref Object location1, Object value, Object comparand) { assert(0); }
}

public class Hashtable
{
	Object opIndex(Object key) { assert(0); }
	void opIndexAssign(Object value, Object key) { assert(0); }
	@property Object[] Values() { assert(0);}
}

class Activator
{
	import System.Reflection;
	static const BindingFlags ConstructorDefault= BindingFlags.Instance | BindingFlags.Public | BindingFlags.CreateInstance;

	static public Object CreateInstance(Type type,
	                                    BindingFlags bindingAttr,
	                                    Binder binder,
	                                    Object[] args,
	CultureInfo culture) {assert(0);}
}

class Number
{
	import System.Globalization;

	public static string FormatInt32(int value, string format, NumberFormatInfo info) { assert(0); }
	public static string FormatUInt32(uint value, string format, NumberFormatInfo info) { assert(0); }
	public static string FormatInt64(long value, string format, NumberFormatInfo info) { assert(0); }
	public static string FormatUInt64(ulong value, string format, NumberFormatInfo info) { assert(0); }
	public static string FormatFloat(float value, string format, NumberFormatInfo info) { assert(0); }
	public static String FormatDouble(double value, string format, NumberFormatInfo info) { assert(0); }

	static int ParseInt32(string s, NumberStyles style, NumberFormatInfo info) { assert(0); }
	static uint ParseUInt32(string s, NumberStyles style, NumberFormatInfo info) { assert(0); }
	static Boolean TryParseInt32(string s, NumberStyles style, NumberFormatInfo info, out int result) { assert(0); }
	static Boolean TryParseUInt32(string s, NumberStyles style, NumberFormatInfo info, out uint result) { assert(0); }

	static long ParseInt64(string s, NumberStyles style, NumberFormatInfo info) { assert(0); }
	static Boolean TryParseInt64(string s, NumberStyles style, NumberFormatInfo info, out long result) { assert(0); }
	static ulong ParseUInt64(string s, NumberStyles style, NumberFormatInfo info) { assert(0); }
	static Boolean TryParseUInt64(string s, NumberStyles style, NumberFormatInfo info, out ulong result) { assert(0); }

	static float ParseFloat(string value, NumberStyles options, NumberFormatInfo info) { assert(0); }
	static Boolean TryParseFloat(string value, NumberStyles options, NumberFormatInfo info, out float result) { assert(0); }

	static double ParseDouble(string value, NumberStyles options, NumberFormatInfo info) { assert(0); }
	static Boolean TryParseDouble(string value, NumberStyles options, NumberFormatInfo info, out double result) { assert(0); }
}

//UDA
public const enum internal = "Internal";