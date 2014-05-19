module System._Class.ExecutionEngineException;

import System;
import System.Runtime.Serialization;


public final class ExecutionEngineException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_ExecutionEngineException"));
		SetErrorCode(__HResults.COR_E_EXECUTIONENGINE);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_EXECUTIONENGINE);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_EXECUTIONENGINE);
	}

	@internal this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}