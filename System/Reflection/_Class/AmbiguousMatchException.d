module System.Reflection._Class.AmbiguousMatchException;

import System;


public final class AmbiguousMatchException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("RFLCT.Ambiguous"));
		SetErrorCode(__HResults.COR_E_AMBIGUOUSMATCH);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_AMBIGUOUSMATCH);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_AMBIGUOUSMATCH);
	}

	@internal public this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}