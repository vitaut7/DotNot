module System._Struct.TypedReference;

import System;
import System.Reflection;


public struct TypedReference {
	private IntPtr _value;
	private IntPtr _type;

	public static TypedReference MakeTypedReference(Object target, FieldInfo[] flds) {
		if (target is null)
			throw new ArgumentNullException("target");

		if (flds is null)
			throw new ArgumentNullException("flds");
		Contract.EndContractBlock();

		if (!flds.Length)
			throw new ArgumentException(Environment.GetResourceString("Arg_ArrayZeroError"));

		IntPtr[] fields = new IntPtr[flds.Length];


		//TODO


		TypedReference* result = new TypedReference();
		//TODO
		return *result;
	}

	//TODO
}