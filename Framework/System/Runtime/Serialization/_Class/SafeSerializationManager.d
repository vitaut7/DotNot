module System.Runtime.Serialization._Class.SafeSerializationManager;

static import System.Runtime.Serialization._Struct.StreamingContext;

import System;
import System.Runtime.Serialization;


public final class SafeSerializationEventArgs : EventArgs
{
	private System.Runtime.Serialization.StreamingContext _streamingContext;
	//TODO: list<object>

	//TODO
	@property public System.Runtime.Serialization.StreamingContext StreamingContextx()
	{
		return _streamingContext;
	}

	@internal public this(System.Runtime.Serialization.StreamingContext streamingContext)
	{
		_streamingContext = streamingContext;
	}

	public void AddSerializedState(ISafeSerializationData serializedState)
	{
		if (serializedState is null)
			throw new ArgumentNullException("serializedState");

		//TODO
	}
}


public interface ISafeSerializationData
{
	void CompleteDeserialization(Object deserialized);
}


public final class SafeSerializationManager //: IObjectReference, ISerializable
{
	private static const RealTypeSerializationName = "CLR_SafeSerializationManager_RealType";

	@internal public EventHandlerT!SafeSerializationEventArgs SerializeObjectState;
	//TODO: list<object>
	private SerializationInfo _savedSerializationInfo;
	private Object _realObject;
	private RuntimeType _realType;

	@internal @property public bool IsActive()
	{
		return SerializeObjectState.Count != 0;
	}

	@internal public this()
	{
	}

	//TODO: zvisok
}