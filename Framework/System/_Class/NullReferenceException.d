module System._Class.NullReferenceException;

import System;
import System.Runtime.Serialization;


public class NullReferenceException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_NullReferenceException"));
		SetErrorCode(__HResults.COR_E_NULLREFERENCE);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_NULLREFERENCE);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_NULLREFERENCE);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}