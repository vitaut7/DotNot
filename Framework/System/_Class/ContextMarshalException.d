module System._Class.ContextMarshalException;

import System;
import System.Runtime.Serialization;


public class ContextMarshalException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_ContextMarshalException"));
		SetErrorCode(__HResults.COR_E_CONTEXTMARSHAL);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_CONTEXTMARSHAL);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_CONTEXTMARSHAL);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}