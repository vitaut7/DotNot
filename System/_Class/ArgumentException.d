module System._Class.ArgumentException;

import System;


public class ArgumentException : SystemException
{
	private string _paramName;

	@property
	{
		string ParamName() { return _paramName; }
	}


	public this()
	{
		super(Environment.GetResourceString("Arg_ArgumentException"));
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message, string paramName)
	{
		super(message);

		_paramName = paramName;
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message, string paramName, Exception innerException)
	{
		super(message, innerException);

		_paramName = paramName;
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
		//info.GetString("ParamName"); TODO
	}

	//Message, ParamName
}