﻿module System._Class.Float;

import System;
import System.Globalization;


public final class Float : IConvertible, IFormattable, IComparable!float, IEquatable!float {
	alias opEquals = Equals;
	alias opCmp = CompareTo;
	public static const float MinValue = -3.40282346638528859e+38;
	public static const float MaxValue = 3.40282346638528859e+38;
	public static const float Epsilon = 1.4e-45;
	public static const float PositiveInfinity = cast(float)1.0 / cast(float)0.0;
	public static const float NegativeInfinity = cast(float)-1.0 / cast(float)0.0;
	public static const float NaN = cast(float)0.0 / cast(float)0.0;

	alias Value this;
	private float _value;
	
	@property float Value() {
		return _value;
	}
	
	@property void Value(float value) {
		_value = value;
	}

	static Float opCall(float value) {
		Float ret = new Float();
		ret._value = value;
		return ret;
	}

	public static float Parse(string s) {
		return Parse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.CurrentInfo);
	}
	
	public static float Parse(string s, NumberStyles style) {
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return Parse(s, style, NumberFormatInfo.CurrentInfo);
	}
	
	public static float Parse(string s, IFormatProvider provider) {
		return Parse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.GetInstance(provider));
	}
	
	public static float Parse(string s, NumberStyles style, IFormatProvider provider) {
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return Parse(s, style, NumberFormatInfo.GetInstance(provider));
	}
	
	private static float Parse(string s, NumberStyles style, NumberFormatInfo info) {
		return Number.ParseFloat(s, style, info);
	}
	
	public static bool TryParse(string s, out float result) {
		return TryParse(s, NumberStyles.Float | NumberStyles.AllowThousands, NumberFormatInfo.CurrentInfo, result);
	}
	
	public static bool TryParse(string s, NumberStyles style, IFormatProvider provider, out float result) {
		NumberFormatInfo.ValidateParseStyleFloatingPoint(style);
		return TryParse(s, style, NumberFormatInfo.GetInstance(provider), result);
	}
	
	private static bool TryParse(string s, NumberStyles style, NumberFormatInfo info, out float result) {
		if (!s) {
			result = 0;
			return false;
		}

		if (Number.TryParseFloat(s, style, info, result)) {
			string trim = s.Trim();
			if (trim == info.PositiveInfinitySymbol)
				result = PositiveInfinity;
			else if (trim == info.NegativeInfinitySymbol)
				result = NegativeInfinity;
			else if (trim == info.NaNSymbol)
				result = NaN;
			else
				return false;
		}

		return true;
	}

	private this() {
	}

	public static bool IsInfinity(float f) {
		return (*cast(int *)(&f) & 0x7FFFFFFF) == 0x7F800000;
	}

	public static bool IsPositiveInfinity(float f) {
		return *cast(int *)(&f) == 0x7F800000;
	}

	public static bool IsNegativeInfinity(float f) {
		return *cast(int *)(&f) == cast(int)0xFF800000;
	}

	public static bool IsNaN(float f) {
		return (*cast(int *)(&f) & 0x7FFFFFFF) > 0x7F800000;
	}

	// Override Objct's methods
	public override int GetHashCode() {
		float f = _value;
		if(!f)
			return 0;

		int v = *cast(int *)(&f);
		return v;
	}

	public override bool Equals(Object obj) {
		if (obj.GetType() != Float.GetType())
			return false;

		float tmp = (cast(Float)obj)._value;
		if (tmp == _value)
			return true;

		return IsNaN(tmp) && IsNaN(_value);
	}

	// Implement interface methods
	public bool Equals(float other) {
		if (_value == other)
			return true;

		return IsNaN(other) && IsNaN(_value);
	}

	public int CompareTo(float value) {
		if (_value < value) return -1;
		if (_value > value) return 1;
		if (_value == value) return 0;

		if (IsNaN(_value))
			return IsNaN(value) ? 0 : -1;
		return 1;
	}

	TypeCode GetTypeCode() {
		return TypeCode.Float;
	}
	
	bool ToBoolean(IFormatProvider provider = null) {
		return Convert.ToBoolean(_value);
	}
	
	char ToChar(IFormatProvider provider = null) {
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Float", "Char"));
	}
	
	byte ToByte(IFormatProvider provider = null) {
		return Convert.ToByte(_value);
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
		return _value;
	}
	
	double ToDouble(IFormatProvider provider = null) {
		return Convert.ToDouble(_value);
	}
	
	real ToReal(IFormatProvider provider = null) {
		return Convert.ToReal(_value);
	}
	
	DateTime ToDateTime(IFormatProvider provider = null) {
		throw new InvalidCastException(Environment.GetResourceString("InvalidCast_FromTo", "Float", "DateTime"));
	}
	
	string ToString(IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatFloat(_value, null, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	string ToString(string format, IFormatProvider provider = null) out (result) {
		assert(result);
	} body {
		return Number.FormatFloat(_value, format, provider ? NumberFormatInfo.GetInstance(provider) : NumberFormatInfo.CurrentInfo);
	}
	
	Object ToType(Type conversionType, IFormatProvider provider = null) {
		return Convert.DefaultToType(this, conversionType, provider);
	}
}