module System._Class.NotSupportedException;

import System;


public class NotSupportedException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_NotSupportedException"));
		SetErrorCode(__HResults.COR_E_NOTSUPPORTED);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_NOTSUPPORTED);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_NOTSUPPORTED);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}