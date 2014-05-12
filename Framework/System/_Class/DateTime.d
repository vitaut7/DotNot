module System._Class.DateTime;

import System;
import System.Runtime.Serialization;


public final class DateTime// : IComparable, IFormattable, IConvertible, ISerializable, IComparableT!DateTime, IEquatable!DateTime
{
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
    
        // TODO : WAT?
        private static const int DaysTo1601 = DaysPer400Years * 4;
        private static const int DaysTo1899 = DaysPer400Years * 4 + DaysPer100Years * 3 - 367;
        private static const int DaysTo10000 = DaysPer400Years * 25 - 366;
    
        @internal public static const long MinTicks = 0;
        @internal public static const long MaxTicks = DaysTo10000 * TicksPerDay - 1;
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

        private ulong dateData;


        this(long, int) {}
}