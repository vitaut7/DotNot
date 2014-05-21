module System.Threading._Class.ThreadStateException;

import System;
import System.Runtime.Serialization;


public class ThreadStateException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_ThreadStateException"));
		SetErrorCode(__HResults.COR_E_THREADSTATE);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_THREADSTATE);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_THREADSTATE);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}