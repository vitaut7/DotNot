module System._Class.Exception;

import System;


// Toto je Exception z .NETu akurad sa mi to nechce prerabat do object.d
public class BaseException : Exception
{
	private int _hResult;

	@property
	{
		public int HResult() { return _hResult; }
	}


	public this() 
	{
		super("Unknown exception");
	}

	public this(string message)
	{
		super(message);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super("Serialized Exception LOL");
	}


	@internal void SetErrorCode(int hr)
	{
		_hResult = hr;
	}
}