module System._Class.ArgumentNullException;

import System;
import System.Runtime.Serialization;


public class ArgumentNullException : ArgumentException {
	public this() {
		super(Environment.GetResourceString("ArgumentNull_Generic"));
		SetErrorCode(__HResults.E_POINTER);
	}

	public this(string paramName) {
		super(Environment.GetResourceString("ArgumentNull_Generic"), paramName);
		SetErrorCode(__HResults.E_POINTER);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.E_POINTER);
	}

	public this(string paramName, string message) {
		super(message, paramName);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}