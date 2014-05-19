module System._Class.Version;

import System;


public class Version// : ICloneable, IComparable!Version, IEquatable!Version
{
	private int _major;
	private int _minor;
	private int _build = -1;
	private int _revision = -1;

	@property public int Major()
	{
		return _major;
	}

	@property public int Minor()
	{
		return _minor;
	}

	@property public int Build()
	{
		return _build;
	}

	@property public int Revision()
	{
		return _revision;
	}

	@property public short MajorRevision()
	{
		return _revision >> 16;
	}

	@property public short MinorRevision()
	{
		return cast(short)(_revision & 0xFFFF);
	}

	public this(int major, int minor, int build = -1, int revision = -1)
	{
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

	public this(string ver)
	{
		//TODO
	}

	public this()
	{
		_major = 0;
		_minor = 0;
	}

	public Object Clone()
	{
		Version v = new Version();
		v._major = _major;
		v._minor = _minor;
		v._build = _build;
		v._revision = v._revision;

		return v;
	}

	public int CompareTo(Version value)
	{
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

	public override bool Equals(Object obj)
	{
		Version v = cast(Version)obj;
		if (v is null)
			return false;

		return _major == v._major && _minor == v._minor && _build == v._build && _revision == v._revision;
	}

	public bool Equals(Version obj)
	{
		if (obj is null)
			return false;

		return _major == obj._major && _minor == obj._minor && _build == obj._build && _revision == obj._revision;
	}

	public override int GetHashCode()
	{
		return _revision << 24 | _build << 16 | _minor << 8 | _major;
	}

	public override string ToString()
	{
		if (_build == -1)
			return ToString(2);

		if (_revision == -1)
			return ToString(3);

		return ToString(4);
	}

	public string ToString(int fieldCount)
	{
		switch (fieldCount)
		{
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
}