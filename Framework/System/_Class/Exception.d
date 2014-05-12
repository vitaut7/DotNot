module System._Class.Exception;

import System;
import System.Reflection;
import System.Runtime.Serialization;
import System.Runtime.InteropServices;


// Toto je Exception z .NETu akurad sa mi to nechce prerabat do object.d
public class BaseException : Throwable, ISerializable
{
	private string _className;
	private MethodBase _exceptionMethod;
	private string _exceptionMethodString;
	private string _message;
	private IDictionary _data;
	private Exception _innerException;
	private string _helpURL;
	private Object _stackTrace;
	private SafeSerializationManager _safeSerializationManager;

	private int _hResult;

	@property
	{
		public int HResult() { return _hResult; }
		protected void HResult(int value) { _hResult = value; }
	}

	public this() 
	{
		Init();
	}

	public this(string message)
	{
		Init();
		_message = message;
	}

	public this(string message, Exception innerException)
	{
		Init();
		_message = message;
		_innerException = innerException;
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		if (info is null)
			throw new ArgumentNullException("info");
		//TODO: Cotnract...

		_className = info.GetString("ClassName");
		_message   = info.GetString("Message");
		_data      = cast(IDictionary)info.GetValueNoThrow("Data", typeid(IDictionary));
	}

	@internal void SetErrorCode(int hr)
	{
		_hResult = hr;
	}

	public override void GetObjectData(SerializationInfo info, StreamingContext context)
	{
		if (info is null)
			throw new ArgumentNullException("info");

		throw new BaseException("Tvoja matka je tak tlsta ze ju ani try-catch nezachyti");
	}

	private void Init()
	{
		_message = null;
		_stackTrace = null;
		_safeSerializationManager = new SafeSerializationManager();

	}
}

unittest
{
	throw new BaseException();
	try
	{
		throw new BaseException();
	}
	catch (BaseException e)
	{
		import std.stdio;
		"excp".writeln();
	}
}