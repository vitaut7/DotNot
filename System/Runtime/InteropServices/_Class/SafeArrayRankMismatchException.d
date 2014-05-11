module System.Runtime.InteropServices._Class.SafeArrayRankMismatchException;

import System;
import System.Runtime.Serialization;


public class SafeArrayRankMismatchException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_SafeArrayRankMismatchException"));
		SetErrorCode(__HResults.COR_E_SAFEARRAYRANKMISMATCH);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_SAFEARRAYRANKMISMATCH);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_SAFEARRAYRANKMISMATCH);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}