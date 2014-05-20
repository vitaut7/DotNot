module System._Class.RuntimeHandles;

import System;


@internal struct RuntimeMethodHandleInternal
{
	@internal IntPtr _handle;

	@internal @property static RuntimeMethodHandleInternal EmptyValue()
	{
		return *(new RuntimeMethodHandleInternal());
	}

	@internal @property IntPtr Value()
	{
		return _handle;
	}

	@internal bool IsNullhandle()
	{
		return _handle.IsNull();
	}

	@internal this(IntPtr value)
	{
		_handle = value;
	}
}


@internal interface IRuntimeMethodInfo
{
	@property RuntimeMethodHandleInternal Value();
}


public final class RuntimeTypeHandle
{
	//TODO
	RuntimeType GetRuntimeType()
	{
		assert(0);
	}
	
	this()
	{
		assert(0);
	}

	this(RuntimeType)
	{
		assert(0);
	}
}