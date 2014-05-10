module System._Struct.ArgIterator;

import System;


public struct ArgIterator
{
	private extern this(IntPtr arglist) {} // TODO
	private extern this(IntPtr arglist, void* ptr) {} // TODO
	private extern void FCallGetNextArg(void* result) {} //TODO
	private extern void InternalGetNextArg(void* result, RuntimeType rt) {} //TODO
	public extern int GetRemainingCount() {return 0;} //TODO
	private extern void* _GetNextArgType() {return null;} //TODO

	private IntPtr _argCookie;
	private IntPtr _sigPtr;
	private IntPtr _sigPtrLen;

	private IntPtr _argPtr;
	private int _remainingArgs;


	public this(RuntimeArgumentHandle arglist)
	{
		this(arglist.Value);
	}

	public this(RuntimeArgumentHandle arglist, void* ptr)
	{
		this(arglist.Value, ptr);
	}


	public TypedReference GetNextArg()
	{
		TypedReference result;
		FCallGetNextArg(&result);

		return result;
	}

	public TypedReference GetNextArg(RuntimeTypeHandle rth)
	{
		if (_sigPtr != IntPtr.Zero)
		{
			return GetNextArg();
		}
		else
		{
			if (_argPtr == IntPtr.Zero)
				throw new ArgumentNullException();

			TypedReference result;
			InternalGetNextArg(&result, rth.GetRuntimeType());
			return result;
		}
	}

	public void End()
	{
	}

	public RuntimeTypeHandle GetNextArgType()
	{
		return new RuntimeTypeHandle(Type.GetTypeFromHandleUnsafe(cast(IntPtr)_GetNextArgType()));
	}

	public int GetHashCode()
	{
		return ValueType.GetHashCodeOfPtr(_argCookie);
	}

	public bool Equals(Object o)
	{
		throw new NotSupportedException(Environment.GetResourceString("NotSupported_NYI"));
	}
}