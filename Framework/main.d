﻿import std.stdio;
/**
Sealed  = final
decimal = real
Miesto Type pouzit TypeInfo

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
_class.Int32 - dorobit
_Class.Exception - dorobit
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