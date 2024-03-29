﻿module System._Class.Guid;

import System;


public final class Guid /*: IFormattable, IComparable */{
	public static immutable Guid Empty;// = cast(immutable(Guid))new Guid();

	private enum GuidStyles {
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

	private enum GuidParseThrowStyle {
		None           = 0,
		All            = 1,
		AllButOverflow = 2
	}

	private enum ParseFailureKind {
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


	public this(byte[] b) in {
		if (b is null)
			throw new ArgumentNullException("b");

		if (b.Length != 16)
			throw new ArgumentException(Environment.GetResourceString("Arg_GuidArrayCtor", [String("16")]));
	} body {
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

	public this(uint a, ushort b, ushort c, byte d, byte e, byte f, byte g, byte h, byte i, byte j, byte k) {
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

	public this(int a, short b, short c, byte d, byte e, byte f, byte g, byte h, byte i, byte j, byte k) {
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

	public this(int a, short b, short c, byte[] d) in {
		if (d is null)
			throw new ArgumentNullException("d");

		if (d.Length != 8)
			throw new ArgumentException(Environment.GetResourceString("Arg_GuidArrayCtor", [String("8")]));
	} body {
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

	public this(string g) in {
		if (!g)
			throw new ArgumentNullException("g");
	} body {
		//this = cast(Guid)Guid.Empty;
		//TODO

		GuidResult* result = new GuidResult();
		result.Init(GuidParseThrowStyle.All);
	}

	public static Guid Parse(string input) in {
		if (!input)
			throw new ArgumentNullException("input");
	} body {
		GuidResult* result = new GuidResult();
		result.Init(GuidParseThrowStyle.AllButOverflow);

		if (TryParseGuid(input, GuidStyles.Any, *result))
			return result.parsedGuid;

		throw result.GetGuidParseException();
	}

	public static bool TryParse(string input, out Guid result) {
		GuidResult* parseResult = new GuidResult();
		parseResult.Init(GuidParseThrowStyle.None);

		if (TryParseGuid(input, GuidStyles.Any, *parseResult)) {
			result = parseResult.parsedGuid;
			return true;
		}

		result = cast(Guid)Guid.Empty;
		return false;
	}

	public static Guid ParseExtract(string input, string format) {
		if (!input)
			throw new ArgumentNullException("input");

		if (!format)
			throw new ArgumentNullException("format");

		if (format.Length != 1)
			throw new FormatException(Environment.GetResourceString("Format_InvalidGuidFormatSpecification"));

		GuidStyles style;
		char formatCh = format[0];

		switch (formatCh) {
			case 'D':
			case 'd':
				style = GuidStyles.DigitFormat;
				break;
			case 'N':
			case 'n':
				style = GuidStyles.NumberFormat;
				break;
			case 'B':
			case 'b':
				style = GuidStyles.BraceFormat;
				break;
			case 'P':
			case 'p':
				style = GuidStyles.ParenthesisFormat;
				break;
			case 'X':
			case 'x':
				style = GuidStyles.HexFormat;
				break;
			default:
				throw new FormatException(Environment.GetResourceString("Format_InvalidGuidFormatSpecification"));
		}

		GuidResult* result = new GuidResult();
		result.Init(GuidParseThrowStyle.AllButOverflow);

		if (TryParseGuid(input, style, *result))
			return result.parsedGuid;

		throw result.GetGuidParseException();
	}

	public static bool TryParseExtract(string input, string format, ref Guid result) {
		if (!format || format.Length != 1) {
			result = cast(Guid)Guid.Empty;
			return false;
		}

		GuidStyles style;
		char formatCh = format[0];
		
		switch (formatCh) {
			case 'D':
			case 'd':
				style = GuidStyles.DigitFormat;
				break;
			case 'N':
			case 'n':
				style = GuidStyles.NumberFormat;
				break;
			case 'B':
			case 'b':
				style = GuidStyles.BraceFormat;
				break;
			case 'P':
			case 'p':
				style = GuidStyles.ParenthesisFormat;
				break;
			case 'X':
			case 'x':
				style = GuidStyles.HexFormat;
				break;
			default:
				result = cast(Guid)Guid.Empty;
				return false;
		}

		GuidResult* parseResult = new GuidResult();
		parseResult.Init(GuidParseThrowStyle.None);
		
		if (TryParseGuid(input, style, *parseResult)) {
			result = parseResult.parsedGuid;
			return true;
		}

		result = cast(Guid)Guid.Empty;
		return false;
	}

	private static bool TryParseGuid(string g, GuidStyles flags, ref GuidResult result) {
		if (!g) {
			result.SetFailure(ParseFailureKind.Format, "Format_GuidUnrecognized");
			return false;
		}

		string guidString = g.Trim();
		if (!guidString.Length) {
			result.SetFailure(ParseFailureKind.Format, "Format_GuidUnrecognized");
			return false;
		}

		//TODO

		assert(0);
	}













	private struct GuidResult {
		@internal Guid parsedGuid;
		@internal GuidParseThrowStyle throwStyle;

		@internal ParseFailureKind _failure;
		@internal string _failureMessageID;
		@internal Object _failureMessageFormatArgument;
		@internal string _failureArgumentName;
		@internal Exception _innerException;

		@internal void Init(GuidParseThrowStyle canThrow) {
			parsedGuid = cast(Guid)Guid.Empty;
			throwStyle = canThrow;
		}

		@internal void SetFailure(Exception nativeException) {
			_failure = ParseFailureKind.NativeException;
			_innerException = nativeException;
		}

		@internal void SetFailure(ParseFailureKind failure, string failureMessageID) {
			SetFailure(failure, failureMessageID, null, null, null);
		}

		@internal void SetFailure(ParseFailureKind failure, string failureMessageID, Object failureMessageFormatArgument) {
			SetFailure(failure, failureMessageID, failureMessageFormatArgument, null, null);
		}

		@internal void SetFailure(ParseFailureKind failure, string failureMessageID, Object failureMessageFormatArgument,
		                                 string failureArgumentName, Exception innerException) {
			assert(failure != ParseFailureKind.NativeException, "ParseFailureKind.NativeException should not be used with this overload");
			_failure = failure;
			_failureMessageID = failureMessageID;
			_failureMessageFormatArgument = failureMessageFormatArgument;
			_failureArgumentName = failureArgumentName;
			_innerException = innerException;

			if (throwStyle != GuidParseThrowStyle.None)
				throw GetGuidParseException();
		}

		@internal Exception GetGuidParseException() {
			switch (_failure) {
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
					assert(false, "Unknown GuidParseFailure: TODO"); //TODO
					return new FormatException(Environment.GetResourceString("Format_GuidUnrecognized"));
			}
		}
	}
}