module System._Class.Exception;

import System;
import System.Runtime.Serialization;


// Toto je Exception z .NETu akurad sa mi to nechce prerabat do object.d
public class BaseException : Exception, ISerializable
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

	public override void GetObjectData(SerializationInfo info, StreamingContext context)
	{
		if (info is null)
			throw new ArgumentNullException("info");

		throw new BaseException("Tvoja matka je tak tlsta ze ju ani try-catch nezachyti");
	}
}