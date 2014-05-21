module System._Class.Byte;

import System;
import System.Globalization;


public final class Byte : IConvertible, IComparable!byte, IEquatable!byte {
	alias opEquals = Equals;
	alias opCmp = CompareTo;
	public static const MaxValue = cast(byte)0x7F;
	public static const MinValue = cast(byte)0x80;

	alias Value this;
	private byte _value;

	@property byte Value() {
		return _value;
	}
	
	@property void Value(byte value) {
		_value = value;
	}

	static Byte opCall(byte value) {
		Byte ret = new Byte();
		ret._value = value;
		return ret;
	}

	public static byte Parse(string s) {
		return Parse(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo);
	}

	public static byte Parse(string s, NumberStyles style) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Parse(s, style, NumberFormatInfo.CurrentInfo);
	}

	public static byte Parse(string s, IFormatProvider provider) {
		return Parse(s, NumberStyles.Integer, NumberFormatInfo.GetInstance(provider));
	}

	public static byte Parse(string s, NumberStyles style, IFormatProvider provider) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return Parse(s, style, NumberFormatInfo.GetInstance(provider));
	}

	private static byte Parse(string s, NumberStyles style, NumberFormatInfo info) {
		int i;

		try {
			i = Number.ParseInt32(s, style, info);
		}
		catch (OverflowException e) {
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"), e);
		}

		if (style & NumberStyles.AllowHexSpecifier) {
			if (i < 0 || i > Byte.MaxValue)
				throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
			return cast(byte)i;
		}

		if (i < MinValue || i > MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));

		return cast(byte)i;
	}

	public static bool TryParse(string s, out byte result) {
		return TryParse(s, NumberStyles.Integer, NumberFormatInfo.CurrentInfo, result);
	}

	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out byte result) {
		NumberFormatInfo.ValidateParseStyleInteger(style);
		return TryParse(s, style, NumberFormatInfo.GetInstance(provider), result);
	}

	private static bool TryParse(string s, NumberStyles style, NumberFormatInfo info, out byte result) {
		result = 0;
		int i;

		if (!Number.TryParseInt32(s, style, info, i))
			return false;

		if (style & NumberStyles.AllowHexSpecifier) {
			if (i < 0 || i > Byte.MaxValue)
				return false;
			
			result = cast(byte)i;
			return true;
		}
		
		if (i < MinValue || i > MaxValue)
			return false;
		
		result = cast(byte)i;
		return true;
	}

	private this() {
	}

	// Override Objct's methods
	public override int GetHashCode() {
		return (cast(int)_value ^ cast(int)_value << 8);
	}
	
	public override bool Equals(Object obj) {
		if (obj.GetType() != Byte.GetType())
			return false;

		return (cast(Byte)obj)._value == _value;
	}
	
	// Implement interface methods
	public bool Equals(byte other) {
		return _value == other;
	}
	
	public int CompareTo(byte value) {
		return _value - value;
	}

	TypeCode GetTypeCode() {
		return TypeCode.Byte;
	}
	
	bool ToBoolean(IFormatProvider provider = null) {
		return Convert.ToBoolean(_value);
	}
	
	char ToChar(IFormatProvider provider = null) {
		return Convert.ToChar(_value);
	}
	
	byte ToByte(IFormatProvider provider = null) {
		return _value;
	}
	
	ubyte ToUByte(IFormatProvider provider = null) {
		return Convert.ToUByte(_value);
	}
	
	short ToInt16(IFormatProvider provider = null) {
		return Convert.ToInt16(_value);
	}
	
	ushort ToUInt16(IFormatProvider provider = null) {
		return Convert.ToUInt16(_value);
	}
	
	int ToInt32(IFormatProvider provider = null) {
		return Convert.ToInt32(_value);
	}
	
	uint ToUInt32(IFormatProvider provider = null) {
		return Convert.ToUInt32(_value);
	}
	
	long ToInt64(IFormatProvider provider = null) {
		return Convert.ToInt64(_value);
	}
	
	ulong ToUInt64(IFormatProvider provider = null) {
		return Convert.ToUInt64(_value);
	}
	
	float ToFloat(IFormatProvider provider = null) {
		return Convert.ToFloat(_value);
	}
	
	double ToDouble(IFormatProvider provider = null) {
		return Convert.ToDouble(_value);
	}
	
	real ToReal(IFormatProvider provider = null) {
		return Convert.ToReal(_value);
	}
	
	DateTime ToDateTime(IFormatProvider provider = null) {
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Byte", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatInt32(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}

	string ToString(string format, IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return ToString(format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}

	string ToString(string format, NumberFormatInfo info) out (result) {
		assert(result);
	} body {
		if (_value < 0 && format && format.Length > 0 && (format[0] == 'x' || format[0] == 'X')) {
			uint temp = _value & 0xFF;
			return Number.FormatInt32(temp, format, info);
		}

		return Number.FormatInt32(_value, format, info);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null) {
		return Convert.DefaultToType(this, conversionType, provider);
	}
}