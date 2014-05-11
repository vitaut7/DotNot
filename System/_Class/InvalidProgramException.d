module System._Class.InvalidProgramException;

import System;
import System.Runtime.Serialization;


public final class InvalidProgramException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("InvalidProgram_Default"));
		SetErrorCode(__HResults.COR_E_INVALIDPROGRAM);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_INVALIDPROGRAM);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_INVALIDPROGRAM);
	}

	@internal public this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}