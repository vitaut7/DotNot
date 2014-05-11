module System.Runtime.Remoting._Class.RemotingException;

import System;


public class RemotingException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Remoting_Default"));
		SetErrorCode(__HResults.COR_E_REMOTING);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_REMOTING);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_REMOTING);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}


public class ServerException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Remoting_Default"));
		SetErrorCode(__HResults.COR_E_SERVER);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_SERVER);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_SERVER);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}


public class RemotingTimeoutException : RemotingException
{
	public this()
	{
		super(Environment.GetResourceString("Remoting_Default"));
		SetErrorCode(__HResults.COR_E_REMOTING);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_REMOTING);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_REMOTING);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}