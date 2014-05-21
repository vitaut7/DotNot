module System.Diagnostics.Contracts._Class.Contract;

import System;


public class PureAttribute : Attribute
{
}


public class ContractClassAttribute : Attribute 
{
	private Type _typeWithContracts;

	@property public Type TypeContainingContracts()
	{
		return _typeWithContracts;
	}

	public this(Type typeContainingContracts)
	{
		_typeWithContracts = typeContainingContracts;
	}
}


public class ContractClassForAttribute : Attribute
{
	private Type _type;

	@property public Type TypeContractsAreFor()
	{
		return _type;
	}

	public this(Type typeContractsAreFor)
	{
		_type = typeContractsAreFor;
	}
}


public class ContractInvariantMethodAttribute : Attribute
{
}


public class ContractReferenceAssemblyAttribute : Attribute
{
}


public class ContractRuntimeIgnoredAttribute : Attribute
{
}


public class ContractVerificationAttribute : Attribute
{
	private bool _value;

	@property public bool Value()
	{
		return _value;
	}

	public this(bool value)
	{
		_value = value;
	}
}


public class ContractPublicPropertyNameAttribute : Attribute
{
	private string _publicName;

	@property public string Name()
	{
		return _publicName;
	}

	public this(string name)
	{
		_publicName = name;
	}
}


public class ContractArgumentValidatorAttribute : Attribute
{
}


public class ContractAbbreviatorAttribute : Attribute
{
}


public class ContractOptionAttribute : Attribute
{
	private string _category;
	private string _setting;
	private bool _enabled;
	private string _value;

	@property public string Category()
	{
		return _category;
	}

	@property public string Setting()
	{
		return _setting;
	}

	@property public bool Enabled()
	{
		return _enabled;
	}

	@property public string Value()
	{
		return _value;
	}

	public this(string category, string setting, bool enabled)
	{
		_category = category;
		_setting = setting;
		_enabled = enabled;
	}

	public this(string category, string setting, string value)
	{
		_category = category;
		_setting = setting;
		_value = value;
	}
}