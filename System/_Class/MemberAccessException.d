module System._Class.MemberAccessException;

import System;


public class MemberAccessException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_AccessException"));
		SetErrorCode(__HResults.COR_E_MEMBERACCESS);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_MEMBERACCESS);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_MEMBERACCESS);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}