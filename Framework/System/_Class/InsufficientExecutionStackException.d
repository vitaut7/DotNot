module System._Class.InsufficientExecutionStackException;

import System;
import System.Runtime.Serialization;


public final class InsufficientExecutionStackException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_InsufficientExecutionStackException"));
		SetErrorCode(__HResults.COR_E_INSUFFICIENTEXECUTIONSTACK);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_INSUFFICIENTEXECUTIONSTACK);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_INSUFFICIENTEXECUTIONSTACK);
	}

	private this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}