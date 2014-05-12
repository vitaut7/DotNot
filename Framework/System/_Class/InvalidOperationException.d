module System._Class.InvalidOperationException;

import System;
import System.Runtime.Serialization;


public class InvalidOperationException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_InvalidOperationException"));
		SetErrorCode(__HResults.COR_E_INVALIDOPERATION);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_INVALIDOPERATION);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_INVALIDOPERATION);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}