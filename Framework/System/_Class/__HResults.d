module System._Class.__HResults;

import System;
import io = System.IO;
import runtimeRemoting = System.Runtime.Remoting;


@internal static class __HResults
{
	mixin io.__HResults;
	mixin runtimeRemoting.__HResults;

	@internal static const RO_E_CLOSED                      = 0x80000013;
	@internal static const E_BOUNDS                         = 0x8000000B;
	@internal static const E_CHANGED_STATE                  = 0x8000000C;
	@internal static const E_FAIL                           = 0x80004005;
	@internal static const E_POINTER                        = 0x80004003;
	@internal static const E_NOTIMPL                        = 0x80004001;
	@internal static const COR_E_AMBIGUOUSMATCH             = 0x8000211D;
	@internal static const COR_E_APPDOMAINUNLOADED          = 0x80131014;
	@internal static const COR_E_APPLICATION                = 0x80131600;
	@internal static const COR_E_ARGUMENT                   = 0x80070057;
	@internal static const COR_E_ARGUMENTOUTOFRANGE         = 0x80131502;
	@internal static const COR_E_ARITHMETIC                 = 0x80070216;
	@internal static const COR_E_ARRAYTYPEMISMATCH          = 0x80131503;
	@internal static const COR_E_BADIMAGEFORMAT             = 0x8007000B;
	@internal static const COR_E_TYPEUNLOADED               = 0x80131013;
	@internal static const COR_E_CANNOTUNLOADAPPDOMAIN      = 0x80131015;
	@internal static const COR_E_COMEMULATE                 = 0x80131535;
	@internal static const COR_E_CONTEXTMARSHAL             = 0x80131504;
	@internal static const COR_E_DATAMISALIGNED             = 0x80131541;
	@internal static const COR_E_TIMEOUT                    = 0x80131505;
	@internal static const COR_E_CUSTOMATTRIBUTEFORMAT      = 0x80131605;
	@internal static const COR_E_DIVIDEBYZERO               = 0x80020012;
	@internal static const COR_E_DUPLICATEWAITOBJECT        = 0x80131529;
	@internal static const COR_E_EXCEPTION                  = 0x80131500;
	@internal static const COR_E_EXECUTIONENGINE            = 0x80131506;
	@internal static const COR_E_FIELDACCESS                = 0x80131507;
	@internal static const COR_E_FORMAT                     = 0x80131537;
	@internal static const COR_E_INDEXOUTOFRANGE            = 0x80131508;
	@internal static const COR_E_INSUFFICIENTMEMORY         = 0x8013153D;
	@internal static const COR_E_INSUFFICIENTEXECUTIONSTACK = 0x80131578;
	@internal static const COR_E_INVALIDCAST                = 0x80004002;
	@internal static const COR_E_INVALIDCOMOBJECT           = 0x80131527;
	@internal static const COR_E_INVALIDFILTERCRITERIA      = 0x80131601;
	@internal static const COR_E_INVALIDOLEVARIANTTYPE      = 0x80131531;
	@internal static const COR_E_INVALIDOPERATION           = 0x80131509;
	@internal static const COR_E_INVALIDPROGRAM             = 0x8013153A;
	@internal static const COR_E_KEYNOTFOUND                = 0x80131577;
	@internal static const COR_E_MARSHALDIRECTIVE           = 0x80131535;
	@internal static const COR_E_MEMBERACCESS               = 0x8013151A;
	@internal static const COR_E_METHODACCESS               = 0x80131510;
	@internal static const COR_E_MISSINGFIELD               = 0x80131511;
	@internal static const COR_E_MISSINGMANIFESTRESOURCE    = 0x80131532;
	@internal static const COR_E_MISSINGMEMBER              = 0x80131512;
	@internal static const COR_E_MISSINGMETHOD              = 0x80131513;
	@internal static const COR_E_MISSINGSATELLITEASSEMBLY   = 0x80131536;
	@internal static const COR_E_MULTICASTNOTSUPPORTED      = 0x80131514;
	@internal static const COR_E_NOTFINITENUMBER            = 0x80131528;
	@internal static const COR_E_PLATFORMNOTSUPPORTED       = 0x80131539;
	@internal static const COR_E_NOTSUPPORTED               = 0x80131515;
	@internal static const COR_E_NULLREFERENCE              = 0x80004003;
	@internal static const COR_E_OBJECTDISPOSED             = 0x80131622;
	@internal static const COR_E_OPERATIONCANCELED          = 0x8013153B;
	@internal static const COR_E_OUTOFMEMORY                = 0x8007000E;
	@internal static const COR_E_OVERFLOW                   = 0x80131516;
	@internal static const COR_E_RANK                       = 0x80131517;
	@internal static const COR_E_REFLECTIONTYPELOAD         = 0x80131602;
	@internal static const COR_E_RUNTIMEWRAPPED             = 0x8013153E;
	@internal static const COR_E_SAFEARRAYRANKMISMATCH      = 0x80131538;
	@internal static const COR_E_SAFEARRAYTYPEMISMATCH      = 0x80131533;
	@internal static const COR_E_SAFEHANDLEMISSINGATTRIBUTE = 0x80131623;
	@internal static const COR_E_SECURITY                   = 0x8013150A;
	@internal static const COR_E_SERIALIZATION              = 0x8013150C;
	@internal static const COR_E_SEMAPHOREFULL              = 0x8013152B;
	@internal static const COR_E_WAITHANDLECANNOTBEOPENED   = 0x8013152C;
	@internal static const COR_E_ABANDONEDMUTEX             = 0x8013152D;
	@internal static const COR_E_STACKOVERFLOW              = 0x800703E9;
	@internal static const COR_E_SYNCHRONIZATIONLOCK        = 0x80131518;
	@internal static const COR_E_SYSTEM                     = 0x80131501;
	@internal static const COR_E_TARGET                     = 0x80131603;
	@internal static const COR_E_TARGETINVOCATION           = 0x80131604;
	@internal static const COR_E_TARGETPARAMCOUNT           = 0x8002000e;
	@internal static const COR_E_THREADABORTED              = 0x80131530;
	@internal static const COR_E_THREADINTERRUPTED          = 0x80131519;
	@internal static const COR_E_THREADSTATE                = 0x80131520;
	@internal static const COR_E_THREADSTOP                 = 0x80131521;
	@internal static const COR_E_THREADSTART                = 0x80131525;
	@internal static const COR_E_TYPEACCESS                 = 0x80131543;
	@internal static const COR_E_TYPEINITIALIZATION         = 0x80131534;
	@internal static const COR_E_TYPELOAD                   = 0x80131522;
	@internal static const COR_E_ENTRYPOINTNOTFOUND         = 0x80131523;
	@internal static const COR_E_DLLNOTFOUND                = 0x80131524;
	@internal static const COR_E_UNAUTHORIZEDACCESS         = 0x80070005;
	@internal static const COR_E_UNSUPPORTEDFORMAT          = 0x80131523;
	@internal static const COR_E_VERIFICATION               = 0x8013150D;
	@internal static const COR_E_HOSTPROTECTION             = 0x80131640;
	@internal static const CORSEC_E_MIN_GRANT_FAIL          = 0x80131417;
	@internal static const CORSEC_E_NO_EXEC_PERM            = 0x80131418;
	@internal static const CORSEC_E_POLICY_EXCEPTION        = 0x80131416;
	@internal static const CORSEC_E_XMLSYNTAX               = 0x80131418;
	@internal static const NTE_FAIL                         = 0x80090020;
	@internal static const CORSEC_E_CRYPTO                  = 0x80131430;
	@internal static const CORSEC_E_CRYPTO_UNEX_OPER        = 0x80131431;
	@internal static const DISP_E_OVERFLOW                  = 0x8002000a;
	@internal static const FUSION_E_REF_DEF_MISMATCH        = 0x80131040;
	@internal static const FUSION_E_INVALID_NAME            = 0x80131047;
	@internal static const TYPE_E_TYPEMISMATCH              = 0x80028ca0;
}