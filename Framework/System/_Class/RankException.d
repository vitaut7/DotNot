module System._Class.RankException;

import System;
import System.Runtime.Serialization;


public class AccessViolationException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_RankException"));
		SetErrorCode(__HResults.COR_E_RANK);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_RANK);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_RANK);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}