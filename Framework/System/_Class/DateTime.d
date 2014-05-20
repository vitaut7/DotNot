module System._Class.DateTime;

import System;
import System.Globalization;
import System.Runtime.Serialization;


public final class DateTime// : IComparable, IFormattable, IConvertible, ISerializable, IComparableT!DateTime, IEquatable!DateTime
{
	//alias opEquals = Equals;
	//alias opCmp = CompareTo;
	private static const long TicksPerMillisecond = 10000;
	private static const long TicksPerSecond = TicksPerMillisecond * 1000;
	private static const long TicksPerMinute = TicksPerSecond * 60;
	private static const long TicksPerHour = TicksPerMinute * 60;
	private static const long TicksPerDay = TicksPerHour * 24;

	private static const int MillisPerSecond = 1000;
	private static const int MillisPerMinute = MillisPerSecond * 60;
	private static const int MillisPerHour = MillisPerMinute * 60;
	private static const int MillisPerDay = MillisPerHour * 24;

	private static const int DaysPerYear = 365;
	private static const int DaysPer4Years = DaysPerYear * 4 + 1;
	private static const int DaysPer100Years = DaysPer4Years * 25 - 1;
	private static const int DaysPer400Years = DaysPer100Years * 4 + 1;

	private static const int DaysTo1601 = DaysPer400Years * 4;
	private static const int DaysTo1899 = DaysPer400Years * 4 + DaysPer100Years * 3 - 367;
	private static const int DaysTo10000 = DaysPer400Years * 25 - 366;

	@internal static const long MinTicks = 0;
	@internal static const long MaxTicks = DaysTo10000 * TicksPerDay - 1;
	private static const long MaxMillis = cast(long)DaysTo10000 * MillisPerDay;

	private static const long FileTimeOffset = DaysTo1601 * TicksPerDay;
	private static const long DoubleDateOffset = DaysTo1899 * TicksPerDay;
	private static const long OADateMinAsTicks = (DaysPer100Years - DaysPerYear) * TicksPerDay;
	private static const double OADateMinAsDouble = -657435.0;
	private static const double OADateMaxAsDouble = 2958466.0;

	private static const int DatePartYear = 0;
	private static const int DatePartDayOfYear = 1;
	private static const int DatePartMonth = 2;
	private static const int DatePartDay = 3;

	private static immutable int[] DaysToMonth365 = [
	    0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];
	private static immutable int[] DaysToMonth366 = [
	    0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366];

	public static immutable DateTime MinValue = cast(immutable(DateTime))new DateTime(MinTicks, DateTimeKind.Unspecified);
	public static immutable DateTime MaxValue = cast(immutable(DateTime))new DateTime(MaxTicks, DateTimeKind.Unspecified);

	private static const ulong TicksMask             = 0x3FFFFFFFFFFFFFFF;
	private static const ulong FlagsMask             = 0xC000000000000000;
	private static const ulong LocalMask             = 0x8000000000000000;
	private static const long TicksCeiling           = 0x4000000000000000;
	private static const ulong KindUnspecified       = 0x0000000000000000;
	private static const ulong KindUtc               = 0x4000000000000000;
	private static const ulong KindLocal             = 0x8000000000000000;
	private static const ulong KindLocalAmbiguousDst = 0xC000000000000000;
	private static const int KindShift = 62;

	private static const string TicksField           = "ticks";
	private static const string DateDataField        = "dateData";

	private ulong _dateData;

	@property public long Ticks()
	{
		return -1;
	}

	public this(long ticks)
	{
		if (ticks < MinTicks || ticks > MaxTicks)
			throw new ArgumentOutOfRangeException("ticks", Environment.GetResourceString("ArgumentOutOfRange_DateTimeBadTicks"));
		Contract.EndContractBlock();

		_dateData = cast(ulong)ticks;
	}

	public this(long ticks, DateTimeKind kind)
	{
		if (ticks < MinTicks || ticks > MaxTicks)
			throw new ArgumentOutOfRangeException("ticks", Environment.GetResourceString("ArgumentOutOfRange_DateTimeBadTicks"));

		if (kind < DateTimeKind.Unspecified || kind > DateTimeKind.Local)
			throw new ArgumentException(Environment.GetResourceString("Argument_InvalidDateTimeKind"), "kind");
		Contract.EndContractBlock();

		_dateData = cast(ulong)ticks | (cast(ulong)kind << KindShift);
	}

	@internal this(long ticks, DateTimeKind kind, bool isAmbiuousDst)
	{
		if (ticks < MinTicks || ticks > MaxTicks)
			throw new ArgumentOutOfRangeException("ticks", Environment.GetResourceString("ArgumentOutOfRange_DateTimeBadTicks"));

		Contract.Requires(kind == DateTimeKind.Local, "Internal Constructor is for local times only");
		Contract.EndContractBlock();

		_dateData = cast(ulong)ticks | (isAmbiuousDst ? KindLocalAmbiguousDst : KindLocal);
	}

	public this(int year, int month, int day)
	{
		_dateData = DateToTicks(year, month, day);
	}

	public this(int year, int month, int day, Calendar calendar)
	{
		this(year, month, day, 0, 0, 0, calendar);
	}

	public this(int year, int month, int day, int hour, int minute, int second)
	{
		_dateData = cast(ulong)(DateToTicks(year, month, day) + TimeToTicks(hour, minute, second));
	}

	public this(int year, int month, int day, int hour, int minute, int second, DateTimeKind kind)
	{
		if (kind < DateTimeKind.Unspecified || kind > DateTimeKind.Local)
			throw new ArgumentException(Environment.GetResourceString("Argument_InvalidDateTimeKind"), "kind");
		Contract.EndContractBlock();

		long ticks = DateToTicks(year, month, day) + TimeToTicks(hour, minute, second);
		_dateData = cast(ulong)ticks | (cast(ulong)kind << KindShift);
	}

	public this(int year, int month, int day, int hour, int minute, int second, Calendar calendar)
	{
		if (calendar is null)
			throw new ArgumentNullException("calendar");
		Contract.EndContractBlock();

		_dateData = cast(ulong)calendar.ToDateTime(year, month, day, hour, minute, second, 0).Ticks;
	}

	public this(int year, int month, int day, int hour, int minute, int second, int millisecond)
	{
		if (millisecond < 0 || millisecond >= MillisPerSecond)
			throw new ArgumentOutOfRangeException("millisecond", Environment.GetResourceString("ArgumentOutOfRange_Range", [Int32(0), Int32(MillisPerSecond - 1)]));
		Contract.EndContractBlock();

		long ticks = DateToTicks(year, month, day) + TimeToTicks(hour, minute, second);
		ticks += millisecond * TicksPerMillisecond;

		if (ticks < MinTicks || ticks > MaxTicks)
			throw new ArgumentException(Environment.GetResourceString("Arg_DateTimeRange"));

		_dateData = cast(ulong)ticks;
	}

	public this(int year, int month, int day, int hour, int minute, int second, int millisecond, DateTimeKind kind)
	{
		if (millisecond < 0 || millisecond >= MillisPerSecond)
			throw new ArgumentOutOfRangeException("millisecond", Environment.GetResourceString("ArgumentOutOfRange_Range", [Int32(0), Int32(MillisPerSecond - 1)]));

		if (kind < DateTimeKind.Unspecified || kind > DateTimeKind.Local)
			throw new ArgumentException(Environment.GetResourceString("Argument_InvalidDateTimeKind"), "kind");
		Contract.EndContractBlock();

		long ticks = DateToTicks(year, month, day) + TimeToTicks(hour, minute, second);
		ticks += millisecond * TicksPerMillisecond;

		if (ticks < MinTicks || ticks > MaxTicks)
			throw new ArgumentException(Environment.GetResourceString("Arg_DateTimeRange"));

		_dateData = cast(ulong)ticks | (cast(ulong)kind << KindShift);
	}

	public this(int year, int month, int day, int hour, int minute, int second, int millisecond, Calendar calendar)
	{
		if (calendar is null)
			throw new ArgumentNullException("calendar");

		if (millisecond < 0 || millisecond >= MillisPerSecond)
			throw new ArgumentOutOfRangeException("millisecond", Environment.GetResourceString("ArgumentOutOfRange_Range", [Int32(0), Int32(MillisPerSecond - 1)]));
		Contract.EndContractBlock();

		long ticks = calendar.ToDateTime(year, month, day, hour, minute, second, 0).Ticks;
		ticks += millisecond * TicksPerMillisecond;

		if (ticks < MinTicks || ticks > MaxTicks)
			throw new ArgumentException(Environment.GetResourceString("Arg_DateTimeRange"));

		_dateData = cast(ulong)ticks;
	}

	public this(int year, int month, int day, int hour, int minute, int second, int millisecond, Calendar calendar, DateTimeKind kind)
	{
		if (calendar is null)
			throw new ArgumentNullException("calendar");

		if (millisecond < 0 || millisecond >= MillisPerSecond)
			throw new ArgumentOutOfRangeException("millisecond", Environment.GetResourceString("ArgumentOutOfRange_Range", [Int32(0), Int32(MillisPerSecond - 1)]));

		if (kind < DateTimeKind.Unspecified || kind > DateTimeKind.Local)
			throw new ArgumentException(Environment.GetResourceString("Argument_InvalidDateTimeKind"), "kind");
		Contract.EndContractBlock();

		long ticks = calendar.ToDateTime(year, month, day, hour, minute, second, 0).Ticks;
		ticks += millisecond * TicksPerMillisecond;

		if (ticks < MinTicks || ticks > MaxTicks)
			throw new ArgumentException(Environment.GetResourceString("Arg_DateTimeRange"));

		_dateData = cast(ulong)ticks | (cast(ulong)kind << KindShift);
	}

	private this(SerializationInfo info, StreamingContext context)
	{
		if (info is null)
		    throw new ArgumentNullException("info");
		Contract.EndContractBlock();

		bool foundTicks = false;
		bool foundDateData = false;
		long serializedTicks = 0;
		ulong serializedDateData = 0;

		SerializationInfoEnumerator enumerator = info.GetEnumerator();
	/*	while (enumerator.MoveNext())
		{
            switch (enumerator.Name)
			{
                case TicksField:
                    serializedTicks = Convert.ToInt64(enumerator.Value, CultureInfo.InvariantCulture);
                    foundTicks = true;
                    break;
                case DateDataField:
                    serializedDateData = Convert.ToUInt64(enumerator.Value, CultureInfo.InvariantCulture);
                    foundDateData = true;
                    break;
                default:
                    break;
            }
        }*/
          /*  if (foundDateData) {
                this.dateData = serializedDateData;
            }
            else if (foundTicks) {
            //    this.dateData = (UInt64)serializedTicks;
            }
            else {
                throw new SerializationException(Environment.GetResourceString("Serialization_MissingDateTimeData"));                
            }
            Int64 ticks = InternalTicks;
            if (ticks < MinTicks || ticks > MaxTicks) {
		throw new SerializationException(Environment.GetResourceString("Serialization_DateTimeTicksOutOfRange"));
	}    */                    
	}




	private static long DateToTicks(int year, int month, int day)
	{
		if (year >= 1 && year <= 9999 && month >= 1 && month <= 12)
		{
			immutable int[] days = IsLeapYear(year) ? DaysToMonth366 : DaysToMonth365;
			if (day >= 1 && day <= days[month] - days[month - 1])
			{
				int y = year - 1;
				int n = y * 365 + y / 4 - y / 100 + y / 400 + days[month - 1] + day - 1;
				return n * TicksPerDay;
			}
		}

		throw new ArgumentOutOfRangeException(null, Environment.GetResourceString("ArgumentOutOfRange_BadYearMonthDay"));
	}

	private static long TimeToTicks(int hour, int minute, int second)
	{
		//if (hour >= 0 && hour < 24 && minute >= 0 && minute < 60 && second >=0 && second < 60)
		//	return (TimeSpan.TimeToTicks(hour, minute, second)); TODO

		throw new ArgumentOutOfRangeException(null, Environment.GetResourceString("ArgumentOutOfRange_BadHourMinuteSecond"));
	}

	public static bool IsLeapYear(int year)
	{
		if (year < 1 || year > 9999)
			throw new ArgumentOutOfRangeException("year", Environment.GetResourceString("ArgumentOutOfRange_Year"));
		Contract.EndContractBlock();

		return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
	}

	public static DateTime Parse(string s, NumberStyles style, IFormatProvider provider) { assert(0); }
}