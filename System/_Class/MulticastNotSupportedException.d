module System._Class.MulticastNotSupportedException;

import System;


public final class MulticastNotSupportedException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_MulticastNotSupportedException"));
		SetErrorCode(__HResults.COR_E_MULTICASTNOTSUPPORTED);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_MULTICASTNOTSUPPORTED);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_MULTICASTNOTSUPPORTED);
	}

	@internal public this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}