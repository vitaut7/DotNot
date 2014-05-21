module System.Collections._Interface.IEqualityComparer;


public interface IEqualityComparer {
	bool Equals(Object x, Object y);
	int GetHashCode(Object obj);
}