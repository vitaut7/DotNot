module System._Class.Guid;

import System;


public final class Guid //: IFormattable, IComparable
{
	public static immutable Guid Empty;// = cast(immutable(Guid))new Guid();

	private enum GuidStyles
	{
		None               = 0x00000000, 
		AllowParenthesis   = 0x00000001,
		AllowBraces        = 0x00000002,
		AllowDashes        = 0x00000004,
		AllowHexPrefix     = 0x00000008,
		RequireParenthesis = 0x00000010,
		RequireBraces      = 0x00000020,
		RequireDashes      = 0x00000040,
		RequireHexPrefix   = 0x00000080,
		
		HexFormat          = RequireBraces | RequireHexPrefix,
		NumberFormat       = None,
		DigitFormat        = RequireDashes,
		BraceFormat        = RequireBraces | RequireDashes,
		ParenthesisFormat  = RequireParenthesis | RequireDashes,
		
		Any                = AllowParenthesis | AllowBraces | AllowDashes | AllowHexPrefix
	}

	private enum GuidParseThrowStyle
	{
		None           = 0,
		All            = 1,
		AllButOverflow = 2
	}

	private enum ParseFailureKind
	{
		None                     = 0,
		ArgumentNull             = 1,
		Format                   = 2,
		FormatWithParameter      = 3,
		NativeException          = 4,
		FormatWithInnerException = 5
	}

	private int   _a;
	private short _b;
	private short _c;
	private byte  _d;
	private byte  _e;
	private byte  _f;
	private byte  _g;
	private byte  _h;
	private byte  _i;
	private byte  _j;
	private byte  _k;


	public this(byte[] b)
	{
		if (b is null)
			throw new ArgumentNullException("b");

		if (b.Length != 16)
			throw new ArgumentException(Environment.GetResourceString("Arg_GuidArrayCtor", [String("16")]));
		Contract.EndContractBlock();

		_a = (cast(int)b[3] << 24) | (cast(int)b[2] << 16) | (cast(int)b[1] << 8) | b[0];
		_b = cast(short)((cast(int)b[5] << 8) | b[4]);
		_c = cast(short)((cast(int)b[7] << 8) | b[6]);
		_d = b[8];
		_e = b[9];
		_f = b[10];
		_g = b[11];
		_h = b[12];
		_i = b[13];
		_j = b[14];
		_k = b[15];
	}

	public this(uint a, ushort b, ushort c, byte d, byte e, byte f, byte g, byte h, byte i, byte j, byte k)
	{
		_a = cast(int)a;
		_b = cast(short)b;
		_c = cast(short)c;
		_d = d;
		_e = e;
		_f = f;
		_g = g;
		_h = h;
		_i = i;
		_j = j;
		_k = k;
	}

	public this(int a, short b, short c, byte d, byte e, byte f, byte g, byte h, byte i, byte j, byte k)
	{
		_a = a;
		_b = b;
		_c = c;
		_d = d;
		_e = e;
		_f = f;
		_g = g;
		_h = h;
		_i = i;
		_j = j;
		_k = k;
	}

	public this(int a, short b, short c, byte[] d)
	{
		if (d is null)
			throw new ArgumentNullException("d");

		if (d.Length != 8)
			throw new ArgumentException(Environment.GetResourceString("Arg_GuidArrayCtor", [String("8")]));
		Contract.EndContractBlock();

		_a  = a;
		_b  = b;
		_c  = c;
		_d = d[0];
		_e = d[1];
		_f = d[2];
		_g = d[3];
		_h = d[4];
		_i = d[5];
		_j = d[6];
		_k = d[7];
	}



	private struct GuidResult
	{
		@internal public Guid parsedGuid;
		@internal public GuidParseThrowStyle throwStyle;

		@internal public ParseFailureKind _failure;
		@internal public string _failureMessageID;
		@internal public Object _failureMessageFormatArgument;
		@internal public string _failureArgumentName;
		@internal public Exception _innerException;

		@internal public void Init(GuidParseThrowStyle canThrow)
		{
			parsedGuid = cast(Guid)Guid.Empty;
			throwStyle = canThrow;
		}

		@internal public void SetFailure(Exception nativeException)
		{
			_failure = ParseFailureKind.NativeException;
			_innerException = nativeException;
		}

		@internal public void SetFailure(ParseFailureKind failure, string failureMessageID)
		{
			SetFailure(failure, failureMessageID, null, null, null);
		}

		@internal public void SetFailure(ParseFailureKind failure, string failureMessageID, Object failureMessageFormatArgument)
		{
			SetFailure(failure, failureMessageID, failureMessageFormatArgument, null, null);
		}

		@internal public void SetFailure(ParseFailureKind failure, string failureMessageID, Object failureMessageFormatArgument,
		                                 string failureArgumentName, Exception innerException)
		{
			Contract.Assert(failure != ParseFailureKind.NativeException, "ParseFailureKind.NativeException should not be used with this overload");
			_failure = failure;
			_failureMessageID = failureMessageID;
			_failureMessageFormatArgument = failureMessageFormatArgument;
			_failureArgumentName = failureArgumentName;
			_innerException = innerException;

			if (throwStyle != GuidParseThrowStyle.None)
				throw GetGuidParseException();
		}

		@internal public Exception GetGuidParseException()
		{
			switch (_failure)
			{
				case ParseFailureKind.ArgumentNull:
					return new ArgumentNullException(_failureArgumentName, Environment.GetResourceString(_failureMessageID));
					
				case ParseFailureKind.FormatWithInnerException:
					return new FormatException(Environment.GetResourceString(_failureMessageID), _innerException);
					
				case ParseFailureKind.FormatWithParameter:
					return new FormatException(Environment.GetResourceString(_failureMessageID, [_failureMessageFormatArgument]));
					
				case ParseFailureKind.Format:
					return new FormatException(Environment.GetResourceString(_failureMessageID));
					
				case ParseFailureKind.NativeException:
					return _innerException;
					
				default:
					Contract.Assert(false, "Unknown GuidParseFailure: TODO"); //TODO
					return new FormatException(Environment.GetResourceString("Format_GuidUnrecognized"));
			}
		}
	}
}