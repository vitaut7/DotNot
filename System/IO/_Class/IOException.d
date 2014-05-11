module System.IO._Class.IOException;

import System;
import System.Runtime.Serialization;


public class IOException : SystemException
{
	private string _maybeFullPath;


	public this()
	{
		super(Environment.GetResourceString("Arg_IOException"));
		SetErrorCode(__HResults.COR_E_IO);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_IO);
	}

	public this(string message, int hresult)
	{
		super(message);
		SetErrorCode(hresult);
	}

	@internal public this(string message, int hresult, string maybeFullPath)
	{
		super(message);

		_maybeFullPath = maybeFullPath;
		SetErrorCode(hresult);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_IO);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}