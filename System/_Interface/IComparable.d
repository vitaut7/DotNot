module System._Interface.IComparable;


public interface IComparable
{
	int CompareTo(Object obj);
}


public interface IComparableT(T)
{
	int CompareTo(T other);
}