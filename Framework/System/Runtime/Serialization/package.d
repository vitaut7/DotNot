module System.Runtime.Serialization;


public import System.Runtime.Serialization._Interface.ISerializable;

public import System.Runtime.Serialization._Struct.StreamingContext;
public import System.Runtime.Serialization._Interface.IObjectReference;

public import System.Runtime.Serialization._Class.SerializationException;
public import System.Runtime.Serialization._Class.SafeSerializationManager;


//TODO, nepouzivat typeinfo nammiesto type!
public final class SerializationInfo {
	public string GetString(string name) { return name; }
	public Object GetValueNoThrow(string name, TypeInfo type) { return null; }
	public Object GetValue(string name, TypeInfo type) { return null; }
	public int GetInt32(string name) { return 0; }

	public void AddValue(string name, Object value, TypeInfo type) {}
	

}