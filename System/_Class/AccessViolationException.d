module System._Class.AccessViolationException;

import System;


public class AccessViolationException : BaseException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_AccessViolationException"));
		SetErrorCode(__HResults.E_POINTER);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.E_POINTER);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.E_POINTER);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		SetErrorCode(__HResults.E_POINTER);
		super(info, context);
	}
}