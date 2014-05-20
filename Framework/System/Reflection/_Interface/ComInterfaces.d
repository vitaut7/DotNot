module System.Reflection._Interface.ComInterfaces;

static import System.Reflection;

import System;
import System.Reflection;
import System.Runtime.Serialization;


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

	ConstructorInfo[] GetConstructors(BindingFlags bindingAttr);
	Type GetInterface(string name, bool ignoreCase);
	Type[] GetInterfaces();
	Type[] FindInterfaces(TypeFilter filter, Object filterCriteria);
	EventInfo GetEvent(string name, BindingFlags bindingAttr);
	EventInfo[] GetEvents();
	EventInfo[] GetEvents(BindingFlags bindingAttr);
	Type[] GetNestedTypes(BindingFlags bindingAttr);
	Type GetNestedType(string name, BindingFlags bindingAttr);
	MemberInfo[] GetMember(string name, MemberTypes type, BindingFlags bindingAttr);
	MemberInfo[] GetDefaultMembers();
	MemberInfo[] FindMembers(MemberTypes memberType, BindingFlags bindingAttr, MemberFilter filter, Object filterCriteria);
	Type GetElementType();
	bool IsSubclassOf(Type c);
	bool IsInstanceOfType(Object o);
	bool IsAssignableFrom(Type c);
	InterfaceMapping GetInterfaceMap(Type interfaceType);
	MethodInfo GetMethod(string name, BindingFlags bindingAttr, Binder binder, Type[] types, ParameterModifier[] modifiers);
	MethodInfo GetMethod(string name, BindingFlags bindingAttr);
	MethodInfo[] GetMethods(BindingFlags bindingAttr);
	FieldInfo GetField(string name, BindingFlags bindingAttr);
	FieldInfo[] GetFields(BindingFlags bindingAttr);
	PropertyInfo GetProperty(string name, BindingFlags bindingAttr);
	PropertyInfo GetProperty(string name, BindingFlags bindingAttr, Binder binder, Type returnType, Type[] types, ParameterModifier[] modifiers);
	PropertyInfo[] GetProperties(BindingFlags bindingAttr);
	MemberInfo[] GetMember(string name, BindingFlags bindingAttr);
	MemberInfo[] GetMembers(BindingFlags bindingAttr);
	Object InvokeMember(string name, BindingFlags invokeAttr, Binder binder, Object target, Object[] args, ParameterModifier[] modifiers, CultureInfo culture, string[] namedParameters);
	@property Type UnderlyingSystemType();
	
	Object InvokeMember(string name, BindingFlags invokeAttr, Binder binder, Object target, Object[] args, CultureInfo culture);
	Object InvokeMember(string name, BindingFlags invokeAttr, Binder binder, Object target, Object[] args);
	ConstructorInfo GetConstructor(BindingFlags bindingAttr, Binder binder, CallingConventions callConvention, Type[] types, ParameterModifier[] modifiers);
	ConstructorInfo GetConstructor(BindingFlags bindingAttr, Binder binder, Type[] types, ParameterModifier[] modifiers);
	ConstructorInfo GetConstructor(Type[] types);
	ConstructorInfo[] GetConstructors();
	@property ConstructorInfo TypeInitializer();
	
	MethodInfo GetMethod(string name, BindingFlags bindingAttr, Binder binder, CallingConventions callConvention, Type[] types, ParameterModifier[] modifiers);
	MethodInfo GetMethod(string name, Type[] types, ParameterModifier[] modifiers);
	MethodInfo GetMethod(string name, Type[] types);
	MethodInfo GetMethod(string name);
	MethodInfo[] GetMethods();
	FieldInfo GetField(string name);
	FieldInfo[] GetFields();
	Type GetInterface(string name);
	EventInfo GetEvent(string name);
	PropertyInfo GetProperty(string name, Type returnType, Type[] types,ParameterModifier[] modifiers);
	PropertyInfo GetProperty(string name, Type returnType, Type[] types);
	PropertyInfo GetProperty(string name, Type[] types);
	PropertyInfo GetProperty(string name, Type returnType);
	PropertyInfo GetProperty(string name);
	PropertyInfo[] GetProperties();
	Type[] GetNestedTypes();
	Type GetNestedType(string name);
	MemberInfo[] GetMember(string name);
	MemberInfo[] GetMembers();
	@property TypeAttributes Attributes();
	@property bool IsNotPublic();
	@property bool IsPublic();
	@property bool IsNestedPublic();
	@property bool IsNestedPrivate();
	@property bool IsNestedFamily();
	@property bool IsNestedAssembly();
	@property bool IsNestedFamANDAssem();
	@property bool IsNestedFamORAssem();
	@property bool IsAutoLayout();
	@property bool IsLayoutSequential();
	@property bool IsExplicitLayout();
	@property bool IsClass();
	@property bool IsInterface();
	@property bool IsValueType();
	@property bool IsAbstract();
	@property bool IsSealed();
	@property bool IsEnum();
	@property bool IsSpecialName();
	@property bool IsImport();
	@property bool IsSerializable();
	@property bool IsAnsiClass();
	@property bool IsUnicodeClass();
	@property bool IsAutoClass();
	@property bool IsArray();
	@property bool IsByRef();
	@property bool IsPointer();
	@property bool IsPrimitive();
	@property bool IsCOMObject();
	@property bool HasElementType();
	@property bool IsContextful();
	@property bool IsMarshalByRef();
	@property bool Equals(Type o);
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
	AssemblyName GetName();
	AssemblyName GetName(bool copiedName);
	@property string FullName();
	@property MethodInfo EntryPoint();
	Type GetType(string name);
	Type GetType(string name, bool throwOnError);
	Type[] GetExportedTypes();
	Type[] GetTypes();
	Stream GetManifestResourceStream(Type type, string name);
	Stream GetManifestResourceStream(string name);
	FileStream GetFile(string name);
	FileStream[] GetFiles();
	FileStream[] GetFiles(bool getResourceModules);
	string[] GetManifestResourceNames();
	ManifestResourceInfo GetManifestResourceInfo(string resourceName);
	@property string Location();
	Object[] GetCustomAttributes(Type attributeType, bool inherit);
	Object[] GetCustomAttributes(bool inherit);
	bool IsDefined(Type attributeType, bool inherit);
	void GetObjectData(SerializationInfo info, StreamingContext context);
	@property Event!ModuleResolveEventHandler ModuleResolve();
	@property void ModuleResolve(Event!ModuleResolveEventHandler event);
	Type GetType(string name, bool throwOnError, bool ignoreCase);
	Assembly GetSatelliteAssembly(CultureInfo culture);
	Assembly GetSatelliteAssembly(CultureInfo culture, Version ver);
	Module LoadModule(string moduleName, byte[] rawModule);
	Module LoadModule(string moduleName, byte[] rawModule, byte[] rawSymbolStore);
	Object CreateInstance(string typeName);
	Object CreateInstance(string typeName, bool ignoreCase);
	Object CreateInstance(string typeName, bool ignoreCase, BindingFlags bindingAttr,  Binder binder, Object[] args, CultureInfo culture, Object[] activationAttributes);
	Module[] GetLoadedModules();
	Module[] GetLoadedModules(bool getResourceModules);
	Module[] GetModules();
	Module[] GetModules(bool getResourceModules);
	Module GetModule(string name);
	AssemblyName[] GetReferencedAssemblies();
	@property bool GlobalAssemblyCache();
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
	ParameterInfo[] GetParameters();
	MethodImplAttributes GetMethodImplementationFlags();
	@property RuntimeMethodHandle MethodHandle();
	@property MethodAttributes Attributes();
	@property CallingConventions CallingConvention();
	Object Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture);
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
	ParameterInfo[] GetParameters();
	MethodImplAttributes GetMethodImplementationFlags();
	@property RuntimeMethodHandle MethodHandle();
	@property MethodAttributes Attributes();
	@property CallingConventions CallingConvention();
	Object Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture);
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
	@property ICustomAttributeProvider ReturnTypeCustomAttributes();
	MethodInfo GetBaseDefinition();
}

public interface _ContructorInfo
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
	ParameterInfo[] GetParameters();
	MethodImplAttributes GetMethodImplementationFlags();
	@property RuntimeMethodHandle MethodHandle();
	@property MethodAttributes Attributes();
	@property CallingConventions CallingConvention();
	Object Invoke_2(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture);
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
	Object Invoke_3(Object obj, Object[] parameters);

	//ContructorInfo
	Object Invoke_4(BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture);
	Object Invoke_5(Object[] parameters);
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
	void SetValue(Object obj, Object value, BindingFlags invokeAttr, Binder binder, CultureInfo culture);
	void SetValueDirect(TypedReference obj,Object value);
	@property RuntimeFieldHandle FieldHandle();
	@property FieldAttributes Attributes();
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
	Object GetValue(Object obj,BindingFlags invokeAttr,Binder binder, Object[] index, CultureInfo culture);
	void SetValue(Object obj, Object value, Object[] index);
	void SetValue(Object obj, Object value, BindingFlags invokeAttr, Binder binder, Object[] index, CultureInfo culture);
	MethodInfo[] GetAccessors(bool nonPublic);
	MethodInfo GetGetMethod(bool nonPublic);
	MethodInfo GetSetMethod(bool nonPublic);
	ParameterInfo[] GetIndexParameters();
	@property PropertyAttributes Attributes();
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