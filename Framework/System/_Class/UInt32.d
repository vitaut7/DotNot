module System._Class.UInt32;

import System;
import System.Globalization;


public final class UInt32 : IConvertible, IFormattable, IComparable!uint, IEquatable!uint
{
	public static const MaxValue = cast(int)0xFFFFFFFF;
	public static const MinValue = cast(int)0x00000000;
	
	alias Value this;
	private uint _value;

	@property uint Value()
	{
		return _value;
	}
	
	@property void Value(uint value)
	{
		_value = value;
	}
	
	static UInt32 opCall(uint value)
	{
		UInt32 ret = new UInt32();
		ret._value = value;
		return ret;
	}

	bool opEquals(uint value)
	{
		return Equals(value);
	}

	public static uint Parse(string s)
	{
		return Number.ParseUInt32(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo);
	}
	
	public static uint Parse(string s, NumberStyles style)
	{
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.ParseUInt32(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static uint Parse(string s, IFormatProvider provider)
	{
		return Number.ParseUInt32(s, NumberStyles.Integer, NumberFormatInfo.GetInstance(provider));
	}
	
	public static uint Parse(string s, NumberStyles style, IFormatProvider provider)
	{
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.ParseUInt32(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	public static bool TryParse(string s, out uint result)
	{
		return Number.TryParseUInt32(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out uint result)
	{
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Number.TryParseUInt32(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
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
		if (obj.GetType() != UInt32.GetType())
			return false;
		
		return (cast(UInt32)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(uint other)
	{
		return _value == other;
	}
	
	public int CompareTo(uint value)
	{
		if (_value < value) return -1;
		if (_value > value) return 1;
		return 0;
	}
	
	TypeCode GetTypeCode()
	{
		return TypeCode.UInt32;
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
		return _value;
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
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "UInt32", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null)
	{
		Contract.Ensures(Contract.Result!string() !is null);
		return Number.FormatUInt32(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null)
	{
		Contract.Ensures(Contract.Result!string() !is null);
		return Number.FormatUInt32(_value, format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null)
	{
		return Convert.DefaultToType(this, conversionType, provider);
	}
}