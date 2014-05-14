module System._Class.OutOfMemoryException;

import System;
import System.Runtime.Serialization;


public class OutOfMemoryException : SystemException
{
	public this()
	{
		super(GetMessageFromNativeResources(ExceptionMessageKind.OutOfMemory));
		SetErrorCode(__HResults.COR_E_OUTOFMEMORY);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_OUTOFMEMORY);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_OUTOFMEMORY);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}