module System.Globalization._Class.Calendar;

import System;


public abstract class Calendar : ICloneable {
	public DateTime ToDateTime(int year, int month,  int day, int hour, int minute, int second, int millisecond);
}