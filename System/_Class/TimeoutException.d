module System._Class.TimeoutException;

import System;


public class TimeoutException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_TimeoutException"));
		SetErrorCode(__HResults.COR_E_TIMEOUT);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_TIMEOUT);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_TIMEOUT);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}