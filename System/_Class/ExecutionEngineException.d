module System._Class.ExecutionEngineException;

import System;


public final class ExecutionEngineException : BaseException
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

	@internal public this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}