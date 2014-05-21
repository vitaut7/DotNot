module System._Class.Version;

import System;
import System.Globalization;


public class Version : ICloneable, IComparable!Version, IEquatable!Version {
	alias opEquals = Equals;
	alias opCmp = CompareTo;
	private int _major;
	private int _minor;
	private int _build = -1;
	private int _revision = -1;

	@property public int Major() {
		return _major;
	}

	@property public int Minor() {
		return _minor;
	}

	@property public int Build() {
		return _build;
	}

	@property public int Revision() {
		return _revision;
	}

	@property public short MajorRevision() {
		return _revision >> 16;
	}

	@property public short MinorRevision() {
		return cast(short)(_revision & 0xFFFF);
	}

	public this(int major, int minor, int build = -1, int revision = -1) {
		if (major < 0)
			throw new ArgumentOutOfRangeException("major", Environment.GetResourceString("ArgumentOutOfRange_Version"));

		if (minor < 0)
			throw new ArgumentOutOfRangeException("minor", Environment.GetResourceString("ArgumentOutOfRange_Version"));

		if (build < -1)
			throw new ArgumentOutOfRangeException("build", Environment.GetResourceString("ArgumentOutOfRange_Version"));

		if (revision < -1)
			throw new ArgumentOutOfRangeException("revision", Environment.GetResourceString("ArgumentOutOfRange_Version"));
		Contract.EndContractBlock();

		_major = major;
		_minor = minor;
		_build = build;
		_revision = revision;
	}

	public this(string ver) {
		Version v = Version.Parse(ver);
		_major = v._major;
		_minor = v._minor;
		_build = v._build;
		_revision = v._revision;
	}

	public this() {
		_major = 0;
		_minor = 0;
	}

	public Object Clone() {
		Version v = new Version();
		v._major = _major;
		v._minor = _minor;
		v._build = _build;
		v._revision = v._revision;

		return v;
	}

	public int CompareTo(Version value) {
		if (value is null)
			return 1;

		if (_major > value._major)
			return 1;
		else if (_major < value._major)
			return -1;

		if (_minor > value._minor)
			return 1;
		else if (_minor < value._minor)
			return -1;

		if (_build > value._build)
			return 1;
		else if (_build < value._build)
			return -1;

		if (_revision > value._revision)
			return 1;
		else if (_revision < value._revision)
			return -1;

		return 0;
	}

	public override bool Equals(Object obj) {
		Version v = cast(Version)obj;
		if (v is null)
			return false;

		return _major == v._major && _minor == v._minor && _build == v._build && _revision == v._revision;
	}

	public bool Equals(Version obj) {
		if (obj is null)
			return false;

		return _major == obj._major && _minor == obj._minor && _build == obj._build && _revision == obj._revision;
	}

	public override int GetHashCode() {
		return _revision << 24 | _build << 16 | _minor << 8 | _major;
	}

	public override string ToString() {
		if (_build == -1)
			return ToString(2);

		if (_revision == -1)
			return ToString(3);

		return ToString(4);
	}

	public string ToString(int fieldCount) {
		switch (fieldCount) {
			case 0:
				return String.Empty;
			case 1:
				return _major.ToString();
			case 2:
				return _major.ToString() ~ '.' ~ _minor.ToString();
			default:
				if (_build == -1)
					throw new ArgumentOutOfRangeException("fieldCount");

				if (fieldCount == 3)
					return _major.ToString() ~ '.' ~ _minor.ToString() ~ '.' ~ _build.ToString();

				if (_revision == -1)
					throw new ArgumentOutOfRangeException("fieldCount");

				if (fieldCount == 4)
					return _major.ToString() ~ '.' ~ _minor.ToString() ~ '.' ~ _build.ToString() ~ '.' ~ _revision.ToString();

				throw new ArgumentOutOfRangeException("fieldCount");
		}
	}

	public static Version Parse(string input) {
		if (input is null)
			throw new ArgumentNullException("input");
		Contract.EndContractBlock();

		VersionResult* r = new VersionResult();
		r.Init("input", true);
		if (!TryParseVersion(input, *r))
			throw r.GetVersionParseException();

		return r._parsedVersion;
	}

	public static bool TryParse(string input, out Version result) {
		VersionResult* r = new VersionResult();
		r.Init("input", false);
		bool b = TryParseVersion(input, *r);
		result = r._parsedVersion;
		return b;
	}
	
	private static bool TryParseVersion(string ver, ref VersionResult result) {
		int major, minor, build, revision;
		
		if (!ver) {
			result.SetFailure(ParseFailureKind.ArgumentNullException);
			return false;
		}
		
		string[] parsedComponents = ver.Split(['.']);
		int parsedComponentsLength = parsedComponents.Length;

		if (parsedComponentsLength < 2 || parsedComponentsLength > 4) {
			result.SetFailure(ParseFailureKind.ArgumentException);
			return false;
		}
		
		if (!TryParseComponent(parsedComponents[0], "version", result, major))
			return false;
		
		if (!TryParseComponent(parsedComponents[1], "version", result, minor))
			return false;
		
		parsedComponentsLength -= 2;
		
		if (parsedComponentsLength > 0) {
			if (!TryParseComponent(parsedComponents[2], "build", result, build))
				return false;
			
			parsedComponentsLength--;
			
			if (parsedComponentsLength > 0) {
				if (!TryParseComponent(parsedComponents[3], "revision", result, revision))
					return false;
				else
					result._parsedVersion = new Version(major, minor, build, revision);
			}
			else
				result._parsedVersion = new Version(major, minor, build);
		}
		else
			result._parsedVersion = new Version(major, minor);
		
		return true;
	}
	
	private static bool TryParseComponent(string component, string componentName, ref VersionResult result, out int parsedComponent) {
		if (!Int32.TryParse(component, NumberStyles.Integer, CultureInfo.InvariantCulture, parsedComponent)) {
			result.SetFailure(ParseFailureKind.FormatException, component);
			return false;
		}
		
		if (parsedComponent < 0) {
			result.SetFailure(ParseFailureKind.ArgumentOutOfRangeException, componentName);
			return false;
		}
		
		return true;
	}

	@internal struct VersionResult {
		@internal Version _parsedVersion;
		@internal ParseFailureKind _failure;
		@internal string _exceptionArgument;
		@internal string _argumentName;
		@internal bool _canThrow;

		@internal void Init(string argumentName, bool canThrow) {
			_canThrow = canThrow;
			_argumentName = argumentName;
		}

		@internal void SetFailure(ParseFailureKind failure) {
			SetFailure(failure, String.Empty);
		}

		@internal void SetFailure(ParseFailureKind failure, string argument) {
			_failure = failure;
			_exceptionArgument = argument;

			if (_canThrow)
				throw GetVersionParseException();
		}

		@internal Exception GetVersionParseException() {
			switch (_failure) {
				case ParseFailureKind.ArgumentNullException:
					return new ArgumentNullException(_argumentName);
				case ParseFailureKind.ArgumentException:
					return new ArgumentException(Environment.GetResourceString("Arg_VersionString"));
				case ParseFailureKind.ArgumentOutOfRangeException:
					return new ArgumentOutOfRangeException(_exceptionArgument, Environment.GetResourceString("ArgumentOutOfRange_Version"));
				case ParseFailureKind.FormatException:
					try {
						Int32.Parse(_exceptionArgument, CultureInfo.InvariantCulture);
					}
					catch (Exception e) {
						return e;
					}

					Contract.Assert(false, "Int32.Parse() did not throw exception but TryParse failed: " ~ _exceptionArgument);
					return new FormatException(Environment.GetResourceString("Format_InvalidString"));
				default:
					Contract.Assert(false, "Unmatched case in Version.GetVersionParseException() for value: "); //TODO
					return new ArgumentException(Environment.GetResourceString("Arg_VersionString"));
			}
		}
	}

	@internal enum ParseFailureKind {
		ArgumentNullException, 
		ArgumentException, 
		ArgumentOutOfRangeException, 
		FormatException 
	}
}