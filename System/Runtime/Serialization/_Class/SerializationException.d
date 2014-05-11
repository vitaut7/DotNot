module System.Runtime.Serialization._Class.SerializationException;

import System;


public class SerializationException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_SerializationException"));
		SetErrorCode(__HResults.COR_E_SERIALIZATION);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_SERIALIZATION);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_SERIALIZATION);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}