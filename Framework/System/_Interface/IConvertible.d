module System._Interface.IConvertible;

import System;


public interface IConvertible
{
	TypeCode GetTypeCode();
	bool ToBoolean(IFormatProvider provider);
	char ToChar(IFormatProvider provider);
	DateTime ToDateTime(IFormatProvider provider);
	string ToString(IFormatProvider provider);
	Object ToType(Type conversionType, IFormatProvider provider);

	byte ToByte(IFormatProvider provider);
	short ToInt16(IFormatProvider provider);
	int ToInt32(IFormatProvider provider);
	long ToInt64(IFormatProvider provider);

	ubyte ToUByte(IFormatProvider provider);
	ushort ToUInt16(IFormatProvider provider);
	uint ToUInt32(IFormatProvider provider);
	ulong ToUInt64(IFormatProvider provider);

	float ToFloat(IFormatProvider provider);
	double ToDouble(IFormatProvider provider);
	real ToReal(IFormatProvider provider);
}