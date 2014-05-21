module System.Security.Policy._Class.PolicyException;

import System;
import System.Runtime.Serialization;


public class PolicyException : SystemException {
	public this() {
		super(Environment.GetResourceString("Policy_Default"));
		SetErrorCode(__HResults.CORSEC_E_POLICY_EXCEPTION);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.CORSEC_E_POLICY_EXCEPTION);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.CORSEC_E_POLICY_EXCEPTION);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}

	@internal this(string message, int hresult) {
		super(message);
		SetErrorCode(hresult);
	}

	@internal this(string message, int hresult, Exception innerException) {
		super(message, innerException);
		SetErrorCode(hresult);
	}
}