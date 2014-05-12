module System.Threading._Class.SemaphoreFullException;

import System;
import System.Runtime.Serialization;


public class SemaphoreFullException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Threading_SemaphoreFullException"));
	}

	public this(string message)
	{
		super(message);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}