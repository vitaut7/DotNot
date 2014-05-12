module System._Class.ArgumentOutOfRangeException;

import System;
import System.Runtime.Serialization;


public class ArgumentOutOfRangeException : ArgumentException
{
	private Object _actualValue;

	@property
	{
		//Message
		public Object ActualValue() { return _actualValue; }
	}


	public this()
	{
		super(Environment.GetResourceString("Arg_ArgumentOutOfRangeException"));
		SetErrorCode(__HResults.COR_E_ARGUMENTOUTOFRANGE);
	}

	public this(string paramName)
	{
		super(Environment.GetResourceString("Arg_ArgumentOutOfRangeException"), paramName);
		SetErrorCode(__HResults.COR_E_ARGUMENTOUTOFRANGE);
	}

	public this(string paramName, string message)
	{
		super(message, paramName);
		SetErrorCode(__HResults.COR_E_ARGUMENTOUTOFRANGE);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_ARGUMENTOUTOFRANGE);
	}

	public this(string paramName, Object actualValue, string message)
	{
		super(message, paramName);

		_actualValue = actualValue;
		SetErrorCode(__HResults.COR_E_ARGUMENTOUTOFRANGE);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
		//_actualValue = info.GetValue("ActualValue", typeof(Object));
	}

	//Override GetObjectData TODO
}