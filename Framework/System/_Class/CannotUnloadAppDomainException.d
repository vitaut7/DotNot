module System._Class.CannotUnloadAppDomainException;

import System;
import System.Runtime.Serialization;


public class CannotUnloadAppDomainException : SystemException {
	public this() {
		super(Environment.GetResourceString("Arg_CannotUnloadAppDomainException"));
		SetErrorCode(__HResults.COR_E_CANNOTUNLOADAPPDOMAIN);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_CANNOTUNLOADAPPDOMAIN);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_CANNOTUNLOADAPPDOMAIN);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}