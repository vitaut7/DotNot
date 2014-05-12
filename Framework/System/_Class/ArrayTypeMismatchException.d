module System._Class.ArrayTypeMismatchException;

import System;
import System.Runtime.Serialization;


public class ArrayTypeMismatchException : SystemException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_ArrayTypeMismatchException"));
		SetErrorCode(__HResults.COR_E_ARRAYTYPEMISMATCH);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_ARRAYTYPEMISMATCH);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_ARRAYTYPEMISMATCH);
	}

	protected this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}