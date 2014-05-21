module System._Class.Exception;

import System;
import System.Reflection;
import System.Runtime.Serialization;
import System.Runtime.InteropServices;


// Toto je Exception z .NETu akurad sa mi to nechce prerabat do object.d
// vsetky BaseException prerobit na Exception
public class BaseException : Exception/*Throwable*/, _Exception, ISerializable {
	@internal enum ExceptionMessageKind {
		ThreadAbort = 1,
		ThreadInterrupted = 2,
		OutOfMemory = 3
	}

	private string _className;
	private MethodBase _exceptionMethod;
	private string _exceptionMethodString;
	private string _message;
	private IDictionary _data;
	private BaseException _innerException;
	private string _helpURL;

	private Object _stackTrace;
	private string _stackTraceString;
	private string _remoteStackTraceString;
	private int _remoteStackIndex;

	private SafeSerializationManager _safeSerializationManager;
	protected EventHandlerT!SafeSerializationEventArgs SerializeObjectState;

	private string _source;
	private int _hResult;

	@property public int HResult() {
		return _hResult;
	}

	@property public Exception InnerException() {
		return _innerException;
	}

	@property public string StackTrace() {
		return GetStackTrace(true);
	}

	@property public MethodBase TargetSite() {
		return GetTargetSiteInternal();
	}

	@property public string HelpLink() {
		return _helpURL;
	}

	@property public void HelpLink(string value) {
		_helpURL = value;
	}

	@property public string Source() {
		return _source;
	} //TODO

	@property public void Source(string value) {
		_source = value;
	}

	public this()  {
		Init();
	}

	public this(string message) {
		Init();
		_message = message;
	}

	public this(string message, Exception innerException) {
		Init();
		_message = message;
		_innerException = cast(BaseException)innerException;
	}

	protected this(SerializationInfo info, StreamingContext context) in {
		if (info is null)
			throw new ArgumentNullException("info");
	} body {
		_className = info.GetString("ClassName");
		_message = info.GetString("Message");
		_data = cast(IDictionary)info.GetValueNoThrow("Data", Typeof!IDictionary);
		_innerException = cast(BaseException)info.GetValue("InnerException", Typeof!Exception);
		_helpURL = info.GetString("HelpURL");

		_stackTraceString = info.GetString("StackTraceString");
		_remoteStackTraceString = info.GetString("RemoteStackTracing");
		_remoteStackIndex = info.GetInt32("RemoteStackIndex");

		_exceptionMethodString = info.GetValue("ExceptionMethod", Typeof!string).ToString();
		_hResult = info.GetInt32("HResult");
		_source = info.GetString("Source");

		if (_className is null || !_hResult)
			throw new SerializationException(Environment.GetResourceString("Serialization_InsufficientState"));

		if (context.State == StreamingContextStates.CrossAppDomain) {
			_remoteStackTraceString = _remoteStackTraceString ~ _stackTraceString;
			_stackTraceString = null;
		}
	}

	@property public string Message() {
		if (!_message) {
			if (!_className)
				_className = GetClassName();

			return Environment.GetRuntimeResourceString("Exception_WasThrown", [String(_className)]);
		}
	
		return _message;
	}

	@property public IDictionary Data() {
		if (_data is null)
			if (IsImmutableAgileException(this))
				_data = null; //TODO
			else
				_data = null; //TODO

		return _data;
	}

	private string GetClassName() {
		if (!_className)
			_className = GetType();

		return _className;
	}

	public Exception GetBaseException() {
		Exception inner = InnerException;
		Exception back = this;

		while (inner !is null) {
			back = inner;
			inner = (cast(BaseException)inner).InnerException; //HACK: No cast
		}

		return back;
	}

	private MethodBase GetExceptionMethodFromStackTrace() {
		IRuntimeMethodInfo method = GetMethodFromStackTrace(_stackTrace);

		if (method is null)
			return null;

		return RuntimeType.GetMethodBase(method);
	}

	private MethodBase GetTargetSiteInternal() {
		if (_exceptionMethod !is null)
			return _exceptionMethod;

		if (_stackTrace is null)
			return null;

		if (_exceptionMethodString)
			_exceptionMethod = GetExceptionMethodFromString();
		else
			_exceptionMethod = GetExceptionMethodFromStackTrace();

		return _exceptionMethod;
	}

	private string GetStackTrace(bool needFileInfo) {
		string stackTraceString = _stackTraceString;
		string remoteStackTraceString = _remoteStackTraceString;

		if (!needFileInfo) {
			stackTraceString = StripFileInfo(stackTraceString, false);
			remoteStackTraceString = StripFileInfo(remoteStackTraceString, true);
		}

		if (stackTraceString)
			return remoteStackTraceString ~ stackTraceString;

		if (_stackTrace is null)
			return remoteStackTraceString;

		string tempStackTraceString = Environment.GetStackTrace(this, needFileInfo);
		return remoteStackTraceString ~ tempStackTraceString;
	}

	@internal void SetErrorCode(int hr) {
		_hResult = hr;
	}

	public override string ToString() {
		return ToString(true, true);
	}

	private string ToString(bool needFileLineInfo, bool needMessage) {
		string message = needMessage ? Message : null;
		string s;

		if (!message || message.Length <= 0)
			s = GetClassName();
		else
			s = GetClassName() ~ ": " ~ message;

		if (_innerException !is null) {
			s = s ~ " ---> " ~ _innerException.ToString(needFileLineInfo, needMessage) ~ Environment.NewLine
				~ "   " ~ Environment.GetRuntimeResourceString("Exception_EndOfInnerExceptionStack");
		}

		string stackTrace = GetStackTrace(needFileLineInfo);
		if (stackTrace)
			s ~= Environment.NewLine ~ stackTrace;

		return s;
	}

	private string GetExceptionMethodString() {
		MethodBase methBase = GetTargetSiteInternal();
		if (methBase is null)
			return null;

		assert(0); //TODO
	}

	private MethodBase GetExceptionMethodFromString() {
		assert(0); //TODO
	}

	public override void GetObjectData(SerializationInfo info, StreamingContext context) in {
		if (info is null)
			throw new ArgumentNullException("info");
	} body {
		string tempStackTraceString = _stackTraceString;
		
		if (_stackTrace !is null) {
			if (!tempStackTraceString)
				tempStackTraceString = Environment.GetStackTrace(this, true);
			
			if (_exceptionMethod is null)
				_exceptionMethod = GetExceptionMethodFromStackTrace();
		}
		
		if (!_source)
			_source = Source;

		info.AddValue("ClassName", GetClassName());
		info.AddValue("Message", _message);
		info.AddValue("Data", cast(Object)_data, Typeof!IDictionary);
		info.AddValue("InnerException", _innerException, Typeof!Exception);
		//TODO
		
		assert(0);
	}







	@internal static string GetMessageFromNativeResources(ExceptionMessageKind kind) {
		string ret;
		GetMessageFromNativeResources(kind); //TODO
		return ret;
	}

	private static bool IsImmutableAgileException(Exception e) {
		throw new NotImplementedException();
	}

	private static IRuntimeMethodInfo GetMethodFromStackTrace(Object stackTrace) {
		throw new NotImplementedException();
	}

	private string StripFileInfo(string stackTrace, bool isRemoteStackTrace) {
		throw new NotImplementedException();
	}

	private void Init() {
		_message = null;
		_stackTrace = null;
		_hResult = __HResults.COR_E_EXCEPTION;
		_safeSerializationManager = new SafeSerializationManager();
		SerializeObjectState = _safeSerializationManager.SerializeObjectState;
	}

	private class __RestrictedErrorObject {
		private Object _realErrorObject;

		@property public Object RealErrorObject() {
			return _realErrorObject;
		}

		public this(Object errorObject) {
			_realErrorObject = errorObject;
		}
	}
}


unittest {
	try {
		throw new BaseException("Test of Exception", new BaseException("This is inner exception"));
	}
	catch (BaseException e) {
		//import std.stdio;
		//writeln(e.ToString());
	}
}