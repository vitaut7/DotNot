module System._Class.DivideByZeroException;

import System;
import System.Runtime.Serialization;


public class DivideByZeroException : ArithmeticException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_DivideByZero"));
		SetErrorCode(__HResults.COR_E_DIVIDEBYZERO);
	}
	
	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_DIVIDEBYZERO);
	}
	
	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_DIVIDEBYZERO);
	}
	
	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}