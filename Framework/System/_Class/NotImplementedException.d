module System._Class.NotImplementedException;

import System;
import System.Runtime.Serialization;


public class NotImplementedException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_NotImplementedException"));
		SetErrorCode(__HResults.E_NOTIMPL);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.E_NOTIMPL);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.E_NOTIMPL);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}