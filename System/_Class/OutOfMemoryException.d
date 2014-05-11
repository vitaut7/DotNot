module System._Class.OutOfMemoryException;

import System;


public class OutOfMemoryException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("TODO")); //TODO
		SetErrorCode(__HResults.COR_E_OUTOFMEMORY);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_OUTOFMEMORY);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_OUTOFMEMORY);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}