module System._Class.DataMisalignedException;

import System;


public final class DataMisalignedException : BaseException
{
	public this()
	{
		super(Environment.GetResourceString("Arg_DataMisalignedException"));
		SetErrorCode(__HResults.COR_E_DATAMISALIGNED);
	}

	public this(string message)
	{
		super(message);
		SetErrorCode(__HResults.COR_E_DATAMISALIGNED);
	}

	public this(string message, Exception innerException)
	{
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_DATAMISALIGNED);
	}

	@internal public this(SerializationInfo info, StreamingContext context)
	{
		super(info, context);
	}
}