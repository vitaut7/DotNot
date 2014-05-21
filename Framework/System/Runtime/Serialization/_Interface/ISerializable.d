module System.Runtime.Serialization._Interface.ISerializable;

import System.Runtime.Serialization;


public interface ISerializable {
	void GetObjectData(SerializationInfo info, StreamingContext context);
}