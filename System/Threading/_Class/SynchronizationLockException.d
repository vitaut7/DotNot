module System.Threading._Class.SynchronizationLockException;

import System;


public class SynchronizationLockException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_SynchronizationLockException"));
		SetErrorCode(__HResults.COR_E_SYNCHRONIZATIONLOCK);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_SYNCHRONIZATIONLOCK);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_SYNCHRONIZATIONLOCK);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}