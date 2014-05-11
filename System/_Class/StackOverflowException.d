module System._Class.StackOverflowException;

import System;


public class StackOverflowException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_StackOverflowException"));
		SetErrorCode(__HResults.COR_E_STACKOVERFLOW);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_STACKOVERFLOW);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_STACKOVERFLOW);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}