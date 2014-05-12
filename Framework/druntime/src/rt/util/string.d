/**
 * String manipulation and comparison utilities.
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Sean Kelly
 */

/*          Copyright Sean Kelly 2005 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module rt.util.string;

private import core.stdc.string;

@trusted:
pure:
nothrow:

alias UintStringBuff = char[10];
alias UlongStringBuff = char[20];

version(D_LP64)
    alias SizeStringBuff = UlongStringBuff;
else
    alias SizeStringBuff = UintStringBuff;

char[] uintToTempString(size_t n)(in uint val, ref char[n] buff)
{ return val._unsignedToTempString(buff); }

char[] ulongToTempString(size_t n)(in ulong val, ref char[n] buff)
{ return val._unsignedToTempString(buff); }

version(D_LP64)
    alias sizeToTempString = ulongToTempString;
else
    alias sizeToTempString = uintToTempString;

private char[] _unsignedToTempString(T, size_t n)(in T val, ref char[n] buff)
if(is(T == uint) || is(T == ulong))
{
    static assert(n >= (is(T == uint) ? 10 : 20), "Buffer is to small for `" ~ T.stringof ~ "`.");

    char* p = buff.ptr + buff.length;
    T k = val;
    do
        *--p = cast(char) (k % 10 + '0');
    while(k /= 10);

    return buff[p - buff.ptr .. $];
}

unittest
{
    UlongStringBuff buff;
    assert(1.uintToTempString(buff) == "1");
    assert(12.ulongToTempString(buff) == "12");
    assert(long.sizeof.sizeToTempString(buff) == "8");
    assert(uint.max.uintToTempString(buff) == "4294967295");
    assert(ulong.max.ulongToTempString(buff) == "18446744073709551615");
}


int dstrcmp( in char[] s1, in char[] s2 )
{
    int  ret = 0;
    auto len = s1.length;
    if( s2.length < len )
        len = s2.length;
    if( 0 != (ret = memcmp( s1.ptr, s2.ptr, len )) )
        return ret;
    return s1.length >  s2.length ? 1 :
           s1.length == s2.length ? 0 : -1;
}
