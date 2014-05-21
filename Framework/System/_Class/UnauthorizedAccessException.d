module System._Class.UnauthorizedAccessException;

import System;
import System.Runtime.Serialization;


public class UnauthorizedAccessException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_UnauthorizedAccessException"));
		SetErrorCode(__HResults.COR_E_UNAUTHORIZEDACCESS);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_UNAUTHORIZEDACCESS);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_UNAUTHORIZEDACCESS);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}