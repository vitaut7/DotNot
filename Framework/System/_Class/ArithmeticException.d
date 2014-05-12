module System._Class.ArithmeticException;

import System;
import System.Runtime.Serialization;


public class ArithmeticException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_ArithmeticException"));
		SetErrorCode(__HResults.COR_E_ARITHMETIC);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_ARITHMETIC);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_ARITHMETIC);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}