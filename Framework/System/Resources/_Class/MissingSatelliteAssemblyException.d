module System.Resources._Class.MissingSatelliteAssemblyException;

import System;
import System.Runtime.Serialization;


public class MissingSatelliteAssemblyException : SystemException {
	private string _cultureName;

	@property string CultureName() {
		return _cultureName;
	}

	public this() {
		super(Environment.GetResourceString("MissingSatelliteAssembly_Default"));
		SetErrorCode(__HResults.COR_E_MISSINGSATELLITEASSEMBLY);
	}

	public this(string message) {
		super(message);
		SetErrorCode(__HResults.COR_E_MISSINGSATELLITEASSEMBLY);
	}

	public this(string message, string cultureName) {
		super(message);
		
		_cultureName = cultureName;
		SetErrorCode(__HResults.COR_E_MISSINGSATELLITEASSEMBLY);
	}

	public this(string message, Exception innerException) {
		super(message, innerException);
		SetErrorCode(__HResults.COR_E_MISSINGSATELLITEASSEMBLY);
	}

	protected this(SerializationInfo info, StreamingContext context) {
		super(info, context);
	}
}