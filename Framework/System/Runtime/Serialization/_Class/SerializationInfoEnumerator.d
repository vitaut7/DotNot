module System.Runtime.Serialization._Class.SerializationInfoEnumerator;

import System;
import System.Collection;


public struct SerializationEntry
{
	private Type _type;
	private Object _value;
	private string _name;

	@property public Object Value()
	{
		return _value;
	}

	@property public string Name()
	{
		return _name;
	}

	@property public Type ObjectType()
	{
		return _type;
	}

	@internal this(string name, Object value, Type type)
	{
		_value = value;
		_name = name;
		_type = type;
	}
}


public final class SerializationInfoEnumerator : IEnumerator!SerializationEntry
{
	private string[] _members;
	private Object[] _data;
	private Type[] _types;
	int _numItems;
	int _currItem;
	bool _current;

	@property public string Name()
	{
		if (!_current)
			throw new InvalidOperationException(Environment.GetResourceString("InvalidOperation_EnumOpCantHappen"));

		return _members[_currItem];
	}

	@property public Object Value()
	{
		if (!_current)
			throw new InvalidOperationException(Environment.GetResourceString("InvalidOperation_EnumOpCantHappen"));
		
		return _data[_currItem];
	}

	@property public Type ObjectType()
	{
		if (!_current)
			throw new InvalidOperationException(Environment.GetResourceString("InvalidOperation_EnumOpCantHappen"));
		
		return _types[_currItem];
	}

	@internal this(string[] members, Object[] info, Type[] types, int numItems)
	{
		Contract.Assert(members !is null, "[SerializationInfoEnumerator.ctor]members!=null");
		Contract.Assert(info !is null, "[SerializationInfoEnumerator.ctor]info!=null");
		Contract.Assert(types !is null, "[SerializationInfoEnumerator.ctor]types!=null");
		Contract.Assert(numItems >= 0, "[SerializationInfoEnumerator.ctor]numItems>=0");
		Contract.Assert(members.Length >= numItems, "[SerializationInfoEnumerator.ctor]members.Length>=numItems");
		Contract.Assert(info.Length >= numItems, "[SerializationInfoEnumerator.ctor]info.Length>=numItems");
		Contract.Assert(types.Length >= numItems, "[SerializationInfoEnumerator.ctor]types.Length>=numItems");

		_members = members;
		_data = info;
		_types = types;
		_numItems = numItems - 1;
		_currItem = -1;
		_current = false;
	}

	public bool MoveNext()
	{
		if (_currItem < _numItems)
		{
			_currItem++;
			_current = true;
		} else
			_current = false;

		return _current;
	}

	public void Reset()
	{
		_currItem = -1;
		_current = false;
	}

	@property public SerializationEntry Current()
	{
		if (!_current)
			throw new InvalidOperationException(Environment.GetResourceString("InvalidOperation_EnumOpCantHappen"));

		return *new SerializationEntry(_members[_currItem], _data[_currItem], _types[_currItem]);
	}

	public void Dispose()
	{

	}
}