module System.Runtime.Remoting;


public import System.Runtime.Remoting._Class.__HResults;
public import System.Runtime.Remoting._Class.Identity;
public import System.Runtime.Remoting._Class.RemotingException;

class ServerIdentity
{
	@property bool IsContextBound() { assert(0); }
	Object  RaceSetTransparentProxy(Object tpObj) { assert(0); }
}

public interface ILease
{}

class LifetimeServices
{
	import System;
	static ILease GetLease(MarshalByRefObject obj) { assert (0); }
	static ILease GetLeaseInitial(MarshalByRefObject obj) { assert(0); }
}

public class ObjRef 
{
	import System;
	this(MarshalByRefObject o, Type requestedType) {}
}