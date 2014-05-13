module System._Class.Convert;

import System;
import system = System._Class.DBNull;


public enum Base64FormattingOptions
{
	None             = 0,
	InsertLineBreaks = 1
}


public static class Convert
{
	public static immutable Object DBNull = system.DBNull.Value;


	public static TypeCode GetTypeCode(Object value)
	{
		if (value is null)
			return TypeCode.Empty;

		IConvertible tmp = cast(IConvertible)value;
		if (tmp !is null)
			return tmp.GetTypeCode();

		return TypeCode.Object;
	}

	public static IsDBNull(Object value)
	{
		if (value is DBNull)
			return true;

		IConvertible conv = cast(IConvertible)value;
		if (conv !is null)
			return conv.GetTypeCode() == TypeCode.DBNull;

		return false;
	}

	//change type...
	//change type...
	//default to type
	//change type...
	//change type...


	// Conversions to Boolean

	public static bool ToBoolean(Object value, IFormatProvider provider = null)
	{
		return value is null ? false : (cast(IConvertible)value).ToBoolean(provider);
	}

	public static bool ToBoolean(bool value)
	{
		return value;
	}

	public static bool ToBoolean(char value)
	{
		return value != 0;
	}

	public static bool ToBoolean(byte value)
	{
		return value != 0;
	}

	public static bool ToBoolean(ubyte value)
	{
		return value != 0;
	}

	public static bool ToBoolean(short value)
	{
		return value != 0;
	}

	public static bool ToBoolean(ushort value)
	{
		return value != 0;
	}

	public static bool ToBoolean(int value)
	{
		return value != 0;
	}

	public static bool ToBoolean(uint value)
	{
		return value != 0;
	}

	public static bool ToBoolean(long value)
	{
		return value != 0;
	}

	public static bool ToBoolean(ulong value)
	{
		return value != 0;
	}

	public static bool ToBoolean(float value)
	{
		return value != 0;
	}

	public static bool ToBoolean(double value)
	{
		return value != 0;
	}

	public static bool ToBoolean(real value)
	{
		return value != 0;
	}

	public static bool ToBoolean(DateTime value)
	{
		if (value is null)
			return false; 
		
		return true; //TODO: (cast(IConvertible)value).ToBoolean(null);
	}

	public static bool ToBoolean(string value)
	{
		if (value is null)
			return false;
		
		return true; //TODO: Boolean.Parse(value);
	}


	// Conversions to Char

	public static char ToChar(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToChar(provider);
	}

	public static char ToChar(bool value)
	{
		return Boolean(value).ToChar();
	}

	public static char ToChar(char value)
	{
		return value;
	}

	public static char ToChar(byte value)
	{
		if (value < Char.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Char"));

		Contract.EndContractBlock();
		return value;
	}

	public static char ToChar(ubyte value)
	{
		return value;
	}

	public static char ToChar(short value)
	{
		if (value < Char.MinValue || value > Char.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Char"));
		
		Contract.EndContractBlock();
		return cast(char)value;
	}

	public static char ToChar(ushort value)
	{
		if (value > Char.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Char"));
		
		Contract.EndContractBlock();
		return cast(char)value;
	}

	public static char ToChar(int value)
	{
		if (value < Char.MinValue || value > Char.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Char"));
		
		Contract.EndContractBlock();
		return cast(char)value;
	}
	
	public static char ToChar(uint value)
	{
		if (value > Char.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Char"));
		
		Contract.EndContractBlock();
		return cast(char)value;
	}

	public static char ToChar(long value)
	{
		if (value < Char.MinValue || value > Char.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Char"));
		
		Contract.EndContractBlock();
		return cast(char)value;
	}
	
	public static char ToChar(ulong value)
	{
		if (value > Char.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Char"));
		
		Contract.EndContractBlock();
		return cast(char)value;
	}

	public static char ToChar(string value, IFormatProvider provider)
	{
		if (!value)
			throw new ArgumentNullException("value");
		
		Contract.EndContractBlock();

		if (String(value).Length != 1)
			throw new FormatException(Environment.GetResourceString("TODO")); //TODO

		return value[0];
	}

	public static char ToChar(float value)
	{
		return Float(value).ToChar();
	}

	public static char ToChar(double value)
	{
		return Double(value).ToChar();
	}

	public static char ToChar(real value)
	{
		return Real(value).ToChar();
	}

	public static char ToChar(DateTime value)
	{
		return (cast(IConvertible)value).ToChar();
	}


	// Conversions to Byte

	public static byte ToByte(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToByte(provider);
	}

	public static byte ToByte(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}

	public static byte ToByte(char value)
	{
		if (value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return cast(byte)value;
	}
	
	public static byte ToByte(byte value)
	{
		return value;
	}
	
	public static byte ToByte(ubyte value)
	{
		if (value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return value;
	}
	
	public static byte ToByte(short value)
	{
		if (value < Byte.MinValue || value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return cast(byte)value;
	}
	
	public static byte ToByte(ushort value)
	{
		if (value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return cast(byte)value;
	}
	
	public static byte ToByte(int value)
	{
		if (value < Byte.MinValue || value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return cast(byte)value;
	}
	
	public static byte ToByte(uint value)
	{
		if (value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return cast(byte)value;
	}
	
	public static byte ToByte(long value)
	{
		if (value < Byte.MinValue || value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return cast(byte)value;
	}
	
	public static byte ToByte(ulong value)
	{
		if (value > Byte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Byte"));
		
		Contract.EndContractBlock();
		return cast(byte)value;
	}
	
	public static byte ToByte(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static byte ToByte(float value)
	{
		return ToByte(cast(double)value);
	}
	
	public static byte ToByte(double value)
	{
		return ToByte(ToInt32(value));
	}

	public static byte ToByte(real value)
	{
		return 0; //TODO
	}
	
	public static byte ToByte(DateTime value)
	{
		return (cast(IConvertible)value).ToByte();
	}


	// Conversions to UByte

	public static ubyte ToUByte(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToUByte(provider);
	}
	
	public static ubyte ToUByte(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static ubyte ToUByte(char value)
	{
		if (value > UByte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return cast(ubyte)value;
	}
	
	public static ubyte ToUByte(byte value)
	{
		if (value < UByte.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return value;
	}

	public static ubyte ToUByte(ubyte value)
	{
		return value;
	}
	
	public static ubyte ToUByte(short value)
	{
		if (value < UByte.MinValue || value > UByte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return cast(ubyte)value;
	}
	
	public static ubyte ToUByte(ushort value)
	{
		if (value > UByte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return cast(ubyte)value;
	}
	
	public static ubyte ToUByte(int value)
	{
		if (value < UByte.MinValue || value > UByte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return cast(ubyte)value;
	}
	
	public static ubyte ToUByte(uint value)
	{
		if (value > UByte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return cast(ubyte)value;
	}
	
	public static ubyte ToUByte(long value)
	{
		if (value < UByte.MinValue || value > UByte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return cast(ubyte)value;
	}
	
	public static ubyte ToUByte(ulong value)
	{
		if (value > UByte.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UByte"));
		
		Contract.EndContractBlock();
		return cast(ubyte)value;
	}
	
	public static ubyte ToUByte(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return 1; //TODO parse
	}
	
	public static ubyte ToUByte(float value)
	{
		return ToUByte(cast(double)value);
	}
	
	public static ubyte ToUByte(double value)
	{
		return ToUByte(ToInt32(value));
	}
	
	public static ubyte ToUByte(real value)
	{
		return 0; //TODO
	}
	
	public static ubyte ToUByte(DateTime value)
	{
		return (cast(IConvertible)value).ToUByte();
	}


	// Conversions to Int16

	public static short ToInt16(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToInt16(provider);
	}
	
	public static short ToInt16(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static short ToInt16(char value)
	{
		return cast(short)value;
	}
	
	public static short ToInt16(byte value)
	{
		return value;
	}
	
	public static short ToInt16(ubyte value)
	{
		return value;
	}
	
	public static short ToInt16(short value)
	{
		return value;
	}
	
	public static short ToInt16(ushort value)
	{
		if (value > Int16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int16"));
		
		Contract.EndContractBlock();
		return cast(short)value;
	}
	
	public static short ToInt16(int value)
	{
		if (value < Int16.MinValue || value > Int16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int16"));
		
		Contract.EndContractBlock();
		return cast(short)value;
	}
	
	public static short ToInt16(uint value)
	{
		if (value > Int16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int16"));
		
		Contract.EndContractBlock();
		return cast(short)value;
	}
	
	public static short ToInt16(long value)
	{
		if (value < Int16.MinValue || value > Int16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int16"));
		
		Contract.EndContractBlock();
		return cast(short)value;
	}
	
	public static short ToInt16(ulong value)
	{
		if (value > Int16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int16"));
		
		Contract.EndContractBlock();
		return cast(short)value;
	}
	
	public static short ToInt16(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static short ToInt16(float value)
	{
		return ToInt16(cast(double)value);
	}
	
	public static short ToInt16(double value)
	{
		return ToInt16(ToInt32(value));
	}
	
	public static short ToInt16(real value)
	{
		return 0; //TODO
	}
	
	public static short ToInt16(DateTime value)
	{
		return (cast(IConvertible)value).ToInt16();
	}


	// Conversions to UInt16

	public static ushort ToUInt16(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToUInt16(provider);
	}
	
	public static ushort ToUInt16(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static ushort ToUInt16(char value)
	{
		return cast(ushort)value;
	}
	
	public static ushort ToUInt16(byte value)
	{
		if (value < UInt16.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"));
		
		Contract.EndContractBlock();
		return value;
	}

	public static ushort ToUInt16(ubyte value)
	{
		return value;
	}
	
	public static ushort ToUInt16(short value)
	{
		if (value < UInt16.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"));
		
		Contract.EndContractBlock();
		return cast(ushort)value;
	}
	
	public static ushort ToUInt16(ushort value)
	{
		return value;
	}
	
	public static ushort ToUInt16(int value)
	{
		if (value < UInt16.MinValue || value > UInt16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"));
		
		Contract.EndContractBlock();
		return cast(ushort)value;
	}
	
	public static ushort ToUInt16(uint value)
	{
		if (value > UInt16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"));
		
		Contract.EndContractBlock();
		return cast(ushort)value;
	}
	
	public static ushort ToUInt16(long value)
	{
		if (value < UInt16.MinValue || value > UInt16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"));
		
		Contract.EndContractBlock();
		return cast(ushort)value;
	}
	
	public static ushort ToUInt16(ulong value)
	{
		if (value > UInt16.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt16"));
		
		Contract.EndContractBlock();
		return cast(ushort)value;
	}
	
	public static ushort ToUInt16(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return 1; //TODO parse
	}
	
	public static ushort ToUInt16(float value)
	{
		return ToUInt16(cast(double)value);
	}
	
	public static ushort ToUInt16(double value)
	{
		return ToUInt16(ToInt32(value));
	}
	
	public static ushort ToUInt16(real value)
	{
		return 0; //TODO
	}
	
	public static ushort ToUInt16(DateTime value)
	{
		return (cast(IConvertible)value).ToUInt16();
	}


	// Conversions to Int32

	public static int ToInt32(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToInt32(provider);
	}
	
	public static int ToInt32(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static int ToInt32(char value)
	{
		return value;
	}
	
	public static int ToInt32(byte value)
	{
		return value;
	}
	
	public static int ToInt32(ubyte value)
	{
		return value;
	}
	
	public static int ToInt32(short value)
	{
		return cast(int)value;
	}
	
	public static int ToInt32(ushort value)
	{
		return cast(int)value;
	}
	
	public static int ToInt32(int value)
	{
		return cast(int)value;
	}
	
	public static int ToInt32(uint value)
	{
		if (value > Int32.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int32"));
		
		Contract.EndContractBlock();
		return cast(int)value;
	}
	
	public static int ToInt32(long value)
	{
		if (value < Int32.MinValue || value > Int32.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int32"));
		
		Contract.EndContractBlock();
		return cast(int)value;
	}
	
	public static int ToInt32(ulong value)
	{
		if (value > Int32.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int32"));
		
		Contract.EndContractBlock();
		return cast(int)value;
	}
	
	public static int ToInt32(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static int ToInt32(float value)
	{
		return ToInt32(cast(double)value);
	}
	
	public static int ToInt32(double value)
	{
		if (value >= 0)
		{
			if (value < 2147483647.5)
			{
				int result = cast(int)value;
				double dif = value - result;

				if (dif > 0.5 || dif == 0.5 && (result & 1))
					result++;

				return result;
			}
		}
		else
		{
			if (value >= -2147483647.5)
			{
				int result = cast(int)value;
				double dif = value - result;
				
				if (dif < -0.5 || dif == -0.5 && (result & 1))
					result--;
				
				return result;
			}
		}

		throw new OverflowException(Environment.GetResourceString("Overflow_Int32"));
	}
	
	public static int ToInt32(real value)
	{
		return 0; //TODO
	}
	
	public static int ToInt32(DateTime value)
	{
		return (cast(IConvertible)value).ToInt32();
	}


	// Conversions to UInt32

	public static uint ToUInt32(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToUInt32(provider);
	}
	
	public static uint ToUInt32(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static uint ToUInt32(char value)
	{
		return value;
	}
	
	public static uint ToUInt32(byte value)
	{
		if (value < UInt32.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt32"));
		
		Contract.EndContractBlock();
		return value;
	}

	public static uint ToUInt32(ubyte value)
	{
		return value;
	}
	
	public static uint ToUInt32(short value)
	{
		if (value < UInt32.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt32"));
		
		Contract.EndContractBlock();
		return value;
	}
	
	public static uint ToUInt32(ushort value)
	{
		return value;
	}
	
	public static uint ToUInt32(int value)
	{
		if (value < UInt32.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt32"));
		
		Contract.EndContractBlock();
		return value;
	}
	
	public static uint ToUInt32(uint value)
	{
		return value;
	}
	
	public static uint ToUInt32(long value)
	{
		if (value < UInt32.MinValue || value > UInt32.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt32"));
		
		Contract.EndContractBlock();
		return cast(uint)value;
	}
	
	public static uint ToUInt32(ulong value)
	{
		if (value > UInt32.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt32"));
		
		Contract.EndContractBlock();
		return cast(uint)value;
	}
	
	public static uint ToUInt32(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static uint ToUInt32(float value)
	{
		return ToUInt32(cast(double)value);
	}
	
	public static uint ToUInt32(double value)
	{
		if (value >= -0.5 && value < 4294967295.5)
		{
			int result = cast(int)value;
			double dif = value - result;
			
			if (dif > 0.5 || dif == 0.5 && (result & 1))
				result++;
			
			return result;
		}
		
		throw new OverflowException(Environment.GetResourceString("Overflow_Int32"));
	}
	
	public static uint ToUInt32(real value)
	{
		return 0; //TODO
	}
	
	public static uint ToUInt32(DateTime value)
	{
		return (cast(IConvertible)value).ToUInt32();
	}


	// Conversions for Int64

	public static long ToInt64(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToInt64(provider);
	}
	
	public static long ToInt64(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static long ToInt64(char value)
	{
		return value;
	}
	
	public static long ToInt64(byte value)
	{
		return value;
	}
	
	public static long ToInt64(ubyte value)
	{
		return value;
	}
	
	public static long ToInt64(short value)
	{
		return value;
	}
	
	public static long ToInt64(ushort value)
	{
		return value;
	}
	
	public static long ToInt64(int value)
	{
		return value;
	}
	
	public static long ToInt64(uint value)
	{
		return value;
	}
	
	public static long ToInt64(long value)
	{
		return value;
	}
	
	public static long ToInt64(ulong value)
	{
		if (value > Int64.MaxValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_Int64"));
		
		Contract.EndContractBlock();
		return cast(long)value;
	}
	
	public static long ToInt64(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static long ToInt64(float value)
	{
		return ToInt64(cast(double)value);
	}
	
	public static long ToInt64(double value)
	{
		return 0; //TODO
	}
	
	public static long ToInt64(real value)
	{
		return 0; //TODO
	}
	
	public static long ToInt64(DateTime value)
	{
		return (cast(IConvertible)value).ToInt64();
	}


	// Conversions to UInt64

	public static ulong ToUInt64(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToUInt64(provider);
	}
	
	public static ulong ToUInt64(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static ulong ToUInt64(char value)
	{
		return value;
	}
	
	public static ulong ToUInt64(byte value)
	{
		if (value < UInt64.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt64"));
		
		Contract.EndContractBlock();
		return value;
	}

	public static ulong ToUInt64(ubyte value)
	{
		return value;
	}
	
	public static ulong ToUInt64(short value)
	{
		if (value < UInt64.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt64"));
		
		Contract.EndContractBlock();
		return cast(ulong)value;
	}
	
	public static ulong ToUInt64(ushort value)
	{
		return value;
	}
	
	public static ulong ToUInt64(int value)
	{
		if (value < UInt64.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt64"));
		
		Contract.EndContractBlock();
		return cast(ulong)value;
	}
	
	public static ulong ToUInt64(uint value)
	{
		return value;
	}
	
	public static ulong ToUInt64(long value)
	{
		if (value < UInt64.MinValue)
			throw new OverflowException(Environment.GetResourceString("Overflow_UInt64"));
		
		Contract.EndContractBlock();
		return cast(ulong)value;
	}
	
	public static ulong ToUInt64(ulong value)
	{
		return value;
	}
	
	public static ulong ToUInt64(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static ulong ToUInt64(float value)
	{
		return ToUInt64(cast(double)value);
	}
	
	public static ulong ToUInt64(double value)
	{
		return 0; //TODO
	}
	
	public static ulong ToUInt64(real value)
	{
		return 0; //TODO
	}
	
	public static ulong ToUInt64(DateTime value)
	{
		return (cast(IConvertible)value).ToUInt64();
	}


	// conversions to Float

	public static float ToFloat(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToFloat(provider);
	}
	
	public static float ToFloat(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static float ToFloat(char value)
	{
		return Char(value).ToFloat();
	}
	
	public static float ToFloat(byte value)
	{
		return value;
	}
	
	public static float ToFloat(ubyte value)
	{
		return value;
	}
	
	public static float ToFloat(short value)
	{
		return value;
	}
	
	public static float ToFloat(ushort value)
	{
		return value;
	}
	
	public static float ToFloat(int value)
	{
		return value;
	}
	
	public static float ToFloat(uint value)
	{
		return value;
	}
	
	public static float ToFloat(long value)
	{
		return value;
	}
	
	public static float ToFloat(ulong value)
	{
		return value;
	}
	
	public static float ToFloat(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static float ToFloat(float value)
	{
		return value;
	}
	
	public static float ToFloat(double value)
	{
		return cast(float)value;
	}
	
	public static float ToFloat(real value)
	{
		return cast(float)value;
	}
	
	public static float ToFloat(DateTime value)
	{
		return (cast(IConvertible)value).ToFloat();
	}


	// Conversions to Double

	public static double ToDouble(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToDouble(provider);
	}
	
	public static double ToDouble(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static double ToDouble(char value)
	{
		return Char(value).ToDouble();
	}
	
	public static double ToDouble(byte value)
	{
		return value;
	}
	
	public static double ToDouble(ubyte value)
	{
		return value;
	}
	
	public static double ToDouble(short value)
	{
		return value;
	}
	
	public static double ToDouble(ushort value)
	{
		return value;
	}
	
	public static double ToDouble(int value)
	{
		return value;
	}
	
	public static double ToDouble(uint value)
	{
		return value;
	}
	
	public static double ToDouble(long value)
	{
		return value;
	}
	
	public static double ToDouble(ulong value)
	{
		return value;
	}
	
	public static double ToDouble(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static double ToDouble(float value)
	{
		return value;
	}
	
	public static double ToDouble(double value)
	{
		return value;
	}
	
	public static double ToDouble(real value)
	{
		return cast(double)value;
	}
	
	public static double ToDouble(DateTime value)
	{
		return (cast(IConvertible)value).ToDouble();
	}


	// Conversion to Real

	public static real ToReal(Object value, IFormatProvider provider = null)
	{
		return value is null ? 0 : (cast(IConvertible)value).ToReal(provider);
	}
	
	public static real ToReal(bool value)
	{
		return value ? Boolean.True : Boolean.False;
	}
	
	public static real ToReal(char value)
	{
		return Char(value).ToReal();
	}
	
	public static real ToReal(byte value)
	{
		return value;
	}
	
	public static real ToReal(ubyte value)
	{
		return value;
	}
	
	public static real ToReal(short value)
	{
		return value;
	}
	
	public static real ToReal(ushort value)
	{
		return value;
	}
	
	public static real ToReal(int value)
	{
		return value;
	}
	
	public static real ToReal(uint value)
	{
		return value;
	}
	
	public static real ToReal(long value)
	{
		return value;
	}
	
	public static real ToReal(ulong value)
	{
		return value;
	}
	
	public static real ToReal(string value, IFormatProvider provider)
	{
		if (!value)
			return 0;
		
		return -1; //TODO parse
	}
	
	public static real ToReal(float value)
	{
		return value;
	}
	
	public static real ToReal(double value)
	{
		return value;
	}
	
	public static real ToReal(real value)
	{
		return value;
	}
	
	public static real ToReal(DateTime value)
	{
		return (cast(IConvertible)value).ToReal();
	}


	//DateTime, String, este nejake dalsie picoviny
}