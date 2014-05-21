module System._Interface.IConvertible;

import System;


public interface IConvertible {
	TypeCode GetTypeCode();

	bool ToBoolean(IFormatProvider provider = null);
	char ToChar(IFormatProvider provider = null);
	byte ToByte(IFormatProvider provider = null);
	ubyte ToUByte(IFormatProvider provider = null);
	short ToInt16(IFormatProvider provider = null);
	ushort ToUInt16(IFormatProvider provider = null);
	int ToInt32(IFormatProvider provider = null);
	uint ToUInt32(IFormatProvider provider = null);
	long ToInt64(IFormatProvider provider = null);
	ulong ToUInt64(IFormatProvider provider = null);
	float ToFloat(IFormatProvider provider = null);
	double ToDouble(IFormatProvider provider = null);
	real ToReal(IFormatProvider provider = null);
	DateTime ToDateTime(IFormatProvider provider = null);
	string ToString(IFormatProvider provider = null);
	Object ToType(Type conversionType, IFormatProvider provider = null);
}