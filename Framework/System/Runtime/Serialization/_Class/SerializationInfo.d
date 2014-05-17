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
}