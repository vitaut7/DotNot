module System._Class.SystemException;

import System;


public class SystemException : BaseException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_SystemException"));
		SetErrorCode(__HResults.COR_E_SYSTEM);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_SYSTEM);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_SYSTEM);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}