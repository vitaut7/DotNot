module System.Runtime.Serialization._Class.SerializationInfo;

import System;
import System.Runtime.Serialization;


public final class SerializationInfo {
	private string[] _members;
	private Object[] _data;
	private Type[] _types;
	private IFormatterConverter _converter;
	private string _fullTypeName;
	private string _assemName;
	private Type _objectType;
	private bool _isFullTypeNameSetExplicit;
	private bool _isAssemblyNameSetExplicit;
	private bool _requireSameTokenInPartialTrust;

	@property public string FullTypeName() {
		return _fullTypeName;
	}

	@property public string AssemblyName() {
		return _assemName;
	}

	@internal @property string[] MemberNames() {
		return _members;
	}

	@internal @property Object[] MemberValues() {
		return _data;
	}

	@property public void FullTypeName(string value) in {
		if (!value)
			throw new ArgumentNullException("value");
	} body {
		_fullTypeName = value;
		_isFullTypeNameSetExplicit = true;
	}

	@property public void AssemblyName(string value) in {
		if (!value)
			throw new ArgumentNullException("value");
	} body {
		if (_requireSameTokenInPartialTrust)
			DemandForUnsafeAssemblyNameAssignments(_assemName, value);

		_assemName = value;
		_isAssemblyNameSetExplicit = true;
	}

	public this(Type type, IFormatterConverter converter) {
		this(type, converter, false);
	}

	public this(Type type, IFormatterConverter converter, bool requireSameTokenInPartialTrust) in {
		if (type is null)
			throw new ArgumentNullException("type");

		if (converter is null)
			throw new ArgumentNullException("converter");
	} body {
		_objectType = type;
		_fullTypeName = type.FullName;
		_assemName = type.Module.Assembly.FullName;
		_converter = converter;
		_requireSameTokenInPartialTrust = requireSameTokenInPartialTrust;
	}

	public void SetType(Type type) in {
		if (type is null)
			throw new ArgumentNullException("type");
	} body {
		if (_requireSameTokenInPartialTrust)
			DemandForUnsafeAssemblyNameAssignments(_objectType.Assembly.FullName, type.Assembly.FullName);

		if (!Object.ReferenceEquals(_objectType, type)) {
			_objectType = type;
			_fullTypeName = type.FullName;
			_assemName = type.Module.Assembly.FullName;
			_isFullTypeNameSetExplicit = false;
			_isAssemblyNameSetExplicit = false;
		}
	}

	private static bool Compare(byte[] a, byte[] b) {
		if (a is null || b is null || !a.Length || !b.Length || a.Length != b.Length)
			return false;

		foreach (i, x; a)
			if (x != b[i])
				return false;

		return true;
	}

	@internal static void DemandForUnsafeAssemblyNameAssignments(string originalAssemblyName, string newAssemblyName) {
		//if (!IsAssemblyNameAssignmentSafe(originalAssemblyName, newAssemblyName))
		//TODO
		assert(0);
	}

	@internal static bool IsAssemblyNameAssignmentSafe(string originalAssemblyName, string newAssemblyName) {
		if (originalAssemblyName == newAssemblyName)
			return true;

		//TODO
		assert(0);
	}

	@property public int MemberCount() {
		return _types.Length;
	}

	@property public Type ObjectType() {
		return _objectType;
	}

	@property public bool IsFullTypeNameSetExplicit() {
		return _isFullTypeNameSetExplicit;
	}

	@property public bool IsAssemblyNameSetExplicit() {
		return _isAssemblyNameSetExplicit;
	}

	@property SerializationInfoEnumerator GetEnumerator() {
		return new SerializationInfoEnumerator(_members, _data, _types);
	}

	public void AddValue(string name, Object value, Type type) in {
		if (!name)
			throw new ArgumentNullException("name");

		if (type is null)
			throw new ArgumentNullException("type");
	} body {
		foreach (x; _members)
			if (x == name)
				throw new SerializationException(Environment.GetResourceString("Serialization_SameNameTwice"));

		_members ~= name;
		_data ~= value;
		_types ~= type;
	}

	public void AddValue(string name, Object value) {
		if (value is null)
			AddValue(name, value, Typeof!Object);
	//	else //TODO
	//		AddValue(name, value, value.GetType());
	}

	public void AddValue(string name, bool value) {
		AddValue(name, Boolean(value), Typeof!bool);
	}

	public void AddValue(string name, byte value) {
		AddValue(name, Byte(value), Typeof!byte);
	}

	public void AddValue(string name, ubyte value) {
		AddValue(name, UByte(value), Typeof!ubyte);
	}

	public void AddValue(string name, short value) {
		AddValue(name, Int16(value), Typeof!short);
	}

	public void AddValue(string name, ushort value) {
		AddValue(name, UInt16(value), Typeof!ushort);
	}

	public void AddValue(string name, int value) {
		AddValue(name, Int32(value), Typeof!int);
	}

	public void AddValue(string name, uint value) {
		AddValue(name, UInt32(value), Typeof!uint);
	}

	public void AddValue(string name, long value) {
		AddValue(name, Int64(value), Typeof!long);
	}

	public void AddValue(string name, ulong value) {
		AddValue(name, UInt64(value), Typeof!ulong);
	}

	public void AddValue(string name, float value) {
		AddValue(name, Float(value), Typeof!float);
	}

	public void AddValue(string name, double value) {
		AddValue(name, Double(value), Typeof!double);
	}

	public void AddValue(string name, real value) {
		AddValue(name, Real(value), Typeof!real);
	}

	public void AddValue(string name, DateTime value) {
		AddValue(name, value, Typeof!DateTime);
	}

	public void AddValue(string name, string value) {
		AddValue(name, String(value), Typeof!string);
	}

	@internal void UpdateValue(string name, Object value, Type type) {
		assert(name !is null, "[SerializationInfo.UpdateValue]name!=null");
		assert(value !is null, "[SerializationInfo.UpdateValue]value!=null");
		assert(type !is null, "[SerializationInfo.UpdateValue]type!=null");

		int index = FindElement(name);
		if (index == -1)
			AddValue(name, value);
		else {
			_members[index] = name;
			_data[index] = value;
			_types[index] = type;
		}
	}

	private int FindElement(string name) in {
		if (!name)
			throw new ArgumentNullException("name");
	} body {
		foreach (int i, x; _members)
			if (x == name)
				return i;

		return -1;
	}

	private Object GetElement(string name, out Type foundType) {
		int index = FindElement(name);
		if (index == -1)
			throw new SerializationException(Environment.GetResourceString("Serialization_NotFound", name));

		assert(index < _data.Length, "[SerializationInfo.GetElement]index<_data.Length");
		assert(index < _types.Length, "[SerializationInfo.GetElement]index<_types.Length");

		foundType = _types[index];
		assert(foundType !is null, "[SerializationInfo.GetElement]foundType!=null");
		return _data[index];
	}

	private Object GetElementNoThrow(string name, out Type foundType) {
		try {
			return GetElement(name, foundType);
		}
		catch {
			foundType = null;
			return null;
		}
	}

	public Object GetValue(string name, Type type) in {
		if (type is null)
			throw new ArgumentNullException("type");
	} body {
		Type foundType;
		Object value = GetElement(name, foundType);

		if (RemotingServices.IsTransparentProxy(value)) {
			RealProxy proxy = RemotingServices.GetRealProxy(value);
			if (RemotingServices.ProxyCheckCast(proxy, cast(RuntimeType)type))
				return value;
		} else {
			if (foundType == type || type.IsAssignableFrom(foundType) || value is null)
				return value;
		}

		assert(_converter !is null, "[SerializationInfo.GetValue]_converter!=null");
		return _converter.Convert(value, type);
	}

	public Object GetValueNoThrow(string name, Type type) {
		assert(type !is null, "[SerializationInfo.GetValue]type ==null");
		assert(type.GetType() == RuntimeType.GetType(), "[SerializationInfo.GetValue]type is not a runtime type");

		Type foundType;
		Object value = GetElementNoThrow(name, foundType);
		if (value is null)
			return null;
				
		if (RemotingServices.IsTransparentProxy(value)) {
			RealProxy proxy = RemotingServices.GetRealProxy(value);
			if (RemotingServices.ProxyCheckCast(proxy, cast(RuntimeType)type))
				return value;
		} else {
			if (foundType == type || type.IsAssignableFrom(foundType) || value is null)
				return value;
		}
		
		assert(_converter !is null, "[SerializationInfo.GetValue]_converter!=null");
		return _converter.Convert(value, type);
	}

	public bool GetBoolean(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);

		if (foundType == Typeof!bool || foundType == Typeof!Boolean)
			return cast(Boolean)value;

		return _converter.ToBoolean(value);
	}

	public char GetChar(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!char || foundType == Typeof!Char)
			return cast(Char)value;

		return _converter.ToChar(value);
	}

	public byte GetByte(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);

		if (foundType == Typeof!byte || foundType == Typeof!Byte)
			return cast(Byte)value;
		
		return _converter.ToByte(value);
	}

	public ubyte GetUByte(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!ubyte || foundType == Typeof!UByte)
			return cast(UByte)value;
		
		return _converter.ToUByte(value);
	}

	public short GetInt16(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);

		if (foundType == Typeof!short || foundType == Typeof!Int16)
			return cast(Int16)value;
		
		return _converter.ToInt16(value);
	}

	public ushort GetUInt16(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);

		if (foundType == Typeof!ushort || foundType == Typeof!UInt16)
			return cast(UInt16)value;
		
		return _converter.ToUInt16(value);
	}

	public int GetInt32(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!int || foundType == Typeof!Int32)
			return cast(Int32)value;
		
		return _converter.ToInt32(value);
	}
	
	public uint GetUInt32(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!uint || foundType == Typeof!UInt32)
			return cast(UInt32)value;
		
		return _converter.ToUInt32(value);
	}

	public long GetInt64(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!long || foundType == Typeof!Int64)
			return cast(Int64)value;
		
		return _converter.ToInt64(value);
	}
	
	public ulong GetUInt64(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!ulong || foundType == Typeof!UInt64)
			return cast(UInt64)value;
		
		return _converter.ToUInt64(value);
	}

	public float GetFloat(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);

		if (foundType == Typeof!float || foundType == Typeof!Float)
			return cast(Float)value;
		
		return _converter.ToFloat(value);
	}

	public double GetDouble(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!double || foundType == Typeof!Double)
			return cast(Double)value;
		
		return _converter.ToDouble(value);
	}

	public real GetReal(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!real || foundType == Typeof!Real)
			return cast(Real)value;
		
		return _converter.ToReal(value);
	}

	public DateTime GetDateTime(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);
		
		if (foundType == Typeof!DateTime)
			return cast(DateTime)value;
		
		return _converter.ToDateTime(value);
	}

	public string GetString(string name) {
		Type foundType;
		Object value = GetElement(name, foundType);

		if (foundType == Typeof!string || foundType == Typeof!String || value is null)
			return cast(String)value;
		
		return _converter.ToString(value);
	}
}