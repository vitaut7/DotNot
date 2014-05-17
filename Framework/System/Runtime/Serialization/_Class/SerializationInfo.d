module System.Runtime.Serialization._Class.SerializationInfo;

import System;
import System.Runtime.Serialization;

/*
		_members = new string[DefaultSize];
		_data = new Object[DefaultSize];
		_types = new Type[DefaultSize];
		sa budu plnit _types ~= type;
*/
public final class SerializationInfo
{
	private string[] _members;
	private Object[] _data;
	private Type[] _types;
	//private int _currMember;
	private IFormatterConverter _converter;
	private string _fullTypeName;
	private string _assemName;
	private Type _objectType;
	private bool _isFullTypeNameSetExplicit;
	private bool _isAssemblyNameSetExplicit;
	private bool _requireSameTokenInPartialTrust;

	@property public string FullTypeName() { return _fullTypeName; }
	@property public string AssemblyName() { return _assemName; }

	@property public void FullTypeName(string value)
	{
		if (!value)
			throw new ArgumentNullException("value");
		Contract.EndContractBlock();

		_fullTypeName = value;
		_isFullTypeNameSetExplicit = true;
	}

	@property public void AssemblyName(string value)
	{
		if (!value)
			throw new ArgumentNullException("value");
		Contract.EndContractBlock();

		if (_requireSameTokenInPartialTrust)
			DemandForUnsafeAssemblyNameAssignments(_assemName, value);

		_assemName = value;
		_isAssemblyNameSetExplicit = true;
	}

	public this(Type type, IFormatterConverter converter)
	{
		this(type, converter, false);
	}

	public this(Type type, IFormatterConverter converter, bool requireSameTokenInPartialTrust)
	{
		if (type is null)
			throw new ArgumentNullException("type");

		if (converter is null)
			throw new ArgumentNullException("converter");
		Contract.EndContractBlock();

		_objectType = type;
		_fullTypeName = type.FullName;
		_assemName = type.Module.Assembly.FullName;
		_converter = converter;
		_requireSameTokenInPartialTrust = requireSameTokenInPartialTrust;
	}

	public void SetType(Type type)
	{
		if (type is null)
			throw new ArgumentNullException("type");
		Contract.EndContractBlock();

		if (_requireSameTokenInPartialTrust)
			DemandForUnsafeAssemblyNameAssignments(_objectType.Assembly.FullName, type.Assembly.FullName);

		if (!Object.ReferenceEquals(_objectType, type))
		{
			_objectType = type;
			_fullTypeName = type.FullName;
			_assemName = type.Module.Assembly.FullName;
			_isFullTypeNameSetExplicit = false;
			_isAssemblyNameSetExplicit = false;
		}
	}

	private static bool Compare(byte[] a, byte[] b)
	{
		if (a is null || b is null || !a.Length || !b.Length || a.Length != b.Length)
			return false;

		foreach (i, x; a)
			if (x != b[i])
				return false;

		return true;
	}

	@internal static void DemandForUnsafeAssemblyNameAssignments(string originalAssemblyName, string newAssemblyName)
	{
		//if (!IsAssemblyNameAssignmentSafe(originalAssemblyName, newAssemblyName))
		//TODO
		assert(0);
	}

	@internal static bool IsAssemblyNameAssignmentSafe(string originalAssemblyName, string newAssemblyName)
	{
		if (originalAssemblyName == newAssemblyName)
			return true;

		//TODO
		assert(0);
	}

	@property public int MemberCount()
	{
		return _types.Length;
	}

	@property public Type ObjectType()
	{
		return _objectType;
	}

	@property public bool IsFullTypeNameSetExplicit()
	{
		return _isFullTypeNameSetExplicit;
	}

	@property public bool IsAssemblyNameSetExplicit()
	{
		return _isAssemblyNameSetExplicit;
	}

	@property SerializationInfoEnumerator GetEnumerator()
	{
		//TODO
		assert(0);
	}

	public void AddValue(string name, Object value, Type type)
	{
		if (!name)
			throw new ArgumentNullException("name");

		if (type is null)
			throw new ArgumentNullException("type");
		Contract.EndContractBlock();

		foreach (x; _members)
			if (x == name)
				throw new SerializationException(Environment.GetResourceString("Serialization_SameNameTwice"));

		_members ~= name;
		_data ~= value;
		_types ~= type;
	}

	public void AddValue(string name, Object value)
	{
		if (value is null)
			AddValue(name, value, Typeof!Object);
	//	else //TODO
	//		AddValue(name, value, value.GetType());
	}

	public void AddValue(string name, bool value)
	{
		AddValue(name, Boolean(value), Typeof!bool);
	}

	public void AddValue(string name, byte value)
	{
		AddValue(name, Byte(value), Typeof!byte);
	}

	public void AddValue(string name, ubyte value)
	{
		AddValue(name, UByte(value), Typeof!ubyte);
	}

	public void AddValue(string name, short value)
	{
		AddValue(name, Int16(value), Typeof!short);
	}

	public void AddValue(string name, ushort value)
	{
		AddValue(name, UInt16(value), Typeof!ushort);
	}

	public void AddValue(string name, int value)
	{
		AddValue(name, Int32(value), Typeof!int);
	}

	public void AddValue(string name, uint value)
	{
		AddValue(name, UInt32(value), Typeof!uint);
	}

	public void AddValue(string name, long value)
	{
		AddValue(name, Int64(value), Typeof!long);
	}

	public void AddValue(string name, ulong value)
	{
		AddValue(name, UInt64(value), Typeof!ulong);
	}

	public void AddValue(string name, float value)
	{
		AddValue(name, Float(value), Typeof!float);
	}

	public void AddValue(string name, double value)
	{
		AddValue(name, Double(value), Typeof!double);
	}

	public void AddValue(string name, real value)
	{
		AddValue(name, Real(value), Typeof!real);
	}

	public void AddValue(string name, DateTime value)
	{
		AddValue(name, value, Typeof!DateTime);
	}

	@internal public void UpdateValue(string name, Object value, Type type)
	{
		Contract.Assert(name !is null, "[SerializationInfo.UpdateValue]name!=null");
		Contract.Assert(value !is null, "[SerializationInfo.UpdateValue]value!=null");
		Contract.Assert(type !is null, "[SerializationInfo.UpdateValue]type!=null");

		int index = FindElement(name);
		if (index == -1)
			AddValue(name, value);
		else
		{
			_members[index] = name;
			_data[index] = value;
			_types[index] = type;
		}
	}

	private int FindElement(string name)
	{
		if (!name)
			throw new ArgumentNullException("name");
		Contract.EndContractBlock();

		foreach (int i, x; _members)
			if (x == name)
				return i;

		return -1;
	}

	private Object GetElement(string name, out Type foundType)
	{
		int index = FindElement(name);
		if (index == -1)
			throw new SerializationException(Environment.GetResourceString("Serialization_NotFound", name));

		Contract.Assert(index < _data.Length, "[SerializationInfo.GetElement]index<_data.Length");
		Contract.Assert(index < _types.Length, "[SerializationInfo.GetElement]index<_types.Length");

		foundType = _types[index];
		Contract.Assert(foundType !is null, "[SerializationInfo.GetElement]foundType!=null");
		return _data[index];
	}
}

//ExpandArrays netreba