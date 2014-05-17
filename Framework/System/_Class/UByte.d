module System._Class.UByte;

import System;


public final class UByte : IConvertible, IComparable!ubyte, IEquatable!ubyte
{
	public static const MaxValue = cast(byte)0xFF;
	public static const MinValue = cast(byte)0x00;

	alias Value this;
	private ubyte _value;

	@property ubyte Value()
	{
		return _value;
	}
	
	@property void Value(ubyte value)
	{
		_value = value;
	}
	
	static UByte opCall(ubyte value)
	{
		UByte ret = new UByte();
		ret._value = value;
		return ret;
	}

	bool opEquals(ubyte value)
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
		return _value;
	}
	
	public override bool Equals(Object obj)
	{
		if (obj.GetType() != UByte.GetType())
			return false;
		
		return (cast(UByte)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(ubyte other)
	{
		return _value == other;
	}
	
	public int CompareTo(ubyte value)
	{
		return _value - value;
	}

	TypeCode GetTypeCode()
	{
		return TypeCode.UByte;
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "UByte", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null)
	{
		return "";// TODO
	}
	
	//TODO nejake stringy
	
	Object ToType(Type conversionType, IFormatProvider provider = null)
	{
		return Convert.DefaultToType(this, conversionType, provider);
	}
}