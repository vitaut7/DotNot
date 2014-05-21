module System._Class.InvalidCastException;

import System;
import System.Runtime.Serialization;


public class InvalidCastException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_InvalidCastException"));
		SetErrorCode(__HResults.COR_E_INVALIDCAST);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_INVALIDCAST);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_INVALIDCAST);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}

	public this(string message, int errorCode) {
		super(message);
		SetErrorCode(errorCode);
	}
}