module System.Threading._Class.ThreadStartException;

import System;


public final class ThreadStartException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_ThreadStartException"));
		SetErrorCode(__HResults.COR_E_THREADSTART);
	}

	public this(Exception innerException)
	{
		super(Environment.GetResourceString("Arg_ThreadStartException"), innerException);
		SetErrorCode(__HResults.COR_E_THREADSTART);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}