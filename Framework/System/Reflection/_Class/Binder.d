module System.Reflection._Class.Binder;

import System;
import System.Reflection;


public abstract class Binder
{
	public MethodBase BindToMethod(BindingFlags bindingAttr, MethodBase[] match, ref Object[] args, 
                                   ParameterModifier[] modifiers,CultureInfo culture,String[] names, out Object state);

	public FieldInfo BindToField(BindingFlags bindingAttr, FieldInfo[] match, Object value, CultureInfo culture);

	public MethodBase SelectMethod(BindingFlags bindingAttr, MethodBase[] match, Type[] types, 
                                   ParameterModifier[] modifiers);

	public MethodBase SelectMethod(BindingFlags bindingAttr, MethodBase[] match, Type[] types, 
                                   ParameterModifier[] modifiers);

	public PropertyInfo SelectProperty(BindingFlags bindingAttr, PropertyInfo[] match, Type returnType, Type[] indexes,
                                       ParameterModifier[] modifiers);

	public Object ChangeType(Object value, Type type, CultureInfo culture);
	public void ReorderArgumentArray(ref Object[] args, Object state);
}