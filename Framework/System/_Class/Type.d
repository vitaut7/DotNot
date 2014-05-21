module System._Class.Type;

static import System.Reflection;

import System;
import System.Reflection;


public abstract class Type {
	@property string FullName() {
		assert(0);
	}

	@property System.Reflection.Module Module() {
		assert(0);
	}

	public Object InvokeMember(string name, BindingFlags invokeAttr, Binder binder, Object target, Object[] args, 
                               ParameterModifier[] modifiers, CultureInfo culture, string[] namedParameters);

	@property System.Reflection.Assembly Assembly() {
		assert(0);
	}

	public bool IsAssignableFrom(Type c) {
		assert(0);
	}

	@internal static RuntimeType GetTypeFromHandleUnsafe(IntPtr handle) {
		throw new NotImplementedException();
	}

	public bool IsInstanceOfType(Object o) { assert(0); }
	@property public bool IsCOMObject() { assert(0); }
}

template Typeof(T) {
	auto Typeof = null;//typeid(T);
	//Typeof = null;
}