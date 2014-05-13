﻿module System._Class.Boolean;

import System;


public final class Boolean : IConvertible, IComparable!bool, IEquatable!bool
{
	@internal public static const True = 1;
	@internal public static const False = 0;

	@internal public static const TrueLiteral = "True";
	@internal public static const FalseLiteral = "False";

	public static immutable TrueString = TrueLiteral;
	public static immutable FalseString = FalseLiteral;

	alias _value this;
	private bool _value;


	static Boolean opCall(bool value)
	{
		Boolean ret = new Boolean();
		ret._value = value;
		return ret;
	}

	public static Boolean Parse(string value)
	{
		if (!value)
			throw new ArgumentNullException("value");

		Boolean result;
		if (!TryParse(value, result))
	    	throw new FormatException(Environment.GetResourceString("Format_BadBoolean"));

		return result;
	}
	
	public static bool TryParse(string value, out Boolean result)
	{
		result = false;

		if (!value)
			return false;


		return false; //TODO
	}

	private this()
	{
	}

	// Override Objct's methods
	public override int GetHashCode()
	{
		return _value ? True : False;
	}

	public override bool Equals(Object obj)
	{
		if (obj.GetType() != Boolean.GetType())
			return false;

		return (cast(Boolean)obj)._value == _value;
	}

	// Implement interface methods
	public bool Equals(bool other)
	{
		return _value == other;
	}

	public int CompareTo(bool value)
	{
		if (_value == value)
			return 0;
		if (!_value)
			return -1;

		return 1;
	}

	TypeCode GetTypeCode()
	{
		return TypeCode.Boolean;
	}
	
	bool ToBoolean(IFormatProvider provider = null)
	{
		return _value;
	}

	char ToChar(IFormatProvider provider = null)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Boolean", "Char"));
	}

	byte ToByte(IFormatProvider provider = null)
	{
		return Convert.ToByte(_value);
	}

	ubyte ToUByte(IFormatProvider provider = null)
	{
		return Convert.ToUByte(_value);
	}

	short ToInt16(IFormatProvider provider = null)
	{
		return Convert.ToInt16(_value);
	}

	ushort ToUInt16(IFormatProvider provider = null)
	{
		return Convert.ToUInt16(_value);
	}

	int ToInt32(IFormatProvider provider = null)
	{
		return Convert.ToInt32(_value);
	}

	uint ToUInt32(IFormatProvider provider = null)
	{
		return Convert.ToUInt32(_value);
	}

	long ToInt64(IFormatProvider provider = null)
	{
		return Convert.ToInt64(_value);
	}

	ulong ToUInt64(IFormatProvider provider = null)
	{
		return Convert.ToUInt64(_value);
	}

	float ToFloat(IFormatProvider provider = null)
	{
		return Convert.ToFloat(_value);
	}

	double ToDouble(IFormatProvider provider = null)
	{
		return Convert.ToDouble(_value);
	}

	real ToReal(IFormatProvider provider = null)
	{
		return Convert.ToReal(_value);
	}

	DateTime ToDateTime(IFormatProvider provider = null)
	{
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Boolean", "DateTime"));
	}

	string ToString(IFormatProvider provider = null)
	{
		return _value ? TrueLiteral : FalseLiteral;
	}

	Object ToType(Type conversionType, IFormatProvider provider = null)
	{
		return Convert.DefaultToType(this, conversionType, provider);
	}
}