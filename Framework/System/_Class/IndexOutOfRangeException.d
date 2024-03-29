module System._Class.IndexOutOfRangeException;

import System;
import System.Runtime.Serialization;


public final class IndexOutOfRangeException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_IndexOutOfRangeException"));
		SetErrorCode(__HResults.COR_E_INDEXOUTOFRANGE);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_INDEXOUTOFRANGE);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_INDEXOUTOFRANGE);
	}

	@internal this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}