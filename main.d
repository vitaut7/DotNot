import std.stdio;
//Sealed = final
//decimal = real

/**
IAsyncResult - NEED WaitHandle
_Class.Type - Deklarovat!
_Struct.DateTime - Deklarovat
*/

int main()
{
	string t = "t てすと";
	writeln("test" ~ t);


	return 0;
}

unittest
{
	writeln("unitest");
}

import System;
abstract class Test : IObserver!Test
{

}






/*
System:
	Interface - HOTOVO
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