module System._Struct.ArgIterator;

import System;


public struct ArgIterator {
	private IntPtr _argCookie;
	private IntPtr _sigPtr;
	private IntPtr _sigPtrLen;

	private IntPtr _argPtr;
	private int _remainingArgs;

	public this(RuntimeArgumentHandle arglist) {
		this(arglist.Value);
	}

	public this(RuntimeArgumentHandle arglist, void* ptr) {
		this(arglist.Value, ptr);
	}

	private this(IntPtr arglist) {
		throw new NotImplementedException();
	}
	
	private this(IntPtr arglist, void* ptr) {
		throw new NotImplementedException();
	}

	public TypedReference GetNextArg() {
		TypedReference result;
		FCallGetNextArg(&result);

		return result;
	}

	public TypedReference GetNextArg(RuntimeTypeHandle rth) {
		if (_sigPtr != IntPtr.Zero) {
			return GetNextArg();
		} else {
			if (_argPtr == IntPtr.Zero)
				throw new ArgumentNullException();

			TypedReference result;
			InternalGetNextArg(&result, rth.GetRuntimeType());
			return result;
		}
	}

	public void End() {
	}

	public RuntimeTypeHandle GetNextArgType() {
		return new RuntimeTypeHandle(Type.GetTypeFromHandleUnsafe(cast(IntPtr)_GetNextArgType()));
	}

	public int GetHashCode() {
		return ValueType.GetHashCodeOfPtr(_argCookie);
	}

	public bool Equals(Object o) {
		throw new NotSupportedException(Environment.GetResourceString("NotSupported_NYI"));
	}

	private void FCallGetNextArg(void* result) {
		throw new NotImplementedException();
	}

	private void InternalGetNextArg(void* result, RuntimeType rt) {
		throw new NotImplementedException();
	}

	public int GetRemainingCount() {
		throw new NotImplementedException();
	}

	private void* _GetNextArgType() {
		throw new NotImplementedException();
	}
}