module System._Class.MarshalByRefObject;

static import System.Runtime.Remoting;

import System;
import System.Reflection;
import System.Runtime.Remoting;
import System.Runtime.InteropServices;


public abstract class MarshalByRefObject
{
	@internal static /*extern*/ IntPtr GetComIUnknown(MarshalByRefObject o) { assert(0); } //TODO
	private Object _identity;

	@property Object Identity()
	{
		return _identity;
	}

	@property private void Identity(Object value)
	{
		_identity = value;
	}

	@internal IntPtr GetComUnknown(bool isBeingMarshalled)
	{
		if (RemotingServices.IsTransparentProxy(this))
			return RemotingServices.GetRealProxy(this).GetCOMIUnknown(isBeingMarshalled);
		else
			return Marshal.GetIUnknownForObject(this);
	}

	@internal bool IsInstanceOfType(Type t)
	{
		return t.IsInstanceOfType(this);
	}

	@internal Object InvokeMember(string name, BindingFlags invokeAttr, Binder binder, Object[] args, 
                                  ParameterModifier[] modifiers, CultureInfo culture, string[] namedParameters)
	{
		Type t = null; //TODO: GetType();

		if (!t.IsCOMObject)
			throw new InvalidOperationException(Environment.GetResourceString("Arg_InvokeMember"));

		return t.InvokeMember(name, invokeAttr, binder, this, args, modifiers, culture, namedParameters);
	}

	protected MarshalByRefObject MemberwiseClone(bool cloneIdentity)
	{
		MarshalByRefObject mbr = cast(MarshalByRefObject)super.MemberwiseClone();

		if (cloneIdentity)
			mbr.Identity = null;
		return mbr;
	}

	@internal static System.Runtime.Remoting.Identity GetIdentity(MarshalByRefObject obj, out bool fServer)
	{
		fServer = true;
		System.Runtime.Remoting.Identity id = null;

		if (obj !is null)
		{
			if (!RemotingServices.IsTransparentProxy(obj))
				id = cast(System.Runtime.Remoting.Identity)obj.Identity;
			else
			{
				fServer = false;
				id = RemotingServices.GetRealProxy(obj).IdentityObject;
			}
		}

		return id;
	}

	@internal static System.Runtime.Remoting.Identity GetIdentity(MarshalByRefObject obj)
	{
		Contract.Assert(!RemotingServices.IsTransparentProxy(obj), "Use this method for server objects only");

		bool fServer;
		return GetIdentity(obj, fServer);
	}

	@internal ServerIdentity __RaceSetServerIdentity(ServerIdentity id)
	{
		if (_identity is null)
		{
			if (!id.IsContextBound)
				id.RaceSetTransparentProxy(this);
			Interlocked.CompareExchange(_identity, id, null);
		}

		return cast(ServerIdentity)_identity;
	}

	@internal void __ResetServerIdentity()
	{
		_identity = null;
	}

	public Object GetLifetimeService()
	{
		return cast(Object)LifetimeServices.GetLease(this);
	}

	public Object InitializeLifetimeService()
	{
		return cast(Object)LifetimeServices.GetLeaseInitial(this);
	}

	public ObjRef CreateObjRef(Type requestedType)
	{
		if (_identity is null)
			throw new RemotingException(Environment.GetResourceString("Remoting_NoIdentityEntry"));

		return new ObjRef(this, requestedType);
	}
}