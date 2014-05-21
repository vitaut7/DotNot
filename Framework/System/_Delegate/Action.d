module System._Delegate.Action;


template Action() {
	alias void delegate() Action;
}

template Action(T) {
	alias void delegate(T arg) Action;
}

template Action(T1, T2) {
	alias void delegate(T1 arg1, T2 arg2) Action;
}

template Action(T1, T2, T3) {
	alias void delegate(T1 arg1, T2 arg2, T3 arg3) Action;
}

template Action(T1, T2, T3, T4) {
	alias void delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4) Action;
}

template Action(T1, T2, T3, T4, T5) {
	alias void delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5) Action;
}

template Action(T1, T2, T3, T4, T5, T6) {
	alias void delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6) Action;
}

template Action(T1, T2, T3, T4, T5, T6, T7) {
	alias void delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7) Action;
}

template Action(T1, T2, T3, T4, T5, T6, T7, T8) {
	alias void delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8) Action;
}


template Func(TResult) {
	alias TResult delegate() Func;
}

template Func(T, TResult) {
	alias TResult delegate(T arg) Func;
}

template Func(T1, T2, TResult) {
	alias TResult delegate(T1 arg1, T2 arg2) Func;
}

template Func(T1, T2, T3, TResult) {
	alias TResult delegate(T1 arg1, T2 arg2, T3 arg3) Func;
}

template Func(T1, T2, T3, T4, TResult) {
	alias TResult delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4) Func;
}

template Func(T1, T2, T3, T4, T5, TResult) {
	alias TResult delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5) Func;
}

template Func(T1, T2, T3, T4, T5, T6, TResult) {
	alias TResult delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6) Func;
}

template Func(T1, T2, T3, T4, T5, T6, T7, TResult) {
	alias TResult delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7) Func;
}

template Func(T1, T2, T3, T4, T5, T6, T7, T8, TResult) {
	alias TResult delegate(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8) Func;
}


template Comparison(T) {
	alias int delegate(T x, T y) Comparison;
}

template Converter(TInput, TOutput) {
	alias TOutput delegate(TInput input) Converter;
}

template Predicate(T) {
	alias bool delegate(T obj) Predicate;
}