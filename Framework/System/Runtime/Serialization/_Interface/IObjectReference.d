module System.Runtime.Serialization._Interface.IObjectReference;

import System.Runtime.Serialization;


public interface IObjectReference {
	Object GetRealObject(StreamingContext context);
}