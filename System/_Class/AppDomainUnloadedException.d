module System._Class.AppDomainUnloadedException;

import System;


public class AppDomainUnloadedException : BaseException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_AppDomainUnloadedException"));
		SetErrorCode(__HResults.COR_E_APPDOMAINUNLOADED);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_APPDOMAINUNLOADED);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_APPDOMAINUNLOADED);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}