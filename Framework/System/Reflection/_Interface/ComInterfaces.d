module System.Reflection._Interface.ComInterfaces;

static import System.Reflection;

import System;
import System.Reflection;
// Bacha niekde su chybne invoky

public interface _Type
{
	//region IDispatch
	void GetTypeInfoCount(out uint info);
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
	bool IsDefined(Type attributeType, bool inherit);

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
	//region IDispatch
	void GetTypeInfoCount(out uint info);
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
	bool IsDefined(Type attributeType, bool inherit);
}

public interface _MethodBase
{
	//region IDispatch
	void GetTypeInfoCount(out uint info);
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
	bool IsDefined(Type attributeType, bool inherit);

	//MethodBase
//	ParameterInfo[] GetParameters();
//	MethodImplAttributes GetMethodImplementationFlags();
//	@property RuntimeMethodHandle MethodHandle();
//	@property MethodAttributes Attributes();
//	@property CallingConventions CallingConvention();
//	Object Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture);
	@property bool IsPublic();
	@property bool IsPrivate();
	@property bool IsFamily();
	@property bool IsAssembly();
	@property bool IsFamilyAndAssembly();
	@property bool IsFamilyOrAssembly();
	@property bool IsStatic();
	@property bool IsFinal();
	@property bool IsVirtual();
	@property bool IsHideBySig();
	@property bool IsAbstract();
	@property bool IsSpecialName();
	@property bool IsConstructor();
	Object Invoke(Object obj, Object[] parameters);
}

public interface _MethodInfo
{
	//region IDispatch
	void GetTypeInfoCount(out uint info);
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
	bool IsDefined(Type attributeType, bool inherit);

	//MethodBase
	//	ParameterInfo[] GetParameters();
	//	MethodImplAttributes GetMethodImplementationFlags();
	//	@property RuntimeMethodHandle MethodHandle();
	//	@property MethodAttributes Attributes();
	//	@property CallingConventions CallingConvention();
	//	Object Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture);
	@property bool IsPublic();
	@property bool IsPrivate();
	@property bool IsFamily();
	@property bool IsAssembly();
	@property bool IsFamilyAndAssembly();
	@property bool IsFamilyOrAssembly();
	@property bool IsStatic();
	@property bool IsFinal();
	@property bool IsVirtual();
	@property bool IsHideBySig();
	@property bool IsAbstract();
	@property bool IsSpecialName();
	@property bool IsConstructor();
	Object Invoke(Object obj, Object[] parameters);

	//MethodInfo
	@property Type ReturnType();
//	@property ICustomAttributeProvider ReturnTypeCustomAttributes();
	MethodInfo GetBaseDefinition();
}

public interface _ContructorInfo
{

}

public interface _FieldInfo
{
	//region IDispatch
	void GetTypeInfoCount(out uint info);
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
	bool IsDefined(Type attributeType, bool inherit);

	//FieldInfo
	@property Type FieldType();
	Object GetValue(Object obj);        
	Object GetValueDirect(TypedReference obj);                
//	void SetValue(Object obj, Object value, BindingFlags invokeAttr, Binder binder, CultureInfo culture);        
	void SetValueDirect(TypedReference obj,Object value);        
//	@property RuntimeFieldHandle FieldHandle();
//	@property FieldAttributes Attributes();
	void SetValue(Object obj, Object value);
	@property bool IsPublic();
	@property bool IsPrivate();
	@property bool IsFamily();
	@property bool IsAssembly();
	@property bool IsFamilyAndAssembly();
	@property bool IsFamilyOrAssembly();
	@property bool IsStatic();
	@property bool IsInitOnly();
	@property bool IsLiteral();
	@property bool IsNotSerialized();
	@property bool IsSpecialName();
	@property bool IsPinvokeImpl();
}

public interface _PropertyInfo
{
	//region IDispatch
	void GetTypeInfoCount(out uint info);
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
	bool IsDefined(Type attributeType, bool inherit);

	//Property
	@property Type PropertyType();
	Object GetValue(Object obj,Object[] index);
//	Object GetValue(Object obj,BindingFlags invokeAttr,Binder binder, Object[] index, CultureInfo culture);
	void SetValue(Object obj, Object value, Object[] index);
//	void SetValue(Object obj, Object value, BindingFlags invokeAttr, Binder binder, Object[] index, CultureInfo culture);
	MethodInfo[] GetAccessors(bool nonPublic);
	MethodInfo GetGetMethod(bool nonPublic);
	MethodInfo GetSetMethod(bool nonPublic);
//	ParameterInfo[] GetIndexParameters();
//	@property PropertyAttributes Attributes();
	@property bool CanRead();
	@property bool CanWrite();
	MethodInfo[] GetAccessors();
	MethodInfo GetGetMethod();
	MethodInfo GetSetMethod();
	@property bool IsSpecialName();
}

public interface _EventInfo
{
	//region IDispatch
	void GetTypeInfoCount(out uint info);
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
	bool IsDefined(Type attributeType, bool inherit);

	//EventInfo
	MethodInfo GetAddMethod(bool nonPublic);
	MethodInfo GetRemoveMethod(bool nonPublic);
	MethodInfo GetRaiseMethod(bool nonPublic);
	@property EventAttributes Attributes();
	MethodInfo GetAddMethod();
	MethodInfo GetRemoveMethod();
	MethodInfo GetRaiseMethod();
	void AddEventHandler(Object target, Delegate handler);
	void RemoveEventHandler(Object target, Delegate handler);
	@property Type EventHandlerType();
	@property bool IsSpecialName();
	@property bool IsMulticast();
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