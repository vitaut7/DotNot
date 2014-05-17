﻿module System._Class.Int64;

import System;


public final class Int64 : IConvertible, IFormattable, IComparable!long, IEquatable!long
{
	public static const MaxValue = cast(int)0x7fffffffffffffff;
	public static const MinValue = cast(int)0x8000000000000000;
	
	alias Value this;
	private long _value;

	@property long Value()
	{
		return _value;
	}
	
	@property void Value(long value)
	{
		_value = value;
	}
	
	static Int64 opCall(long value)
	{
		Int64 ret = new Int64();
		ret._value = value;
		return ret;
	}

	bool opEquals(long value)
	{
		return Equals(value);
	}
	
	//TODO: parsery
	
	private this()
	{
	}
	
	// Override Objct's methods
	public override int GetHashCode()
	{
		return cast(int)(_value ^ cast(int)(_value >> 32));
	}
	
	public override bool Equals(Object obj)
	{
		if (obj.GetType() != Int64.GetType())
			return false;
		
		return (cast(Int64)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(long other)
	{
		return _value == other;
	}
	
	public int CompareTo(long value)
	{
		if (_value < value) return -1;
		if (_value > value) return 1;
		return 0;
	}
	
	TypeCode GetTypeCode()
	{
		return TypeCode.Int64;
	}
	
	bool ToBoolean(IFormatProvider provider = null)
	{
		return Convert.ToBoolean(_value);
	}
	
	char ToChar(IFormatProvider provider = null)
	{
		return Convert.ToChar(_value);
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Int64", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null)
	{
		return "";// TODO
	}
	
	string ToString(string format, IFormatProvider provider = null)
	{
		return ""; //TODO
	}
	
	//TODO nejake stringy
	
	Object ToType(Type conversionType, IFormatProvider provider = null)
	{
		return Convert.DefaultToType(this, conversionType, provider);
	}
}