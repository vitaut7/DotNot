module System._Class.FormatException;

import System;


public class FormatException : BaseException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_FormatException"));
		SetErrorCode(__HResults.COR_E_FORMAT);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_FORMAT);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_FORMAT);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}