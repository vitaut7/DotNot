module System._Class.NotFiniteNumberException;

import System;
import System.Runtime.Serialization;


public class NotFiniteNumberException : ArithmeticException
{
	private double _offendingNumber;

	@property public double OffendingNumber()
	{
		return _offendingNumber;
	}

	public this()
	{
		super(Environment.GetResourceString("Arg_NotFiniteNumberException"));
		_offendingNumber = 0;
		SetErrorCode(__HResults.COR_E_NOTFINITENUMBER);
	}

	public this(double offendingNumber)
	{
		super(Environment.GetResourceString("Arg_NotFiniteNumberException"));
		_offendingNumber = offendingNumber;
		SetErrorCode(__HResults.COR_E_NOTFINITENUMBER);
	}
	
	public this(string message)
	{
		super(message);
		_offendingNumber = 0;
		SetErrorCode(__HResults.COR_E_NOTFINITENUMBER);
	}

	public this(string message, double offendingNumber)
	{
		super(message);
		_offendingNumber = offendingNumber;
		SetErrorCode(__HResults.COR_E_NOTFINITENUMBER);
	}
	
	public this(string message, Exception innerException)
	{
		super(message, innerException);
		_offendingNumber = 0;
		SetErrorCode(__HResults.COR_E_NOTFINITENUMBER);
	}

	public this(string message, double offendingNumber, Exception innerException)
	{
		super(message, innerException);
		_offendingNumber = offendingNumber;
		SetErrorCode(__HResults.COR_E_NOTFINITENUMBER);
	}
	
	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
		_offendingNumber = info.GetInt32("OffendingNumber");
	}

	public override void GetObjectData(SerializationInfo info, StreamingContext context) {
		if (info is null)
			throw new ArgumentNullException("info");

		Contract.EndContractBlock();
		super.GetObjectData(info, context);
		info.AddValue("OffendingNumber", Double(_offendingNumber), typeid(int));
	}
}