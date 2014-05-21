module System._Class.GC;


public enum GCCollectionMode {
	Default   = 0,
	Forced    = 1,
	Optimized = 2
}


public enum GCNotificationStatus {
	Succeeded     = 0,
	Failed        = 1,
	Canceled      = 2,
	Timeout       = 3,
	NotApplicable = 4
}