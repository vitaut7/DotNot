module System._Class.CannotUnloadAppDomainException;

import System;


public class CannotUnloadAppDomainException : BaseException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_CannotUnloadAppDomainException"));
		SetErrorCode(__HResults.COR_E_CANNOTUNLOADAPPDOMAIN);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_CANNOTUNLOADAPPDOMAIN);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_CANNOTUNLOADAPPDOMAIN);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}