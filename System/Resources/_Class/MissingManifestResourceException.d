module System.Resources._Class.MissingManifestResourceException;

import System;


public class MissingManifestResourceException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_MissingManifestResourceException"));
		SetErrorCode(__HResults.COR_E_MISSINGMANIFESTRESOURCE);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_MISSINGMANIFESTRESOURCE);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_MISSINGMANIFESTRESOURCE);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}