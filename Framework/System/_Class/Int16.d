module System._Class.Int16;

import System;


public final class Int16 : IConvertible, IFormattable, IComparable!short, IEquatable!short
{
	public static const MaxValue = cast(short)0x7FFF;
	public static const MinValue = cast(short)0x8000;
	
	alias Value this;
	private short _value;

	@property short Value()
	{
		return _value;
	}
	
	@property void Value(short value)
	{
		_value = value;
	}
	
	static Int16 opCall(short value)
	{
		Int16 ret = new Int16();
		ret._value = value;
		return ret;
	}

	bool opEquals(short value)
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
		return (cast(short)_value | (cast(int)_value << 8));
	}
	
	public override bool Equals(Object obj)
	{
		if (obj.GetType() != Int16.GetType())
			return false;
		
		return (cast(Int16)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(short other)
	{
		return _value == other;
	}
	
	public int CompareTo(short value)
	{
		return _value - value;
	}
	
	TypeCode GetTypeCode()
	{
		return TypeCode.Int16;
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Int16", "DateTime"));
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