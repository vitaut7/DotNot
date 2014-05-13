module System._Class.String;


public enum StrngSplitOptions
{
	None               = 0,
	RemoveEmptyEntries = 1
}


class String
{
	string a;
	alias a this;
	public static immutable String Empty;

	static String opCall(string value) { return new String(); }

	int Length;
}