import std.stdio;
/**
Sealed  = final
decimal = real

scope c = new C(); // alokovanie na stacku
*/

/**
IAsyncResult - NEED WaitHandle
_Class.Type - Deklarovat!
_Struct.DateTime - Deklarovat -> class
_CLass.AppDomain - Deklarovat
_Class.Convert - Deklarovat vssetko ostatne
_Class.GC - Dorobit
_Class.GenericUriParser - Deklarovat triedu
_cLASS.LoaderOptimizationAttribute - Deklarovat triedu
_Classs.String - deklarovat
_struct.ArgIterator - doplnit externy
_class.Int32 - dorobit
_Class.Exception - dorobit
_Class.__HResults dorobit
*/

import System;


int main()
{
	string t = " てすと";
	writeln("test" ~ t);

	import System.Runtime.Remoting;
	new RemotingException();

	return 0;
}


unittest
{
	auto var1 = new Object();
	auto var2 = new Object();
	assert(var1.ToString() == "object.Object");
	assert(!var1.Equals(var2));
}


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

	Exceptions:
		(Base)Exception - Dorobit
			SystemException - OK
				AccessViolationException            - OK
				AppDomainUnloadedException          - OK
				ArgumentException                   - TODO
				ArithmeticException                 - OK
				ArrayTypeMismatchException          - OK
				BadImageFormatException             - IMPL
				CannotUnloadAppDomainException      - OK
				KeyNotFoundException                - IMPL
				ContextMarshalException             - OK
				DataMisalignedException             - OK
				ExecutionEngineException            - OK
				FormatException                     - OK
				IndexOutOfRangeException            - OK
				InsufficientExecutionStackException - OK
				InvalidCastException                - OK
				InvalidOperationException           - OK
				InvalidProgramException             - OK
				IOException                         - OK
				MemberAccessException               - OK
				MulticastNotSupportedException      - OK
				NotImplementedException             - OK
				NotSupportedException               - OK
				NullReferenceException              - OK
				OperationCanceledException          - TODO EASY
				OutOfMemoryException                - TODO
				RankException                       - OK
				AmbiguousMatchException             - OK
				ReflectionTypeLoadException         - TODO LEVEL ASIAN
				MissingManifestResourceException    - OK
				MissingSatelliteAssemblyException   - OK
				ExternalException                   - TODO EASY
				InvalidComObjectException           - NETREBA
				InvalidOleVariantTypeException      - NETREBA
				MarshalDirectiveException           - OK
				SafeArrayRankMismatchException      - OK
				SafeArrayTypeMismatchException      - OK
				RemotingException                   - OK
					RemotingTimeoutException        - OK
					ServerException                 - OK
				SerializationException              - OK
				CryptographicException              - IMPL
				HostProtectionException             - IMPL
				PolicyException                     - OK
				IdentityReferenceCollection         - IMPL
				SecurityException                   - TODO LEVEL GROUP OF ASIANS
				VerificationException               - OK
				XmlSyntaxException                  - IMPL
				StackOverflowException              - OK
				AbandonedMutexException             - IMPL
				SemaphoreFullException              - OK
				SynchronizationLockException        - OK
				ThreadAbortException                - TODO
				ThreadInterruptedException          - TODO
				ThreadStartException                - OK
				ThreadStateException                - OK
				TimeoutException                    - OK
				TypeInitializationException         - IMPL
				TypeLoadException                   - IMPL
				TypeUnloadedException               - OK
				UnauthorizedAccessException         - OK
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