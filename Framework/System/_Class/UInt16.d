module System._Class.UInt16;

import System;


public final class UInt16 : IConvertible, IFormattable, IComparable!ushort, IEquatable!ushort
{
	public static const MaxValue = cast(short)0xFFFF;
	public static const MinValue = cast(short)0x0000;
	
	alias Value this;
	private ushort _value;

	@property ushort Value()
	{
		return _value;
	}
	
	@property void Value(ushort value)
	{
		_value = value;
	}
	
	static UInt16 opCall(ushort value)
	{
		UInt16 ret = new UInt16();
		ret._value = value;
		return ret;
	}

	bool opEquals(ushort value)
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
		if (obj.GetType() != UInt16.GetType())
			return false;
		
		return (cast(UInt16)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(ushort other)
	{
		return _value == other;
	}
	
	public int CompareTo(ushort value)
	{
		return _value - value;
	}
	
	TypeCode GetTypeCode()
	{
		return TypeCode.UInt16;
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "UInt16", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null)
	{
		return "";// TODO
	}

	string ToString(string format, IFormatProvider provider = null)
	{
		return "";
	}
	
	//TODO nejake stringy
	
	Object ToType(Type conversionType, IFormatProvider provider = null)
	{
		return Convert.DefaultToType(this, conversionType, provider);
	}
}