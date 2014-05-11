module System.Threading._Class.ThreadInterruptedException;

import System;


public class ThreadInterruptedException : SystemException
{
	public this()
	{
		super("TODO"); // TODO: GetMessageFromNativeResources(ExceptionMessageKind.ThreadInterrupted)
		SetErrorCode(__HResults.COR_E_THREADINTERRUPTED);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_THREADINTERRUPTED);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_THREADINTERRUPTED);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}