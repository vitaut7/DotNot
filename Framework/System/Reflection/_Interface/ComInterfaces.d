module System.Reflection._Interface.ComInterfaces;

static import System.Reflection;

import System;
import System.Reflection;


public interface _Type
{
	//region IDispatch
	void GetTypeInfo(out uint info);
	void GetTypeInfo(uint info, uint lcid, IntPtr ptrInfo);
	void GetIDsOfNames(ref Guid riid, IntPtr rgszNames, uint cNames, uint lcid, IntPtr rgDispId);
	void Invoke(uint dispIdMember, ref Guid riid, uint lcid, short wFlags, IntPtr pDispParams, IntPtr pVarResult, IntPtr pExcepInfo, IntPtr puArgErr);

	//region Object
	string ToString();
	bool Equals(Object other);
	int GetHashCode();
	Type GetType();

	//MemberInfo
	@property MemberTypes MemberType();
	@property string Name();
	@property Type DeclaringType();
	@property Type ReflectedType();
	Object[] GetCustomAttributes(Type typeAttribute, bool inherit);
	Object[] GetCustomAttributes(bool inherit);

	//Type
	@property Guid GUID();
	@property System.Reflection.Module Module();
	@property System.Reflection.Assembly Assembly();
	@property RuntimeTypeHandle TypeHandle();
	@property string FullName();
	@property string Namespace();
	@property string AssemblyQualifiedName();
	int GetArrayrank();
	@property Type BaseType();

	//TODO
}

public interface _Assembly
{
	//region Object
	string ToString();
	bool Equals(Object other);
	int GetHashCode();
	Type GetType();

	//region Assembly
	@property string CodeBase();
	@property string EscapedCodeBase();

	//TODO
}

public interface _MemberInfo
{

}

public interface _MethodBase
{

}

public interface _MethodInfo
{

}

public interface _ContructorInfo
{

}

public interface _FieldInfo
{

}

public interface _PropertyInfo
{

}

public interface _EventInfo
{

}

public interface _ParameterInfo
{
	void GetTypeInfoCount(out uint pcTInfo);
	void GetTypeInfo(uint iTInfo, uint lcid, IntPtr ppTInfo);
	void GetIDsOfNames(ref Guid riid, IntPtr rgszNames, uint cNames, uint lcid, IntPtr rgDispId);
	void Invoke(uint dispIdMember, ref Guid riid, uint lcid, short wFlags, IntPtr pDispParams, IntPtr pVarResult, IntPtr pExcepInfo, IntPtr puArgErr);
}

public interface _Module
{
	void GetTypeInfoCount(out uint pcTInfo);
	void GetTypeInfo(uint iTInfo, uint lcid, IntPtr ppTInfo);
	void GetIDsOfNames(ref Guid riid, IntPtr rgszNames, uint cNames, uint lcid, IntPtr rgDispId);
	void Invoke(uint dispIdMember, ref Guid riid, uint lcid, short wFlags, IntPtr pDispParams, IntPtr pVarResult, IntPtr pExcepInfo, IntPtr puArgErr);
}

public interface _AssemblyName
{
	void GetTypeInfoCount(out uint pcTInfo);
	void GetTypeInfo(uint iTInfo, uint lcid, IntPtr ppTInfo);
	void GetIDsOfNames(ref Guid riid, IntPtr rgszNames, uint cNames, uint lcid, IntPtr rgDispId);
	void Invoke(uint dispIdMember, ref Guid riid, uint lcid, short wFlags, IntPtr pDispParams, IntPtr pVarResult, IntPtr pExcepInfo, IntPtr puArgErr);
}