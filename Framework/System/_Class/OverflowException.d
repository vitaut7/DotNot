module System._Class.OverflowException;

import System;
import System.Runtime.Serialization;


public class OverflowException : ArithmeticException {
	public this() {
		super(Environment.GetResourceString("Arg_OverflowException"));
		SetErrorCode(__HResults.COR_E_OVERFLOW);
	}
	
	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_OVERFLOW);
	}
	
	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_OVERFLOW);
	}
	
	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}