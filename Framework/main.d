/**
Sealed  = final
decimal = real
Miesto Type pouzit TypeInfo
miesto IHashCodeProvider pouzit IEqualityComparer
Vyjebat sa na klasicke kolekce a pouzit iba generic

scope c = new C(); // alokovanie na stacku


Zajtra spravit:
	version

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
	ValueType
	Environment
	Reflection.RuntimeAssembly
	UnitySerializationHolder
	Real
	Char
	Delegate
	MarshalByRefObject
	AppDomainManager
	Version

int:
IConfigHandler
_AppDomain

_Class.Convert - Deklarovat vssetko ostatne
_struct.ArgIterator - doplnit externy
_Class.Exception - dorobit
_Class.Guid
serializationinfo - nejake detaily AssemblyName atd.
_Class.IntPtr - nejake divne operatory
*/
 

void main() {}

unittest
{
	auto var1 = new Object();
	auto var2 = new Object();
	assert(var1.ToString() == "object.Object");
	assert(!var1.Equals(var2));
}


/*
System:
	Interface - SKORO HOTOVO
	Delegats  - HOTOVO
	Enums     - SKORO HOTOVO

IAppdomain
IAppDomainPauseManager - prerobit na AppDomainPauseManager do class


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

/*
 * template Gen(alias f)
{
	foreach (name; __traits(allMembers, (System._Class.Int32)))
	{
		//	static if (!__traits(isStaticFunction, __traits(getMember, (System._Class.Int32), name)))
		{
			mixin("alias symbol = " ~ name ~ ";");
			static if (symbol.stringof[0] == 'p')
			{
				//writeln(symbol.stringof);
				foreach (name2; __traits(allMembers, symbol))
				{
					mixin("alias symbol = " ~ name2 ~ ";");
					pragma(msg, [__traits(allMembers, symbol)]);
				}
			}
		}
	}
}*/