import std.stdio;
/**
Sealed  = final
decimal = real
Miesto Type pouzit TypeInfo
miesto IHashCodeProvider pouzit IEqualityComparer
Vyjebat sa na klasicke kolekce a pouzit iba generic

scope c = new C(); // alokovanie na stacku
*/

/**
_Class.Type - Deklarovat!
_Class.DateTime - Deklarovat
_CLass.AppDomain - Deklarovat
_Class.Convert - Deklarovat vssetko ostatne
_Class.GC - Dorobit
_Class.GenericUriParser - Deklarovat triedu
_cLASS.LoaderOptimizationAttribute - Deklarovat triedu
_Classs.String - deklarovat
_struct.ArgIterator - doplnit externy
_Class.Exception - dorobit

mozno este nejake operatory:
_Class.Boolean - Dorobit TryParse, ostatne hotovo
_Class.Byte - Dorobit TryParse, stringy, ostatne hotovo
_Class.UByte - Dorobit TryParse, stringy, ostatne hotovo
_Class.Int16 - Dorobit TryParse, stringy, ostatne hotovo
_Class.UInt16 - Dorobit TryParse, stringy, ostatne hotovo
_Class.Int32 - Dorobit TryParse, stringy, ostatne hotovo
*/

import System;


int main()
{
	writeln("test");
	
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
System:
	Interface - HOTOVO
	Delegats  - HOTOVO
	Enums     - SKORO HOTOVO

System.Collections:
	Delegats  - NENI
	Enums     - NENI
	Struct    - HOTOVO


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
					ArgumentNullException           - OK
					ArgumentOutOfRangeException     - TODO
				ArithmeticException                 - OK
					DivideByZeroException           - OK
					NotFiniteNumberException        - OK
					OverflowException               - OK
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