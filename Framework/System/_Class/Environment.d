module System._Class.Environment;

import System;


public static class Environment //TODO
{
	static string GetResourceString(string key)
	{
		return key;
	}
	
	static string GetResourceString(string key, Object[] values)
	{
		return key;
	}
	
	static string GetResourceString(string key, string, string a = null)
	{
		return key;
	}
	
	static string GetRuntimeResourceString(string key, Object[] values) { return key; }
	static string GetRuntimeResourceString(string key) { return key; }
	
	
	@property public static string NewLine()
	{
		//Contract.Ensures(Contract.Result<String>() != null);
		return "\r\n";
	}
	
	@internal static string GetStackTrace(Exception e, bool needFileInfo)
	{
		return "LTODO";
	}
}