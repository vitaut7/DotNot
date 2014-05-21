module System._Class.TypeUnloadedException;

import System;
import System.Runtime.Serialization;


public class TypeUnloadedException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_TypeUnloadedException"));
		SetErrorCode(__HResults.COR_E_TYPEUNLOADED);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_TYPEUNLOADED);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_TYPEUNLOADED);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}