import std.stdio;
/**
Sealed  = final
decimal = real
*/

/**
IAsyncResult - NEED WaitHandle
_Class.Type - Deklarovat!
_Struct.DateTime - Deklarovat
_CLass.AppDomain - Deklarovat
_Class.Convert - Deklarovat vssetko ostatne
_Class.GC - Dorobit
_Class.GenericUriParser - Deklarovat triedu
_cLASS.LoaderOptimizationAttribute - Deklarovat triedu
_Classs.String - deklarovat
_struct.ArgIterator - doplnit externy
*/

import System;


int main()
{
	string t = " てすと";
	writeln("test" ~ t);

	//new Int32();

	return 0;
}


unittest
{
	auto var1 = new Object();
	auto var2 = new Object();
	assert(var1.ToString() == "object.Object");
	assert(!var1.Equals(var2));
}


/*


/*
final class Int
{
	int value;

	alias value this;

	static Int opCall(int value) {
		Int ret = new Int();
		ret.value = value;
		return ret;
	}

	int opCast()
	{
		return value;
	}

	void fce() {

	}
}*/

//alias void delegate(Object a) EventHandler;


/*
System:
	Interface - HOTOVO
	Delegats  - HOTOVO
	Enums     - SKORO HOTOVO


	Enumy:
	ActivationContext.ContextForm ???
	AppDomainManagerInitializationOptions ???
	Environment.SpecialFolder ???
	Environment.SpecialFolderOption ???
	EnvironmentVariableTarget ???


*/















/*

interface A {
	@property int data();
	@property void data(int);
}



string implement(Interface)() {
	string code;

	import std.traits;

	foreach(memberName; __traits(allMembers, Interface)) {
		string m_name = "m_" ~ memberName;

		// if this is an @property...
		foreach(member; __traits(getOverloads, Interface, memberName))
		static if(functionAttributes!member & FunctionAttribute.property) {
			// if it doesn't return void, we have a getter
			// and can use its return value to make the
			// private member.
			static if(!is(ReturnType!member == void)) {
				auto type = (ReturnType!member).stringof;
				code ~= "private " ~ type ~ " " ~ m_name ~ ";\n";

				// and implement the getter
				code ~= "@property " ~ type ~ " " ~ memberName ~ "() { return " ~ m_name ~ "; }\n";
			} else {
				// should be a setter, implement it too
				code ~= "@property void " ~ memberName ~ "(typeof("~m_name~") v) { "~m_name~" = v; }\n";
			}
		}
	}

	return code;
}*/