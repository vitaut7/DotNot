module System._Class.ArgumentException;

import System;
import System.Runtime.Serialization;


public class ArgumentException : SystemException {
	private string _paramName;

	@property string ParamName() {
		return _paramName; 
	}

	@property public override string Message() {
		string s = super.Message();

		if (!String.IsNullOrEmpty(_paramName)) {
			string resourceString = Environment.GetRuntimeResourceString("Arg_ParamName_Name", [String(_paramName)]);
			return s ~ Environment.NewLine ~ resourceString;
		}

		return s;
	}

	public this() {
		super(Environment.GetResourceString("Arg_ArgumentException"));
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message, string paramName) {
		super(message);

		_paramName = paramName;
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	public this(string message, string paramName, Exception innerException) {
		super(message, innerException);

		_paramName = paramName;
		SetErrorCode(__HResults.COR_E_ARGUMENT);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
		_paramName = info.GetString("ParamName");
	}

	public override void GetObjectData(SerializationInfo info, StreamingContext context) {
		if (info is null)
			throw new ArgumentNullException("info");

		super.GetObjectData(info, context);
		info.AddValue("ParamName", _paramName);
	}
}