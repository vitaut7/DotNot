module System._Class.Byte;

import System;


public final class Byte : IConvertible, IComparable!byte, IEquatable!byte
{
	public static const MaxValue = cast(byte)0x7F;
	public static const MinValue = cast(byte)0x80;

	alias _value this;
	private byte _value;


	static Byte opCall(byte value)
	{
		Byte ret = new Byte();
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
		return (cast(int)_value ^ cast(int)_value << 8);
	}
	
	public override bool Equals(Object obj)
	{
		if (obj.GetType() != Byte.GetType())
			return false;

		return (cast(Byte)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(byte other)
	{
		return _value == other;
	}
	
	public int CompareTo(byte value)
	{
		return _value - value;
	}

	TypeCode GetTypeCode()
	{
		return TypeCode.Byte;
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Byte", "DateTime"));
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