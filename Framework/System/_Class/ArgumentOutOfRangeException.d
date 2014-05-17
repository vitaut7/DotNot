module System._Class.ArgumentOutOfRangeException;

import System;
import System.Runtime.Serialization;


public class ArgumentOutOfRangeException : ArgumentException
{
	private Object _actualValue;

	@property public Object ActualValue()
	{
		return _actualValue; 
	}

	@property public override string Message()
	{
		string s = super.Message();
		if (_actualValue !is null)
		{
			string valueMessage = Environment.GetRuntimeResourceString("ArgumentOutOfRange_ActualValue", [String(_actualValue.ToString())]);
			if (!s)
				return valueMessage;
			return s ~ Environment.NewLine ~ valueMessage;
		}

		return s;
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
		_actualValue = info.GetValue("ActualValue", Typeof!Object);
	}

	public override void GetObjectData(SerializationInfo info, StreamingContext context)
	{
		if (info is null)
			throw new ArgumentNullException("info");
		
		Contract.EndContractBlock();
		super.GetObjectData(info, context);
		info.AddValue("ActualValue", _actualValue, Typeof!Object);
	}
}