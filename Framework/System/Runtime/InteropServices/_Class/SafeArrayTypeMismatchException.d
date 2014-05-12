module System.Runtime.InteropServices._Class.SafeArrayTypeMismatchException;

import System;
import System.Runtime.Serialization;


public class SafeArrayTypeMismatchException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_SafeArrayTypeMismatchException"));
		SetErrorCode(__HResults.COR_E_SAFEARRAYTYPEMISMATCH);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_SAFEARRAYTYPEMISMATCH);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_SAFEARRAYTYPEMISMATCH);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}