module System.Security._Class.VerificationException;

import System;
import System.Runtime.Serialization;


public class VerificationException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Verification_Exception"));
		SetErrorCode(__HResults.COR_E_VERIFICATION);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_VERIFICATION);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_VERIFICATION);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}