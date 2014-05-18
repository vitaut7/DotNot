module System._Class.MarshalByRefObject;

import System;


public abstract class MarshalByRefObject
{
	@internal static /*extern*/ IntPtr GetComIUnknown(MarshalByRefObject o) { assert(0); }
	private Object _identity;

	@property private Object Identity()
	{
		return _identity;
	}

	@property void Identity(Object value)
	{
		_identity = value;
	}

	@internal public IntPtr GetComUnknown(bool isBeingMarshalled)
	{
		if (RemotingServices.IsTransparentProxy(this))
			return RemotingServices.GetRealProxy(this).GetCOMIUnknown(isBeingMarshalled);
		else
			return Marshal.GetIUnknownForObject(this);
	}

	@internal public bool IsInstanceOfType(Type t)
	{
		return t.IsInstanceOfType(this);
	}
}