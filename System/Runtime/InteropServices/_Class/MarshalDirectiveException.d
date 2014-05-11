module System.Runtime.InteropServices._Class.MarshalDirectiveException;

import System;


public class MarshalDirectiveException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_MarshalDirectiveException"));
		SetErrorCode(__HResults.COR_E_MARSHALDIRECTIVE);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_MARSHALDIRECTIVE);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_MARSHALDIRECTIVE);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}