import std.stdio;
/**
Sealed  = final
decimal = real
Miesto Type pouzit TypeInfo
miesto IHashCodeProvider pouzit IEqualityComparer
Vyjebat sa na klasicke kolekce a pouzit iba generic

scope c = new C(); // alokovanie na stacku


Zajtra spravit:
	double, real, float, char triedy
	opravit (u)int 16,32,64, tie parsery atd.
	cominterface

_Class:
	Reflection.Assembly
	Type
	DateTime
	AppDomain
	GC
	GenericUriParser
	LoaderOptimizationAttribute
	String
	Reflection.ComInterfaces
	Threading.WaitHandle
	Reflection.MethodBase
	Threading.CancellationToken
	RuntimeType
	RuntimeHandles
	TypedReference - EASY
	IRuntimeMethodInfo - TUTORIAL
	ValueType
	Environment
	Reflection.RuntimeAssembly
	UnitySerializationHolder
	Double
	Real
	Char
	Float
	Delegate


_Class.Convert - Deklarovat vssetko ostatne
_struct.ArgIterator - doplnit externy
_Class.Exception - dorobit
_Class.Guid
serializationinfo - nejake detaily AssemblyName atd.

mozno este nejake operatory:
Char...
_Class.UByte - Dorobit TryParse, stringy, ostatne hotovo
_Class.Int16 - Dorobit TryParse, stringy, ostatne hotovo
_Class.UInt16 - Dorobit TryParse, stringy, ostatne hotovo
_Class.Int32 - Dorobit TryParse, stringy, ostatne hotovo
_Class.UInt32 - Dorobit TryParse, stringy, ostatne hotovo
_Class.Int64 - Dorobit TryParse, stringy, ostatne hotovo
_Class.UInt64 - Dorobit TryParse, stringy, ostatne hotovo
_Class.IntPtr - nejake divne operatory
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
	Struct    - nope


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
				ArgumentException                   - OK
					ArgumentNullException           - OK
					ArgumentOutOfRangeException     - OK
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
				OperationCanceledException          - OK
				OutOfMemoryException                - OK
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
				ThreadAbortException                - OK
				ThreadInterruptedException          - OK
				ThreadStartException                - OK
				ThreadStateException                - OK
				TimeoutException                    - OK
				TypeInitializationException         - IMPL
				TypeLoadException                   - IMPL
				TypeUnloadedException               - OK
				UnauthorizedAccessException         - OK



    Constant Fields
    Fields
    Constructors
    Finalizers (Destructors)
    Delegates
    Events
    Enums
    Interfaces
    Properties
    Indexers
    Methods
    Structs
    Classes

    public
    internal
    protected internal
    protected
    private

    static
    non-static

    readonly
    non-readonly
*/