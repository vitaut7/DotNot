module System.Reflection._Struct.ParameterModifier;

import System;


public struct ParameterModifier
{
	private bool[] _byRef;

	@internal @property bool[] IsByRefArray()
	{
		return _byRef;
	}

	public bool opIndex(int index)
	{
		return _byRef[index];
	}

	public void opIndexAssign(bool value, int index)
	{
		_byRef[index] = value;
	}

	public this(int parameterCount)
	{
		if (parameterCount <= 0)
			throw new ArgumentException(Environment.GetResourceString("Arg_ParmArraySize"));
		Contract.EndContractBlock();

		_byRef = new bool[parameterCount];
	}
}