module System._Class.UInt64;

import System;


public final class UInt64 : IConvertible, IFormattable, IComparable!ulong, IEquatable!ulong
{
	public static const MaxValue = cast(int)0xffffffffffffffff;
	public static const MinValue = cast(int)0x0000000000000000;
	
	alias _value this;
	private ulong _value;
	
	
	static UInt64 opCall(ulong value)
	{
		UInt64 ret = new UInt64();
		ret._value = value;
		return ret;
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
		if (obj.GetType() != UInt64.GetType())
			return false;
		
		return (cast(UInt64)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(ulong other)
	{
		return _value == other;
	}
	
	public int CompareTo(ulong value)
	{
		if (_value < value) return -1;
		if (_value > value) return 1;
		return 0;
	}
	
	TypeCode GetTypeCode()
	{
		return TypeCode.UInt64;
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
		return Convert.ToInt64(_value);
	}
	
	ulong ToUInt64(IFormatProvider provider = null)
	{
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "UInt64", "DateTime"));
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