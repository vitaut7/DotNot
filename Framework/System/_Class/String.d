module System._Class.String;

import System;


public enum StrngSplitOptions {
	None               = 0,
	RemoveEmptyEntries = 1
}


class String {
	string a;
	alias a this;
	public static immutable String Empty;

	static String opCall(string value) { return new String(); }

	int Length;



	public static bool IsNullOrEmpty(string value) {
		return (value == null || value.Length == 0);
	}
}


string Substring(string str, int startIndex, int length) {
	return "todo";
}

bool Equals(string str, string value, StringComparison comparisonType) {
	return str == value;
}

@property public int Length(string str) {
	return cast(int)str.length;
}