module System._Class.Int16;

import System;
import System.Globalization;


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

	public static short Parse(string s)
	{
		return Parse(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo);
	}
	
	public static short Parse(string s, NumberStyles style)
	{
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Parse(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static short Parse(string s, IFormatProvider provider)
	{
		return Parse(s, NumberStyles.Integer, NumberFormatInfo.GetInstance(provider));
	}
	
	public static short Parse(string s, NumberStyles style, IFormatProvider provider)
	{
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Parse(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	private static short Parse(string s, NumberStyles style, NumberFormatInfo info)
	{
		int i;
		
		try
		{
			i = Number.ParseInt32(s, style, info);
		}
		catch (OverflowException e)
		{
			throw new OverflowException(Environment.GetResourceString("Overflow_Int16"), e);
		}
		
		if (style & NumberStyles.AllowHexSpecifier)
		{
			if (i < 0 || i > UInt16.MaxValue)
				throw new OverflowException(Environment.GetResourceString("Overflow_Int16"));
			
			return cast(short)i;
		}
		
		if (i < MinValue || i > MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int16"));
		
		return cast(short)i;
	}
	
	public static bool TryParse(string s, out short result)
	{
		return TryParse(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out short result)
	{
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return TryParse(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
	private static bool TryParse(string s, NumberStyles style, NumberFormatInfo info, out short result)
	{
		result = 0;
		int i;
		
		if (!Number.TryParseInt32(s, style, info, i))
			return false;
		
		if (style & NumberStyles.AllowHexSpecifier)
		{
			if (i < 0 || i > Byte.MaxValue)
				return false;
			
			result = cast(short)i;
			return true;
		}
		
		if (i < MinValue || i > MaxValue)
			return false;
		
		result = cast(short)i;
		return true;
	}
	
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
		Contract.Ensures(Contract.Result!string() !is null);
		return Number.FormatInt32(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null)
	{
		Contract.Ensures(Contract.Result!string() !is null);
		return ToString(format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, NumberFormatInfo info)
	{
		Contract.Ensures(Contract.Result!string() !is null);
		
		if (_value < 0 && format && format.Length > 0 && (format[0] == 'x' || format[0] == 'X'))
		{
			uint temp = _value & 0xFFFF;
			return Number.FormatInt32(temp, format, info);
		}
		
		return Number.FormatInt32(_value, format, info);
	}

	Object ToType(Type conversionType, IFormatProvider provider = null)
	{
		return Convert.DefaultToType(this, conversionType, provider);
	}
}